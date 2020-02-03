Content-Type: multipart/mixed; boundary="===============5550001049131651806=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 6/7] net: phylink: Introduce phylink_fwnode_phy_connect()
Date: Tue, 04 Feb 2020 02:21:46 +0800
Message-ID: <202002040222.w3eEuGSb%lkp@intel.com>
In-Reply-To: <20200131153440.20870-7-calvin.johnson@nxp.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5550001049131651806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Calvin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.5]
[cannot apply to driver-core/driver-core-testing net-next/master net/master=
 linus/master sparc-next/master next-20200203]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Calvin-Johnson/ACPI-suppor=
t-for-xgmac_mdio-and-dpaa2-mac-drivers/20200203-070754
base:    d5226fa6dbae0569ee43ecfc08bdcd6770fc4755
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comme=
nts found
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured commen=
ts found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:254: warning: Function=
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
   drivers/net/phy/mdio_bus.c:861: warning: Function parameter or member 'c=
hild' not described in 'fwnode_mdiobus_child_is_phy'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETH=
TOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_sta=
te'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETH=
TOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_=
state'
>> drivers/net/phy/phylink.c:836: warning: Function parameter or member 'fw=
node' not described in 'phylink_fwnode_phy_connect'
   drivers/net/phy/phylink.c:836: warning: Excess function parameter 'dn' d=
escription in 'phylink_fwnode_phy_connect'
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

vim +836 drivers/net/phy/phylink.c

   820	=

   821	/**
   822	 * phylink_fwnode_phy_connect() - connect the PHY specified in the f=
wnode.
   823	 * @pl: a pointer to a &struct phylink returned from phylink_create()
   824	 * @dn: a pointer to a &struct device_node.
   825	 * @flags: PHY-specific flags to communicate to the PHY device driver
   826	 *
   827	 * Connect the phy specified in the device node @dn to the phylink i=
nstance
   828	 * specified by @pl. Actions specified in phylink_connect_phy() will=
 be
   829	 * performed.
   830	 *
   831	 * Returns 0 on success or a negative errno.
   832	 */
   833	int phylink_fwnode_phy_connect(struct phylink *pl,
   834				       struct fwnode_handle *fwnode,
   835				       u32 flags)
 > 836	{
   837		struct fwnode_handle *phy_node;
   838		struct phy_device *phy_dev;
   839		int ret;
   840		int status;
   841		struct fwnode_reference_args args;
   842	=

   843		/* Fixed links and 802.3z are handled without needing a PHY */
   844		if (pl->link_an_mode =3D=3D MLO_AN_FIXED ||
   845		    (pl->link_an_mode =3D=3D MLO_AN_INBAND &&
   846		     phy_interface_mode_is_8023z(pl->link_interface)))
   847			return 0;
   848	=

   849		status =3D acpi_node_get_property_reference(fwnode, "phy-handle", 0,
   850							  &args);
   851		if (ACPI_FAILURE(status) || !is_acpi_device_node(args.fwnode))
   852			status =3D acpi_node_get_property_reference(fwnode, "phy", 0,
   853								  &args);
   854		if (ACPI_FAILURE(status) || !is_acpi_device_node(args.fwnode))
   855			status =3D acpi_node_get_property_reference(fwnode,
   856								  "phy-device", 0,
   857								  &args);
   858	=

   859		if (ACPI_FAILURE(status) || !is_acpi_device_node(args.fwnode)) {
   860			if (pl->link_an_mode =3D=3D MLO_AN_PHY)
   861				return -ENODEV;
   862			return 0;
   863		}
   864	=

   865		phy_dev =3D fwnode_phy_find_device(args.fwnode);
   866		if (phy_dev)
   867			phy_attach_direct(pl->netdev, phy_dev, flags,
   868					  pl->link_interface);
   869	=

   870		/* refcount is held by phy_attach_direct() on success */
   871		put_device(&phy_dev->mdio.dev);
   872	=

   873		if (!phy_dev)
   874			return -ENODEV;
   875	=

   876		ret =3D phylink_bringup_phy(pl, phy_dev);
   877		if (ret)
   878			phy_detach(phy_dev);
   879	=

   880		return ret;
   881	}
   882	EXPORT_SYMBOL_GPL(phylink_fwnode_phy_connect);
   883	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============5550001049131651806==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICG1TOF4AAy5jb25maWcAlDxbc9s2s+/9FZx05kwy3yRxbMd1zxk/QCAoouYtBClLfuGoMp1o
