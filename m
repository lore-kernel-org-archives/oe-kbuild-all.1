Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884881632DD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760042626; cv=none; b=GdjSqKjJgYx6W2bxQxJvuZk+nj4Jm8b9dEbNJbCETmyJIaiaoMRcw6MGXc4z1Escgnry2UzRE1RJViQ3oFLBOynezFdvAUl54i2W9oHsVvH6S4ICDq/tXJ5NSm56thrOfe9J7p7lyx0zlwuntTh00Mxz6Q5J7LpFRFLj/oWoak4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760042626; c=relaxed/simple;
	bh=UoRCzekOBK9CpgNikFXsaYmzJ90uZP0B+r5KVbeCPQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXqIcO3gU19QWMcgBuyevh36gZuwX3n3dnKQ/DUiJSKkrIgYL8S9YvN+hcAY45QGdOuO/6bgldrrjpi1hWMqVVlQyDodE4K+ZUb0ANgdfq7BIj7HQG/WH4AJq9vob1FY2brYe93AZYh4qer/fC/Emy1Bx0YUssdwvFAp7cMNVDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmqpL5C0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmqpL5C0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760042624; x=1791578624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UoRCzekOBK9CpgNikFXsaYmzJ90uZP0B+r5KVbeCPQ0=;
  b=SmqpL5C0PM/CcT2dc27mOx2up8lxzM9tXpZwHWA3rIAVCA7bZQ/NRxtP
   wFHTNDPrqnfmE6SOMuelx8BM6OrbS7s3ZU9gBKu6Q0199CTlO2fFPNyYV
   AWlseJkqOaeKaq4r7Gb6tqF0hBCqcecNVeHg7pLDFbV8eva3MQ7/WOYel
   Hf5ku+Cq1NwmR07uRc+FXCUQlMJIZd4ZOY2YrzN176SXDqhuWAEP0d70v
   d77o2RMzSKDICU4OEPDLjhwyoZBSGrW60xEoIxlSJm4wTg0PwecM6N/1h
   QU4fJI6iyDIqxJlnySPbfgP6YZnWmVcT2+pA7tJZ6I/fBYJAQjV9zVT7o
   Q==;
X-CSE-ConnectionGUID: eTjs8/BeR8CL5IvObZ5RgQ==
X-CSE-MsgGUID: IsYXrDt5Syin63cFtmlXjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73695547"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73695547"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 13:43:44 -0700
X-CSE-ConnectionGUID: RRINsefFQI6jFo6DaoNveg==
X-CSE-MsgGUID: Lj0DZX8aRiS0rxJNRpq95w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="180494612"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2025 13:43:43 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6xUD-0001Op-0R;
	Thu, 09 Oct 2025 20:43:41 +0000
Date: Fri, 10 Oct 2025 04:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 15/19] drivers/pinctrl/pinctrl-mpfs-mssio.c:550:7:
 warning: this statement may fall through
Message-ID: <202510100407.cZLHTyrj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   e31f6372b59b1cc2257a3c1490c3a3a81eac36df
commit: c82e77be5131a42923803354cc669aa899216f0d [15/19] pinctrl: add polarfire soc mssio pinctrl driver
config: riscv-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100407.cZLHTyrj-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100407.cZLHTyrj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100407.cZLHTyrj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-mpfs-mssio.c: In function 'mpfs_pinctrl_pinconf_generate_config':
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:550:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
     550 |    if (!arg)
         |       ^
   drivers/pinctrl/pinctrl-mpfs-mssio.c:552:3: note: here
     552 |   case PIN_CONFIG_INPUT_SCHMITT:
         |   ^~~~


vim +550 drivers/pinctrl/pinctrl-mpfs-mssio.c

   509	
   510	static int mpfs_pinctrl_pinconf_generate_config(struct mpfs_pinctrl *pctrl, unsigned int pin,
   511							unsigned long *configs, unsigned int num_configs,
   512							u32 *value)
   513	{
   514		u32 val = 0;
   515	
   516		for (int i = 0; i < num_configs; i++) {
   517			int param, tmp;
   518			u32 arg;
   519			//TODO bank_voltage;
   520	
   521			param = pinconf_to_config_param(configs[i]);
   522			arg = pinconf_to_config_argument(configs[i]);
   523	
   524			switch (param) {
   525			case PIN_CONFIG_BIAS_BUS_HOLD:
   526				val |= MPFS_PINCTRL_PULL_MASK;
   527				break;
   528			case PIN_CONFIG_BIAS_PULL_DOWN:
   529				//TODO always starting from val == 0, there's no reason to ever actually
   530				// clear anything AFAICT. @Linus, does the driver need to check mutual
   531				// exclusion on these?
   532				val &= ~MPFS_PINCTRL_PULL_MASK;
   533				val |= MPFS_PINCTRL_WPD;
   534				break;
   535			case PIN_CONFIG_BIAS_PULL_UP:
   536				val &= ~MPFS_PINCTRL_PULL_MASK;
   537				val |= MPFS_PINCTRL_WPU;
   538				break;
   539			case PIN_CONFIG_BIAS_DISABLE:
   540				val &= ~MPFS_PINCTRL_PULL_MASK;
   541				break;
   542			case PIN_CONFIG_DRIVE_STRENGTH:
   543				tmp = mpfs_pinctrl_get_drive_strength_val(arg);
   544				if (tmp < 0)
   545					return tmp;
   546	
   547				val |= FIELD_PREP(MPFS_PINCTRL_DRV_MASK, tmp);
   548				break;
   549			case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 > 550				if (!arg)
   551					break;
   552			case PIN_CONFIG_INPUT_SCHMITT:
   553			case PIN_CONFIG_INPUT_SCHMITT_UV:
   554				//TODO Is it enabled regardless of register setting, or must it
   555				// be set for lower voltage IO? Docs are missing, MSS Configurator
   556				// is not clear. Leaning towards the latter.
   557				//bank_voltage = mpfs_pinctrl_pin_to_bank_voltage(pctrl, pin);
   558				//if (bank_voltage < MPFS_PINCTRL_LVCMOS25 && !arg) {
   559				//	dev_err(pctrl->dev,
   560				//		"schmitt always enabled for 1.2, 1.5 and 1.8 volt io\n");
   561				//	return -EINVAL;
   562				//}
   563				val |= MPFS_PINCTRL_ENHYST;
   564				break;
   565			case PIN_CONFIG_PERSIST_STATE:
   566				val |= MPFS_PINCTRL_LP_PERSIST_EN;
   567				break;
   568			case PIN_CONFIG_MODE_LOW_POWER:
   569				if (arg)
   570					val |= MPFS_PINCTRL_LP_BYPASS_EN;
   571				break;
   572			//TODO @Linus, do I have to document these custom controls other than in the binding?
   573			case MPFS_PINCTRL_CLAMP_DIODE:
   574				val |= MPFS_PINCTRL_CLAMP;
   575				break;
   576			case MPFS_PINCTRL_LOCKDOWN:
   577				val &= MPFS_PINCTRL_LOCKDN;
   578				break;
   579			case MPFS_PINCTRL_IBUFMD:
   580				val |= FIELD_PREP(MPFS_PINCTRL_IBUFMD_MASK, arg);
   581				break;
   582			default:
   583				dev_err(pctrl->dev, "config %u not supported\n", param);
   584				return -ENOTSUPP;
   585			}
   586		}
   587	
   588		*value = val;
   589		return 0;
   590	}
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
