<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tbl_transmigrasi extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        is_login();
        $this->load->model('Tbl_transmigrasi_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->uri->segment(3));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . '.php/c_url/index.html?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'index.php/tbl_transmigrasi/index.html?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'index.php/tbl_transmigrasi/index/';
            $config['first_url'] = base_url() . 'index.php/tbl_transmigrasi/index/';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = FALSE;
        $config['total_rows'] = $this->Tbl_transmigrasi_model->total_rows($q);
        $tbl_transmigrasi = $this->Tbl_transmigrasi_model->get_limit_data($config['per_page'], $start, $q);
        $config['full_tag_open'] = '<ul class="pagination pagination-sm no-margin pull-right">';
        $config['full_tag_close'] = '</ul>';
        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'tbl_transmigrasi_data' => $tbl_transmigrasi,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $this->template->load('template','tbl_transmigrasi/tbl_transmigrasi_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Tbl_transmigrasi_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id_transmigrasi' => $row->id_transmigrasi,
		'id_anggota' => $row->id_anggota,
		'tanggal_mulai' => $row->tanggal_mulai,
		'tanggal_selesai' => $row->tanggal_selesai,
		'asal_kota' => $row->asal_kota,
		'kota_tujuan' => $row->kota_tujuan,
	    );
            $this->template->load('template','tbl_transmigrasi/tbl_transmigrasi_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_transmigrasi'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('tbl_transmigrasi/create_action'),
	    'id_transmigrasi' => set_value('id_transmigrasi'),
	    'id_anggota' => set_value('id_anggota'),
	    'tanggal_mulai' => set_value('tanggal_mulai'),
	    'tanggal_selesai' => set_value('tanggal_selesai'),
	    'asal_kota' => set_value('asal_kota'),
	    'kota_tujuan' => set_value('kota_tujuan'),
	);
        $this->template->load('template','tbl_transmigrasi/tbl_transmigrasi_form', $data);
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
		'asal_kota' => $this->input->post('asal_kota',TRUE),
		'kota_tujuan' => $this->input->post('kota_tujuan',TRUE),
	    );

            $this->Tbl_transmigrasi_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success 2');
            redirect(site_url('tbl_transmigrasi'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Tbl_transmigrasi_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('tbl_transmigrasi/update_action'),
		'id_transmigrasi' => set_value('id_transmigrasi', $row->id_transmigrasi),
		'id_anggota' => set_value('id_anggota', $row->id_anggota),
		'tanggal_mulai' => set_value('tanggal_mulai', $row->tanggal_mulai),
		'tanggal_selesai' => set_value('tanggal_selesai', $row->tanggal_selesai),
		'asal_kota' => set_value('asal_kota', $row->asal_kota),
		'kota_tujuan' => set_value('kota_tujuan', $row->kota_tujuan),
	    );
            $this->template->load('template','tbl_transmigrasi/tbl_transmigrasi_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_transmigrasi'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id_transmigrasi', TRUE));
        } else {
            $data = array(
		'id_anggota' => $this->input->post('id_anggota',TRUE),
		'tanggal_mulai' => $this->input->post('tanggal_mulai',TRUE),
		'tanggal_selesai' => $this->input->post('tanggal_selesai',TRUE),
		'asal_kota' => $this->input->post('asal_kota',TRUE),
		'kota_tujuan' => $this->input->post('kota_tujuan',TRUE),
	    );

            $this->Tbl_transmigrasi_model->update($this->input->post('id_transmigrasi', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('tbl_transmigrasi'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Tbl_transmigrasi_model->get_by_id($id);

        if ($row) {
            $this->Tbl_transmigrasi_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('tbl_transmigrasi'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_transmigrasi'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('id_anggota', 'id anggota', 'trim|required');
	$this->form_validation->set_rules('tanggal_mulai', 'tanggal mulai', 'trim|required');
	$this->form_validation->set_rules('tanggal_selesai', 'tanggal selesai', 'trim|required');
	$this->form_validation->set_rules('asal_kota', 'asal kota', 'trim|required');
	$this->form_validation->set_rules('kota_tujuan', 'kota tujuan', 'trim|required');

	$this->form_validation->set_rules('id_transmigrasi', 'id_transmigrasi', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function word()
    {
        header("Content-type: application/vnd.ms-word");
        header("Content-Disposition: attachment;Filename=tbl_transmigrasi.doc");

        $data = array(
            'tbl_transmigrasi_data' => $this->Tbl_transmigrasi_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('tbl_transmigrasi/tbl_transmigrasi_doc',$data);
    }

}

/* End of file Tbl_transmigrasi.php */
/* Location: ./application/controllers/Tbl_transmigrasi.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2024-02-05 17:36:30 */
/* http://harviacode.com */