Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB4B204589
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737840113; cv=none; b=dYB5A5a2Aj5ZgIAnB1WkCPN63RILY4rmr/uY3xCp7azT7P7/7hn6zKJU6xMKUPZMsSiQSx5OFKpSJvn2h3TUvTBUqXlA69A4eCgI6uuo8jg2jl/GjqlzgpdghloJThVormoBup48rJiWv1RPqdsntxvwKoQfD5mwfOg0yHX3mWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737840113; c=relaxed/simple;
	bh=RRUfuNmYUPEDkP3aRGMrmvbLLAdiIjn43hVNyuCbKL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgnAWVzaz1zBzrf+himt19TT5Xgv2zer1sFX8ikk04PoLfvObFVHTe3JhYzH/MoYNHwEi6CIn8gbjzcvysC4DxONwaEwyenhF0l4NeVHwYUAmpTZmjD/V5CeDc20QgnZcxAxJJRjb3p0z0fkH1Lcj/w0RiCUMQeMkqmC2Q1RmL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gV/CGUfw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gV/CGUfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737840111; x=1769376111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RRUfuNmYUPEDkP3aRGMrmvbLLAdiIjn43hVNyuCbKL8=;
  b=gV/CGUfw0jvSY7eqvTjQUaYjKiENwo1Z4XwHWDoekfS9eVZM/SWr5SUi
   B+43i/CJ2q2miXY/K1v7FQrwAcmzzIBwVK7+01rJ7ghBCd2/vl0vkBLky
   cxCmtowOSA4H01iUOkE34hB6biLoSmUO4Ckx3r2D9SsZMoArazaDg9uOC
   7H/BAHhnVND1ZH1A/rmoZOB7t+cnr3sgQtLpmmSicTZJwKqtOgSk0wxnc
   QUO9F5Ip+Vuqzy2Uk1nt2ZMtvL5/0TpJwH56ztE5DZdIaauQSj+Wj/vHH
   UsHOgRFKNSDNriVJn74yiRZbfKPiZGCgJCta06Dve4/tRm2CBJbgUjidM
   g==;
X-CSE-ConnectionGUID: dzYtBGAmSoy8UvSXKAAgVg==
X-CSE-MsgGUID: 0cpaaaZ9QFGg7TOK2VTYcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="37551553"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="37551553"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 13:21:50 -0800
X-CSE-ConnectionGUID: Zc2Fwos1TJKyabWHvSdVxQ==
X-CSE-MsgGUID: WtzJ7m8MRPSuQJ2FkHxA2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113011889"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jan 2025 13:21:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbnb8-000eED-0U;
	Sat, 25 Jan 2025 21:21:46 +0000
Date: Sun, 26 Jan 2025 05:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 1/31] arch/arm64/kernel/ptrace.c:1657:8: error:
 initializer element is not a compile-time constant
