Content-Type: multipart/mixed; boundary="===============7654302584118245692=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 4/6] bus: Add Baikal-T1 AXI-bus driver
Date: Sun, 31 May 2020 21:47:16 +0800
Message-ID: <202005312130.1wX6GC8U%lkp@intel.com>
In-Reply-To: <20200526125928.17096-5-Sergey.Semin@baikalelectronics.ru>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7654302584118245692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Serge,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on char-misc/char-misc-testing staging/staging-tes=
ting linus/master v5.7-rc7]
[cannot apply to next-20200529]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Serge-Semin/bus-memory-Add=
-Baikal-T1-SoC-APB-AXI-L2-drivers/20200526-210837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/netronome/nfp/flower/offload.c:1129:44: warning: Cl=
arify calculation precedence for '&' and '?'. [clarifyCalculation]
     size =3D key_layer & NFP_FLOWER_LAYER_IPV4 ?
                                              ^
--
>> drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:3555:2: warning: Ass=
ignment of function parameter has no effect outside the function. Did you f=
orget dereferencing it? [uselessAssignmentPtrArg]
    data =3D qlcnic_83xx_fill_stats(adapter, &cmd, data,
    ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic.h:1836:2: warning: Non-boolean=
 value returned from function returning bool [returnNonBoolInBooleanFunctio=
n]
    return adapter->ahw->extra_capability[0] &
    ^
>> drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:3858:9: warning: Ide=
ntical condition 'err', second condition is always false [identicalConditio=
nAfterEarlyExit]
    return err;
           ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:3853:6: note: first =
condition
    if (err)
        ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:3858:9: note: second=
 condition
    return err;
           ^
>> drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:485:12: warning: Var=
iable 'intr_val' is reassigned a value before the old one has been used. [r=
edundantAssignment]
     intr_val =3D readl(adapter->tgt_status_reg);
              ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:483:11: note: Variab=
le 'intr_val' is reassigned a value before the old one has been used.
    intr_val =3D readl(adapter->isr_int_vec);
             ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:485:12: note: Variab=
le 'intr_val' is reassigned a value before the old one has been used.
     intr_val =3D readl(adapter->tgt_status_reg);
              ^
>> drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2385:6: warning: Var=
iable 'err' is reassigned a value before the old one has been used. [redund=
antAssignment]
    err =3D qlcnic_alloc_mbx_args(&cmd, adapter, QLCNIC_CMD_SET_NIC_INFO);
        ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2375:0: note: Variab=
le 'err' is reassigned a value before the old one has been used.
    int i, err =3D -EIO;
   ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2385:6: note: Variab=
le 'err' is reassigned a value before the old one has been used.
    err =3D qlcnic_alloc_mbx_args(&cmd, adapter, QLCNIC_CMD_SET_NIC_INFO);
        ^
>> drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2825:6: warning: Var=
iable 'ret' is reassigned a value before the old one has been used. [redund=
antAssignment]
    ret =3D qlcnic_83xx_poll_flash_status_reg(adapter);
        ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2809:0: note: Variab=
le 'ret' is reassigned a value before the old one has been used.
    int ret =3D -EIO;
   ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2825:6: note: Variab=
le 'ret' is reassigned a value before the old one has been used.
    ret =3D qlcnic_83xx_poll_flash_status_reg(adapter);
        ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2881:6: warning: Var=
iable 'ret' is reassigned a value before the old one has been used. [redund=
antAssignment]
    ret =3D qlcnic_83xx_poll_flash_status_reg(adapter);
        ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2874:0: note: Variab=
le 'ret' is reassigned a value before the old one has been used.
    int ret =3D -EIO;
   ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2881:6: note: Variab=
le 'ret' is reassigned a value before the old one has been used.
    ret =3D qlcnic_83xx_poll_flash_status_reg(adapter);
        ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2917:6: warning: Var=
iable 'ret' is reassigned a value before the old one has been used. [redund=
antAssignment]
    ret =3D qlcnic_83xx_poll_flash_status_reg(adapter);
        ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2895:0: note: Variab=
le 'ret' is reassigned a value before the old one has been used.
    int ret =3D -EIO, err =3D 0;
   ^
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:2917:6: note: Variab=
le 'ret' is reassigned a value before the old one has been used.
    ret =3D qlcnic_83xx_poll_flash_status_reg(adapter);
        ^
>> drivers/net/macvlan.c:83:2: warning: Non-boolean value returned from fun=
ction returning bool [returnNonBoolInBooleanFunction]
    return port->flags & MACVLAN_F_ADDRCHANGE;
    ^
>> drivers/net/macvlan.c:763:57: warning: Clarify calculation precedence fo=
r '&' and '?'. [clarifyCalculation]
      dev_set_allmulti(lowerdev, dev->flags & IFF_ALLMULTI ? 1 : -1);
                                                           ^
   drivers/net/macvlan.c:766:35: warning: Clarify calculation precedence fo=
r '&' and '?'. [clarifyCalculation]
            dev->flags & IFF_PROMISC ? 1 : -1);
                                     ^
