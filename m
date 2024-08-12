Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B61193092
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723494340; cv=none; b=oFMacmRfuoOyNJkWbqrFps07XSKKdtVPmrDvMEBidCp7O9mYht+5bR4nb+Dwpj7Vcl9agc1Uu6IVSRW3MI5yjT52hnIT20KVKQZ/3NJaY5uKjcuRkNFakxSC9k4adHhF7TwHSCuoNdeUYAO47Raj8mfhCEdNBVrlbV2GP8aQJ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723494340; c=relaxed/simple;
	bh=jN9wnNczQ9GMZEEKhewppiaItX6FtzTVk26GlChufhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCCht7swiMtrCO2MNlEcbjL4HS3ktLbb3Z9ugd75InRQfMRzNsHnUOzzRGQssWpLUVT9G5ey9zJd+QBnhyFbDDfjNVuAd7eYknI1FIe8/cbsQy1v0PX+di3XRp0KHTGNMiNcygeSpdYwGbQxNz+ntTc+uHDaglL93qouX8ozXZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAVqugmU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAVqugmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723494339; x=1755030339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jN9wnNczQ9GMZEEKhewppiaItX6FtzTVk26GlChufhk=;
  b=QAVqugmUwomhMT6WZf9WxmKY3bo4a0hzeeDxojcfczYXGssSMTiy1543
   9GkEovlxJb3qgMz/UKrGk4udrMsDglOD94Md2MPYqhhP3rtgwkEbcR1mL
   C5nvm5DoxTgL4G4GV6YynYPIghhX0mVJ577KB4TQYPTJspYQtVBFlJM83
   EBppQ6+mXghe5FqPARiDZYdyHe2OzSCvOLvVmZTV/Lj1bHC6XqKsz6pF0
   rZJ0a5SMhROrREPf/0r7HdZmnrXzNr2ByTB6Y3Ohbcd4lF+SP9crGbUE4
   Yt/k8hqzhLd1GUuxUATX+SsdzRmi0IHFgLsVfT/lxKOtt42smaQwqBmOi
   A==;
X-CSE-ConnectionGUID: aQgQxwZyT/Cgp4qO951Nww==
X-CSE-MsgGUID: ijnjad3SSzSZDmftXMXoOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21272554"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="21272554"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 13:25:38 -0700
X-CSE-ConnectionGUID: boTyfTxQTY6gD+Pl+O1ixg==
X-CSE-MsgGUID: pxSpLirDRFOhdkJFReh7Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="58042333"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2024 13:25:35 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdbbd-000C9r-2F;
	Mon, 12 Aug 2024 20:25:30 +0000
Date: Tue, 13 Aug 2024 04:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	fabrice.gasnier@foss.st.com,
	Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH 3/5] phy: stm32: Add support for STM32MP25 COMBOPHY.
Message-ID: <202408130447.IzvuJERR-lkp@intel.com>
References: <20240812120529.3564390-4-christian.bruel@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812120529.3564390-4-christian.bruel@foss.st.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on robh/for-next linus/master v6.11-rc3 next-20240812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/MAINTAINERS-add-entry-for-ST-STM32MP25-COMBOPHY-driver/20240812-201003
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20240812120529.3564390-4-christian.bruel%40foss.st.com
patch subject: [PATCH 3/5] phy: stm32: Add support for STM32MP25 COMBOPHY.
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240813/202408130447.IzvuJERR-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130447.IzvuJERR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130447.IzvuJERR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/st/phy-stm32-combophy.c: In function 'stm32_impedance_tune':
>> drivers/phy/st/phy-stm32-combophy.c:134:36: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     134 |                                    FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
         |                                    ^~~~~~~~~~
>> drivers/phy/st/phy-stm32-combophy.c:137:26: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     137 |                 imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
         |                          ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +134 drivers/phy/st/phy-stm32-combophy.c

   107	
   108	static int stm32_impedance_tune(struct stm32_combophy *combophy)
   109	{
   110		u8 imp_size = ARRAY_SIZE(imp_lookup);
   111		u8 vswing_size = ARRAY_SIZE(imp_lookup[0].vswing);
   112		u8 imp_of, vswing_of;
   113		u32 max_imp = imp_lookup[0].microohm;
   114		u32 min_imp = imp_lookup[imp_size - 1].microohm;
   115		u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
   116		u32 min_vswing = imp_lookup[0].vswing[0];
   117		u32 val;
   118	
   119		if (!of_property_read_u32(combophy->dev->of_node, "st,output-micro-ohms", &val)) {
   120			if (val < min_imp || val > max_imp) {
   121				dev_err(combophy->dev, "Invalid value %u for output ohm\n", val);
   122				return -EINVAL;
   123			}
   124	
   125			for (imp_of = 0 ; imp_of < ARRAY_SIZE(imp_lookup); imp_of++)
   126				if (imp_lookup[imp_of].microohm <= val)
   127					break;
   128	
   129			dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
   130				imp_lookup[imp_of].microohm);
   131	
   132			regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
   133					   STM32MP25_PCIEPRG_IMPCTRL_OHM,
 > 134					   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
   135		} else {
   136			regmap_read(combophy->regmap, SYSCFG_PCIEPRGCR, &val);
 > 137			imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
   138		}
   139	
   140		if (!of_property_read_u32(combophy->dev->of_node, "st,output-vswing-microvolt", &val)) {
   141			if (val < min_vswing || val > max_vswing) {
   142				dev_err(combophy->dev, "Invalid value %u for output vswing\n", val);
   143				return -EINVAL;
   144			}
   145	
   146			for (vswing_of = 0 ; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++)
   147				if (imp_lookup[imp_of].vswing[vswing_of] >= val)
   148					break;
   149	
   150			dev_dbg(combophy->dev, "Set %u microvolt swing\n",
   151				 imp_lookup[imp_of].vswing[vswing_of]);
   152	
   153			regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
   154					   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
   155					   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
   156		}
   157	
   158		return 0;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
