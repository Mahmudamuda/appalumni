<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tbl_anggota extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        is_login();
        $this->load->model('Tbl_anggota_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->uri->segment(3));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . '.php/c_url/index.html?q=' . urlencode($q);
            $config['first_url'] = base_url() . 'index.php/tbl_anggota/index.html?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 'index.php/tbl_anggota/index/';
            $config['first_url'] = base_url() . 'index.php/tbl_anggota/index/';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = FALSE;
        $config['total_rows'] = $this->Tbl_anggota_model->total_rows($q);
        $tbl_anggota = $this->Tbl_anggota_model->get_limit_data($config['per_page'], $start, $q);
        $config['full_tag_open'] = '<ul class="pagination pagination-sm no-margin pull-right">';
        $config['full_tag_close'] = '</ul>';
        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            'tbl_anggota_data' => $tbl_anggota,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $this->template->load('template','tbl_anggota/tbl_anggota_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Tbl_anggota_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id_anggota' => $row->id_anggota,
		'nik' => $row->nik,
		'no_kk' => $row->no_kk,
		'nama' => $row->nama,
		'tempat_lahir' => $row->tempat_lahir,
		'tanggal_lahir' => $row->tanggal_lahir,
		'jenis_kelamin' => $row->jenis_kelamin,
		'alamat' => $row->alamat,
		'kota' => $row->kota,
		'rt' => $row->rt,
		'rw' => $row->rw,
		'agama' => $row->agama,
		'status_kawin' => $row->status_kawin,
		'status' => $row->status,
		'foto' => $row->foto,
	    );
            $this->template->load('template','tbl_anggota/tbl_anggota_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_anggota'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('tbl_anggota/create_action'),
	    'id_anggota' => set_value('id_anggota'),
	    'nik' => set_value('nik'),
	    'no_kk' => set_value('no_kk'),
	    'nama' => set_value('nama'),
	    'tempat_lahir' => set_value('tempat_lahir'),
	    'tanggal_lahir' => set_value('tanggal_lahir'),
	    'jenis_kelamin' => set_value('jenis_kelamin'),
	    'alamat' => set_value('alamat'),
	    'kota' => set_value('kota'),
	    'rt' => set_value('rt'),
	    'rw' => set_value('rw'),
	    'agama' => set_value('agama'),
	    'status_kawin' => set_value('status_kawin'),
	    'status' => set_value('status'),
	    'foto' => set_value('foto'),
	);
        $this->template->load('template','tbl_anggota/tbl_anggota_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();
        $foto = $this->upload_foto();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
                'nik' => $this->input->post('nik',TRUE),
                'no_kk' => $this->input->post('no_kk',TRUE),
                'nama' => $this->input->post('nama',TRUE),
                'tempat_lahir' => $this->input->post('tempat_lahir',TRUE),
                'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
                'jenis_kelamin' => $this->input->post('jenis_kelamin',TRUE),
                'alamat' => $this->input->post('alamat',TRUE),
                'kota' => $this->input->post('kota',TRUE),
                'rt' => $this->input->post('rt',TRUE),
                'rw' => $this->input->post('rw',TRUE),
                'agama' => $this->input->post('agama',TRUE),
                'status_kawin' => $this->input->post('status_kawin',TRUE),
                'status' => $this->input->post('status',TRUE),
                'foto' => $foto['file_name'],
	    );

            $this->Tbl_anggota_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success 2');
            redirect(site_url('tbl_anggota'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Tbl_anggota_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('tbl_anggota/update_action'),
                'id_anggota' => set_value('id_anggota', $row->id_anggota),
                'nik' => set_value('nik', $row->nik),
                'no_kk' => set_value('no_kk', $row->no_kk),
                'nama' => set_value('nama', $row->nama),
                'tempat_lahir' => set_value('tempat_lahir', $row->tempat_lahir),
                'tanggal_lahir' => set_value('tanggal_lahir', $row->tanggal_lahir),
                'jenis_kelamin' => set_value('jenis_kelamin', $row->jenis_kelamin),
                'alamat' => set_value('alamat', $row->alamat),
                'kota' => set_value('kota', $row->kota),
                'rt' => set_value('rt', $row->rt),
                'rw' => set_value('rw', $row->rw),
                'agama' => set_value('agama', $row->agama),
                'status_kawin' => set_value('status_kawin', $row->status_kawin),
                'status' => set_value('status', $row->status),
                'foto' => set_value('foto', $row->foto),
	    );
            $this->template->load('template','tbl_anggota/tbl_anggota_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_anggota'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();
        $foto = $this->upload_foto();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id_anggota', TRUE));
        } else {
            if($foto['file_name']==''){
            $data = array(
                'nik' => $this->input->post('nik',TRUE),
                'no_kk' => $this->input->post('no_kk',TRUE),
                'nama' => $this->input->post('nama',TRUE),
                'tempat_lahir' => $this->input->post('tempat_lahir',TRUE),
                'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
                'jenis_kelamin' => $this->input->post('jenis_kelamin',TRUE),
                'alamat' => $this->input->post('alamat',TRUE),
                'kota' => $this->input->post('kota',TRUE),
                'rt' => $this->input->post('rt',TRUE),
                'rw' => $this->input->post('rw',TRUE),
                'agama' => $this->input->post('agama',TRUE),
                'status_kawin' => $this->input->post('status_kawin',TRUE),
                'status' => $this->input->post('status',TRUE));
            } else {
                $data = array(
                'nik' => $this->input->post('nik',TRUE),
                'no_kk' => $this->input->post('no_kk',TRUE),
                'nama' => $this->input->post('nama',TRUE),
                'tempat_lahir' => $this->input->post('tempat_lahir',TRUE),
                'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
                'jenis_kelamin' => $this->input->post('jenis_kelamin',TRUE),
                'alamat' => $this->input->post('alamat',TRUE),
                'kota' => $this->input->post('kota',TRUE),
                'foto'        =>$foto['file_name'],
                'rt' => $this->input->post('rt',TRUE),
                'rw' => $this->input->post('rw',TRUE),
                'agama' => $this->input->post('agama',TRUE),
                'status_kawin' => $this->input->post('status_kawin',TRUE),
                'status' => $this->input->post('status',TRUE));
            }
	   
            $this->Tbl_anggota_model->update($this->input->post('id_anggota', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('tbl_anggota'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Tbl_anggota_model->get_by_id($id);

        if ($row) {
            $this->Tbl_anggota_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('tbl_anggota'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('tbl_anggota'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('nik', 'nik', 'trim|required');
	$this->form_validation->set_rules('no_kk', 'no kk', 'trim|required');
	$this->form_validation->set_rules('nama', 'nama', 'trim|required');
	$this->form_validation->set_rules('tempat_lahir', 'tempat lahir', 'trim|required');
	$this->form_validation->set_rules('tanggal_lahir', 'tanggal lahir', 'trim|required');
	$this->form_validation->set_rules('jenis_kelamin', 'jenis kelamin', 'trim|required');
	$this->form_validation->set_rules('alamat', 'alamat', 'trim|required');
	$this->form_validation->set_rules('kota', 'kota', 'trim|required');
	$this->form_validation->set_rules('rt', 'rt', 'trim|required');
	$this->form_validation->set_rules('rw', 'rw', 'trim|required');
	$this->form_validation->set_rules('agama', 'agama', 'trim|required');
	$this->form_validation->set_rules('status_kawin', 'status kawin', 'trim|required');
	$this->form_validation->set_rules('status', 'status', 'trim|required');
	
	$this->form_validation->set_rules('id_anggota', 'id_anggota', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function word()
    {
        header("Content-type: application/vnd.ms-word");
        header("Content-Disposition: attachment;Filename=tbl_anggota.doc");

        $data = array(
            'tbl_anggota_data' => $this->Tbl_anggota_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('tbl_anggota/tbl_anggota_doc',$data);
    }

    function upload_foto(){
        $config['upload_path']          = './assets/foto_profil';
        $config['allowed_types']        = 'gif|jpg|png';
        //$config['max_size']             = 100;
        //$config['max_width']            = 1024;
        //$config['max_height']           = 768;
        $this->load->library('upload', $config);
        $this->upload->do_upload('foto');
        return $this->upload->data();
    }

}

/* End of file Tbl_anggota.php */
/* Location: ./application/controllers/Tbl_anggota.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2024-02-05 16:50:38 */
/* http://harviacode.com */