Content-Type: multipart/mixed; boundary="===============0400134250001168487=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arm-platforms:kvm-arm64/pmu-undef-fixes 29/30] arch/arm64/kvm/sys_regs.c:1544:13: warning: initializer overrides prior initialization of this subobject
Date: Fri, 08 Jan 2021 22:18:57 +0800
Message-ID: <202101082253.LtrQbZvn-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0400134250001168487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.g=
it kvm-arm64/pmu-undef-fixes
head:   248735e2001115f36e70105cb9dadff95a9fdb42
commit: 9bde3c476c881793f310f38a5f705b0394283f8b [29/30] KVM: arm64: Hide P=
MU registers from userspace when not available
config: arm64-randconfig-r012-20210108 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c9516=
23bc8965fa1e89660f2f5f4a2944e4981a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms=
.git/commit/?id=3D9bde3c476c881793f310f38a5f705b0394283f8b
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/k=
ernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms kvm-arm64/pmu-undef-fixes
        git checkout 9bde3c476c881793f310f38a5f705b0394283f8b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/sys_regs.c:1544:13: warning: initializer overrides prior =
initialization of this subobject [-Winitializer-overrides]
             .reset =3D reset_pmcr, .reg =3D PMCR_EL0 },
                      ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1543:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMCR_EL0), .access =3D access_pmcr,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:949:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset =3D reset_unknown, .visibility =3D pmu_visib=
ility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1556:38: warning: initializer overrides prior =
initialization of this subobject [-Winitializer-overrides]
             .access =3D access_pmceid, .reset =3D NULL },
                                               ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1555:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMCEID0_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:949:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset =3D reset_unknown, .visibility =3D pmu_visib=
ility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1558:38: warning: initializer overrides prior =
initialization of this subobject [-Winitializer-overrides]
             .access =3D access_pmceid, .reset =3D NULL },
                                               ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1557:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMCEID1_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:949:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset =3D reset_unknown, .visibility =3D pmu_visib=
ility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1562:43: warning: initializer overrides prior =
initialization of this subobject [-Winitializer-overrides]
             .access =3D access_pmu_evtyper, .reset =3D NULL },
                                                    ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1561:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMXEVTYPER_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:949:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset =3D reset_unknown, .visibility =3D pmu_visib=
ility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1564:42: warning: initializer overrides prior =
initialization of this subobject [-Winitializer-overrides]
             .access =3D access_pmu_evcntr, .reset =3D NULL },
                                                   ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1563:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMXEVCNTR_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:949:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset =3D reset_unknown, .visibility =3D pmu_visib=
ility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1570:13: warning: initializer overrides prior =
initialization of this subobject [-Winitializer-overrides]
             .reset =3D reset_val, .reg =3D PMUSERENR_EL0, .val =3D 0 },
                      ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1569:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMUSERENR_EL0), .access =3D access_pmuserenr,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:949:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset =3D reset_unknown, .visibility =3D pmu_visib=
ility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1725:13: warning: initializer overrides prior =
initialization of this subobject [-Winitializer-overrides]
             .reset =3D reset_val, .reg =3D PMCCFILTR_EL0, .val =3D 0 },
                      ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1724:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMCCFILTR_EL0), .access =3D access_pmu_evtyper,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:949:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset =3D reset_unknown, .visibility =3D pmu_visib=
ility
                                 ^~~~~~~~~~~~~
   7 warnings generated.