>> drivers/net/macvlan.c:1092:6: warning: Variable 'err' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
    err =3D __netpoll_setup(netpoll, real_dev);
        ^
   drivers/net/macvlan.c:1088:6: note: Variable 'err' is reassigned a value=
 before the old one has been used.
    err =3D -ENOMEM;
        ^
   drivers/net/macvlan.c:1092:6: note: Variable 'err' is reassigned a value=
 before the old one has been used.
    err =3D __netpoll_setup(netpoll, real_dev);
        ^
--
>> drivers/net/ethernet/realtek/r8169_main.c:800:2: warning: Non-boolean va=
lue returned from function returning bool [returnNonBoolInBooleanFunction]
    return RTL_R32(tp, GPHY_OCP) & OCPAR_FLAG;
    ^
   drivers/net/ethernet/realtek/r8169_main.c:893:2: warning: Non-boolean va=
lue returned from function returning bool [returnNonBoolInBooleanFunction]
    return RTL_R32(tp, PHYAR) & 0x80000000;
    ^
   drivers/net/ethernet/realtek/r8169_main.c:928:2: warning: Non-boolean va=
lue returned from function returning bool [returnNonBoolInBooleanFunction]
    return RTL_R32(tp, OCPAR) & OCPAR_FLAG;
    ^
   drivers/net/ethernet/realtek/r8169_main.c:1032:2: warning: Non-boolean v=
alue returned from function returning bool [returnNonBoolInBooleanFunction]
    return RTL_R32(tp, EPHYAR) & EPHYAR_FLAG;
    ^
   drivers/net/ethernet/realtek/r8169_main.c:1055:2: warning: Non-boolean v=
alue returned from function returning bool [returnNonBoolInBooleanFunction]
    return RTL_R32(tp, ERIAR) & ERIAR_FLAG;
    ^
   drivers/net/ethernet/realtek/r8169_main.c:1157:2: warning: Non-boolean v=
alue returned from function returning bool [returnNonBoolInBooleanFunction]
    return r8168dp_ocp_read(tp, 0x0f, reg) & 0x00000800;
    ^
   drivers/net/ethernet/realtek/r8169_main.c:1167:2: warning: Non-boolean v=
alue returned from function returning bool [returnNonBoolInBooleanFunction]
    return RTL_R8(tp, IBISR0) & 0x20;
    ^
   drivers/net/ethernet/realtek/r8169_main.c:1275:2: warning: Non-boolean v=
alue returned from function returning bool [returnNonBoolInBooleanFunction]
    return RTL_R32(tp, EFUSEAR) & EFUSEAR_FLAG;
    ^
   drivers/net/ethernet/realtek/r8169_main.c:2694:2: warning: Non-boolean v=
alue returned from function returning bool [returnNonBoolInBooleanFunction]
    return RTL_R32(tp, CSIAR) & CSIAR_FLAG;
    ^
>> drivers/net/ethernet/realtek/r8169_main.c:4740:9: warning: Variable 'ret=
val' is reassigned a value before the old one has been used. [redundantAssi=
gnment]
    retval =3D rtl8169_init_ring(tp);
           ^
   drivers/net/ethernet/realtek/r8169_main.c:4722:0: note: Variable 'retval=
' is reassigned a value before the old one has been used.
    int retval =3D -ENOMEM;
   ^
   drivers/net/ethernet/realtek/r8169_main.c:4740:9: note: Variable 'retval=
