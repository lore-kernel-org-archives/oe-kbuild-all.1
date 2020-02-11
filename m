Content-Type: multipart/mixed; boundary="===============1147159395742445715=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [alibaba-cloud:ck-4.19.91 10494/10873] htmldocs: include/net/sock.h:518: warning: Function parameter or member 'ALI_HOTFIX_RESERVE(1' not described in 'sock'
Date: Tue, 11 Feb 2020 21:16:01 +0800
Message-ID: <202002112148.g6Ici90Z%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1147159395742445715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xunlei,

FYI, the error/warning still remains.

tree:   https://github.com/alibaba/cloud-kernel.git ck-4.19.91
head:   536f70b41d6fc5fc46f50c4caa012c4439160180
commit: 802248f01f25379b5222ed8dac0974798c3abd31 [10494/10873] alinux: hotf=
ix: Add Cloud Kernel hotfix enhancement
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   net/mac80211/sta_info.h:588: warning: Function parameter or member 'stat=
us_stats.last_ack' not described in 'sta_info'
   net/mac80211/sta_info.h:588: warning: Function parameter or member 'stat=
us_stats.last_ack_signal' not described in 'sta_info'
   net/mac80211/sta_info.h:588: warning: Function parameter or member 'stat=
us_stats.ack_signal_filled' not described in 'sta_info'
   net/mac80211/sta_info.h:588: warning: Function parameter or member 'stat=
us_stats.avg_ack_signal' not described in 'sta_info'
   net/mac80211/sta_info.h:588: warning: Function parameter or member 'tx_s=
tats.packets' not described in 'sta_info'
   net/mac80211/sta_info.h:588: warning: Function parameter or member 'tx_s=
tats.bytes' not described in 'sta_info'
   net/mac80211/sta_info.h:588: warning: Function parameter or member 'tx_s=
tats.last_rate' not described in 'sta_info'
   net/mac80211/sta_info.h:588: warning: Function parameter or member 'tx_s=
tats.msdu' not described in 'sta_info'
   include/linux/dma-buf.h:304: warning: Function parameter or member 'cb_e=
xcl.cb' not described in 'dma_buf'
   include/linux/dma-buf.h:304: warning: Function parameter or member 'cb_e=
xcl.poll' not described in 'dma_buf'
   include/linux/dma-buf.h:304: warning: Function parameter or member 'cb_e=
xcl.active' not described in 'dma_buf'
   include/linux/dma-buf.h:304: warning: Function parameter or member 'cb_s=
hared.cb' not described in 'dma_buf'
   include/linux/dma-buf.h:304: warning: Function parameter or member 'cb_s=
hared.poll' not described in 'dma_buf'
   include/linux/dma-buf.h:304: warning: Function parameter or member 'cb_s=
hared.active' not described in 'dma_buf'
   include/linux/dma-fence-array.h:54: warning: Function parameter or membe=
r 'work' not described in 'dma_fence_array'
   include/linux/gpio/driver.h:149: warning: Function parameter or member '=
request_key' not described in 'gpio_irq_chip'
   include/linux/i2c.h:343: warning: Function parameter or member 'init_irq=
' not described in 'i2c_client'
   include/linux/iio/hw-consumer.h:1: warning: no structured comments found
   drivers/base/node.c:78: warning: Function parameter or member 'hmem_attr=
s' not described in 'node_access_nodes'
   drivers/base/node.c:690: warning: Function parameter or member 'mem_nid'=
 not described in 'register_memory_node_under_compute_node'
   drivers/base/node.c:690: warning: Function parameter or member 'cpu_nid'=
 not described in 'register_memory_node_under_compute_node'
   drivers/base/node.c:690: warning: Excess function parameter 'mem_node' d=
escription in 'register_memory_node_under_compute_node'
   drivers/base/node.c:690: warning: Excess function parameter 'cpu_node' d=
escription in 'register_memory_node_under_compute_node'
   include/linux/input/sparse-keymap.h:46: warning: Function parameter or m=
ember 'sw' not described in 'key_entry'
   drivers/pci/pci.c:220: warning: Excess function parameter 'p' descriptio=