aks+ktwm//7sAqQIkgulp9M2MfaC22Lv9K+//Oqx18P2eXlYr5ZPTz+8r/Wm3i0P9YP3uH6q/8fz
Uy9JC0/4svgAyNF68/r94/ri+sr7/OHzhzPvtt5t6iePbzeP66+vQLnebn759Rf491cYfH4BJrv/
9r6uVu9/89769Z/r5cb7DSnfX7wzfwFUniaBnFacV1JVU85vfrRD8EM1E7mSaXLz29nns7MjbsSS
6RF0ZrHgLKkimdx2TGAwZKpiKq6maZGSAJkAjRiB7lieVDFbTERVJjKRhWSRvBd+hyjzL9VdmlvT
TUoZ+YWMRSXmBZtEolJpXnTwIswF82HGIIX/VQVTSKxPbKpP/8nb14fXl+5gJnl6K5IqTSoVZ9bU
sJ5KJLOK5VPYciyLm4tzPPdmC2mcSZi9EKrw1ntvsz0g45Y6SjmL2gN886ajswEVK4uUINZ7rBSL
CiRtBkM2E9WtyBMRVdN7aa3UhkwAck6DovuY0ZD5vYsidQEuO0B/TceN2guy9zhEwGWdgs/vT1On
p8GXxPn6ImBlVFRhqoqExeLmzdvNdlO/s65JLdRMZpzkzfNUqSoWcZovKlYUjIckXqlEJCfE/Poo
Wc5DEAB4+jAXyETUiinIvLd//XP/Y3+onzsxnYpE5JLrJ5Hl6cR6TjZIhekdDcmFEvmMFSh4ceqL
/isL0pwLv3k+Mpl2UJWxXAlE0tdbbx687eNglZ3iSPmtSkvgBa+74KGfWpz0lm0UnxXsBBifoKU0
LMgMFAUQiypiqqj4gkfEcWgtMetOdwDW/MRMJIU6Caxi0CPM/6NUBYEXp6oqM1xLe3/F+rne7akr
DO+rDKhSX3L7pSQpQqQfCVKMNJiEhHIa4rXqneaqj9Pc02g17WKyXIg4K4C91sxHpu34LI3KpGD5
gpy6wbJhxipl5cdiuf/LO8C83hLWsD8sD3tvuVptXzeH9eZrdxyF5LcVEFSM8xTmMlJ3nAKlUl9h
B6aXoiS583+xFL3knJeeGl8WzLeoAGYvCX4EswN3SKl8ZZBtctXSN0vqT2Vt9db8xaUrykQ1to6H
8Ei1cLbiplbf6odXcAS8x3p5eN3Vez3czEhAe8/tjiVFNcGXCnzLJGZZVUSTKohKFY7stUyKT+fX
9oHwaZ6WmaLVZCj4bZYCEcpokea0eJstoSXUvEicXESMlsNJdAvqfKZVRe4T5wdLTzMQI/ArUMfh
A4Q/YpbwntQP0RT8xXkb0v90ZelHUDBFBHLBRaaVa5EzLgaGM+Mqu4XZI1bg9B3UiJO9lBhMkwTb
kdPHNRVFDE5N1eg1GmmhAnUSIwhZ4lI4WarknNQpx8cPl3pL30fpeKT9/dO0DMxMULpWXBZiTkJE
lrrOQU4TFgU+CdQbdMC05nfAVAimn4QwSTsjMq3K3KW+mD+TsO/msugDhwknLM+lQyZukXAR07ST
LDgpCShp2h0KqOejlQS+/W4JwC0BwwfvuacalfhC0AOV8H3bpTfPAeasjrbXkpJPZz2HTauyJgrK
6t3jdve83KxqT/xdb0CVM1ByHJU5mLhOczuY+wKE0wBhz9UshhNJBx5eozX/5Ywd71lsJqy0pXK9
G4wZGKjbnH47KmKUt6iicmLvQ0XpxEkP95RPRevhutECsN+RBN8pBz2Q0uLcRwxZ7oPT43oTZRCA
fcoYTK7PlYHCdyiPNJDR6DU0J9+P0dojmF9fVRdWWAM/24GaKvKSa9XrCw6ebd4B07LIyqLSKh+i
qfrp8eL8PUbYb3oSDudlfrx5s9ytvn38fn31caWj7r2Ox6uH+tH8fKRDG+yLrFJllvUiUDDV/Fbb
gDEsjsuBvxujyc0Tv5pI42reXJ+Cs/nNpysaoZWun/DpofXYHYMFxSo/HjrmEKe3pqwKfE64wuCT
T3J0yn001wNy1CHo66Epn1MwiKIEphaEtr0EBkgNvKwqm4IEFQN9okRRZvi2jT8JMUyHkAjwL1qQ
1kfAKsewISztREYPTwsyiWbWIycQYJpYCsylkpNouGRVqkzAeTvA2vHSR8eiKizBqkeTEQctParV
XLAk/bR67wDeBQRB94tqqlzkpQ4XLXAA5l2wPFpwDAWF5Y1kU+NnRqDNInVzPnAAFcPrQfnGOxAc
3njrhma77are77c77/DjxbjbPX+0YXQP0QYKF61FYtr9w20GghVlLiqM12ntOk0jP5CKjsVzUYCX
ANLlnMAIJ7hyOW0nEUfMC7hSFJNTfkxzKzKX9EKNx5vGEvRSDtuptJPssO3hAkQSPATwSaflINfU
+QeX11eKdo4QRAM+nwAUik59ICyO54SViq+0Tu4wQfjBjY2lpBkdwafh9Am30EsaeuvY2O1vjvFr
epznpUppiYlFEEgu0oSG3smEhzLjjoU04AvamMagIh18pwLM23T+6QS0ihyCwBe5nDvPeyYZv6jo
TJ0GOs4O/UAHFbgA7gfSWA1CkhCq30OCuzF2QYUyKG4+2yjRJzcM/bsMVJSJQVUZ91UmSHd/gMfZ
nIfTq8vhcDrrj4BdlXEZa2URsFhGi5srG641NUSDscr7OZWUC4VvWIkI1CYVpwJH0Nh651ayqh3W
l9fzgVoIi/3xYLiYpgnBBZ4NK/MxANyVRMWiYOQUZczJ8fuQpXOZ2DsNM1GYyIq8eT+WxN4TbXMV
+qJgdSdiCjw/0UBQv2NQ4+2OADDQkzk8rUzSmk3fLu89dmPXrBjgebtZH7Y7k8TqLrcLN/AyQJvf
DXffOLcOXv1FRGLK+AIiCod61s8jzSL8n3BYoCKFRzGhjay8pqMP5JuLSZoW4B64cjqx5CDK8C7d
Z6jom29MrKRVXpJiLnMQV7ciZSCXveRgM3h1SeXMZrHKIrCuFz2SbhRTPeQyWpRzOlTvwD/l8Ila
l3Yq0yAAb/Xm7Ds/M/8M9jnw4gLwNGAUBJ8RPqZOzbvBWtm0lQrM+VuaRUYoaVHrfGBKvRQ3Z/0j
zooTDhPqVogjUoXJgLzUyS+HPje1B7BN6d3N1aUlT0VOi4te/4nYFJkqCGmcQHAtshPGJQIjMNdH
ghdiiwmFQVtjAnNY0Ot8PsEx8KJdvPvq09kZJfn31fnns57Y31cXfdQBF5rNDbCx0kViLlyVLaYg
GC5j6uiycKEkBHkYAOQowJ8a+bXTtBj4oySeooc4cZoA/fmAvIlMZ76iz5DHvo4PQUfRLjpcgQwW
VeQXdMarVcMnQpXe+zGPqn0/YVpkUTk9Bjzbf+qdB8p8+bV+rjcHzYfxTHrbF6zT98KeJhikEyKU
0utHcMjWFgM9DSlmQW+8Lcl4wa7+39d6s/rh7VfLp4EB085M3k/f2VUUgvrIWD481UNe40qWxcsQ
HK/ip4eomU9e9+2A9zbj0qsPqw/v7HkxZzEpFXGSTTYDLX+vuqQcMShHuSRBaeQoCINA0z53IorP
n89ob11rsIUKJuRROXZsTmO9We5+eOL59WnZSlr/CWlnreM1wu8XosFNx6xPCuq0Fe5gvXv+Z7mr
PX+3/tskV7vcuE/LcSDz+I7l+r24NPM0TaeROKKOZLWov+6W3mM7+4Oe3a5nORBa8Gjd/e6FWdxz
CGRelNhxwoaWq9cuggnB9aFeoYJ4/1C/wFQoqd0rt6dITXrTssTtSJXE0njG9hr+AF1bRWwiIkpx
I0cdaErMLZeJ1pxYLeMYTgysPQY92DlSyKSaqDs27BCREKlhEpBIn90OM0RmFJMmFACcH5rAjGIr
TUAVwYIyMWlakecQC8nkD6F/HqDBQQ1G9P40xzBNbwdAfNzwcyGnZVoSpXwFJ4wqqeltoDKLoGTR
cJjmAgIBHLbGCjiAvsy1pzU6dLNy05Nk0tTVXSgLnVInMoIQyywShs+x0DU+TTHAuzifgIMJXks1
vEZstQIb2HQXDW8nF1OwJIlvEniNDDVqsYenxBfXxWEvlJMwvKsmsFFT8x3AYjkHue3ASi9ngISl
KMzUlXkCEQFcibRT+cPCESEnWKPAvDwEer4w+UlNQTEh5m9rQ3lzROgIUffZPdrTUJ3sLuRsLFJG
yivFAtEmH4asmqfeCA2GDgOMhs50lDlgflo6Us8y45Vp7Gm71IitNF5rk3onMfCgIrjVYUJ+mCRu
DVSTSO6BRz0ofbBLM5rNyCIEhWcuTKdTh7dK9JEMhTPFy4+HRcpW6yQYZqECxjR9/yK680QY8qgU
COHwquBRtgGb4CDWVvoJQGUEOhO1t4hQLKORtCgD0dFQrzbSLbNXJhogiDnoC1L59amu+yKUZotW
cxWRxZNHmMOfwHmDCfctQIpNi3La+LoXIwBrlf3Q4zcaDe/oVAUaXoKEl9B09uV3VhXpBGhIbs67
j9MdYwbHf3HeBjJ9JWqXwiE04PkiK1p/acrT2fs/l/v6wfvL1I5fdtvH9VOv3+nIALGr1i0wvWld
AfQEp2MkBWEIyDy2L3J+8+brf/7T7xLFvl6D0yuAW8Mna68/cXjaqXS7hsIqup1na+SZqhA0kl7k
AhMBKWhpe3UTVNyU/56YomAGOy4TRGpaEftwLacGfgpG0t7lYJFdxDawTz2I0YwbDY4t4Zd9KUWJ
yhw2obsY3Sj5HYWgBbhtu6gmIsA/0FI1jZxaCMX3evV6WP75VOv2ck/nGg89330ikyAuUJ3QvSIG
rHguHfmtBiOWjgIRrm+YPzgKmGuBeoVx/byFKCXuYsGRh30yn9UmymKWlCzqWZNjlszACCFriPvc
Kl2AMHSWH9CxA6NT2Lrc6HoRa1FuqEceYYAdq9OyxxAzhlmhqXTe+nKgIrkjtYYRTFWkGPnaG75V
VEqh7XrWSt/0tPr5zeXZ71dW4piwdlTC3i6V3/aCKg7OQKILM44cDh1232eupM79pKTjzXs17uAZ
uP66yN0GPr2CjMh1EQMu0FFMBhdyAko+jFlOaaXjq8wKYaw666lxtzT3sgPOoA+7tv6QR/vi13+v
V3Y03kOWitmbE4PcRs/F5b0sCGYWyJwU56zfTtmFxOtVsw4vHSe6StMGFYooc5WAxKyIs8BRGi/A
yWHoYDh6hwz7Y6pBfykxWuYxC/C0XT40+YP2Xd+B6WG+o0AzJLRTPFF6pztNaQ133Bx2avg5+Pyu
3WsEMcsdXQwGAb8qadiA9UL/9ISU65aXskgdXwUgeFZG2GkykaBppFA9h4O+02Pe7UGLXq+p2B62
nkyiHEWjgn7AaeB6WLGchsWx2wj0UdNF1QmCGRrdfDIDH1K9vrxsdwd7xb1xY27W+1Vvb+35l3G8
QDtPLhk0QpQq7EPBeobkjktUEIfQST/sfJtXyg9cGfhzcl9CwOXG3t7aWbsiDal+v+DzK1KmB6RN
mu37cu/Jzf6we33WfY37byD2D95ht9zsEc8Dh7P2HuCQ1i/4134O7v9NrcnZ0wH8Sy/IpszK4G3/
2eBr85632KfuvcVc83pXwwTn/F37sZvcHMATBv/K+y9vVz/pT+iIw5il2TAL3H2wcoKFdZw8TEny
nrz048vOA1NcyQbJWl4rFABEp8V+fBSB9XAYlwnWchtVoEZyITcvr4fxjF2WO8nKsTSFy92DPnz5
MfWQpF+rwE9U/t3L1Ki9EAPi76EAHzdLTdvdDrERsyqQreUKJId6rUVBfxYACtbVpA2gWxcM98Mi
reZHYtSeaBbLyjTPOxq27k7VLZOZSzVk/Pq3i6vv1TRzdJEniruBsKKpKci6my8KDv9ljo4BEfFh
ANbVbUZX0BGavYLjWGKrZFaS3HtI2GIwtsFGnM85KcXndJu2jW5hX9CqVblqZllMA8Lhh0XtTWXj
h5gVmbd62q7+stZvNPdGxztZuMBvAbG8BW4fftKK9VB9WeDzxBn2Qx+2wK/2Dt9qb/nwsEY7DNG4
5rr/YCvg8WTW4mTibGFE6Rl8kXiE3dFVKt3MUrGZ40MQDcXiPh0tGjiGyBH9TsO72FFcL0IIbhm9
j/bLQkJJKTWxO267S1ZUa/0EwhESfTKIU4zL8Pp0WD++blZ4M62uehgXyOLAB9UN8k2HOmGBLo2S
/IL2loD6VsRZ5GgORObF1cXvjn48AKvYVXNkk/nnszPtwrqpF4q72hoBXMiKxRcXn+fYRcd8R5so
In6J58MWptaWnjpIS2uIaRk5vyOIhS9Zm34ZRyq75cu39WpPqRPf0TUF45WPTXJ8xI4BCeEI28MG
j2feW/b6sN56fHvsM3g3+oK/4/CvCExUs1s+196fr4+PoIj9sS10VJJJMuPdL1d/Pa2/fjuARxRx
/4QbAVD8nQAKW+3Q66VTQ1gJ0O6BG7UNIH4y8zE2Gd6i9aDTMqE+WCpBAaQhlxVEOkWkGwYls4ob
CO8+y+jiVhguo0w6mggQfAz5Q+4PSEfygmPaEe7Uw3E8+/Zjj78PwouWP9CkjhVIAm4szjjnQs7I
AzzBp7+nKfOnDuVcLDJHEIKEeYqfm97JwvFxexw7nr6IFX7Y6+iHgPBb+LQxMXVFqWPUBXEHwme8
zbIqnpfW5xIaNPrYJgdFC+auPxDzT5dX15+uG0inbApu5JZWDajPR/GeSc3EbFIGZNMPJmwxx09e
4YDOOody7kuVub54LR0eoM4FEnFCD0GmcEFJOdpEvF7ttvvt48ELf7zUu/cz7+trvT/0dMExEDqN
au2/YFPXV4/Y/dJ+RFERR9szJfgLFypXwBxCdCuOvFzfT0YRS9L56e82wrs2Pz86H669LbV93fVM
/jHneatyXsnr889W1QtGxawgRieRfxztfGxqBjsUlNEkpbuMZBrHpdMS5vXz9lC/gGmhVA0mlwrM
ENAeNkFsmL4877+S/LJYtaJGc+xRmqgZJn+r9DfxXrqBaGP98s7bv9Sr9eMxL3XUoOz5afsVhtWW
9+Zv7SkBNnTAECJ+F9kYakzkbrt8WG2fXXQk3GSi5tnHYFfX2DFXe1+2O/nFxeRnqBp3/SGeuxiM
YBr45XX5BEtzrp2E2wYWf4PGSJzmWIr8PuLZz2/NeElePkV8TIX8KymwYgutN8Z9i61JmBdON1bX
j+in5FCu2V08OgnMEa5glZSSHMHsBAJ2KrjSCzqW0u1MYIAjIkSGqLH32yq64K5J9yIC6Z7xuLpN
E4bW/dyJhUFpNmfV+XUSYwBMK90eFvIjb7u/1EFUyB0dgjEfe1PEdxPUoZ9Cs06YjW042zzstusH
+zhZ4ufp8GuFVls06JZ/wBwNoMM0lMm/3WGqdLXefKWcbVXQ5qlpNQ/JJREsrcgAM65k6kM6TIqK
ZOzMgOHnAvD3ZPAhU2eSzTfwtNfTL2Q15RpQe0ZKLKPqm6+77tLc6nfsnJn2FwAFyrQx0UGimKNN
BBxTkk0dn7XoRgzEcLkrwKHp+JAOpQIY4HlJVz5St7M5dI6BVc5f+RGwE9RfyrSgLxdLQoG6rByl
NgN2QQNsSXDAUtgoeKcDsBHh5erbICpVRDG49XkMtnnj+/r1Yav7AjpR6FQGOCiu5WgYD2Xk54K+
G/3rUGiXz3x47YCaP4hDahXOeM2WIpPKeP8weyEcjmni+IUfZSLHX1kdi5TWczEOVL163a0PP6gg
5Pb/Krua5rZtIHr3r/Dk1IPasRNPmosPFEXKHPHLAhU2uWgUW1U1rmWPZHeS/vriLcAPgLt0eooj
rEAQH7sL4L2n6ItwRxWFK8xXvbeJFAUeAkiN2sbc3rhFXkIdgmYxQcdaFQiHv+Kb8ZPPwePyLSLo
RQuBGd43NwvPgh66tw16gI1UZdfvkHjjFmryY/O4meAu6nl/mJw2f251Pfv7yf7wst2he985ciR/
bY732wMcbtfrfSDLXgeg/ebv/b/NmU+73JPKwhV92CMVAWWLrmubLjicxhgCHaKti0bwm+TJnTBv
1CZn/gzrLRJ4xWLgCdL9tyNYB8en15f9wfUJyIA8T+slMXou5qGeRDHuNjHIDKxbm6RRLpTGSd7I
PEwT56Qn1AElGQONlGHSkiG8Iu/jDkAOTA/pNpVp4gL8Q70xDMOkEkLlMrzkaZ74XnV5MUt4pBaK
k2q1Fqv9wJOydclHnjWvS8QC/qw5Tab0IIlLFvK0enMZ9OE94FyxL5/Z7SS+QsyFdTcK49AHa5mP
EOl9vJVyhUwIt6ToOGet5868uukPlWUJGQgGv+agveiJTfW9YDNPQGEbzh4danDfU8SzvjpK/zsO
y7rDV9dBunDh0VCTEvrPrtjB+nN9192DgabSp89H7eMe6HLq/nF72g2Rd/ofVVCONCdpkJZy/bto
cbtKour6qkV/6gQO9NdBDVf9OJ1NixS4reUSOh/si4mNPeup4v5Kmn86u7h7OJHpnVXL5UKkgdxA
MZbPIS0LkC44ccXKjL7R8YCe7fXlxfsrd6hKImaIAl1Ap9ITAiWcS0W4TFIkdBSwk6+VriPMqqej
aF5PGaoN0pIskA51fSOj0FvkKXce62iXDB9IgqLrOgoWDVKQzwF/dsAcAJqdx7Ptt9fdDhGrh0Zx
ruKCOULFFyXgeWxTxbSG1uBiPnOOivF/5gttNFhNVZBDKyepMCYNwLtJ7VDKXTHQt4j2kUV5xUG0
Rt/6zHklA4UfjooP3O1nLG29bqyeR0b3RklbH0+eiE/Sifpe58IWh4r1VFJFLm3BzFOWBTRjB6rL
nlUxBbNMHFXbRTqGWOaK9/WmZOQJJoFbKQ8f260k0vgxVlCBGjgOr77PIgmYgpixMXzFYXttwUj1
FjKNnHHEakSDoes2eidsAeOUlIa5jmmKmZosAWgRYLbb2NfFPPMx1UGkAjd/7Sbo4Kk3HmLPoma1
/Xnx9HyanKc6y399Nr7lZnPYeQmp3m8hmS68EwKuvFVKcAopsq+qvoCCKuLKY6Px/n3IWhMGCYV6
z6pjP+iBrFF9y8IjegcwY31y5irKuh5hICkrjwd6YxFFpbeYzc4AFx2dD/vlpLdbhHGZnD++vmy/
b/UfYDv/RgzvJtfE8Q3VPafUZ3iDWy6Lz+OHOFQHNo5j65q5AfLXEoRIR9G7dW2MINVYl4F/ZOc6
tFpJhwPGgFotO1Zj1FyLprrP36gL3Ycst8ke+WfTU/VEJM010dt2Lzqaiv6PAXd2+FZGkX80MhPd
LdBG1lk9mDMy6s66dRMWBDdh2Vb3m5fNOaLq3UC7zvZhMhp6yjfK1Vh0a0ivgpIrIltOoumC4oq3
yoVX8p8aLnX/5fjxheGBHhSr2bwAUtjElxUnByzenEFkJA4y6W3fKm5H1lPUlt1QbXXt18tBAtpk
XS3bV1DsdPnPZOQTYdvS+TIob3ibhtbN8uLdQqK0cvRkzswSz0k62G+WMcvoOF7Xh4MPn6VrVFJM
kw0v2ycS2y+aWrpCfENwxLE8nirISp4c2Et1cGWCnyohygUpB9O8+/7pozMTew0hjm+cBnPFtQdQ
A52PTAtF0jGVoDFuuEIj0tYEWajeoH7U/H2K4WHLmrw2aqZTEl6XErAsSwp/mjrNs/K3rDtujjAK
I8+6vvjjkyMt1CsQRH5bi9VM1GNvbXKJwxOWwcgJi+kI7Y2EC9pWZG8d8+s5r5McXSDuTlsLyGny
5/ruVOsfnFTbE344gDKm8Omf7XGzc+RvFispw25cu699Idz44DCXtXHTaJ0tg0tsJkXp/KrEElT3
zLherFQf99PtkaNMDN2jrz04PjaHSv8BChXkrvdoAAA=
--===============5550001049131651806==--