' is reassigned a value before the old one has been used.
    retval =3D rtl8169_init_ring(tp);
           ^
>> drivers/net/ethernet/realtek/r8169_main.c:474:16: warning: Shifting sign=
ed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    DescOwn  =3D (1 << 31), /* Descriptor is owned by NIC */
                  ^
   drivers/net/ethernet/realtek/r8169_main.c:514:18: warning: Shifting sign=
ed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    TD1_UDP_CS =3D (1 << 31),  /* Calculate UDP/IP checksum */
                    ^
--
   In file included from drivers/net/ethernet/sfc/ef10.c:
>> drivers/net/ethernet/sfc/ef10.c:308:21: warning: Either the condition 'r=
c<0' is redundant or there is division by zero@line 308. [zerodivcond]
     quantum =3D 1536000 / rc; /* 1536 cycles */
                       ^
   drivers/net/ethernet/sfc/ef10.c:305:10: note: Assuming that condition 'r=
c<0' is not redundant
     if (rc < 0)
            ^
   drivers/net/ethernet/sfc/ef10.c:308:21: note: Division by zero
     quantum =3D 1536000 / rc; /* 1536 cycles */
                       ^
>> drivers/net/ethernet/sfc/ef10.c:2718:29: warning: Local variable nic_dat=
a shadows outer variable [shadowVar]
     struct efx_ef10_nic_data *nic_data =3D efx->nic_data;
                               ^
   drivers/net/ethernet/sfc/ef10.c:2682:28: note: Shadowed declaration
    struct efx_ef10_nic_data *nic_data =3D efx->nic_data;
                              ^
   drivers/net/ethernet/sfc/ef10.c:2718:29: note: Shadow variable
     struct efx_ef10_nic_data *nic_data =3D efx->nic_data;
                               ^
>> drivers/net/ethernet/sfc/ef10.c:2700:7: warning: Shifting signed 32-bit =
value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
      (1 << MC_CMD_GET_CAPABILITIES_OUT_VXLAN_NVGRE_LBN) ?
         ^
   drivers/net/ethernet/sfc/ef10.c:3721:9: warning: Shifting signed 32-bit =
value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
        (1 << MC_CMD_GET_CAPABILITIES_OUT_VXLAN_NVGRE_LBN))) {
           ^
   drivers/net/ethernet/sfc/ef10.c:3842:11: warning: Shifting signed 32-bit=
 value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
          (1 << MC_CMD_GET_CAPABILITIES_OUT_VXLAN_NVGRE_LBN)))
             ^
   drivers/net/ethernet/sfc/ef10.c:3903:11: warning: Shifting signed 32-bit=
 value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
          (1 << MC_CMD_GET_CAPABILITIES_OUT_VXLAN_NVGRE_LBN)))
             ^
   drivers/net/ethernet/sfc/ef10.c:3924:11: warning: Shifting signed 32-bit=
 value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
          (1 << MC_CMD_GET_CAPABILITIES_OUT_VXLAN_NVGRE_LBN)))
             ^
>> drivers/net/ethernet/sfc/ef10.c:2700:55: warning: Clarify calculation pr=
ecedence for '&' and '?'. [clarifyCalculation]
      (1 << MC_CMD_GET_CAPABILITIES_OUT_VXLAN_NVGRE_LBN) ?
                                                         ^
   drivers/net/ethernet/sfc/ef10.c:3255:30: warning: Local variable nic_dat=
a shadows outer variable [shadowVar]
      struct efx_ef10_nic_data *nic_data =3D efx_pf->nic_data;
                                ^
   drivers/net/ethernet/sfc/ef10.c:3214:28: note: Shadowed declaration
    struct efx_ef10_nic_data *nic_data =3D efx->nic_data;
                              ^
   drivers/net/ethernet/sfc/ef10.c:3255:30: note: Shadow variable
      struct efx_ef10_nic_data *nic_data =3D efx_pf->nic_data;
                                ^