n in 'pci_dev_str_match_path'
   include/linux/regulator/driver.h:227: warning: Function parameter or mem=
ber 'resume' not described in 'regulator_ops'
   drivers/regulator/core.c:4479: warning: Excess function parameter 'state=
' description in 'regulator_suspend'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member '=
esw.esw0' not described in 'irb'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member '=
esw.esw1' not described in 'irb'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member '=
esw.esw2' not described in 'irb'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member '=
esw.esw3' not described in 'irb'
   arch/s390/include/asm/cio.h:245: warning: Function parameter or member '=
esw.eadm' not described in 'irb'
   drivers/slimbus/stream.c:1: warning: no structured comments found
   drivers/target/target_core_device.c:1: warning: no structured comments f=
ound
   drivers/usb/typec/bus.c:1: warning: no structured comments found
   drivers/usb/typec/class.c:1: warning: no structured comments found
   include/linux/w1.h:281: warning: Function parameter or member 'of_match_=
table' not described in 'w1_family'
   fs/direct-io.c:257: warning: Excess function parameter 'offset' descript=
ion in 'dio_complete'
   fs/file_table.c:1: warning: no structured comments found
   fs/libfs.c:481: warning: Excess function parameter 'available' descripti=
on in 'simple_write_end'
   fs/posix_acl.c:646: warning: Function parameter or member 'inode' not de=
scribed in 'posix_acl_update_mode'
   fs/posix_acl.c:646: warning: Function parameter or member 'mode_p' not d=
escribed in 'posix_acl_update_mode'
   fs/posix_acl.c:646: warning: Function parameter or member 'acl' not desc=
ribed in 'posix_acl_update_mode'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:183: warning: Function parameter =
or member 'blockable' not described in 'amdgpu_mn_read_lock'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:254: warning: Function parameter =
or member 'blockable' not described in 'amdgpu_mn_invalidate_range_start_gf=
x'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:302: warning: Function parameter =
or member 'blockable' not described in 'amdgpu_mn_invalidate_range_start_hs=
a'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3012: warning: Excess function pa=
rameter 'dev' description in 'amdgpu_vm_get_task_info'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3013: warning: Function parameter=
 or member 'adev' not described in 'amdgpu_vm_get_task_info'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3013: warning: Excess function pa=
rameter 'dev' description in 'amdgpu_vm_get_task_info'
   include/drm/drm_drv.h:610: warning: Function parameter or member 'gem_pr=
ime_pin' not described in 'drm_driver'
   include/drm/drm_drv.h:610: warning: Function parameter or member 'gem_pr=
ime_unpin' not described in 'drm_driver'
   include/drm/drm_drv.h:610: warning: Function parameter or member 'gem_pr=
ime_res_obj' not described in 'drm_driver'
   include/drm/drm_drv.h:610: warning: Function parameter or member 'gem_pr=
ime_get_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:610: warning: Function parameter or member 'gem_pr=
ime_import_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:610: warning: Function parameter or member 'gem_pr=
ime_vmap' not described in 'drm_driver'
   include/drm/drm_drv.h:610: warning: Function parameter or member 'gem_pr=
ime_vunmap' not described in 'drm_driver'
   include/drm/drm_drv.h:610: warning: Function parameter or member 'gem_pr=
ime_mmap' not described in 'drm_driver'
   drivers/gpu/drm/i915/i915_vma.h:49: warning: cannot understand function =
prototype: 'struct i915_vma '
   drivers/gpu/drm/i915/i915_vma.h:1: warning: no structured comments found
   drivers/gpu/drm/i915/intel_guc_fwif.h:553: warning: cannot understand fu=
nction prototype: 'struct guc_log_buffer_state '
   drivers/gpu/drm/i915/i915_trace.h:1: warning: no structured comments fou=
nd
   include/linux/skbuff.h:863: warning: Function parameter or member 'dev_s=
cratch' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'list'=
 not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'ip_de=