Message-ID: <202501260503.5fvA2hXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   63c713fe1c72102136e20280e6ce21afa3a93d62
commit: be9688e3d2545e30b6c25c71d94b56df69932ff1 [1/31] crypto: Harden against integer overflows in DIV_ROUND_UP()
config: arm64-randconfig-001-20250126 (https://download.01.org/0day-ci/archive/20250126/202501260503.5fvA2hXu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260503.5fvA2hXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260503.5fvA2hXu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/ptrace.c:1657:8: error: initializer element is not a compile-time constant
    1657 |                 .n = DIV_ROUND_UP(SVE_PT_SIZE(ARCH_SVE_VQ_MAX,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1658 |                                               SVE_PT_REGS_SVE),
         |                                               ~~~~~~~~~~~~~~~~~
    1659 |                                   SVE_VQ_BYTES),
         |                                   ~~~~~~~~~~~~~
   include/linux/math.h:50:2: note: expanded from macro 'DIV_ROUND_UP'
      50 |         (__builtin_constant_p(d) && is_power_of_2(d)                    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 |                 ? DIV_ROUND_UP_POW2(n, d)                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                 : __KERNEL_DIV_ROUND_UP(n, d))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1657 arch/arm64/kernel/ptrace.c

478fcb2cdb2351 Will Deacon         2012-03-05  1589  
478fcb2cdb2351 Will Deacon         2012-03-05  1590  static const struct user_regset aarch64_regsets[] = {
478fcb2cdb2351 Will Deacon         2012-03-05  1591  	[REGSET_GPR] = {
478fcb2cdb2351 Will Deacon         2012-03-05  1592  		.core_note_type = NT_PRSTATUS,
478fcb2cdb2351 Will Deacon         2012-03-05  1593  		.n = sizeof(struct user_pt_regs) / sizeof(u64),
478fcb2cdb2351 Will Deacon         2012-03-05  1594  		.size = sizeof(u64),
478fcb2cdb2351 Will Deacon         2012-03-05  1595  		.align = sizeof(u64),
759de58f28b1cd Al Viro             2020-05-27  1596  		.regset_get = gpr_get,
478fcb2cdb2351 Will Deacon         2012-03-05  1597  		.set = gpr_set
478fcb2cdb2351 Will Deacon         2012-03-05  1598  	},
478fcb2cdb2351 Will Deacon         2012-03-05  1599  	[REGSET_FPR] = {
478fcb2cdb2351 Will Deacon         2012-03-05  1600  		.core_note_type = NT_PRFPREG,
478fcb2cdb2351 Will Deacon         2012-03-05  1601  		.n = sizeof(struct user_fpsimd_state) / sizeof(u32),
478fcb2cdb2351 Will Deacon         2012-03-05  1602  		/*
478fcb2cdb2351 Will Deacon         2012-03-05  1603  		 * We pretend we have 32-bit registers because the fpsr and
478fcb2cdb2351 Will Deacon         2012-03-05  1604  		 * fpcr are 32-bits wide.
478fcb2cdb2351 Will Deacon         2012-03-05  1605  		 */
478fcb2cdb2351 Will Deacon         2012-03-05  1606  		.size = sizeof(u32),
478fcb2cdb2351 Will Deacon         2012-03-05  1607  		.align = sizeof(u32),
c9d66999f06494 Suzuki K Poulose    2020-01-13  1608  		.active = fpr_active,
759de58f28b1cd Al Viro             2020-05-27  1609  		.regset_get = fpr_get,
478fcb2cdb2351 Will Deacon         2012-03-05  1610  		.set = fpr_set
478fcb2cdb2351 Will Deacon         2012-03-05  1611  	},
478fcb2cdb2351 Will Deacon         2012-03-05  1612  	[REGSET_TLS] = {
478fcb2cdb2351 Will Deacon         2012-03-05  1613  		.core_note_type = NT_ARM_TLS,
0027d9c6c7b57b Mark Brown          2022-08-29  1614  		.n = 2,
478fcb2cdb2351 Will Deacon         2012-03-05  1615  		.size = sizeof(void *),
478fcb2cdb2351 Will Deacon         2012-03-05  1616  		.align = sizeof(void *),
759de58f28b1cd Al Viro             2020-05-27  1617  		.regset_get = tls_get,
478fcb2cdb2351 Will Deacon         2012-03-05  1618  		.set = tls_set,
478fcb2cdb2351 Will Deacon         2012-03-05  1619  	},
478fcb2cdb2351 Will Deacon         2012-03-05  1620  #ifdef CONFIG_HAVE_HW_BREAKPOINT
478fcb2cdb2351 Will Deacon         2012-03-05  1621  	[REGSET_HW_BREAK] = {
478fcb2cdb2351 Will Deacon         2012-03-05  1622  		.core_note_type = NT_ARM_HW_BREAK,
478fcb2cdb2351 Will Deacon         2012-03-05  1623  		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
478fcb2cdb2351 Will Deacon         2012-03-05  1624  		.size = sizeof(u32),
478fcb2cdb2351 Will Deacon         2012-03-05  1625  		.align = sizeof(u32),
759de58f28b1cd Al Viro             2020-05-27  1626  		.regset_get = hw_break_get,
478fcb2cdb2351 Will Deacon         2012-03-05  1627  		.set = hw_break_set,
478fcb2cdb2351 Will Deacon         2012-03-05  1628  	},
478fcb2cdb2351 Will Deacon         2012-03-05  1629  	[REGSET_HW_WATCH] = {
478fcb2cdb2351 Will Deacon         2012-03-05  1630  		.core_note_type = NT_ARM_HW_WATCH,
478fcb2cdb2351 Will Deacon         2012-03-05  1631  		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
478fcb2cdb2351 Will Deacon         2012-03-05  1632  		.size = sizeof(u32),
478fcb2cdb2351 Will Deacon         2012-03-05  1633  		.align = sizeof(u32),
759de58f28b1cd Al Viro             2020-05-27  1634  		.regset_get = hw_break_get,
478fcb2cdb2351 Will Deacon         2012-03-05  1635  		.set = hw_break_set,
478fcb2cdb2351 Will Deacon         2012-03-05  1636  	},
478fcb2cdb2351 Will Deacon         2012-03-05  1637  #endif
766a85d7bc5d7f AKASHI Takahiro     2014-11-28  1638  	[REGSET_SYSTEM_CALL] = {
766a85d7bc5d7f AKASHI Takahiro     2014-11-28  1639  		.core_note_type = NT_ARM_SYSTEM_CALL,
766a85d7bc5d7f AKASHI Takahiro     2014-11-28  1640  		.n = 1,
766a85d7bc5d7f AKASHI Takahiro     2014-11-28  1641  		.size = sizeof(int),
766a85d7bc5d7f AKASHI Takahiro     2014-11-28  1642  		.align = sizeof(int),
759de58f28b1cd Al Viro             2020-05-27  1643  		.regset_get = system_call_get,
766a85d7bc5d7f AKASHI Takahiro     2014-11-28  1644  		.set = system_call_set,
766a85d7bc5d7f AKASHI Takahiro     2014-11-28  1645  	},
4035c22ef7d43a Mark Brown          2024-03-06  1646  	[REGSET_FPMR] = {
4035c22ef7d43a Mark Brown          2024-03-06  1647  		.core_note_type = NT_ARM_FPMR,
4035c22ef7d43a Mark Brown          2024-03-06  1648  		.n = 1,
4035c22ef7d43a Mark Brown          2024-03-06  1649  		.size = sizeof(u64),
4035c22ef7d43a Mark Brown          2024-03-06  1650  		.align = sizeof(u64),
4035c22ef7d43a Mark Brown          2024-03-06  1651  		.regset_get = fpmr_get,
4035c22ef7d43a Mark Brown          2024-03-06  1652  		.set = fpmr_set,
4035c22ef7d43a Mark Brown          2024-03-06  1653  	},
43d4da2c45b2f5 Dave Martin         2017-10-31  1654  #ifdef CONFIG_ARM64_SVE
43d4da2c45b2f5 Dave Martin         2017-10-31  1655  	[REGSET_SVE] = { /* Scalable Vector Extension */
43d4da2c45b2f5 Dave Martin         2017-10-31  1656  		.core_note_type = NT_ARM_SVE,
2813926261e436 Mark Brown          2024-02-13 @1657  		.n = DIV_ROUND_UP(SVE_PT_SIZE(ARCH_SVE_VQ_MAX,
2813926261e436 Mark Brown          2024-02-13  1658  					      SVE_PT_REGS_SVE),
43d4da2c45b2f5 Dave Martin         2017-10-31  1659  				  SVE_VQ_BYTES),
43d4da2c45b2f5 Dave Martin         2017-10-31  1660  		.size = SVE_VQ_BYTES,
43d4da2c45b2f5 Dave Martin         2017-10-31  1661  		.align = SVE_VQ_BYTES,
759de58f28b1cd Al Viro             2020-05-27  1662  		.regset_get = sve_get,
43d4da2c45b2f5 Dave Martin         2017-10-31  1663  		.set = sve_set,
43d4da2c45b2f5 Dave Martin         2017-10-31  1664  	},
43d4da2c45b2f5 Dave Martin         2017-10-31  1665  #endif
e12310a0d30f26 Mark Brown          2022-04-19  1666  #ifdef CONFIG_ARM64_SME
e12310a0d30f26 Mark Brown          2022-04-19  1667  	[REGSET_SSVE] = { /* Streaming mode SVE */
e12310a0d30f26 Mark Brown          2022-04-19  1668  		.core_note_type = NT_ARM_SSVE,
d158a0608eb85f Mark Brown          2022-05-05  1669  		.n = DIV_ROUND_UP(SVE_PT_SIZE(SME_VQ_MAX, SVE_PT_REGS_SVE),
e12310a0d30f26 Mark Brown          2022-04-19  1670  				  SVE_VQ_BYTES),
e12310a0d30f26 Mark Brown          2022-04-19  1671  		.size = SVE_VQ_BYTES,
e12310a0d30f26 Mark Brown          2022-04-19  1672  		.align = SVE_VQ_BYTES,
e12310a0d30f26 Mark Brown          2022-04-19  1673  		.regset_get = ssve_get,
e12310a0d30f26 Mark Brown          2022-04-19  1674  		.set = ssve_set,
e12310a0d30f26 Mark Brown          2022-04-19  1675  	},
776b4a1cf36411 Mark Brown          2022-04-19  1676  	[REGSET_ZA] = { /* SME ZA */
776b4a1cf36411 Mark Brown          2022-04-19  1677  		.core_note_type = NT_ARM_ZA,
d158a0608eb85f Mark Brown          2022-05-05  1678  		/*
d158a0608eb85f Mark Brown          2022-05-05  1679  		 * ZA is a single register but it's variably sized and
d158a0608eb85f Mark Brown          2022-05-05  1680  		 * the ptrace core requires that the size of any data
d158a0608eb85f Mark Brown          2022-05-05  1681  		 * be an exact multiple of the configured register
d158a0608eb85f Mark Brown          2022-05-05  1682  		 * size so report as though we had SVE_VQ_BYTES
d158a0608eb85f Mark Brown          2022-05-05  1683  		 * registers. These values aren't exposed to
d158a0608eb85f Mark Brown          2022-05-05  1684  		 * userspace.
d158a0608eb85f Mark Brown          2022-05-05  1685  		 */
d158a0608eb85f Mark Brown          2022-05-05  1686  		.n = DIV_ROUND_UP(ZA_PT_SIZE(SME_VQ_MAX), SVE_VQ_BYTES),
776b4a1cf36411 Mark Brown          2022-04-19  1687  		.size = SVE_VQ_BYTES,
776b4a1cf36411 Mark Brown          2022-04-19  1688  		.align = SVE_VQ_BYTES,
776b4a1cf36411 Mark Brown          2022-04-19  1689  		.regset_get = za_get,
776b4a1cf36411 Mark Brown          2022-04-19  1690  		.set = za_set,
776b4a1cf36411 Mark Brown          2022-04-19  1691  	},
f90b529bcbe57c Mark Brown          2023-01-16  1692  	[REGSET_ZT] = { /* SME ZT */
f90b529bcbe57c Mark Brown          2023-01-16  1693  		.core_note_type = NT_ARM_ZT,
f90b529bcbe57c Mark Brown          2023-01-16  1694  		.n = 1,
f90b529bcbe57c Mark Brown          2023-01-16  1695  		.size = ZT_SIG_REG_BYTES,
f90b529bcbe57c Mark Brown          2023-01-16  1696  		.align = sizeof(u64),
f90b529bcbe57c Mark Brown          2023-01-16  1697  		.regset_get = zt_get,
f90b529bcbe57c Mark Brown          2023-01-16  1698  		.set = zt_set,
f90b529bcbe57c Mark Brown          2023-01-16  1699  	},
e12310a0d30f26 Mark Brown          2022-04-19  1700  #endif
ec6e822d1a22d0 Mark Rutland        2018-12-07  1701  #ifdef CONFIG_ARM64_PTR_AUTH
ec6e822d1a22d0 Mark Rutland        2018-12-07  1702  	[REGSET_PAC_MASK] = {
ec6e822d1a22d0 Mark Rutland        2018-12-07  1703  		.core_note_type = NT_ARM_PAC_MASK,
ec6e822d1a22d0 Mark Rutland        2018-12-07  1704  		.n = sizeof(struct user_pac_mask) / sizeof(u64),
ec6e822d1a22d0 Mark Rutland        2018-12-07  1705  		.size = sizeof(u64),
ec6e822d1a22d0 Mark Rutland        2018-12-07  1706  		.align = sizeof(u64),
759de58f28b1cd Al Viro             2020-05-27  1707  		.regset_get = pac_mask_get,
ec6e822d1a22d0 Mark Rutland        2018-12-07  1708  		/* this cannot be set dynamically */
ec6e822d1a22d0 Mark Rutland        2018-12-07  1709  	},
201698626fbca1 Peter Collingbourne 2021-03-18  1710  	[REGSET_PAC_ENABLED_KEYS] = {
201698626fbca1 Peter Collingbourne 2021-03-18  1711  		.core_note_type = NT_ARM_PAC_ENABLED_KEYS,
201698626fbca1 Peter Collingbourne 2021-03-18  1712  		.n = 1,
201698626fbca1 Peter Collingbourne 2021-03-18  1713  		.size = sizeof(long),
201698626fbca1 Peter Collingbourne 2021-03-18  1714  		.align = sizeof(long),
201698626fbca1 Peter Collingbourne 2021-03-18  1715  		.regset_get = pac_enabled_keys_get,
201698626fbca1 Peter Collingbourne 2021-03-18  1716  		.set = pac_enabled_keys_set,
201698626fbca1 Peter Collingbourne 2021-03-18  1717  	},
d0a060be573bfb Kristina Martsenko  2019-01-30  1718  #ifdef CONFIG_CHECKPOINT_RESTORE
d0a060be573bfb Kristina Martsenko  2019-01-30  1719  	[REGSET_PACA_KEYS] = {
d0a060be573bfb Kristina Martsenko  2019-01-30  1720  		.core_note_type = NT_ARM_PACA_KEYS,
d0a060be573bfb Kristina Martsenko  2019-01-30  1721  		.n = sizeof(struct user_pac_address_keys) / sizeof(__uint128_t),
d0a060be573bfb Kristina Martsenko  2019-01-30  1722  		.size = sizeof(__uint128_t),
d0a060be573bfb Kristina Martsenko  2019-01-30  1723  		.align = sizeof(__uint128_t),
759de58f28b1cd Al Viro             2020-05-27  1724  		.regset_get = pac_address_keys_get,
d0a060be573bfb Kristina Martsenko  2019-01-30  1725  		.set = pac_address_keys_set,
d0a060be573bfb Kristina Martsenko  2019-01-30  1726  	},
d0a060be573bfb Kristina Martsenko  2019-01-30  1727  	[REGSET_PACG_KEYS] = {
d0a060be573bfb Kristina Martsenko  2019-01-30  1728  		.core_note_type = NT_ARM_PACG_KEYS,
d0a060be573bfb Kristina Martsenko  2019-01-30  1729  		.n = sizeof(struct user_pac_generic_keys) / sizeof(__uint128_t),
d0a060be573bfb Kristina Martsenko  2019-01-30  1730  		.size = sizeof(__uint128_t),
d0a060be573bfb Kristina Martsenko  2019-01-30  1731  		.align = sizeof(__uint128_t),
759de58f28b1cd Al Viro             2020-05-27  1732  		.regset_get = pac_generic_keys_get,
d0a060be573bfb Kristina Martsenko  2019-01-30  1733  		.set = pac_generic_keys_set,
d0a060be573bfb Kristina Martsenko  2019-01-30  1734  	},
d0a060be573bfb Kristina Martsenko  2019-01-30  1735  #endif
ec6e822d1a22d0 Mark Rutland        2018-12-07  1736  #endif
2200aa7154cb7e Catalin Marinas     2020-07-03  1737  #ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
2200aa7154cb7e Catalin Marinas     2020-07-03  1738  	[REGSET_TAGGED_ADDR_CTRL] = {
2200aa7154cb7e Catalin Marinas     2020-07-03  1739  		.core_note_type = NT_ARM_TAGGED_ADDR_CTRL,
2200aa7154cb7e Catalin Marinas     2020-07-03  1740  		.n = 1,
2200aa7154cb7e Catalin Marinas     2020-07-03  1741  		.size = sizeof(long),
2200aa7154cb7e Catalin Marinas     2020-07-03  1742  		.align = sizeof(long),
2200aa7154cb7e Catalin Marinas     2020-07-03  1743  		.regset_get = tagged_addr_ctrl_get,
2200aa7154cb7e Catalin Marinas     2020-07-03  1744  		.set = tagged_addr_ctrl_set,
2200aa7154cb7e Catalin Marinas     2020-07-03  1745  	},
2200aa7154cb7e Catalin Marinas     2020-07-03  1746  #endif
17519819926211 Joey Gouly          2024-08-22  1747  #ifdef CONFIG_ARM64_POE
17519819926211 Joey Gouly          2024-08-22  1748  	[REGSET_POE] = {
17519819926211 Joey Gouly          2024-08-22  1749  		.core_note_type = NT_ARM_POE,
17519819926211 Joey Gouly          2024-08-22  1750  		.n = 1,
17519819926211 Joey Gouly          2024-08-22  1751  		.size = sizeof(long),
17519819926211 Joey Gouly          2024-08-22  1752  		.align = sizeof(long),
17519819926211 Joey Gouly          2024-08-22  1753  		.regset_get = poe_get,
17519819926211 Joey Gouly          2024-08-22  1754  		.set = poe_set,
17519819926211 Joey Gouly          2024-08-22  1755  	},
17519819926211 Joey Gouly          2024-08-22  1756  #endif
7ec3b57cb29f83 Mark Brown          2024-10-01  1757  #ifdef CONFIG_ARM64_GCS
7ec3b57cb29f83 Mark Brown          2024-10-01  1758  	[REGSET_GCS] = {
7ec3b57cb29f83 Mark Brown          2024-10-01  1759  		.core_note_type = NT_ARM_GCS,
7ec3b57cb29f83 Mark Brown          2024-10-01  1760  		.n = sizeof(struct user_gcs) / sizeof(u64),
7ec3b57cb29f83 Mark Brown          2024-10-01  1761  		.size = sizeof(u64),
7ec3b57cb29f83 Mark Brown          2024-10-01  1762  		.align = sizeof(u64),
7ec3b57cb29f83 Mark Brown          2024-10-01  1763  		.regset_get = gcs_get,
7ec3b57cb29f83 Mark Brown          2024-10-01  1764  		.set = gcs_set,
7ec3b57cb29f83 Mark Brown          2024-10-01  1765  	},
7ec3b57cb29f83 Mark Brown          2024-10-01  1766  #endif
478fcb2cdb2351 Will Deacon         2012-03-05  1767  };
478fcb2cdb2351 Will Deacon         2012-03-05  1768  

:::::: The code at line 1657 was first introduced by commit
:::::: 2813926261e436d33bc74486b51cce60b76edf78 arm64/sve: Lower the maximum allocation for the SVE ptrace regset

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
