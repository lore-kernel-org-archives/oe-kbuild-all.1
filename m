Content-Type: multipart/mixed; boundary="===============1196338168207325989=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 09/46] libata: move ata_dump_id() to dynamic debugging
Date: Wed, 05 Feb 2020 09:51:35 +0800
Message-ID: <202002050952.2bQ21sJQ%lkp@intel.com>
In-Reply-To: <20200204165547.115220-10-hare@suse.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1196338168207325989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Hannes,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/perf/core]
[also build test WARNING on v5.5]
[cannot apply to block/for-next next-20200204]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Hannes-Reinecke/ata-kill-A=
TA_DEBUG/20200205-040548
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 0cc4bd8=
f70d1ea2940295f1050508c663fe9eff9
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
   include/linux/spi/spi.h:650: warning: Function parameter or member 'irq_=
flags' not described in 'spi_controller'
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comme=
nts found
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured commen=
ts found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:254: warning: Function=
 parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_mana=
ger'
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not =
found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' no=
t found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' =
not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier=
' not found
   include/linux/regulator/machine.h:196: warning: Function parameter or me=
mber 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or mem=
ber 'resume' not described in 'regulator_ops'
   sound/soc/soc-core.c:2522: warning: Function parameter or member 'legacy=
_dai_naming' not described in 'snd_soc_register_dai'
   drivers/infiniband/core/umem_odp.c:167: warning: Function parameter or m=
ember 'ops' not described in 'ib_umem_odp_alloc_child'
   drivers/infiniband/core/umem_odp.c:217: warning: Function parameter or m=
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
>> drivers/ata/libata-core.c:1454: warning: Function parameter or member 'a=
p' not described in 'ata_dump_id'
   include/linux/skbuff.h:888: warning: Function parameter or member 'dev_s=
cratch' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'list'=
 not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'ip_de=
frag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'skb_m=
stamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__clo=
ned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'head_=
frag' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__pkt=
_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'encap=
sulation' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'encap=
_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_=
valid' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__pkt=
_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'vlan_=
present' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_=
complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_=
level' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'inner=
_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'remcs=
um_offload' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'sende=
r_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'reser=
ved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'inner=
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
   include/net/sock.h:514: warning: Function parameter or member 'sk_rx_skb=
_cache' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_wq_raw=
' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'tcp_rtx_q=
ueue' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_tx_skb=
_cache' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_route_=
forced_caps' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_txtime=
_report_errors' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_valida=
te_xmit_skb' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_bpf_st=
orage' not described in 'sock'
   include/net/sock.h:2459: warning: Function parameter or member 'tcp_rx_s=
kb_cache_key' not described in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2459: warning: Excess function parameter 'sk' descrip=
tion in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2459: warning: Excess function parameter 'skb' descri=
ption in 'DECLARE_STATIC_KEY_FALSE'
   net/core/skbuff.c:5489: warning: Function parameter or member 'ethernet'=
 not described in 'skb_mpls_push'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'g=
so_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'l=
3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'x=
frmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 't=
lsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'n=
ame_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'i=
eee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'm=
pls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'x=
dp_prog' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'g=
ro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'n=
f_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'q=
disc_hash' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'x=
ps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'x=
ps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETH=
TOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_sta=
te'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETH=
TOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_=
state'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function paramet=
er or member 'prepare_writeback_job' not described in 'drm_connector_helper=
_funcs'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function paramet=
er or member 'cleanup_writeback_job' not described in 'drm_connector_helper=
_funcs'
   include/net/cfg80211.h:1189: warning: Function parameter or member 'txpw=
r' not described in 'station_parameters'
   include/net/mac80211.h:4081: warning: Function parameter or member 'sta_=
set_txpwr' not described in 'ieee80211_ops'
   include/net/mac80211.h:2036: warning: Function parameter or member 'txpw=
r' not described in 'ieee80211_sta'
   include/linux/devfreq.h:187: warning: Function parameter or member 'last=
_status' not described in 'devfreq'
   drivers/devfreq/devfreq.c:1818: warning: bad line: - Resource-managed de=
vfreq_register_notifier()
   drivers/devfreq/devfreq.c:1854: warning: bad line: - Resource-managed de=
vfreq_unregister_notifier()
   drivers/devfreq/devfreq-event.c:355: warning: Function parameter or memb=
er 'edev' not described in 'devfreq_event_remove_edev'
   drivers/devfreq/devfreq-event.c:355: warning: Excess function parameter =
'dev' description in 'devfreq_event_remove_edev'
   Documentation/admin-guide/hw-vuln/tsx_async_abort.rst:142: WARNING: dupl=
icate label virt_mechanism, other instance in Documentation/admin-guide/hw-=
vuln/mds.rst
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends wit=
hout a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends wit=
hout a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends wit=
hout a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends wit=
hout a blank line; unexpected unindent.
   Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline em=
phasis start-string without end-string.
   Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline em=
phasis start-string without end-string.
   include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-st=
ring without end-string.
   drivers/firewire/core-transaction.c:606: WARNING: Inline strong start-st=
ring without end-string.
   Documentation/x86/boot.rst:72: WARNING: Malformed table.
   Text in column margin in table line 57.

vim +1454 drivers/ata/libata-core.c

  1440	=

  1441	/**
  1442	 *	ata_dump_id - IDENTIFY DEVICE info debugging output
  1443	 *	@id: IDENTIFY DEVICE page to dump
  1444	 *
  1445	 *	Dump selected 16-bit words from the given IDENTIFY DEVICE
  1446	 *	page.
  1447	 *
  1448	 *	LOCKING:
  1449	 *	caller.
  1450	 */
  1451	=

  1452	static inline void ata_dump_id(struct ata_port *ap, const u16 *id)
  1453	{
> 1454		ata_port_dbg(ap,
  1455			"49=3D=3D0x%04x  53=3D=3D0x%04x  63=3D=3D0x%04x  64=3D=3D0x%04x  7=
5=3D=3D0x%04x\n"
  1456			"80=3D=3D0x%04x  81=3D=3D0x%04x  82=3D=3D0x%04x  83=3D=3D0x%04x  8=
4=3D=3D0x%04x\n"
  1457			"88=3D=3D0x%04x  93=3D=3D0x%04x\n",
  1458			id[49], id[53], id[63], id[64], id[75], id[80],
  1459			id[81], id[82], id[83], id[84], id[88], id[93]);
  1460	}
  1461	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============1196338168207325989==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1196338168207325989==--

