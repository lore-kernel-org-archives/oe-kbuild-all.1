Content-Type: multipart/mixed; boundary="===============6338306295565952055=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [vsyrjala:dp_downstream_ports_5 18/34] htmldocs: drivers/gpu/drm/drm_dp_helper.c:633: warning: Function parameter or member 'dev' not described in 'drm_dp_downstream_mode'
Date: Tue, 04 Feb 2020 14:27:41 +0800
Message-ID: <202002041431.rTD0nJFO%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6338306295565952055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/vsyrjala/linux.git dp_downstream_ports_5
head:   78d4acaff0dc033dbec908b27093d24bb854c369
commit: a70c77431759cba71b5d0edeb810fc5627f60f1f [18/34] drm/dp: Add drm_dp=
_downstream_mode()
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_read' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_write' not described in 'security_list_options'
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not =
found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' no=
t found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier=
' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' =
not found
   include/linux/regulator/machine.h:196: warning: Function parameter or me=
mber 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or mem=
ber 'resume' not described in 'regulator_ops'
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
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function paramet=
er or member 'prepare_writeback_job' not described in 'drm_connector_helper=
_funcs'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function paramet=
er or member 'cleanup_writeback_job' not described in 'drm_connector_helper=
_funcs'
   drivers/gpu/drm/drm_atomic_state_helper.c:646: warning: Excess function =
parameter 'state' description in 'drm_atomic_helper_bridge_reset'
   drivers/gpu/drm/drm_atomic_state_helper.c:647: warning: Excess function =
parameter 'state' description in 'drm_atomic_helper_bridge_reset'
   drivers/gpu/drm/bridge/panel.c:303: warning: Function parameter or membe=
r 'bridge' not described in 'drm_panel_bridge_connector'
   drivers/gpu/drm/drm_dp_helper.c:384: warning: Function parameter or memb=
er 'type' not described in 'drm_dp_downstream_is_type'
>> drivers/gpu/drm/drm_dp_helper.c:633: warning: Function parameter or memb=
er 'dev' not described in 'drm_dp_downstream_mode'
   include/drm/drm_dp_mst_helper.h:162: warning: Function parameter or memb=
er 'fec_capable' not described in 'drm_dp_mst_port'
   include/drm/gpu_scheduler.h:102: warning: Function parameter or member '=
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
   Documentation/usb/index.rst:5: WARNING: toctree contains reference to no=
nexisting document 'usb/rio'
   Documentation/usb/index.rst:5: WARNING: toctree contains reference to no=
nexisting document 'usb/wusb-design-overview'
   Documentation/x86/boot.rst:72: WARNING: Malformed table.
   Text in column margin in table line 57.

vim +633 drivers/gpu/drm/drm_dp_helper.c

   617	=

   618	/**
   619	 * drm_dp_downstream_mode() - return a mode for downstream facing po=
rt
   620	 * @dpcd: DisplayPort configuration data
   621	 * @port_cap: port capabilities
   622	 *
   623	 * Provides a suitable mode for downstream facing ports without EDID.
   624	 *
   625	 * Returns a new drm_display_mode on success or NULL on failure
   626	 */
   627	struct drm_display_mode *
   628	drm_dp_downstream_mode(struct drm_device *dev,
   629			       const u8 dpcd[DP_RECEIVER_CAP_SIZE],
   630			       const u8 port_cap[4])
   631	=

   632	{
 > 633		u8 vic;
   634	=

   635		if (!drm_dp_is_branch(dpcd))
   636			return NULL;
   637	=

   638		if (dpcd[DP_DPCD_REV] < 0x11)
   639			return NULL;
   640	=

   641		switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
   642		case DP_DS_PORT_TYPE_NON_EDID:
   643			switch (port_cap[0] & DP_DS_NON_EDID_MASK) {
   644			case DP_DS_NON_EDID_720x480i_60:
   645				vic =3D 6;
   646				break;
   647			case DP_DS_NON_EDID_720x480i_50:
   648				vic =3D 21;
   649				break;
   650			case DP_DS_NON_EDID_1920x1080i_60:
   651				vic =3D 5;
   652				break;
   653			case DP_DS_NON_EDID_1920x1080i_50:
   654				vic =3D 20;
   655				break;
   656			case DP_DS_NON_EDID_1280x720_60:
   657				vic =3D 4;
   658				break;
   659			case DP_DS_NON_EDID_1280x720_50:
   660				vic =3D 19;
   661				break;
   662			default:
   663				return NULL;
   664			}
   665			return drm_display_mode_from_cea_vic(dev, vic);
   666		default:
   667			return NULL;
   668		}
   669	}
   670	EXPORT_SYMBOL(drm_dp_downstream_mode);
   671	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corpor=
ation

--===============6338306295565952055==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6338306295565952055==--

