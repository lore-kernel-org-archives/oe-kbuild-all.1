Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D49D1B1D5F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724259839; cv=none; b=m9HAgjCM6lp08OcgnJe76f95zzyZwRSiamVBzVeKzqkJ6R45aEQQD8rCBU5JOg1knyW9dJFEkBPYn/BOOMBYCQenKFha8TvMARxD1TtF7hi1yY5rbsdC0sGJfKVsDZFwksc8epRMmDuYpCJo6IfVVWwMpeDjVtMR9nlg5ZuCiwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724259839; c=relaxed/simple;
	bh=IZAN6g5Cmd2ajD7NfULqKvCBo79t4SqDk/w8rB4nE34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzkADVs7W0JK0ZRg1gigfuN2w0SzxXpCO2URLEp/Zenl1S6vGIJUICSB8oaU7YoQJKPImOyubY4J0OSg1iwuJhoHMQ9hQ61N+E6xvHWBB5he/rJeYGy/E0TKWwq08Bgktg3VAsf6YKSh10YHYTj+FMM2zc5dBchooMyU8Iu6YUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha7bj7jU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha7bj7jU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724259837; x=1755795837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IZAN6g5Cmd2ajD7NfULqKvCBo79t4SqDk/w8rB4nE34=;
  b=ha7bj7jUPe7vcgV+1LY8mv6L492RiC0Arz69ImrUOBdpzzDH27grB2aQ
   DafLFlW0itK5B++8FAJJNmehsVvFCKMIAYFH5IO7+83jzH3jKsICy9P94
   Pgqnp4Taq3VvQ0lRpi8DHIyNz7hPgrD112aAMAipH0txm0dMGfplL84Km
   UUVikstNtBT5TGXH88H/byr6hbcJ+MP4kZrrKlG6pcU4LE/PbUo1GOLE9
   svtqyOa3tFIiRHvrxk54m/lzgys+eKo4kNzZ44+GqlTep7wsI6cY+3gNr
   6N/XFCiRPE5ekmrejkQfn9HbUj2dtbrYWNRNlCqgvrTpc8yBcPwDG+mow
   w==;
X-CSE-ConnectionGUID: QnNGcYzlT6O9D4dQhlkhsQ==
X-CSE-MsgGUID: DrjUMYyFR5ervxb49D4JYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22801606"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22801606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 10:03:52 -0700
X-CSE-ConnectionGUID: CtkGY0ZzRJ24U0a7WMWJhg==
X-CSE-MsgGUID: vfHCCW4+TmiF7zc0pSMrzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="91938461"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2024 10:03:51 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgokO-000BjO-2L;
	Wed, 21 Aug 2024 17:03:48 +0000
Date: Thu, 22 Aug 2024 01:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 08/12] KVM: arm64: Add trap routing information for
 ICH_HCR_EL2
Message-ID: <202408220022.RkIIpm8d-lkp@intel.com>
References: <20240820100349.3544850-9-maz@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820100349.3544850-9-maz@kernel.org>

