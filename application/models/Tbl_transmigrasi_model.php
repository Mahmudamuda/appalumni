<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tbl_transmigrasi_model extends CI_Model
{

    public $table = 'tbl_transmigrasi';
    public $id = 'id_transmigrasi';
    public $order = 'DESC';

    function __construct()
    {
        parent::__construct();
    }

    // get all
    function get_all()
    {
        $this->db->order_by($this->id, $this->order);
        return $this->db->get($this->table)->result();
    }

    // get data by id
    function get_by_id($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }
    
    // get total rows
    function total_rows($q = NULL) {
        $this->db->like('id_transmigrasi', $q);
        $this->db->join('tbl_anggota' , 'tbl_anggota.id_anggota = tbl_transmigrasi.id_anggota');
        $this->db->or_like('tanggal_mulai', $q);
        $this->db->or_like('tanggal_selesai', $q);
        $this->db->or_like('asal_kota', $q);
        $this->db->or_like('kota_tujuan', $q);
	$this->db->from($this->table);
        return $this->db->count_all_results();
    }

    // get data with limit and search
    function get_limit_data($limit, $start = 0, $q = NULL) {
        $this->db->order_by($this->id, $this->order);
        $this->db->like('id_transmigrasi', $q);
        $this->db->join('tbl_anggota' , 'tbl_anggota.id_anggota = tbl_transmigrasi.id_anggota');
        $this->db->or_like('tanggal_mulai', $q);
        $this->db->or_like('tanggal_selesai', $q);
        $this->db->or_like('asal_kota', $q);
        $this->db->or_like('kota_tujuan', $q);
        $this->db->limit($limit, $start);
        return $this->db->get($this->table)->result();
    }

    // insert data
    function insert($data)
    {
        $this->db->insert($this->table, $data);
    }

    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table);
    }

}

/* End of file Tbl_transmigrasi_model.php */
/* Location: ./application/models/Tbl_transmigrasi_model.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2024-02-05 17:36:30 */
/* http://harviacode.com */