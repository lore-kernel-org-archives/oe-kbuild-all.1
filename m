Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DAB246762
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 05:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791003928; cv=none; b=beaDkGEGVNtdcLfykoYHZ0qixX0oLmMDyE1w1/ML8RsQI8myRJmOR8hkSRY4op32Wuo4jqJrv00VgGjp8k6PfWD6huu2or8dDyaaYu8gXr8vTYEvT2u6ms7Jp2ghXOaknI6bDsez9ebo/9o9GOpGo9E/PmqcZ4S5ULQUnFdCD5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791003928; c=relaxed/simple;
	bh=6ekWxCc7p0ixxvV84BiNKj+n2VEg1WuWKCqZ2ss1GZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b4mJGUecbMtAnqWoThuuytxvuGo+3SxyMEI1yVSCQH4dsBAzui2SXxk1StaFqX3DpCqtNcLJsTfj3CTOqq6NvUcM5afaN0wqmXsn+1oTrl04+IsU7/Yhq37pFT9qjAorwbKNgwGk0bL9TWX5KY5F9OwFgqnVWvp2QQaTrvE6eac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNGplz6X; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNGplz6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791003927; x=1822539927;
  h=date:from:to:cc:subject:message-id;
  bh=6ekWxCc7p0ixxvV84BiNKj+n2VEg1WuWKCqZ2ss1GZE=;
  b=ZNGplz6XsihZArk/cu6wlsnRNJDfaXlM9X8BvI/Re6Lw0bwoRqFT3Xzf
   ZBxA0Lni3cVmdFrLLTlaRwW9btxKV2mdGGZ2N9FP9g4L4ByYbYQx7E2D6
   bNQmpL3QWzo7TFd2MnDUG0lM4HzpUsOEKlpBmCDbrrEwTWtgid5F5RzBA
   KS2G+i3BSl9qv2HPxcv7VVCCMMi+oIKtmgHo+urmxyfhDQ1bzk8T7nhDn
   dougyhvfKtkTWqf8X+q2j52CkZ58hl5/prN/VwHk1uiNZONAkycvDVFUx
   McE9igBiO1XJZ0FqsuUW5LezCdZ9GiUy0QPpjS6rAK9QEceVeaxk8vC8s
   g==;
X-CSE-ConnectionGUID: j3l9uS+NThu8ukGFuMjI9A==
X-CSE-MsgGUID: uFQRIj8bTemfnOzJ4wO+zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90662844"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90662844"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 22:05:26 -0700
X-CSE-ConnectionGUID: L4T6VXPpRbGCDl9DhRujJA==
X-CSE-MsgGUID: r2VvvmuhQoCEmrfCgTcf2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="314395563"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 Oct 2026 22:05:25 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCrw2-000000000wp-3STq;
	Sat, 03 Oct 2026 05:05:22 +0000
Date: Sat, 03 Oct 2026 07:05:18 +0200
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/pinctrl/berlin/berlin.c:271:31: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202610030734.aALYYeQ9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dt-bindings-serial-snps-dw-apb-uart-Add-Synaptics-sl261x-uart/20260929-141358
head:   66f26b6f0baa133e1c8c3a8afb0ef81b5001f027
commit: 36ba973f7fdc2baf760334dffccba25c685c8e89 pinctrl: berlin: add optional pinconf support
date:   4 days ago
config: xtensa-randconfig-r2105-20261003 (https://download.01.org/0day-ci/archive/20261003/202610030734.aALYYeQ9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030734.aALYYeQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610030734.aALYYeQ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/berlin/berlin.c: In function 'berlin_pinconf_group_get':
>> drivers/pinctrl/berlin/berlin.c:271:31: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     271 |                         val = FIELD_GET(PINCFG_DS_10BIT, val);
         |                               ^~~~~~~~~


vim +/FIELD_GET +271 drivers/pinctrl/berlin/berlin.c

   217	
   218	static int berlin_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
   219					    unsigned int group, unsigned long *configs)
   220	{
   221		enum pin_config_param param = pinconf_to_config_param(*configs);
   222		struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
   223		const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
   224		bool enabled;
   225		u32 val;
   226		int ret;
   227		u8 conf_bits = group_desc->conf_bits;
   228	
   229		if (!conf_bits)
   230			return -EOPNOTSUPP;
   231	
   232		ret = regmap_read(pctrl->regmap, group_desc->conf_offset, &val);
   233		if (ret)
   234			return ret;
   235	
   236		switch (param) {
   237		case PIN_CONFIG_BIAS_DISABLE:
   238			if (conf_bits == 10)
   239				enabled = !(val & PINCFG_PE_10BIT);
   240			else
   241				enabled = !(val & (PINCFG_PD_8BIT | PINCFG_PU_8BIT));
   242			val = 0;
   243			break;
   244		case PIN_CONFIG_BIAS_PULL_DOWN:
   245			if (conf_bits == 10)
   246				enabled = (val & (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) == PINCFG_PE_10BIT;
   247			else
   248				enabled = val & PINCFG_PD_8BIT;
   249			val = enabled ? 1 : 0;
   250			break;
   251		case PIN_CONFIG_BIAS_PULL_UP:
   252			if (conf_bits == 10) {
   253				if ((val & (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) == (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) {
   254					enabled = true;
   255					if (val & PINCFG_SPU_10BIT)
   256						val = 2;
   257					else
   258						val = 1;
   259				} else {
   260					enabled = false;
   261					val = 0;
   262				}
   263			} else {
   264				enabled = val & PINCFG_PU_8BIT;
   265				val = enabled ? 1 : 0;
   266			}
   267			break;
   268		case PIN_CONFIG_DRIVE_STRENGTH:
   269			enabled = true;
   270			if (conf_bits == 10)
 > 271				val = FIELD_GET(PINCFG_DS_10BIT, val);
   272			else
   273				val = FIELD_GET(PINCFG_DS_8BIT, val);
   274			break;
   275		case PIN_CONFIG_INPUT_ENABLE:
   276			if (conf_bits == 10)
   277				enabled = val & PINCFG_IE_10BIT;
   278			else
   279				enabled = val & PINCFG_IE_8BIT;
   280			val = enabled ? 1 : 0;
   281			break;
   282		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
   283			if (conf_bits == 10)
   284				enabled = val & PINCFG_ST_10BIT;
   285			else
   286				enabled = val & PINCFG_ST_8BIT;
   287			val = enabled ? 1 : 0;
   288			break;
   289		case PIN_CONFIG_SLEW_RATE:
   290			if (conf_bits == 10)
   291				enabled = val & PINCFG_SL_10BIT;
   292			else
   293				enabled = val & PINCFG_SL_8BIT;
   294			val = enabled ? 1 : 0;
   295			break;
   296		default:
   297			return -EOPNOTSUPP;
   298		}
   299	
   300		*configs = pinconf_to_config_packed(param, val);
   301		return enabled ? 0 : -EINVAL;
   302	}
   303	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
