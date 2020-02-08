Content-Type: multipart/mixed; boundary="===============0096555810985014020=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3] drm/hdcp: optimizing the srm handling
Date: Sat, 08 Feb 2020 10:16:54 +0800
Message-ID: <202002081010.Q7jWYzvm%lkp@intel.com>
In-Reply-To: <20200206105231.24813-1-ramalingam.c@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0096555810985014020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ramalingam,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next tegr=
a-drm/drm/tegra/for-next linus/master v5.5 next-20200207]
[cannot apply to drm/drm-next]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ramalingam-C/drm-hdcp-opti=
mizing-the-srm-handling/20200208-060809
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_alloc' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_free' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_read' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'p=
erf_event_write' not described in 'security_list_options'
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' no=
t found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not =
found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier=
' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' =
not found
   sound/soc/soc-core.c:2522: warning: Function parameter or member 'legacy=
_dai_naming' not described in 'snd_soc_register_dai'
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
   drivers/gpu/drm/bridge/panel.c:303: warning: Function parameter or membe=
r 'bridge' not described in 'drm_panel_bridge_connector'
>> drivers/gpu/drm/drm_hdcp.c:284: warning: Function parameter or member 'k=
svs_in' not described in 'drm_hdcp_check_ksvs_revoked'
   drivers/gpu/drm/drm_hdcp.c:284: warning: Excess function parameter 'ksvs=
' description in 'drm_hdcp_check_ksvs_revoked'
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

vim +284 drivers/gpu/drm/drm_hdcp.c

   255	=

   256	/**
   257	 * drm_hdcp_check_ksvs_revoked - Check the revoked status of the IDs
   258	 *
   259	 * @drm_dev: drm_device for which HDCP revocation check is requested
   260	 * @ksvs: List of KSVs (HDCP receiver IDs)
   261	 * @ksv_count: KSV count passed in through @ksvs
   262	 *
   263	 * This function reads the HDCP System renewability Message(SRM Tabl=
e)
   264	 * from userspace as a firmware and parses it for the revoked HDCP
   265	 * KSVs(Receiver IDs) detected by DCP LLC. Once the revoked KSVs are=
 known,
   266	 * revoked state of the KSVs in the list passed in by display driver=
s are
   267	 * decided and response is sent.
   268	 *
   269	 * SRM should be presented in the name of "display_hdcp_srm.bin".
   270	 *
   271	 * Format of the SRM table, that userspace needs to write into the b=
inary file,
   272	 * is defined at:
   273	 * 1. Renewability chapter on 55th page of HDCP 1.4 specification
   274	 * https://www.digital-cp.com/sites/default/files/specifications/HDC=
P%20Specification%20Rev1_4_Secure.pdf
   275	 * 2. Renewability chapter on 63rd page of HDCP 2.2 specification
   276	 * https://www.digital-cp.com/sites/default/files/specifications/HDC=
P%20on%20HDMI%20Specification%20Rev2_2_Final1.pdf
   277	 *
   278	 * Returns:
   279	 * Count of the revoked KSVs or -ve error number incase of the failu=
re.
   280	 */
   281	int drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs=
_in,
   282					u32 ksv_count)
   283	{
 > 284		u32 revoked_ksv_cnt =3D 0, i, j;
   285		u8 *revoked_ksv_list =3D NULL;
   286		int ret =3D 0;
   287	=

   288		ret =3D drm_hdcp_request_srm(drm_dev, &revoked_ksv_list,
   289					   &revoked_ksv_cnt);
   290	=

   291		/* revoked_ksv_cnt will be zero when above function failed */
   292		for (i =3D 0; i < revoked_ksv_cnt; i++)
   293			for  (j =3D 0; j < ksv_count; j++)
   294				if (!memcmp(&ksvs_in[j * DRM_HDCP_KSV_LEN],
   295				    &revoked_ksv_list[i * DRM_HDCP_KSV_LEN],
   296				    DRM_HDCP_KSV_LEN)) {
   297					DRM_DEBUG("Revoked KSV is ");
   298					drm_hdcp_print_ksv(&ksvs_in[j * DRM_HDCP_KSV_LEN]);
   299					ret++;
   300				}
   301	=

   302		kfree(revoked_ksv_list);
   303		return ret;
   304	}
   305	EXPORT_SYMBOL_GPL(drm_hdcp_check_ksvs_revoked);
   306	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============0096555810985014020==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0096555810985014020==--

