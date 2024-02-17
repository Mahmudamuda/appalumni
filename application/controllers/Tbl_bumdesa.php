<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tbl_bumdesa extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        is_login();
        $this->load->model('Tbl_bumdesa_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->uri->segment(3));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . '.php/c_url/index.html?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'index.php/tbl_bumdesa/index.html?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'index.php/tbl_bumdesa/index/';
            $config['first_url'] = base_url() . 'index.php/tbl_bumdesa/index/';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = FALSE;
        $config['total_rows'] = $this->Tbl_bumdesa_model->total_rows($q);
        $tbl_bumdesa = $this->Tbl_bumdesa_model->get_limit_data($config['per_page'], $start, $q);
        $config['full_tag_open'] = '<ul class="pagination pagination-sm no-margin pull-right">';
        $config['full_tag_close'] = '</ul>';
        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'tbl_bumdesa_data' => $tbl_bumdesa,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $this->template->load('template','tbl_bumdesa/tbl_bumdesa_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Tbl_bumdesa_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id_bumdesa' => $row->id_bumdesa,
		'id_anggota' => $row->id_anggota,
		'nama_desa' => $row->nama_desa,
		'tanggal_mulai' => $row->tanggal_mulai,
		'tanggal_selesai' => $row->tanggal_selesai,
		'jenis_usaha' => $row->jenis_usaha,
		'jumlah_orang' => $row->jumlah_orang,
	    );
            $this->template->load('template','tbl_bumdesa/tbl_bumdesa_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_bumdesa'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('tbl_bumdesa/create_action'),
	    'id_bumdesa' => set_value('id_bumdesa'),
	    'id_anggota' => set_value('id_anggota'),
	    'nama_desa' => set_value('nama_desa'),
	    'tanggal_mulai' => set_value('tanggal_mulai'),
	    'tanggal_selesai' => set_value('tanggal_selesai'),
	    'jenis_usaha' => set_value('jenis_usaha'),
	    'jumlah_orang' => set_value('jumlah_orang'),
	);
        $this->template->load('template','tbl_bumdesa/tbl_bumdesa_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'id_anggota' => $this->input->post('id_anggota',TRUE),
		'nama_desa' => $this->input->post('nama_desa',TRUE),
		'tanggal_mulai' => $this->input->post('tanggal_mulai',TRUE),
		'tanggal_selesai' => $this->input->post('tanggal_selesai',TRUE),
		'jenis_usaha' => $this->input->post('jenis_usaha',TRUE),
		'jumlah_orang' => $this->input->post('jumlah_orang',TRUE),
	    );

            $this->Tbl_bumdesa_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success 2');
            redirect(site_url('tbl_bumdesa'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Tbl_bumdesa_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('tbl_bumdesa/update_action'),
		'id_bumdesa' => set_value('id_bumdesa', $row->id_bumdesa),
		'id_anggota' => set_value('id_anggota', $row->id_anggota),
		'nama_desa' => set_value('nama_desa', $row->nama_desa),
		'tanggal_mulai' => set_value('tanggal_mulai', $row->tanggal_mulai),
		'tanggal_selesai' => set_value('tanggal_selesai', $row->tanggal_selesai),
		'jenis_usaha' => set_value('jenis_usaha', $row->jenis_usaha),
		'jumlah_orang' => set_value('jumlah_orang', $row->jumlah_orang),
	    );
            $this->template->load('template','tbl_bumdesa/tbl_bumdesa_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_bumdesa'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id_bumdesa', TRUE));
        } else {
            $data = array(
		'id_anggota' => $this->input->post('id_anggota',TRUE),
		'nama_desa' => $this->input->post('nama_desa',TRUE),
		'tanggal_mulai' => $this->input->post('tanggal_mulai',TRUE),
		'tanggal_selesai' => $this->input->post('tanggal_selesai',TRUE),
		'jenis_usaha' => $this->input->post('jenis_usaha',TRUE),
		'jumlah_orang' => $this->input->post('jumlah_orang',TRUE),
	    );

            $this->Tbl_bumdesa_model->update($this->input->post('id_bumdesa', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('tbl_bumdesa'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Tbl_bumdesa_model->get_by_id($id);

        if ($row) {
            $this->Tbl_bumdesa_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('tbl_bumdesa'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_bumdesa'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('id_anggota', 'id anggota', 'trim|required');
	$this->form_validation->set_rules('nama_desa', 'nama desa', 'trim|required');
	$this->form_validation->set_rules('tanggal_mulai', 'tanggal mulai', 'trim|required');
	$this->form_validation->set_rules('tanggal_selesai', 'tanggal selesai', 'trim|required');
	$this->form_validation->set_rules('jenis_usaha', 'jenis usaha', 'trim|required');
	$this->form_validation->set_rules('jumlah_orang', 'jumlah orang', 'trim|required');

	$this->form_validation->set_rules('id_bumdesa', 'id_bumdesa', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function word()
    {
        header("Content-type: application/vnd.ms-word");
        header("Content-Disposition: attachment;Filename=tbl_bumdesa.doc");

        $data = array(
            'tbl_bumdesa_data' => $this->Tbl_bumdesa_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('tbl_bumdesa/tbl_bumdesa_doc',$data);
    }

}

/* End of file Tbl_bumdesa.php */
/* Location: ./application/controllers/Tbl_bumdesa.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2024-02-05 17:29:22 */
/* http://harviacode.com */