Hi Marc,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvmarm/next]
[also build test WARNING on kvm/queue arm64/for-next/core soc/for-next linus/master v6.11-rc4 next-20240821]
[cannot apply to kvm/linux-next arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Zyngier/KVM-arm64-Make-ICC_-SGI-_EL1-undef-in-the-absence-of-a-vGICv3/20240820-180937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20240820100349.3544850-9-maz%40kernel.org
patch subject: [PATCH 08/12] KVM: arm64: Add trap routing information for ICH_HCR_EL2
config: arm64-randconfig-r113-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220022.RkIIpm8d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408220022.RkIIpm8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220022.RkIIpm8d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/emulate-nested.c:394:10: sparse: sparse: Initializer entry defined twice
   arch/arm64/kvm/emulate-nested.c:406:10: sparse:   also defined here

vim +394 arch/arm64/kvm/emulate-nested.c

   128	
   129	static const struct trap_bits coarse_trap_bits[] = {
   130		[CGT_HCR_TID1] = {
   131			.index		= HCR_EL2,
   132			.value 		= HCR_TID1,
   133			.mask		= HCR_TID1,
   134			.behaviour	= BEHAVE_FORWARD_READ,
   135		},
   136		[CGT_HCR_TID2] = {
   137			.index		= HCR_EL2,
   138			.value 		= HCR_TID2,
   139			.mask		= HCR_TID2,
   140			.behaviour	= BEHAVE_FORWARD_ANY,
   141		},
   142		[CGT_HCR_TID3] = {
   143			.index		= HCR_EL2,
   144			.value 		= HCR_TID3,
   145			.mask		= HCR_TID3,
   146			.behaviour	= BEHAVE_FORWARD_READ,
   147		},
   148		[CGT_HCR_IMO] = {
   149			.index		= HCR_EL2,
   150			.value 		= HCR_IMO,
   151			.mask		= HCR_IMO,
   152			.behaviour	= BEHAVE_FORWARD_WRITE,
   153		},
   154		[CGT_HCR_FMO] = {
   155			.index		= HCR_EL2,
   156			.value 		= HCR_FMO,
   157			.mask		= HCR_FMO,
   158			.behaviour	= BEHAVE_FORWARD_WRITE,
   159		},
   160		[CGT_HCR_TIDCP] = {
   161			.index		= HCR_EL2,
   162			.value		= HCR_TIDCP,
   163			.mask		= HCR_TIDCP,
   164			.behaviour	= BEHAVE_FORWARD_ANY,
   165		},
   166		[CGT_HCR_TACR] = {
   167			.index		= HCR_EL2,
   168			.value		= HCR_TACR,
   169			.mask		= HCR_TACR,
   170			.behaviour	= BEHAVE_FORWARD_ANY,
   171		},
   172		[CGT_HCR_TSW] = {
   173			.index		= HCR_EL2,
   174			.value		= HCR_TSW,
   175			.mask		= HCR_TSW,
   176			.behaviour	= BEHAVE_FORWARD_ANY,
   177		},
   178		[CGT_HCR_TPC] = { /* Also called TCPC when FEAT_DPB is implemented */
   179			.index		= HCR_EL2,
   180			.value		= HCR_TPC,
   181			.mask		= HCR_TPC,
   182			.behaviour	= BEHAVE_FORWARD_ANY,
   183		},
   184		[CGT_HCR_TPU] = {
   185			.index		= HCR_EL2,
   186			.value		= HCR_TPU,
   187			.mask		= HCR_TPU,
   188			.behaviour	= BEHAVE_FORWARD_ANY,
   189		},
   190		[CGT_HCR_TTLB] = {
   191			.index		= HCR_EL2,
   192			.value		= HCR_TTLB,
   193			.mask		= HCR_TTLB,
   194			.behaviour	= BEHAVE_FORWARD_ANY,
   195		},
   196		[CGT_HCR_TVM] = {
   197			.index		= HCR_EL2,
   198			.value		= HCR_TVM,
   199			.mask		= HCR_TVM,
   200			.behaviour	= BEHAVE_FORWARD_WRITE,
   201		},
   202		[CGT_HCR_TDZ] = {
   203			.index		= HCR_EL2,
   204			.value		= HCR_TDZ,
   205			.mask		= HCR_TDZ,
   206			.behaviour	= BEHAVE_FORWARD_ANY,
   207		},
   208		[CGT_HCR_TRVM] = {
   209			.index		= HCR_EL2,
   210			.value		= HCR_TRVM,
   211			.mask		= HCR_TRVM,
   212			.behaviour	= BEHAVE_FORWARD_READ,
   213		},
   214		[CGT_HCR_TLOR] = {
   215			.index		= HCR_EL2,
   216			.value		= HCR_TLOR,
   217			.mask		= HCR_TLOR,
   218			.behaviour	= BEHAVE_FORWARD_ANY,
   219		},
   220		[CGT_HCR_TERR] = {
   221			.index		= HCR_EL2,
   222			.value		= HCR_TERR,
   223			.mask		= HCR_TERR,
   224			.behaviour	= BEHAVE_FORWARD_ANY,
   225		},
   226		[CGT_HCR_APK] = {
   227			.index		= HCR_EL2,
   228			.value		= 0,
   229			.mask		= HCR_APK,
   230			.behaviour	= BEHAVE_FORWARD_ANY,
   231		},
   232		[CGT_HCR_NV] = {
   233			.index		= HCR_EL2,
   234			.value		= HCR_NV,
   235			.mask		= HCR_NV,
   236			.behaviour	= BEHAVE_FORWARD_ANY,
   237		},
   238		[CGT_HCR_NV_nNV2] = {
   239			.index		= HCR_EL2,
   240			.value		= HCR_NV,
   241			.mask		= HCR_NV | HCR_NV2,
   242			.behaviour	= BEHAVE_FORWARD_ANY,
   243		},
   244		[CGT_HCR_NV1_nNV2] = {
   245			.index		= HCR_EL2,
   246			.value		= HCR_NV | HCR_NV1,
   247			.mask		= HCR_NV | HCR_NV1 | HCR_NV2,
   248			.behaviour	= BEHAVE_FORWARD_ANY,
   249		},
   250		[CGT_HCR_AT] = {
   251			.index		= HCR_EL2,
   252			.value		= HCR_AT,
   253			.mask		= HCR_AT,
   254			.behaviour	= BEHAVE_FORWARD_ANY,
   255		},
   256		[CGT_HCR_nFIEN] = {
   257			.index		= HCR_EL2,
   258			.value		= 0,
   259			.mask		= HCR_FIEN,
   260			.behaviour	= BEHAVE_FORWARD_ANY,
   261		},
   262		[CGT_HCR_TID4] = {
   263			.index		= HCR_EL2,
   264			.value 		= HCR_TID4,
   265			.mask		= HCR_TID4,
   266			.behaviour	= BEHAVE_FORWARD_ANY,
   267		},
   268		[CGT_HCR_TICAB] = {
   269			.index		= HCR_EL2,
   270			.value 		= HCR_TICAB,
   271			.mask		= HCR_TICAB,
   272			.behaviour	= BEHAVE_FORWARD_ANY,
   273		},
   274		[CGT_HCR_TOCU] = {
   275			.index		= HCR_EL2,
   276			.value 		= HCR_TOCU,
   277			.mask		= HCR_TOCU,
   278			.behaviour	= BEHAVE_FORWARD_ANY,
   279		},
   280		[CGT_HCR_ENSCXT] = {
   281			.index		= HCR_EL2,
   282			.value 		= 0,
   283			.mask		= HCR_ENSCXT,
   284			.behaviour	= BEHAVE_FORWARD_ANY,
   285		},
   286		[CGT_HCR_TTLBIS] = {
   287			.index		= HCR_EL2,
   288			.value		= HCR_TTLBIS,
   289			.mask		= HCR_TTLBIS,
   290			.behaviour	= BEHAVE_FORWARD_ANY,
   291		},
   292		[CGT_HCR_TTLBOS] = {
   293			.index		= HCR_EL2,
   294			.value		= HCR_TTLBOS,
   295			.mask		= HCR_TTLBOS,
   296			.behaviour	= BEHAVE_FORWARD_ANY,
   297		},
   298		[CGT_MDCR_TPMCR] = {
   299			.index		= MDCR_EL2,
   300			.value		= MDCR_EL2_TPMCR,
   301			.mask		= MDCR_EL2_TPMCR,
   302			.behaviour	= BEHAVE_FORWARD_ANY,
   303		},
   304		[CGT_MDCR_TPM] = {
   305			.index		= MDCR_EL2,
   306			.value		= MDCR_EL2_TPM,
   307			.mask		= MDCR_EL2_TPM,
   308			.behaviour	= BEHAVE_FORWARD_ANY,
   309		},
   310		[CGT_MDCR_TDE] = {
   311			.index		= MDCR_EL2,
   312			.value		= MDCR_EL2_TDE,
   313			.mask		= MDCR_EL2_TDE,
   314			.behaviour	= BEHAVE_FORWARD_ANY,
   315		},
   316		[CGT_MDCR_TDA] = {
   317			.index		= MDCR_EL2,
   318			.value		= MDCR_EL2_TDA,
   319			.mask		= MDCR_EL2_TDA,
   320			.behaviour	= BEHAVE_FORWARD_ANY,
   321		},
   322		[CGT_MDCR_TDOSA] = {
   323			.index		= MDCR_EL2,
   324			.value		= MDCR_EL2_TDOSA,
   325			.mask		= MDCR_EL2_TDOSA,
   326			.behaviour	= BEHAVE_FORWARD_ANY,
   327		},
   328		[CGT_MDCR_TDRA] = {
   329			.index		= MDCR_EL2,
   330			.value		= MDCR_EL2_TDRA,
   331			.mask		= MDCR_EL2_TDRA,
   332			.behaviour	= BEHAVE_FORWARD_ANY,
   333		},
   334		[CGT_MDCR_E2PB] = {
   335			.index		= MDCR_EL2,
   336			.value		= 0,
   337			.mask		= BIT(MDCR_EL2_E2PB_SHIFT),
   338			.behaviour	= BEHAVE_FORWARD_ANY,
   339		},
   340		[CGT_MDCR_TPMS] = {
   341			.index		= MDCR_EL2,
   342			.value		= MDCR_EL2_TPMS,
   343			.mask		= MDCR_EL2_TPMS,
   344			.behaviour	= BEHAVE_FORWARD_ANY,
   345		},
   346		[CGT_MDCR_TTRF] = {
   347			.index		= MDCR_EL2,
   348			.value		= MDCR_EL2_TTRF,
   349			.mask		= MDCR_EL2_TTRF,
   350			.behaviour	= BEHAVE_FORWARD_ANY,
   351		},
   352		[CGT_MDCR_E2TB] = {
   353			.index		= MDCR_EL2,
   354			.value		= 0,
   355			.mask		= BIT(MDCR_EL2_E2TB_SHIFT),
   356			.behaviour	= BEHAVE_FORWARD_ANY,
   357		},
   358		[CGT_MDCR_TDCC] = {
   359			.index		= MDCR_EL2,
   360			.value		= MDCR_EL2_TDCC,
   361			.mask		= MDCR_EL2_TDCC,
   362			.behaviour	= BEHAVE_FORWARD_ANY,
   363		},
   364		[CGT_CPACR_E0POE] = {
   365			.index		= CPTR_EL2,
   366			.value		= CPACR_ELx_E0POE,
   367			.mask		= CPACR_ELx_E0POE,
   368			.behaviour	= BEHAVE_FORWARD_ANY,
   369		},
   370		[CGT_CPTR_TAM] = {
   371			.index		= CPTR_EL2,
   372			.value		= CPTR_EL2_TAM,
   373			.mask		= CPTR_EL2_TAM,
   374			.behaviour	= BEHAVE_FORWARD_ANY,
   375		},
   376		[CGT_CPTR_TCPAC] = {
   377			.index		= CPTR_EL2,
   378			.value		= CPTR_EL2_TCPAC,
   379			.mask		= CPTR_EL2_TCPAC,
   380			.behaviour	= BEHAVE_FORWARD_ANY,
   381		},
   382		[CGT_HCRX_TCR2En] = {
   383			.index		= HCRX_EL2,
   384			.value 		= 0,
   385			.mask		= HCRX_EL2_TCR2En,
   386			.behaviour	= BEHAVE_FORWARD_ANY,
   387		},
   388		[CGT_ICH_HCR_TC] = {
   389			.index		= ICH_HCR_EL2,
   390			.value		= ICH_HCR_TC,
   391			.mask		= ICH_HCR_TC,
   392			.behaviour	= BEHAVE_FORWARD_ANY,
   393		},
 > 394		[CGT_ICH_HCR_TALL0] = {
   395			.index		= ICH_HCR_EL2,
   396			.value		= ICH_HCR_TALL0,
   397			.mask		= ICH_HCR_TALL0,
   398			.behaviour	= BEHAVE_FORWARD_ANY,
   399		},
   400		[CGT_ICH_HCR_TALL1] = {
   401			.index		= ICH_HCR_EL2,
   402			.value		= ICH_HCR_TALL1,
   403			.mask		= ICH_HCR_TALL1,
   404			.behaviour	= BEHAVE_FORWARD_ANY,
   405		},
   406		[CGT_ICH_HCR_TALL0] = {
   407			.index		= ICH_HCR_EL2,
   408			.value		= ICH_HCR_TALL0,
   409			.mask		= ICH_HCR_TALL0,
   410			.behaviour	= BEHAVE_FORWARD_ANY,
   411		},
   412		[CGT_ICH_HCR_TDIR] = {
   413			.index		= ICH_HCR_EL2,
   414			.value		= ICH_HCR_TDIR,
   415			.mask		= ICH_HCR_TDIR,
   416			.behaviour	= BEHAVE_FORWARD_ANY,
   417		},
   418	};
   419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
