<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tbl_adat extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        is_login();
        $this->load->model('Tbl_adat_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->uri->segment(3));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . '.php/c_url/index.html?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'index.php/tbl_adat/index.html?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'index.php/tbl_adat/index/';
            $config['first_url'] = base_url() . 'index.php/tbl_adat/index/';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = FALSE;
        $config['total_rows'] = $this->Tbl_adat_model->total_rows($q);
        $tbl_adat = $this->Tbl_adat_model->get_limit_data($config['per_page'], $start, $q);
        $config['full_tag_open'] = '<ul class="pagination pagination-sm no-margin pull-right">';
        $config['full_tag_close'] = '</ul>';
        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'tbl_adat_data' => $tbl_adat,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $this->template->load('template','tbl_adat/tbl_adat_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Tbl_adat_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id_adat' => $row->id_adat,
		'id_anggota' => $row->id_anggota,
		'tanggal_mulai' => $row->tanggal_mulai,
		'tanggal_selesai' => $row->tanggal_selesai,
		'ruangan' => $row->ruangan,
		'suku' => $row->suku,
	    );
            $this->template->load('template','tbl_adat/tbl_adat_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_adat'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('tbl_adat/create_action'),
	    'id_adat' => set_value('id_adat'),
	    'id_anggota' => set_value('id_anggota'),
	    'tanggal_mulai' => set_value('tanggal_mulai'),
	    'tanggal_selesai' => set_value('tanggal_selesai'),
	    'ruangan' => set_value('ruangan'),
	    'suku' => set_value('suku'),
	);
        $this->template->load('template','tbl_adat/tbl_adat_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'id_anggota' => $this->input->post('id_anggota',TRUE),
		'tanggal_mulai' => $this->input->post('tanggal_mulai',TRUE),
		'tanggal_selesai' => $this->input->post('tanggal_selesai',TRUE),
		'ruangan' => $this->input->post('ruangan',TRUE),
		'suku' => $this->input->post('suku',TRUE),
	    );

            $this->Tbl_adat_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success 2');
            redirect(site_url('tbl_adat'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Tbl_adat_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('tbl_adat/update_action'),
		'id_adat' => set_value('id_adat', $row->id_adat),
		'id_anggota' => set_value('id_anggota', $row->id_anggota),
		'tanggal_mulai' => set_value('tanggal_mulai', $row->tanggal_mulai),
		'tanggal_selesai' => set_value('tanggal_selesai', $row->tanggal_selesai),
		'ruangan' => set_value('ruangan', $row->ruangan),
		'suku' => set_value('suku', $row->suku),
	    );
            $this->template->load('template','tbl_adat/tbl_adat_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_adat'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id_adat', TRUE));
        } else {
            $data = array(
		'id_anggota' => $this->input->post('id_anggota',TRUE),
		'tanggal_mulai' => $this->input->post('tanggal_mulai',TRUE),
		'tanggal_selesai' => $this->input->post('tanggal_selesai',TRUE),
		'ruangan' => $this->input->post('ruangan',TRUE),
		'suku' => $this->input->post('suku',TRUE),
	    );

            $this->Tbl_adat_model->update($this->input->post('id_adat', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('tbl_adat'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Tbl_adat_model->get_by_id($id);

        if ($row) {
            $this->Tbl_adat_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('tbl_adat'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_adat'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('id_anggota', 'id anggota', 'trim|required');
	$this->form_validation->set_rules('tanggal_mulai', 'tanggal mulai', 'trim|required');
	$this->form_validation->set_rules('tanggal_selesai', 'tanggal selesai', 'trim|required');
	$this->form_validation->set_rules('ruangan', 'ruangan', 'trim|required');
	$this->form_validation->set_rules('suku', 'suku', 'trim|required');

	$this->form_validation->set_rules('id_adat', 'id_adat', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function word()
    {
        header("Content-type: application/vnd.ms-word");
        header("Content-Disposition: attachment;Filename=tbl_adat.doc");

        $data = array(
            'tbl_adat_data' => $this->Tbl_adat_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('tbl_adat/tbl_adat_doc',$data);
    }

}

/* End of file Tbl_adat.php */
/* Location: ./application/controllers/Tbl_adat.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2024-02-05 17:21:26 */
/* http://harviacode.com */