frag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'skb_m=
stamp' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member '__clo=
ned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'head_=
frag' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member '__pkt=
_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'encap=
sulation' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'encap=
_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'csum_=
valid' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'csum_=
complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'csum_=
level' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'inner=
_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'remcs=
um_offload' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'offlo=
ad_fwd_mark' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'offlo=
ad_mr_fwd_mark' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'sende=
r_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'reser=
ved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:863: warning: Function parameter or member 'inner=
_ipproto' not described in 'sk_buff'
   include/net/sock.h:238: warning: Function parameter or member 'skc_addrp=
air' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_portp=
air' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_ipv6o=
nly' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_net_r=
efcnt' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_v6_da=
ddr' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_v6_rc=
v_saddr' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_cooki=
e' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_liste=
ner' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_tw_dr=
' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_rcv_w=
nd' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_tw_rc=
v_nxt' not described in 'sock_common'
   include/net/sock.h:518: warning: Function parameter or member 'sk_backlo=
g.rmem_alloc' not described in 'sock'
   include/net/sock.h:518: warning: Function parameter or member 'sk_backlo=
g.len' not described in 'sock'
   include/net/sock.h:518: warning: Function parameter or member 'sk_backlo=
g.head' not described in 'sock'
   include/net/sock.h:518: warning: Function parameter or member 'sk_backlo=
g.tail' not described in 'sock'
   include/net/sock.h:518: warning: Function parameter or member 'sk_wq_raw=
' not described in 'sock'
   include/net/sock.h:518: warning: Function parameter or member 'tcp_rtx_q=
ueue' not described in 'sock'
   include/net/sock.h:518: warning: Function parameter or member 'sk_route_=
forced_caps' not described in 'sock'
   include/net/sock.h:518: warning: Function parameter or member 'sk_txtime=
_report_errors' not described in 'sock'
   include/net/sock.h:518: warning: Function parameter or member 'sk_valida=
te_xmit_skb' not described in 'sock'
>> include/net/sock.h:518: warning: Function parameter or member 'ALI_HOTFI=
X_RESERVE(1' not described in 'sock'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'a=
dj_list.upper' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'a=
dj_list.lower' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'g=
so_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 's=
witchdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'l=
3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'x=
frmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 't=
lsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'n=
ame_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'i=
eee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'm=
pls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'x=
dp_prog' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'g=
ro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'n=
f_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member '_=
___cacheline_aligned_in_smp' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'q=
disc_hash' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'x=
ps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2037: warning: Function parameter or member 'x=
ps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETH=
TOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_sta=
te'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETH=
TOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_=
state'
   sound/soc/soc-core.c:2919: warning: Excess function parameter 'legacy_da=
i_naming' description in 'snd_soc_register_dais'
   Documentation/admin-guide/cgroup-v2.rst:1647: WARNING: Block quote ends =
without a blank line; unexpected unindent.
   Documentation/admin-guide/cgroup-v2.rst:1649: WARNING: Block quote ends =
without a blank line; unexpected unindent.
   Documentation/admin-guide/cgroup-v2.rst:1650: WARNING: Block quote ends =
without a blank line; unexpected unindent.
   Documentation/admin-guide/hw-vuln/tsx_async_abort.rst:142: WARNING: dupl=
icate label virt_mechanism, other instance in Documentation/admin-guide/hw-=
vuln/mds.rst
   Documentation/admin-guide/mm/numaperf.rst:24: WARNING: Unexpected indent=
ation.
   Documentation/admin-guide/mm/numaperf.rst:24: WARNING: Inline substituti=
on_reference start-string without end-string.
   Documentation/admin-guide/mm/numaperf.rst:25: WARNING: Block quote ends =
without a blank line; unexpected unindent.
   Documentation/admin-guide/mm/numaperf.rst:168: WARNING: Footnote is not =
referenced.
   Documentation/core-api/boot-time-mm.rst:78: WARNING: Error in "kernel-do=
c" directive:
   unknown option: "nodocs".

vim +518 include/net/sock.h

^1da177e4c3f41 Linus Torvalds 2005-04-16 @518  =


:::::: The code at line 518 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1147159395742445715==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1147159395742445715==--

