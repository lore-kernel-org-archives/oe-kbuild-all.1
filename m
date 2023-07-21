Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051891EA8F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689969622; x=1721505622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EULYI47kAKSHpXGlSyxpmEjrKrOH62PR2W8+zfO2fW4=;
  b=hj52a/WJ63zzEtR5XCTxUvY0Ig6JejvDX062SiFOJ0qdCw8FlpIDLnIs
   OJ7tyVCebxny3Vl0Qed1mar/o/xdtHNKxXaE4M+BBmIWRyKaXb8IQlf0I
   jnQxSpdM1mqfkHAZ47E9iSgZU3WAFq7cxgCpMgIoXwCtmkPew8jVIbEzx
   icqAq57JxzkStLjlr6ToE2ADyferzRj+0jS2zXvdLjZEmakEfECEtDkNF
   DXhYEvatd7PvzsmIz61eAgzI6v48r/9s4UvCNR5QdSQrOA3b9BE9FLxkx
   VF7jMpNpXqGgPP7WkdHpi/0m3UPkXqzwaazT2lX2XbROjlep+VyODDh4r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347400006"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="347400006"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 13:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795071769"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="795071769"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 13:00:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMwIQ-0007bb-2t;
	Fri, 21 Jul 2023 20:00:14 +0000
Date: Sat, 22 Jul 2023 03:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RESEND v2 6/7] regulator: mt6358: Add output voltage fine
 tuning to variable LDOs
Message-ID: <202307220323.u5S1K3OZ-lkp@intel.com>
References: <20230721082903.2038975-7-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721082903.2038975-7-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on lee-mfd/for-mfd-next lee-leds/for-leds-next linus/master v6.5-rc2 next-20230721]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/mfd-mt6358-Add-missing-registers-for-LDO-voltage-calibration/20230721-163236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20230721082903.2038975-7-wenst%40chromium.org
patch subject: [PATCH RESEND v2 6/7] regulator: mt6358: Add output voltage fine tuning to variable LDOs
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230722/202307220323.u5S1K3OZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220323.u5S1K3OZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220323.u5S1K3OZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:492:9: note: in expansion of macro 'MT6358_LDO'
     492 |         MT6358_LDO("ldo_vdram2", VDRAM2, vdram2,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:494:9: note: in expansion of macro 'MT6358_LDO'
     494 |         MT6358_LDO("ldo_vsim1", VSIM1, vsim,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:496:9: note: in expansion of macro 'MT6358_LDO'
     496 |         MT6358_LDO("ldo_vibr", VIBR, vibr,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:498:9: note: in expansion of macro 'MT6358_LDO'
     498 |         MT6358_LDO("ldo_vusb", VUSB, vusb,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:500:9: note: in expansion of macro 'MT6358_LDO'
     500 |         MT6358_LDO("ldo_vcamd", VCAMD, vcamd,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:502:9: note: in expansion of macro 'MT6358_LDO'
     502 |         MT6358_LDO("ldo_vefuse", VEFUSE, vefuse,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:504:9: note: in expansion of macro 'MT6358_LDO'
     504 |         MT6358_LDO("ldo_vmch", VMCH, vmch_vemc,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:506:9: note: in expansion of macro 'MT6358_LDO'
     506 |         MT6358_LDO("ldo_vcama1", VCAMA1, vcama,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:508:9: note: in expansion of macro 'MT6358_LDO'
     508 |         MT6358_LDO("ldo_vemc", VEMC, vmch_vemc,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:510:9: note: in expansion of macro 'MT6358_LDO'
     510 |         MT6358_LDO("ldo_vcn33", VCN33, vcn33,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:512:9: note: in expansion of macro 'MT6358_LDO'
     512 |         MT6358_LDO("ldo_vcama2", VCAMA2, vcama,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:514:9: note: in expansion of macro 'MT6358_LDO'
     514 |         MT6358_LDO("ldo_vmc", VMC, vmc,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:516:9: note: in expansion of macro 'MT6358_LDO'
     516 |         MT6358_LDO("ldo_vldo28", VLDO28, vldo28,
         |         ^~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:76:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
      76 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:519:9: note: in expansion of macro 'MT6358_LDO'
     519 |         MT6358_LDO("ldo_vsim2", VSIM2, vsim,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:568:9: note: in expansion of macro 'MT6366_LDO'
     568 |         MT6366_LDO("ldo_vdram2", VDRAM2, vdram2,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:570:9: note: in expansion of macro 'MT6366_LDO'
     570 |         MT6366_LDO("ldo_vsim1", VSIM1, vsim,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:572:9: note: in expansion of macro 'MT6366_LDO'
     572 |         MT6366_LDO("ldo_vibr", VIBR, vibr,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:574:9: note: in expansion of macro 'MT6366_LDO'
     574 |         MT6366_LDO("ldo_vusb", VUSB, vusb,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:576:9: note: in expansion of macro 'MT6366_LDO'
     576 |         MT6366_LDO("ldo_vefuse", VEFUSE, vefuse,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:578:9: note: in expansion of macro 'MT6366_LDO'
     578 |         MT6366_LDO("ldo_vmch", VMCH, vmch_vemc,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:580:9: note: in expansion of macro 'MT6366_LDO'
     580 |         MT6366_LDO("ldo_vemc", VEMC, vmch_vemc,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:582:9: note: in expansion of macro 'MT6366_LDO'
     582 |         MT6366_LDO("ldo_vcn33", VCN33, vcn33,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:584:9: note: in expansion of macro 'MT6366_LDO'
     584 |         MT6366_LDO("ldo_vmc", VMC, vmc,
         |         ^~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:175:18: error: 'struct regulator_desc' has no member named 'linear_range_selectors_bitfield'; did you mean 'linear_range_selectors'?
     175 |                 .linear_range_selectors_bitfield = volt_ranges##_selectors,     \
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6358-regulator.c:586:9: note: in expansion of macro 'MT6366_LDO'
     586 |         MT6366_LDO("ldo_vsim2", VSIM2, vsim,
         |         ^~~~~~~~~~


vim +76 drivers/regulator/mt6358-regulator.c

    64	
    65	#define MT6358_LDO(match, vreg, volt_ranges, enreg, enbit, vosel, vosel_mask) \
    66	[MT6358_ID_##vreg] = {	\
    67		.desc = {	\
    68			.name = #vreg,	\
    69			.of_match = of_match_ptr(match),	\
    70			.ops = &mt6358_volt_table_ops,	\
    71			.type = REGULATOR_VOLTAGE,	\
    72			.id = MT6358_ID_##vreg,	\
    73			.owner = THIS_MODULE,	\
    74			.n_voltages = ARRAY_SIZE(volt_ranges##_ranges) * 11,	\
    75			.linear_ranges = volt_ranges##_ranges,		\
  > 76			.linear_range_selectors_bitfield = volt_ranges##_selectors,	\
    77			.n_linear_ranges = ARRAY_SIZE(volt_ranges##_ranges),	\
    78			.vsel_range_reg = vosel,	\
    79			.vsel_range_mask = vosel_mask,	\
    80			.vsel_reg = MT6358_##vreg##_ANA_CON0,	\
    81			.vsel_mask = GENMASK(3, 0),	\
    82			.enable_reg = enreg,	\
    83			.enable_mask = BIT(enbit),	\
    84		},	\
    85		.status_reg = MT6358_LDO_##vreg##_CON1,	\
    86		.qi = BIT(15),	\
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
