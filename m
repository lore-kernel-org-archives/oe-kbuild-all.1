Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D1A1A3165
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 02:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761185014; cv=none; b=tVaF+VIxOws5sv8Np8PJGTPVTZ0vARg/Kl9gaKpCQWCAS+hz8M8984nrYBftLBVBD+qVRmEJYe+osgrWkyRDqjk410N4PbgVFnGhdOql9Oc6gh2f3bRJphuf6xtHlbinnaDABt0YikeqLIGKNT1kcSV1k7nHrxGrnOh9B5wwV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761185014; c=relaxed/simple;
	bh=II/ZdmUJAzGxv3QWKqJsX3UBm0ANX86R16zcAqswtp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9HTVqeejpdBNStM/UJevcRHyED0Waoc0Pdu/cbjB6xHUSnahUYh4nEQZchtsi9+h511v/vM/x41AqxkAL71ty296P7nYObF9Oman9muRiRgsvhz35K5EPpHR8UHhvCZX7mOk0MpDpz2J0Jtmz+dHMA/+ueNmjaNPnvHdJQJGy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5d4LORr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5d4LORr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761185009; x=1792721009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=II/ZdmUJAzGxv3QWKqJsX3UBm0ANX86R16zcAqswtp0=;
  b=Q5d4LORrBu1g3srYOsxM2f88VV/qA2t7Rv/cVWU8uJNPqV+eDW/bDuSe
   gVFF1jZgos4PIEwpzOEuZthg3hoCh8e3fvP3YBpF250z8tcvvxkXalR9m
   UIQpHATIDCE+4UMdgky1reWOtUhjHqchSUwxHhKEx8x1s6CMlM4xSE3j8
   sssyjVcP3Dk9B+0yC3fccedXq1e8rW5LBgTk8dV/L4xvIMiOwVhwyKNES
   gIOGswpCPonb+SE38f00ZcmUzPTd2vrarCSGno+/RR/DxSZNRjTtwQ/As
   K1Xg56V22hUPLw/+lJKXm63+fZMUdXQaHd5QBPhwEFHIZmHvoQG+9RWiE
   g==;
X-CSE-ConnectionGUID: FTsn6w80QCKCxIfQA0cLiw==
X-CSE-MsgGUID: fPAMrwO1QmGAkg7GdS5NYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73950822"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="73950822"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:03:28 -0700
X-CSE-ConnectionGUID: 4N7oplQ1RIy9OOBPvJvjpQ==
X-CSE-MsgGUID: Ps9BDcO6Tf2jplnBrjoDwA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2025 19:03:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkfj-000Cv5-0Z;
	Thu, 23 Oct 2025 02:03:23 +0000
Date: Thu, 23 Oct 2025 10:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: muhammed.efecetin.67@gmail.com, linux-rockchip@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de, neil.armstrong@linaro.org, lee@kernel.org,
	rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v3 3/5] mfd: add Khadas Edge 2 registers to khadas-mcu.
Message-ID: <202510230921.N0ezsPtO-lkp@intel.com>
References: <adbd6dd5e9ed938bab7927597b7f21eca3274b78.1761059314.git.efectn@protonmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adbd6dd5e9ed938bab7927597b7f21eca3274b78.1761059314.git.efectn@protonmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes rockchip/for-next rafael-pm/thermal linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/muhammed-efecetin-67-gmail-com/dt-bindings-mfd-khadas-mcu-add-new-compatible-for-Khadas-Edge-2/20251021-232554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/adbd6dd5e9ed938bab7927597b7f21eca3274b78.1761059314.git.efectn%40protonmail.com
patch subject: [PATCH v3 3/5] mfd: add Khadas Edge 2 registers to khadas-mcu.
config: x86_64-buildonly-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230921.N0ezsPtO-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230921.N0ezsPtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230921.N0ezsPtO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/khadas-mcu.c:103:35: warning: 'khadas_mcu_regmap_config_edge2' defined but not used [-Wunused-const-variable=]
     103 | static const struct regmap_config khadas_mcu_regmap_config_edge2 = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/khadas-mcu.c:93:35: warning: 'khadas_mcu_regmap_config' defined but not used [-Wunused-const-variable=]
      93 | static const struct regmap_config khadas_mcu_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/khadas_mcu_regmap_config_edge2 +103 drivers/mfd/khadas-mcu.c

    92	
  > 93	static const struct regmap_config khadas_mcu_regmap_config = {
    94		.reg_bits	= 8,
    95		.reg_stride	= 1,
    96		.val_bits	= 8,
    97		.max_register	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
    98		.volatile_reg	= khadas_mcu_reg_volatile,
    99		.writeable_reg	= khadas_mcu_reg_writeable,
   100		.cache_type	= REGCACHE_MAPLE,
   101	};
   102	
 > 103	static const struct regmap_config khadas_mcu_regmap_config_edge2 = {
   104		.reg_bits	= 8,
   105		.reg_stride	= 1,
   106		.val_bits	= 8,
   107		.max_register	= KHADAS_MCU_EDGE2_SYS_RST_REG,
   108		.volatile_reg	= khadas_mcu_reg_volatile_edge2,
   109		.writeable_reg	= khadas_mcu_reg_writeable_edge2,
   110		.cache_type	= REGCACHE_MAPLE,
   111	};
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
