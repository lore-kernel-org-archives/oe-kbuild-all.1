Content-Type: multipart/mixed; boundary="===============7326406021857714760=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [dax:readahead 6/13] htmldocs: fs/mpage.c:383: warning: Function parameter or member 'rac' not described in 'mpage_readahead'
Date: Tue, 11 Feb 2020 18:11:42 +0800
Message-ID: <202002111838.88FKInPk%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7326406021857714760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/willy/linux-dax.git readahead
head:   1e482175acab90ed79d3ce6069d4e078f01bb24a
commit: f15ed1ce0b69b4b2ed8bdb5b497e709962b4d173 [6/13] fs: Convert mpage_r=
eadpages to mpage_readahead
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   Warning: The Sphinx 'sphinx_rtd_theme' HTML theme was not found. Make su=
re you have the theme installed to produce pretty HTML output. Falling back=
 to the default theme.
   WARNING: dot(1) not found, for better output quality install graphviz fr=
om http://www.graphviz.org
   WARNING: convert(1) not found, for SVG to PDF conversion install ImageMa=
gick (https://www.imagemagick.org)
   include/linux/spi/spi.h:207: warning: Function parameter or member 'driv=
er_override' not described in 'spi_device'
   include/linux/spi/spi.h:658: warning: Function parameter or member 'irq_=
flags' not described in 'spi_controller'
   include/kunit/test.h:240: warning: Excess function parameter 'suites' de=
scription in 'kunit_test_suites'
   include/linux/pipe_fs_i.h:66: warning: Function parameter or member 'rd_=
wait' not described in 'pipe_inode_info'
   include/linux/pipe_fs_i.h:66: warning: Function parameter or member 'wr_=
wait' not described in 'pipe_inode_info'
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' no=
t found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not =
found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' =
not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier=
' not found
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:92: warning: Function parameter o=
r member 'vm' not described in 'amdgpu_vm_eviction_lock'
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comme=
nts found
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured commen=
ts found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:305: warning: Function=
 parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_mana=
ger'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'q=
uotactl' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'q=
uota_on' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 's=
b_free_mnt_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 's=
b_eat_lsm_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 's=
b_kern_mount' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 's=
b_show_options' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 's=
b_add_mnt_opt' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'd=
_instantiate' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'g=
etprocattr' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 's=
etprocattr' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'l=
ocked_down' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_open' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_alloc' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_free' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_read' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_write' not described in 'security_list_options'
   include/linux/regulator/machine.h:196: warning: Function parameter or me=
mber 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or mem=
ber 'resume' not described in 'regulator_ops'
>> fs/mpage.c:383: warning: Function parameter or member 'rac' not describe=
d in 'mpage_readahead'
   fs/mpage.c:383: warning: Excess function parameter 'mapping' description=
 in 'mpage_readahead'
   fs/mpage.c:383: warning: Excess function parameter 'start' description i=
n 'mpage_readahead'
   fs/mpage.c:383: warning: Excess function parameter 'nr_pages' descriptio=
n in 'mpage_readahead'
   include/linux/skbuff.h:890: warning: Function parameter or member 'dev_s=
cratch' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'list'=
 not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'ip_de=
frag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'skb_m=
stamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member '__clo=
ned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'head_=
frag' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member '__pkt=
_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'encap=
sulation' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'encap=
_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'csum_=
valid' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member '__pkt=
_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'vlan_=
present' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'csum_=
complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'csum_=
level' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'inner=
_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'remcs=
um_offload' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'sende=
r_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'reser=
ved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'inner=
_ipproto' not described in 'sk_buff'
   include/net/sock.h:232: warning: Function parameter or member 'skc_addrp=
air' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_portp=
air' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_ipv6o=
nly' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_net_r=
efcnt' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_v6_da=
ddr' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_v6_rc=
v_saddr' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_cooki=
e' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_liste=
ner' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_tw_dr=
' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_rcv_w=
nd' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_tw_rc=
v_nxt' not described in 'sock_common'
   include/net/sock.h:498: warning: Function parameter or member 'sk_rx_skb=
_cache' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_wq_raw=
' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'tcp_rtx_q=
ueue' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_tx_skb=
_cache' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_route_=
forced_caps' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_txtime=
_report_errors' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_valida=
te_xmit_skb' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_bpf_st=
orage' not described in 'sock'
   include/net/sock.h:2444: warning: Function parameter or member 'tcp_rx_s=
kb_cache_key' not described in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2444: warning: Excess function parameter 'sk' descrip=
tion in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2444: warning: Excess function parameter 'skb' descri=
ption in 'DECLARE_STATIC_KEY_FALSE'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'g=
so_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'l=
3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'x=
frmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 't=
lsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'n=
ame_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'i=
eee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'm=
pls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'x=
dp_prog' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'g=
ro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'x=
dp_bulkq' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'x=
ps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'x=
ps_rxqs_map' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'q=
disc_hash' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETH=
TOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_sta=
te'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETH=
TOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_=
state'
   drivers/infiniband/core/umem_odp.c:161: warning: Function parameter or m=
ember 'ops' not described in 'ib_umem_odp_alloc_child'
   drivers/infiniband/core/umem_odp.c:211: warning: Function parameter or m=
ember 'ops' not described in 'ib_umem_odp_get'
   drivers/infiniband/ulp/iser/iscsi_iser.h:401: warning: Function paramete=
r or member 'all_list' not described in 'iser_fr_desc'
   drivers/infiniband/ulp/iser/iscsi_iser.h:415: warning: Function paramete=
r or member 'all_list' not described in 'iser_fr_pool'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function =
parameter or member 'rsvd0' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function =
parameter or member 'rsvd1' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function =
parameter or member 'rsvd2' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function =
parameter or member 'rsvd3' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function =
parameter or member 'rsvd4' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function =
parameter or member 'rsvd0' not described in 'opa_per_veswport_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function =
parameter or member 'rsvd1' not described in 'opa_per_veswport_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function =
parameter or member 'rsvd2' not described in 'opa_per_veswport_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function =
parameter or member 'rsvd3' not described in 'opa_per_veswport_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:263: warning: Function =
parameter or member 'tbl_entries' not described in 'opa_veswport_mactable'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:342: warning: Function =
parameter or member 'reserved' not described in 'opa_veswport_summary_count=
ers'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd0' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd1' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd2' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd3' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd4' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd5' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd6' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd7' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd8' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function =
parameter or member 'rsvd9' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:460: warning: Function =
parameter or member 'reserved' not described in 'opa_vnic_vema_mad'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:485: warning: Function =
parameter or member 'reserved' not described in 'opa_vnic_notice_attr'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:500: warning: Function =
parameter or member 'reserved' not described in 'opa_vnic_vema_mad_trap'
   include/linux/input/sparse-keymap.h:43: warning: Function parameter or m=
ember 'sw' not described in 'key_entry'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function paramet=
er or member 'prepare_writeback_job' not described in 'drm_connector_helper=
_funcs'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function paramet=
er or member 'cleanup_writeback_job' not described in 'drm_connector_helper=
_funcs'
   drivers/gpu/drm/bridge/panel.c:303: warning: Function parameter or membe=
r 'bridge' not described in 'drm_panel_bridge_connector'
   include/drm/drm_dp_mst_helper.h:162: warning: Function parameter or memb=
er 'fec_capable' not described in 'drm_dp_mst_port'
   include/drm/gpu_scheduler.h:103: warning: Function parameter or member '=
priority' not described in 'drm_sched_entity'
   drivers/gpu/drm/i915/i915_vma.h:1: warning: 'Virtual Memory Address' not=
 found
   drivers/gpu/drm/i915/i915_gem_gtt.c:1: warning: 'Global GTT views' not f=
ound
   include/linux/host1x.h:66: warning: Function parameter or member 'parent=
' not described in 'host1x_client'
   include/linux/host1x.h:66: warning: Function parameter or member 'usecou=
nt' not described in 'host1x_client'
   include/linux/host1x.h:66: warning: Function parameter or member 'lock' =
not described in 'host1x_client'
   include/net/cfg80211.h:1189: warning: Function parameter or member 'txpw=
r' not described in 'station_parameters'
   include/net/mac80211.h:4081: warning: Function parameter or member 'sta_=
set_txpwr' not described in 'ieee80211_ops'

vim +383 fs/mpage.c

   339	=

   340	/**
   341	 * mpage_readahead - start reads against pages
   342	 * @mapping: the address_space
   343	 * @start: The number of the first page to read.
   344	 * @nr_pages: The number of consecutive pages to read.
   345	 * @get_block: The filesystem's block mapper function.
   346	 *
   347	 * This function walks the pages and the blocks within each page, bu=
ilding and
   348	 * emitting large BIOs.
   349	 *
   350	 * If anything unusual happens, such as:
   351	 *
   352	 * - encountering a page which has buffers
   353	 * - encountering a page which has a non-hole after a hole
   354	 * - encountering a page with non-contiguous blocks
   355	 *
   356	 * then this code just gives up and calls the buffer_head-based read=
 function.
   357	 * It does handle a page which has holes at the end - that is a comm=
on case:
   358	 * the end-of-file on blocksize < PAGE_SIZE setups.
   359	 *
   360	 * BH_Boundary explanation:
   361	 *
   362	 * There is a problem.  The mpage read code assembles several pages,=
 gets all
   363	 * their disk mappings, and then submits them all.  That's fine, but=
 obtaining
   364	 * the disk mappings may require I/O.  Reads of indirect blocks, for=
 example.
   365	 *
   366	 * So an mpage read of the first 16 blocks of an ext2 file will caus=
e I/O to be
   367	 * submitted in the following order:
   368	 *
   369	 * 	12 0 1 2 3 4 5 6 7 8 9 10 11 13 14 15 16
   370	 *
   371	 * because the indirect block has to be read to get the mappings of =
blocks
   372	 * 13,14,15,16.  Obviously, this impacts performance.
   373	 *
   374	 * So what we do it to allow the filesystem's get_block() function t=
o set
   375	 * BH_Boundary when it maps block 11.  BH_Boundary says: mapping of =
the block
   376	 * after this one will require I/O against a block which is probably=
 close to
   377	 * this one.  So you should push what I/O you have currently accumul=
ated.
   378	 *
   379	 * This all causes the disk requests to be issued in the correct ord=
er.
   380	 */
   381	void mpage_readahead(struct readahead_control *rac, get_block_t get_=
block)
   382	{
 > 383		struct page *page;
   384		struct mpage_readpage_args args =3D {
   385			.get_block =3D get_block,
   386			.is_readahead =3D true,
   387		};
   388	=

   389		readahead_for_each(rac, page) {
   390			prefetchw(&page->flags);
   391			args.page =3D page;
   392			args.nr_pages =3D readahead_count(rac);
   393			args.bio =3D do_mpage_readpage(&args);
   394			put_page(page);
   395		}
   396		if (args.bio)
   397			mpage_bio_submit(REQ_OP_READ, REQ_RAHEAD, args.bio);
   398	}
   399	EXPORT_SYMBOL(mpage_readahead);
   400	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7326406021857714760==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
m2zSf6Sx7JJkaQAA
--===============7326406021857714760==--