>> drivers/net/ethernet/qlogic/qed/qed_roce.c:809:5: warning: Variable 'rc'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
    rc =3D qed_sp_init_request(p_hwfn, &p_ent, ROCE_RAMROD_DESTROY_QP,
       ^
   drivers/net/ethernet/qlogic/qed/qed_roce.c:786:0: note: Variable 'rc' is=
 reassigned a value before the old one has been used.
    int rc =3D -ENOMEM;
   ^
   drivers/net/ethernet/qlogic/qed/qed_roce.c:809:5: note: Variable 'rc' is=
 reassigned a value before the old one has been used.
    rc =3D qed_sp_init_request(p_hwfn, &p_ent, ROCE_RAMROD_DESTROY_QP,
       ^
   drivers/net/ethernet/qlogic/qed/qed_roce.c:890:5: warning: Variable 'rc'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
    rc =3D qed_sp_init_request(p_hwfn, &p_ent, ROCE_RAMROD_QUERY_QP,
       ^
   drivers/net/ethernet/qlogic/qed/qed_roce.c:853:0: note: Variable 'rc' is=
 reassigned a value before the old one has been used.
    int rc =3D -ENOMEM;
   ^
   drivers/net/ethernet/qlogic/qed/qed_roce.c:890:5: note: Variable 'rc' is=
 reassigned a value before the old one has been used.
    rc =3D qed_sp_init_request(p_hwfn, &p_ent, ROCE_RAMROD_QUERY_QP,
       ^
>> drivers/net/ethernet/qlogic/qed/qed_rdma.c:1692:9: warning: Identical co=
ndition 'rc', second condition is always false [identicalConditionAfterEarl=
yExit]
    return rc;
           ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1686:6: note: first condition
    if (rc)
        ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1692:9: note: second condition
    return rc;
           ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1735:9: warning: Identical co=
ndition 'rc', second condition is always false [identicalConditionAfterEarl=
yExit]
    return rc;
           ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1723:6: note: first condition
    if (rc)
        ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1735:9: note: second condition
    return rc;
           ^
>> drivers/net/ethernet/qlogic/qed/qed_rdma.c:206:5: warning: Variable 'rc'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
    rc =3D qed_rdma_bmap_alloc(p_hwfn, &p_rdma_info->pd_map, RDMA_MAX_PDS,
       ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:167:0: note: Variable 'rc' is=
 reassigned a value before the old one has been used.
    int rc =3D -ENOMEM;
   ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:206:5: note: Variable 'rc' is=
 reassigned a value before the old one has been used.
    rc =3D qed_rdma_bmap_alloc(p_hwfn, &p_rdma_info->pd_map, RDMA_MAX_PDS,
       ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:761:5: warning: Variable 'rc'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
    rc =3D qed_sp_init_request(p_hwfn, &p_ent, RDMA_RAMROD_FUNC_CLOSE,
       ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:722:0: note: Variable 'rc' is=
 reassigned a value before the old one has been used.
    int rc =3D -EBUSY;
   ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:761:5: note: Variable 'rc' is=
 reassigned a value before the old one has been used.
    rc =3D qed_sp_init_request(p_hwfn, &p_ent, RDMA_RAMROD_FUNC_CLOSE,
       ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1131:5: warning: Variable 'rc=
' is reassigned a value before the old one has been used. [redundantAssignm=
ent]
    rc =3D qed_sp_init_request(p_hwfn, &p_ent,
       ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1109:0: note: Variable 'rc' i=
s reassigned a value before the old one has been used.
    int rc =3D -ENOMEM;
   ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1131:5: note: Variable 'rc' i=
s reassigned a value before the old one has been used.
    rc =3D qed_sp_init_request(p_hwfn, &p_ent,
       ^
>> drivers/net/ethernet/qlogic/qed/qed_rdma.c:1771:13: warning: Variable 'o=
paque_fid' is reassigned a value before the old one has been used. [redunda=
ntAssignment]
    opaque_fid =3D p_hwfn->hw_info.opaque_fid;
               ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1769:13: note: Variable 'opaq=
ue_fid' is reassigned a value before the old one has been used.
    opaque_fid =3D p_hwfn->hw_info.opaque_fid;
               ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1771:13: note: Variable 'opaq=
ue_fid' is reassigned a value before the old one has been used.
    opaque_fid =3D p_hwfn->hw_info.opaque_fid;
               ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1860:5: warning: Variable 'rc=
' is reassigned a value before the old one has been used. [redundantAssignm=
ent]
    rc =3D qed_rdma_alloc(p_hwfn);
       ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1851:0: note: Variable 'rc' i=
s reassigned a value before the old one has been used.
    int rc =3D -EBUSY;
   ^
   drivers/net/ethernet/qlogic/qed/qed_rdma.c:1860:5: note: Variable 'rc' i=
s reassigned a value before the old one has been used.
    rc =3D qed_rdma_alloc(p_hwfn);
       ^
>> drivers/bus/bt1-axi.c:67:29: warning: Clarify calculation precedence for=
 '&' and '?'. [clarifyCalculation]
     high & BT1_AXI_WERRH_TYPE ? "no slave" : "slave protocol error",
                               ^
--
>> drivers/clk/ingenic/cgu.c:39:3: warning: Boolean result is used in bitwi=
se operation. Clarify expression with parentheses. [clarifyCondition]
     ^ info->clear_to_gate;
     ^
>> drivers/clk/ingenic/cgu.c:729:6: warning: Variable 'err' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    err =3D clk_register_clkdev(clk, clk_info->name, NULL);
        ^
   drivers/clk/ingenic/cgu.c:604:0: note: Variable 'err' is reassigned a va=
lue before the old one has been used.
    int err =3D -EINVAL;
   ^
   drivers/clk/ingenic/cgu.c:729:6: note: Variable 'err' is reassigned a va=
lue before the old one has been used.
    err =3D clk_register_clkdev(clk, clk_info->name, NULL);
        ^
>> drivers/clk/ingenic/jz4780-cgu.c:220:22: warning: Local variable cgu sha=
dows outer variable [shadowVar]
    struct ingenic_cgu *cgu =3D ingenic_clk->cgu;
                        ^
   drivers/clk/ingenic/jz4780-cgu.c:100:28: note: Shadowed declaration
   static struct ingenic_cgu *cgu;
                              ^
   drivers/clk/ingenic/jz4780-cgu.c:220:22: note: Shadow variable
    struct ingenic_cgu *cgu =3D ingenic_clk->cgu;
                        ^
--
>> fs/ceph/inode.c:1042:6: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing? [redundantAssignInSwitch]
    err =3D 0;
        ^
   fs/ceph/inode.c:950:8: note: Variable 'err' is reassigned a value before=
 the old one has been used. 'break;' missing?
      err =3D -ENOMEM;
          ^
   fs/ceph/inode.c:1042:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used. 'break;' missing?
    err =3D 0;
        ^
>> fs/ceph/dir.c:966:6: warning: Variable 'err' is reassigned a value befor=
e the old one has been used. [redundantAssignment]
    err =3D ceph_pre_init_acls(dir, &mode, &as_ctx);
        ^
   fs/ceph/dir.c:944:0: note: Variable 'err' is reassigned a value before t=
he old one has been used.
    int err =3D -EROFS;
   ^
   fs/ceph/dir.c:966:6: note: Variable 'err' is reassigned a value before t=
he old one has been used.
    err =3D ceph_pre_init_acls(dir, &mode, &as_ctx);
        ^
   fs/ceph/dir.c:1161:7: warning: Variable 'err' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
     err =3D ceph_mdsc_submit_request(mdsc, dir, req);
         ^
   fs/ceph/dir.c:1125:0: note: Variable 'err' is reassigned a value before =
the old one has been used.
    int err =3D -EROFS;
   ^
   fs/ceph/dir.c:1161:7: note: Variable 'err' is reassigned a value before =
the old one has been used.
     err =3D ceph_mdsc_submit_request(mdsc, dir, req);
         ^
>> fs/ceph/file.c:2324:6: warning: Variable 'ret' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    ret =3D file_write_and_wait_range(src_file, src_off, (src_off + len));
        ^
   fs/ceph/file.c:2271:0: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ssize_t ret =3D -EIO, bytes;
   ^
   fs/ceph/file.c:2324:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D file_write_and_wait_range(src_file, src_off, (src_off + len));
        ^
>> fs/ceph/file.c:938:12: warning: Local variable len shadows outer variabl=
e [shadowVar]
       size_t len, copied;
              ^
   fs/ceph/file.c:840:6: note: Shadowed declaration
    u64 len =3D iov_iter_count(to);
        ^
   fs/ceph/file.c:938:12: note: Shadow variable
       size_t len, copied;
              ^
   fs/ceph/file.c:612:70: warning: Clarify calculation precedence for '&' a=
nd '?'. [clarifyCalculation]
    in.gid =3D cpu_to_le32(from_kgid(&init_user_ns, dir->i_mode & S_ISGID ?
                                                                        ^
--
>> fs/ceph/export.c:79:6: warning: Variable 'ret' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    ret =3D FILEID_BTRFS_WITH_PARENT;
        ^
   fs/ceph/export.c:51:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D  -EINVAL;
        ^
   fs/ceph/export.c:79:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D FILEID_BTRFS_WITH_PARENT;
        ^
>> fs/ceph/export.c:494:6: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    err =3D -ENOENT;
        ^
   fs/ceph/export.c:416:0: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    int err =3D -EINVAL;
   ^
   fs/ceph/export.c:494:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D -ENOENT;
        ^
>> fs/ceph/caps.c:2253:6: warning: Variable 'ret' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    ret =3D ceph_wait_on_async_create(inode);
        ^
   fs/ceph/caps.c:2249:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D file_write_and_wait_range(file, start, end);
        ^
   fs/ceph/caps.c:2253:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D ceph_wait_on_async_create(inode);
        ^
   fs/ceph/caps.c:2752:38: warning: Same expression on both sides of '||'. =
[duplicateExpression]
    if (ret =3D=3D -EAGAIN || ret =3D=3D -EFBIG || ret =3D=3D -EAGAIN)
                                        ^
   fs/ceph/caps.c:609:33: warning: Function 'ceph_add_cap' argument order d=
ifferent: declaration 'inode, session, cap_id, issued, wanted, cap, seq, re=
almino, flags, new_cap' definition 'inode, session, cap_id, issued, wanted,=
 seq, mseq, realmino, flags, new_cap' [funcArgOrderDifferent]
   void ceph_add_cap(struct inode *inode,
                                   ^
   fs/ceph/super.h:1051:40: note: Function 'ceph_add_cap' argument order di=
fferent: declaration 'inode, session, cap_id, issued, wanted, cap, seq, rea=
lmino, flags, new_cap' definition 'inode, session, cap_id, issued, wanted, =
seq, mseq, realmino, flags, new_cap'
   extern void ceph_add_cap(struct inode *inode,
                                          ^
   fs/ceph/caps.c:609:33: note: Function 'ceph_add_cap' argument order diff=
erent: declaration 'inode, session, cap_id, issued, wanted, cap, seq, realm=
ino, flags, new_cap' definition 'inode, session, cap_id, issued, wanted, se=
q, mseq, realmino, flags, new_cap'
   void ceph_add_cap(struct inode *inode,
                                   ^
>> drivers/hwmon/nct7904.c:208:18: warning: Either the condition 'ret<0' is=
 redundant or there is division by zero@line 208. [zerodivcond]
      rpm =3D 1350000 / cnt;
                    ^
   drivers/hwmon/nct7904.c:202:11: note: Assuming that condition 'ret<0' is=
 not redundant
     if (ret < 0)
             ^
   drivers/hwmon/nct7904.c:204:31: note: Assignment 'cnt=3D((ret&65280)>>3)=
|(ret&31)', assigned value is 0
     cnt =3D ((ret & 0xff00) >> 3) | (ret & 0x1f);
                                 ^
   drivers/hwmon/nct7904.c:208:18: note: Division by zero
      rpm =3D 1350000 / cnt;
                    ^
   drivers/hwmon/nct7904.c:220:18: warning: Either the condition 'ret<0' is=
 redundant or there is division by zero@line 220. [zerodivcond]
      rpm =3D 1350000 / cnt;
                    ^
   drivers/hwmon/nct7904.c:214:11: note: Assuming that condition 'ret<0' is=
 not redundant
     if (ret < 0)
             ^
   drivers/hwmon/nct7904.c:216:31: note: Assignment 'cnt=3D((ret&65280)>>3)=
|(ret&31)', assigned value is 0
     cnt =3D ((ret & 0xff00) >> 3) | (ret & 0x1f);
                                 ^
   drivers/hwmon/nct7904.c:220:18: note: Division by zero
      rpm =3D 1350000 / cnt;
                    ^
>> drivers/hwmon/nct7904.c:398:29: warning: Shifting a negative value is te=
chnically undefined behaviour [shiftNegativeLHS]
                ((channel - 5) >> 3));
                               ^
--
   In file included from drivers/md/raid5.c:
   drivers/md/md.h:617:9: warning: Identical condition 'sd', second conditi=
on is always false [identicalConditionAfterEarlyExit]
    return sd;
           ^
   drivers/md/md.h:615:6: note: first condition
    if (sd)
        ^
   drivers/md/md.h:617:9: note: second condition
    return sd;
           ^
>> drivers/md/raid5.c:179:26: warning: Local variable group shadows outer v=
ariable [shadowVar]
     struct r5worker_group *group;
                            ^
   drivers/md/raid5.c:169:25: note: Shadowed declaration
    struct r5worker_group *group;
                           ^
   drivers/md/raid5.c:179:26: note: Shadow variable
     struct r5worker_group *group;
                            ^
>> drivers/md/raid5.c:3181:7: warning: Local variable qd_idx shadows outer =
variable [shadowVar]
     int qd_idx =3D sh->qd_idx;
         ^
   drivers/md/raid5.c:3095:30: note: Shadowed declaration
    int i, pd_idx =3D sh->pd_idx, qd_idx =3D sh->qd_idx, disks =3D sh->disk=
s;
                                ^
   drivers/md/raid5.c:3181:7: note: Shadow variable
     int qd_idx =3D sh->qd_idx;
         ^
>> drivers/md/raid5.c:1508:9: warning: Uninitialized variable: target [unin=
itvar]
    BUG_ON(target < 0);
           ^
--
>> drivers/net/ethernet/freescale/fec_main.c:2097:6: warning: Variable 'err=
' is reassigned a value before the old one has been used. [redundantAssignm=
ent]
    err =3D of_mdiobus_register(fep->mii_bus, node);
        ^
   drivers/net/ethernet/freescale/fec_main.c:2016:0: note: Variable 'err' i=
s reassigned a value before the old one has been used.
    int err =3D -ENXIO;
   ^
   drivers/net/ethernet/freescale/fec_main.c:2097:6: note: Variable 'err' i=
s reassigned a value before the old one has been used.
    err =3D of_mdiobus_register(fep->mii_bus, node);
        ^
>> drivers/net/ethernet/freescale/fec_main.c:868:34: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
     writel(rxq->bd.dma, fep->hwp + FEC_R_DES_START(i));
                                    ^
   drivers/net/ethernet/freescale/fec_main.c:869:38: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
     writel(PKT_MAXBUF_SIZE, fep->hwp + FEC_R_BUFF_SIZE(i));
                                        ^
   drivers/net/ethernet/freescale/fec_main.c:874:22: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
             fep->hwp + FEC_RCMR(i));
                        ^
   drivers/net/ethernet/freescale/fec_main.c:879:34: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
     writel(txq->bd.dma, fep->hwp + FEC_X_DES_START(i));
                                    ^
   drivers/net/ethernet/freescale/fec_main.c:883:26: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
      writel(DMA_CLASS_EN | IDLE_SLOPE(i),
                            ^
   drivers/net/ethernet/freescale/fec_main.c:884:22: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
             fep->hwp + FEC_DMA_CFG(i));
                        ^
>> drivers/net/ethernet/freescale/fec_main.c:1524:23: warning: Local variab=
le ebdp shadows outer variable [shadowVar]
      struct bufdesc_ex *ebdp =3D (struct bufdesc_ex *)bdp;
                         ^
   drivers/net/ethernet/freescale/fec_main.c:1370:21: note: Shadowed declar=
ation
    struct bufdesc_ex *ebdp =3D NULL;
                       ^
   drivers/net/ethernet/freescale/fec_main.c:1524:23: note: Shadow variable
      struct bufdesc_ex *ebdp =3D (struct bufdesc_ex *)bdp;
                         ^
>> drivers/net/ethernet/freescale/fec_main.c:1074:11: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    writel(0 << 31, fep->hwp + FEC_MIB_CTRLSTAT);
             ^
   drivers/net/ethernet/freescale/fec_main.c:2481:12: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    rx_itr |=3D FEC_ITR_EN;
              ^
   drivers/net/ethernet/freescale/fec_main.c:2482:12: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    tx_itr |=3D FEC_ITR_EN;
              ^
>> drivers/net/ethernet/freescale/fec_main.c:3050:18: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour. See condition at line 3=
047. [shiftTooManyBitsSigned]
      hash_low |=3D 1 << hash;
                    ^
   drivers/net/ethernet/freescale/fec_main.c:3047:12: note: Assuming that c=
ondition 'hash>31' is not redundant
     if (hash > 31)
              ^
   drivers/net/ethernet/freescale/fec_main.c:3050:18: note: Shift
      hash_low |=3D 1 << hash;
                    ^
>> drivers/net/ethernet/freescale/fec_main.c:2612:54: warning: Clarify calc=
ulation precedence for '&' and '?'. [clarifyCalculation]
     wol->wolopts =3D fep->wol_flag & FEC_WOL_FLAG_ENABLE ? WAKE_MAGIC : 0;
                                                        ^
>> drivers/net/ethernet/freescale/fec_main.c:915:6: warning: Unused variabl=
e: val [unusedVariable]
    u32 val;
        ^
>> drivers/net/ethernet/8390/ne2k-pci.c:185:18: warning: struct member 'ne2=
k_pci_card::pci_dev' is never used. [unusedStructMember]
    struct pci_dev *pci_dev;
                    ^
>> drivers/net/ethernet/8390/ne2k-pci.c:346:35: warning: Clarify calculatio=
n precedence for '&' and '?'. [clarifyCalculation]
    stop_page =3D flags & STOP_PG_0x60 ? 0x60 : NESM_STOP_PG;
                                     ^
--
>> drivers/pci/pcie/aer.c:673:1: warning: %d in format string (no. 1) requi=
res 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_si=
nt]
   aer_stats_dev_attr(aer_dev_correctable, dev_cor_errs,
   ^
   drivers/pci/pcie/aer.c:676:1: warning: %d in format string (no. 1) requi=
res 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_si=
nt]
   aer_stats_dev_attr(aer_dev_fatal, dev_fatal_errs,
   ^
   drivers/pci/pcie/aer.c:679:1: warning: %d in format string (no. 1) requi=
res 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_si=
nt]
   aer_stats_dev_attr(aer_dev_nonfatal, dev_nonfatal_errs,
   ^
>> drivers/pci/quirks.c:3208:54: warning: Shifting signed 32-bit value by 3=
1 bits is undefined behaviour [shiftTooManyBitsSigned]
    pci_write_config_dword(dev, VTUNCERRMSK_REG, word | VTD_MSK_SPEC_ERRORS=
);
                                                        ^

vim +67 drivers/bus/bt1-axi.c

    55	=

    56	static irqreturn_t bt1_axi_isr(int irq, void *data)
    57	{
    58		struct bt1_axi *axi =3D data;
    59		u32 low =3D 0, high =3D 0;
    60	=

    61		regmap_read(axi->sys_regs, BT1_AXI_WERRL, &low);
    62		regmap_read(axi->sys_regs, BT1_AXI_WERRH, &high);
    63	=

    64		dev_crit_ratelimited(axi->dev,
    65			"AXI-bus fault %d: %s at 0x%x%08x\n",
    66			atomic_inc_return(&axi->count),
  > 67			high & BT1_AXI_WERRH_TYPE ? "no slave" : "slave protocol error",
    68			high, low);
    69	=

    70		/*
    71		 * Print backtrace on each CPU. This might be pointless if the fault
    72		 * has happened on the same CPU as the IRQ handler is executed or
    73		 * the other core proceeded further execution despite the error.
    74		 * But if it's not, by looking at the trace we would get straight to
    75		 * the cause of the problem.
    76		 */
    77		trigger_all_cpu_backtrace();
    78	=

    79		return IRQ_HANDLED;
    80	}
    81	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7654302584118245692==--