vim +1544 arch/arm64/kvm/sys_regs.c

  1332	=

  1333	/*
  1334	 * Architected system registers.
  1335	 * Important: Must be sorted ascending by Op0, Op1, CRn, CRm, Op2
  1336	 *
  1337	 * Debug handling: We do trap most, if not all debug related system
  1338	 * registers. The implementation is good enough to ensure that a gue=
st
  1339	 * can use these with minimal performance degradation. The drawback =
is
  1340	 * that we don't implement any of the external debug, none of the
  1341	 * OSlock protocol. This should be revisited if we ever encounter a
  1342	 * more demanding guest...
  1343	 */
  1344	static const struct sys_reg_desc sys_reg_descs[] =3D {
  1345		{ SYS_DESC(SYS_DC_ISW), access_dcsw },
  1346		{ SYS_DESC(SYS_DC_CSW), access_dcsw },
  1347		{ SYS_DESC(SYS_DC_CISW), access_dcsw },
  1348	=

  1349		DBG_BCR_BVR_WCR_WVR_EL1(0),
  1350		DBG_BCR_BVR_WCR_WVR_EL1(1),
  1351		{ SYS_DESC(SYS_MDCCINT_EL1), trap_debug_regs, reset_val, MDCCINT_EL=
1, 0 },
  1352		{ SYS_DESC(SYS_MDSCR_EL1), trap_debug_regs, reset_val, MDSCR_EL1, 0=
 },
  1353		DBG_BCR_BVR_WCR_WVR_EL1(2),
  1354		DBG_BCR_BVR_WCR_WVR_EL1(3),
  1355		DBG_BCR_BVR_WCR_WVR_EL1(4),
  1356		DBG_BCR_BVR_WCR_WVR_EL1(5),
  1357		DBG_BCR_BVR_WCR_WVR_EL1(6),
  1358		DBG_BCR_BVR_WCR_WVR_EL1(7),
  1359		DBG_BCR_BVR_WCR_WVR_EL1(8),
  1360		DBG_BCR_BVR_WCR_WVR_EL1(9),
  1361		DBG_BCR_BVR_WCR_WVR_EL1(10),
  1362		DBG_BCR_BVR_WCR_WVR_EL1(11),
  1363		DBG_BCR_BVR_WCR_WVR_EL1(12),
  1364		DBG_BCR_BVR_WCR_WVR_EL1(13),
  1365		DBG_BCR_BVR_WCR_WVR_EL1(14),
  1366		DBG_BCR_BVR_WCR_WVR_EL1(15),
  1367	=

  1368		{ SYS_DESC(SYS_MDRAR_EL1), trap_raz_wi },
  1369		{ SYS_DESC(SYS_OSLAR_EL1), trap_raz_wi },
  1370		{ SYS_DESC(SYS_OSLSR_EL1), trap_oslsr_el1 },
  1371		{ SYS_DESC(SYS_OSDLR_EL1), trap_raz_wi },
  1372		{ SYS_DESC(SYS_DBGPRCR_EL1), trap_raz_wi },
  1373		{ SYS_DESC(SYS_DBGCLAIMSET_EL1), trap_raz_wi },
  1374		{ SYS_DESC(SYS_DBGCLAIMCLR_EL1), trap_raz_wi },
  1375		{ SYS_DESC(SYS_DBGAUTHSTATUS_EL1), trap_dbgauthstatus_el1 },
  1376	=

  1377		{ SYS_DESC(SYS_MDCCSR_EL0), trap_raz_wi },
  1378		{ SYS_DESC(SYS_DBGDTR_EL0), trap_raz_wi },
  1379		// DBGDTR[TR]X_EL0 share the same encoding
  1380		{ SYS_DESC(SYS_DBGDTRTX_EL0), trap_raz_wi },
  1381	=

  1382		{ SYS_DESC(SYS_DBGVCR32_EL2), NULL, reset_val, DBGVCR32_EL2, 0 },
  1383	=

  1384		{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
  1385	=

  1386		/*
  1387		 * ID regs: all ID_SANITISED() entries here must have corresponding
  1388		 * entries in arm64_ftr_regs[].
  1389		 */
  1390	=

  1391		/* AArch64 mappings of the AArch32 ID registers */
  1392		/* CRm=3D1 */
  1393		ID_SANITISED(ID_PFR0_EL1),
  1394		ID_SANITISED(ID_PFR1_EL1),
  1395		ID_SANITISED(ID_DFR0_EL1),
  1396		ID_HIDDEN(ID_AFR0_EL1),
  1397		ID_SANITISED(ID_MMFR0_EL1),
  1398		ID_SANITISED(ID_MMFR1_EL1),
  1399		ID_SANITISED(ID_MMFR2_EL1),
  1400		ID_SANITISED(ID_MMFR3_EL1),
  1401	=

  1402		/* CRm=3D2 */
  1403		ID_SANITISED(ID_ISAR0_EL1),
  1404		ID_SANITISED(ID_ISAR1_EL1),
  1405		ID_SANITISED(ID_ISAR2_EL1),
  1406		ID_SANITISED(ID_ISAR3_EL1),
  1407		ID_SANITISED(ID_ISAR4_EL1),
  1408		ID_SANITISED(ID_ISAR5_EL1),
  1409		ID_SANITISED(ID_MMFR4_EL1),
  1410		ID_SANITISED(ID_ISAR6_EL1),
  1411	=

  1412		/* CRm=3D3 */
  1413		ID_SANITISED(MVFR0_EL1),
  1414		ID_SANITISED(MVFR1_EL1),
  1415		ID_SANITISED(MVFR2_EL1),
  1416		ID_UNALLOCATED(3,3),
  1417		ID_SANITISED(ID_PFR2_EL1),
  1418		ID_HIDDEN(ID_DFR1_EL1),
  1419		ID_SANITISED(ID_MMFR5_EL1),
  1420		ID_UNALLOCATED(3,7),
  1421	=

  1422		/* AArch64 ID registers */
  1423		/* CRm=3D4 */
  1424		{ SYS_DESC(SYS_ID_AA64PFR0_EL1), .access =3D access_id_reg,
  1425		  .get_user =3D get_id_reg, .set_user =3D set_id_aa64pfr0_el1, },
  1426		ID_SANITISED(ID_AA64PFR1_EL1),
  1427		ID_UNALLOCATED(4,2),
  1428		ID_UNALLOCATED(4,3),
  1429		ID_SANITISED(ID_AA64ZFR0_EL1),
  1430		ID_UNALLOCATED(4,5),
  1431		ID_UNALLOCATED(4,6),
  1432		ID_UNALLOCATED(4,7),
  1433	=

  1434		/* CRm=3D5 */
  1435		ID_SANITISED(ID_AA64DFR0_EL1),
  1436		ID_SANITISED(ID_AA64DFR1_EL1),
  1437		ID_UNALLOCATED(5,2),
  1438		ID_UNALLOCATED(5,3),
  1439		ID_HIDDEN(ID_AA64AFR0_EL1),
  1440		ID_HIDDEN(ID_AA64AFR1_EL1),
  1441		ID_UNALLOCATED(5,6),
  1442		ID_UNALLOCATED(5,7),
  1443	=

  1444		/* CRm=3D6 */
  1445		ID_SANITISED(ID_AA64ISAR0_EL1),
  1446		ID_SANITISED(ID_AA64ISAR1_EL1),
  1447		ID_UNALLOCATED(6,2),
  1448		ID_UNALLOCATED(6,3),
  1449		ID_UNALLOCATED(6,4),
  1450		ID_UNALLOCATED(6,5),
  1451		ID_UNALLOCATED(6,6),
  1452		ID_UNALLOCATED(6,7),
  1453	=

  1454		/* CRm=3D7 */
  1455		ID_SANITISED(ID_AA64MMFR0_EL1),
  1456		ID_SANITISED(ID_AA64MMFR1_EL1),
  1457		ID_SANITISED(ID_AA64MMFR2_EL1),
  1458		ID_UNALLOCATED(7,3),
  1459		ID_UNALLOCATED(7,4),
  1460		ID_UNALLOCATED(7,5),
  1461		ID_UNALLOCATED(7,6),
  1462		ID_UNALLOCATED(7,7),
  1463	=

  1464		{ SYS_DESC(SYS_SCTLR_EL1), access_vm_reg, reset_val, SCTLR_EL1, 0x0=
0C50078 },
  1465		{ SYS_DESC(SYS_ACTLR_EL1), access_actlr, reset_actlr, ACTLR_EL1 },
  1466		{ SYS_DESC(SYS_CPACR_EL1), NULL, reset_val, CPACR_EL1, 0 },
  1467	=

  1468		{ SYS_DESC(SYS_RGSR_EL1), undef_access },
  1469		{ SYS_DESC(SYS_GCR_EL1), undef_access },
  1470	=

  1471		{ SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility =
=3D sve_visibility },
  1472		{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 =
},
  1473		{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 =
},
  1474		{ SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
  1475	=

  1476		PTRAUTH_KEY(APIA),
  1477		PTRAUTH_KEY(APIB),
  1478		PTRAUTH_KEY(APDA),
  1479		PTRAUTH_KEY(APDB),
  1480		PTRAUTH_KEY(APGA),
  1481	=

  1482		{ SYS_DESC(SYS_AFSR0_EL1), access_vm_reg, reset_unknown, AFSR0_EL1 =
},
  1483		{ SYS_DESC(SYS_AFSR1_EL1), access_vm_reg, reset_unknown, AFSR1_EL1 =
},
  1484		{ SYS_DESC(SYS_ESR_EL1), access_vm_reg, reset_unknown, ESR_EL1 },
  1485	=

  1486		{ SYS_DESC(SYS_ERRIDR_EL1), trap_raz_wi },
  1487		{ SYS_DESC(SYS_ERRSELR_EL1), trap_raz_wi },
  1488		{ SYS_DESC(SYS_ERXFR_EL1), trap_raz_wi },
  1489		{ SYS_DESC(SYS_ERXCTLR_EL1), trap_raz_wi },
  1490		{ SYS_DESC(SYS_ERXSTATUS_EL1), trap_raz_wi },
  1491		{ SYS_DESC(SYS_ERXADDR_EL1), trap_raz_wi },
  1492		{ SYS_DESC(SYS_ERXMISC0_EL1), trap_raz_wi },
  1493		{ SYS_DESC(SYS_ERXMISC1_EL1), trap_raz_wi },
  1494	=

  1495		{ SYS_DESC(SYS_TFSR_EL1), undef_access },
  1496		{ SYS_DESC(SYS_TFSRE0_EL1), undef_access },
  1497	=

  1498		{ SYS_DESC(SYS_FAR_EL1), access_vm_reg, reset_unknown, FAR_EL1 },
  1499		{ SYS_DESC(SYS_PAR_EL1), NULL, reset_unknown, PAR_EL1 },
  1500	=

  1501		{ PMU_SYS_REG(SYS_PMINTENSET_EL1),
  1502		  .access =3D access_pminten, .reg =3D PMINTENSET_EL1 },
  1503		{ PMU_SYS_REG(SYS_PMINTENCLR_EL1),
  1504		  .access =3D access_pminten, .reg =3D PMINTENSET_EL1 },
  1505	=

  1506		{ SYS_DESC(SYS_MAIR_EL1), access_vm_reg, reset_unknown, MAIR_EL1 },
  1507		{ SYS_DESC(SYS_AMAIR_EL1), access_vm_reg, reset_amair_el1, AMAIR_EL=
1 },
  1508	=

  1509		{ SYS_DESC(SYS_LORSA_EL1), trap_loregion },
  1510		{ SYS_DESC(SYS_LOREA_EL1), trap_loregion },
  1511		{ SYS_DESC(SYS_LORN_EL1), trap_loregion },
  1512		{ SYS_DESC(SYS_LORC_EL1), trap_loregion },
  1513		{ SYS_DESC(SYS_LORID_EL1), trap_loregion },
  1514	=

  1515		{ SYS_DESC(SYS_VBAR_EL1), NULL, reset_val, VBAR_EL1, 0 },
  1516		{ SYS_DESC(SYS_DISR_EL1), NULL, reset_val, DISR_EL1, 0 },
  1517	=

  1518		{ SYS_DESC(SYS_ICC_IAR0_EL1), write_to_read_only },
  1519		{ SYS_DESC(SYS_ICC_EOIR0_EL1), read_from_write_only },
  1520		{ SYS_DESC(SYS_ICC_HPPIR0_EL1), write_to_read_only },
  1521		{ SYS_DESC(SYS_ICC_DIR_EL1), read_from_write_only },
  1522		{ SYS_DESC(SYS_ICC_RPR_EL1), write_to_read_only },
  1523		{ SYS_DESC(SYS_ICC_SGI1R_EL1), access_gic_sgi },
  1524		{ SYS_DESC(SYS_ICC_ASGI1R_EL1), access_gic_sgi },
  1525		{ SYS_DESC(SYS_ICC_SGI0R_EL1), access_gic_sgi },
  1526		{ SYS_DESC(SYS_ICC_IAR1_EL1), write_to_read_only },
  1527		{ SYS_DESC(SYS_ICC_EOIR1_EL1), read_from_write_only },
  1528		{ SYS_DESC(SYS_ICC_HPPIR1_EL1), write_to_read_only },
  1529		{ SYS_DESC(SYS_ICC_SRE_EL1), access_gic_sre },
  1530	=

  1531		{ SYS_DESC(SYS_CONTEXTIDR_EL1), access_vm_reg, reset_val, CONTEXTID=
R_EL1, 0 },
  1532		{ SYS_DESC(SYS_TPIDR_EL1), NULL, reset_unknown, TPIDR_EL1 },
  1533	=

  1534		{ SYS_DESC(SYS_SCXTNUM_EL1), undef_access },
  1535	=

  1536		{ SYS_DESC(SYS_CNTKCTL_EL1), NULL, reset_val, CNTKCTL_EL1, 0},
  1537	=

  1538		{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
  1539		{ SYS_DESC(SYS_CLIDR_EL1), access_clidr },
  1540		{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL=
1 },
  1541		{ SYS_DESC(SYS_CTR_EL0), access_ctr },
  1542	=

  1543		{ PMU_SYS_REG(SYS_PMCR_EL0), .access =3D access_pmcr,
> 1544		  .reset =3D reset_pmcr, .reg =3D PMCR_EL0 },
  1545		{ PMU_SYS_REG(SYS_PMCNTENSET_EL0),
  1546		  .access =3D access_pmcnten, .reg =3D PMCNTENSET_EL0 },
  1547		{ PMU_SYS_REG(SYS_PMCNTENCLR_EL0),
  1548		  .access =3D access_pmcnten, .reg =3D PMCNTENSET_EL0 },
  1549		{ PMU_SYS_REG(SYS_PMOVSCLR_EL0),
  1550		  .access =3D access_pmovs, .reg =3D PMOVSSET_EL0 },
  1551		{ PMU_SYS_REG(SYS_PMSWINC_EL0),
  1552		  .access =3D access_pmswinc, .reg =3D PMSWINC_EL0 },
  1553		{ PMU_SYS_REG(SYS_PMSELR_EL0),
  1554		  .access =3D access_pmselr, .reg =3D PMSELR_EL0 },
  1555		{ PMU_SYS_REG(SYS_PMCEID0_EL0),
  1556		  .access =3D access_pmceid, .reset =3D NULL },
  1557		{ PMU_SYS_REG(SYS_PMCEID1_EL0),
  1558		  .access =3D access_pmceid, .reset =3D NULL },
  1559		{ PMU_SYS_REG(SYS_PMCCNTR_EL0),
  1560		  .access =3D access_pmu_evcntr, .reg =3D PMCCNTR_EL0 },
  1561		{ PMU_SYS_REG(SYS_PMXEVTYPER_EL0),
  1562		  .access =3D access_pmu_evtyper, .reset =3D NULL },
  1563		{ PMU_SYS_REG(SYS_PMXEVCNTR_EL0),
  1564		  .access =3D access_pmu_evcntr, .reset =3D NULL },
  1565		/*
  1566		 * PMUSERENR_EL0 resets as unknown in 64bit mode while it resets as=
 zero
  1567		 * in 32bit mode. Here we choose to reset it as zero for consistenc=
y.
  1568		 */
  1569		{ PMU_SYS_REG(SYS_PMUSERENR_EL0), .access =3D access_pmuserenr,
  1570		  .reset =3D reset_val, .reg =3D PMUSERENR_EL0, .val =3D 0 },
  1571		{ PMU_SYS_REG(SYS_PMOVSSET_EL0),
  1572		  .access =3D access_pmovs, .reg =3D PMOVSSET_EL0 },
  1573	=

  1574		{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
  1575		{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
  1576	=

  1577		{ SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
  1578	=

  1579		{ SYS_DESC(SYS_AMCR_EL0), undef_access },
  1580		{ SYS_DESC(SYS_AMCFGR_EL0), undef_access },
  1581		{ SYS_DESC(SYS_AMCGCR_EL0), undef_access },
  1582		{ SYS_DESC(SYS_AMUSERENR_EL0), undef_access },
  1583		{ SYS_DESC(SYS_AMCNTENCLR0_EL0), undef_access },
  1584		{ SYS_DESC(SYS_AMCNTENSET0_EL0), undef_access },
  1585		{ SYS_DESC(SYS_AMCNTENCLR1_EL0), undef_access },
  1586		{ SYS_DESC(SYS_AMCNTENSET1_EL0), undef_access },
  1587		AMU_AMEVCNTR0_EL0(0),
  1588		AMU_AMEVCNTR0_EL0(1),
  1589		AMU_AMEVCNTR0_EL0(2),
  1590		AMU_AMEVCNTR0_EL0(3),
  1591		AMU_AMEVCNTR0_EL0(4),
  1592		AMU_AMEVCNTR0_EL0(5),
  1593		AMU_AMEVCNTR0_EL0(6),
  1594		AMU_AMEVCNTR0_EL0(7),
  1595		AMU_AMEVCNTR0_EL0(8),
  1596		AMU_AMEVCNTR0_EL0(9),
  1597		AMU_AMEVCNTR0_EL0(10),
  1598		AMU_AMEVCNTR0_EL0(11),
  1599		AMU_AMEVCNTR0_EL0(12),
  1600		AMU_AMEVCNTR0_EL0(13),
  1601		AMU_AMEVCNTR0_EL0(14),
  1602		AMU_AMEVCNTR0_EL0(15),
  1603		AMU_AMEVTYPER0_EL0(0),
  1604		AMU_AMEVTYPER0_EL0(1),
  1605		AMU_AMEVTYPER0_EL0(2),
  1606		AMU_AMEVTYPER0_EL0(3),
  1607		AMU_AMEVTYPER0_EL0(4),
  1608		AMU_AMEVTYPER0_EL0(5),
  1609		AMU_AMEVTYPER0_EL0(6),
  1610		AMU_AMEVTYPER0_EL0(7),
  1611		AMU_AMEVTYPER0_EL0(8),
  1612		AMU_AMEVTYPER0_EL0(9),
  1613		AMU_AMEVTYPER0_EL0(10),
  1614		AMU_AMEVTYPER0_EL0(11),
  1615		AMU_AMEVTYPER0_EL0(12),
  1616		AMU_AMEVTYPER0_EL0(13),
  1617		AMU_AMEVTYPER0_EL0(14),
  1618		AMU_AMEVTYPER0_EL0(15),
  1619		AMU_AMEVCNTR1_EL0(0),
  1620		AMU_AMEVCNTR1_EL0(1),
  1621		AMU_AMEVCNTR1_EL0(2),
  1622		AMU_AMEVCNTR1_EL0(3),
  1623		AMU_AMEVCNTR1_EL0(4),
  1624		AMU_AMEVCNTR1_EL0(5),
  1625		AMU_AMEVCNTR1_EL0(6),
  1626		AMU_AMEVCNTR1_EL0(7),
  1627		AMU_AMEVCNTR1_EL0(8),
  1628		AMU_AMEVCNTR1_EL0(9),
  1629		AMU_AMEVCNTR1_EL0(10),
  1630		AMU_AMEVCNTR1_EL0(11),
  1631		AMU_AMEVCNTR1_EL0(12),
  1632		AMU_AMEVCNTR1_EL0(13),
  1633		AMU_AMEVCNTR1_EL0(14),
  1634		AMU_AMEVCNTR1_EL0(15),
  1635		AMU_AMEVTYPER1_EL0(0),
  1636		AMU_AMEVTYPER1_EL0(1),
  1637		AMU_AMEVTYPER1_EL0(2),
  1638		AMU_AMEVTYPER1_EL0(3),
  1639		AMU_AMEVTYPER1_EL0(4),
  1640		AMU_AMEVTYPER1_EL0(5),
  1641		AMU_AMEVTYPER1_EL0(6),
  1642		AMU_AMEVTYPER1_EL0(7),
  1643		AMU_AMEVTYPER1_EL0(8),
  1644		AMU_AMEVTYPER1_EL0(9),
  1645		AMU_AMEVTYPER1_EL0(10),
  1646		AMU_AMEVTYPER1_EL0(11),
  1647		AMU_AMEVTYPER1_EL0(12),
  1648		AMU_AMEVTYPER1_EL0(13),
  1649		AMU_AMEVTYPER1_EL0(14),
  1650		AMU_AMEVTYPER1_EL0(15),
  1651	=

  1652		{ SYS_DESC(SYS_CNTP_TVAL_EL0), access_arch_timer },
  1653		{ SYS_DESC(SYS_CNTP_CTL_EL0), access_arch_timer },
  1654		{ SYS_DESC(SYS_CNTP_CVAL_EL0), access_arch_timer },
  1655	=

  1656		/* PMEVCNTRn_EL0 */
  1657		PMU_PMEVCNTR_EL0(0),
  1658		PMU_PMEVCNTR_EL0(1),
  1659		PMU_PMEVCNTR_EL0(2),
  1660		PMU_PMEVCNTR_EL0(3),
  1661		PMU_PMEVCNTR_EL0(4),
  1662		PMU_PMEVCNTR_EL0(5),
  1663		PMU_PMEVCNTR_EL0(6),
  1664		PMU_PMEVCNTR_EL0(7),
  1665		PMU_PMEVCNTR_EL0(8),
  1666		PMU_PMEVCNTR_EL0(9),
  1667		PMU_PMEVCNTR_EL0(10),
  1668		PMU_PMEVCNTR_EL0(11),
  1669		PMU_PMEVCNTR_EL0(12),
  1670		PMU_PMEVCNTR_EL0(13),
  1671		PMU_PMEVCNTR_EL0(14),
  1672		PMU_PMEVCNTR_EL0(15),
  1673		PMU_PMEVCNTR_EL0(16),
  1674		PMU_PMEVCNTR_EL0(17),
  1675		PMU_PMEVCNTR_EL0(18),
  1676		PMU_PMEVCNTR_EL0(19),
  1677		PMU_PMEVCNTR_EL0(20),
  1678		PMU_PMEVCNTR_EL0(21),
  1679		PMU_PMEVCNTR_EL0(22),
  1680		PMU_PMEVCNTR_EL0(23),
  1681		PMU_PMEVCNTR_EL0(24),
  1682		PMU_PMEVCNTR_EL0(25),
  1683		PMU_PMEVCNTR_EL0(26),
  1684		PMU_PMEVCNTR_EL0(27),
  1685		PMU_PMEVCNTR_EL0(28),
  1686		PMU_PMEVCNTR_EL0(29),
  1687		PMU_PMEVCNTR_EL0(30),
  1688		/* PMEVTYPERn_EL0 */
  1689		PMU_PMEVTYPER_EL0(0),
  1690		PMU_PMEVTYPER_EL0(1),
  1691		PMU_PMEVTYPER_EL0(2),
  1692		PMU_PMEVTYPER_EL0(3),
  1693		PMU_PMEVTYPER_EL0(4),
  1694		PMU_PMEVTYPER_EL0(5),
  1695		PMU_PMEVTYPER_EL0(6),
  1696		PMU_PMEVTYPER_EL0(7),
  1697		PMU_PMEVTYPER_EL0(8),
  1698		PMU_PMEVTYPER_EL0(9),
  1699		PMU_PMEVTYPER_EL0(10),
  1700		PMU_PMEVTYPER_EL0(11),
  1701		PMU_PMEVTYPER_EL0(12),
  1702		PMU_PMEVTYPER_EL0(13),
  1703		PMU_PMEVTYPER_EL0(14),
  1704		PMU_PMEVTYPER_EL0(15),
  1705		PMU_PMEVTYPER_EL0(16),
  1706		PMU_PMEVTYPER_EL0(17),
  1707		PMU_PMEVTYPER_EL0(18),
  1708		PMU_PMEVTYPER_EL0(19),
  1709		PMU_PMEVTYPER_EL0(20),
  1710		PMU_PMEVTYPER_EL0(21),
  1711		PMU_PMEVTYPER_EL0(22),
  1712		PMU_PMEVTYPER_EL0(23),
  1713		PMU_PMEVTYPER_EL0(24),
  1714		PMU_PMEVTYPER_EL0(25),
  1715		PMU_PMEVTYPER_EL0(26),
  1716		PMU_PMEVTYPER_EL0(27),
  1717		PMU_PMEVTYPER_EL0(28),
  1718		PMU_PMEVTYPER_EL0(29),
  1719		PMU_PMEVTYPER_EL0(30),
  1720		/*
  1721		 * PMCCFILTR_EL0 resets as unknown in 64bit mode while it resets as=
 zero
  1722		 * in 32bit mode. Here we choose to reset it as zero for consistenc=
y.
  1723		 */
  1724		{ PMU_SYS_REG(SYS_PMCCFILTR_EL0), .access =3D access_pmu_evtyper,
  1725		  .reset =3D reset_val, .reg =3D PMCCFILTR_EL0, .val =3D 0 },
  1726	=

  1727		{ SYS_DESC(SYS_DACR32_EL2), NULL, reset_unknown, DACR32_EL2 },
  1728		{ SYS_DESC(SYS_IFSR32_EL2), NULL, reset_unknown, IFSR32_EL2 },
  1729		{ SYS_DESC(SYS_FPEXC32_EL2), NULL, reset_val, FPEXC32_EL2, 0x700 },
  1730	};
  1731	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0400134250001168487==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
wuuW9gEA
--===============0400134250001168487==--

