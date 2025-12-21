Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9714978F2B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766306084; cv=none; b=E3/nzX2AXp7w7DaPS/+UJjBiFdlbXlz+O3WD57Ph/VzVoWfbysNRWJMsQLl/506KopqmOriYXcxJWQFmPcNGNwRz8RtMq/g5De3MJ1k/CIIFeWAaAQkKxlDAbgeUTfQTJIdxBKPahOOX9+ry7gBCbURIKJ8kGE42rmHkxX1jtQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766306084; c=relaxed/simple;
	bh=3OioRMcArPhc0ygXAre+38pQvJUlLoXvBvRQPNVG+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VlJpwJhGuY1/KdjN/eIGOaQFKcE43ueN97VIfeAyue4Xyz2anAWlfBuAF58oCfQ5HXuPo2A5GxrRDDHpNEgi5yVw8Ad81iutQT8XpZLICIkX8IoJfYzzM5x/H8ltesd+VbRVsYwrljYNuztnSqumlfLBYft35yh+Ki8zJbZ7h14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QV34KsS4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QV34KsS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766306081; x=1797842081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OioRMcArPhc0ygXAre+38pQvJUlLoXvBvRQPNVG+p8=;
  b=QV34KsS4bVhW4ryg/QmpA9bMh4m+GbhMdQq+INx5OlrGjoEYkqY1cRy/
   JVzzry60267R41y0dvE171ZrJmf3Wtf6G1JJfh+bdk/vDhD4FxbUeLVgZ
   IrIseSsATtw6FQmm7csBnl1NkPETPDq0bAChkS7vP8p/VqLz0E0b5a4KW
   Lo1bQafK4AI5Ryg3A5cMZ7zltY+SC4/yramv8zh+fY2nKond6jSdrSOJG
   2OLUXRc+yEboK86IN2krFhuuKgVCEaARNyKzSpK1MlXRRpZkeiwnp2SNg
   QVhD9MgoA+QfgyKqCFjmcN3hQMTsoFDypRIDs1abjnNSIYiPJShZnimxS
   w==;
X-CSE-ConnectionGUID: T6LeQ/QaROGf5YlIJ+h6fA==
X-CSE-MsgGUID: 7F8Wgq+RT1aQ+x2cuvUSGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70771765"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70771765"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 00:34:04 -0800
X-CSE-ConnectionGUID: 1H3Pc3k5TJ6gQW+PvegNhw==
X-CSE-MsgGUID: rhxaIruVTxm1NO0zLH9ssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198395198"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 00:34:03 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXEt6-000000005T3-3Fl2;
	Sun, 21 Dec 2025 08:34:00 +0000
Date: Sun, 21 Dec 2025 16:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 7/14] drivers/pinctrl/pinconf-generic.c:392:1: error:
 version control conflict marker in file
Message-ID: <202512211613.nnkZGVuI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a8805fb8a49841ef67f240537e28ed40ce539661
commit: 596864db6236b48f63f554719d00841b8c5ff80c [7/14] pinctrl: pinconf-generic: perform basic checks on pincfg properties
config: i386-buildonly-randconfig-001-20251221 (https://download.01.org/0day-ci/archive/20251221/202512211613.nnkZGVuI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211613.nnkZGVuI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211613.nnkZGVuI-lkp@intel.com/

Note: the conor/pinctrl HEAD a8805fb8a49841ef67f240537e28ed40ce539661 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   drivers/pinctrl/pinconf-generic.c: In function 'parse_dt_cfg':
   drivers/pinctrl/pinconf-generic.c:226:16: warning: variable 'test' set but not used [-Wunused-but-set-variable]
     226 |         int i, test;
         |                ^~~~
   drivers/pinctrl/pinconf-generic.c: In function 'pinconf_generic_parse_dt_config':
>> drivers/pinctrl/pinconf-generic.c:392:1: error: version control conflict marker in file
     392 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/pinctrl/pinconf-generic.c:395:1: error: version control conflict marker in file
     395 | =======
         | ^~~~~~~
>> drivers/pinctrl/pinconf-generic.c:407:45: error: expected statement before ')' token
     407 |                 pctldev->desc->custom_params)
         |                                             ^
   drivers/pinctrl/pinconf-generic.c:412:1: error: version control conflict marker in file
     412 | =======
         | ^~~~~~~
   drivers/pinctrl/pinconf-generic.c: At top level:
>> drivers/pinctrl/pinconf-generic.c:419:9: warning: data definition has no type or storage class
     419 |         ret = 0;
         |         ^~~
>> drivers/pinctrl/pinconf-generic.c:419:9: error: type defaults to 'int' in declaration of 'ret' [-Wimplicit-int]
   drivers/pinctrl/pinconf-generic.c:420:1: error: version control conflict marker in file
     420 | >>>>>>> e296cfc3eca6 (pinctrl: pinconf-generic: perform basic checks on pincfg properties)
         | ^~~~~~~
   drivers/pinctrl/pinconf-generic.c:433:9: warning: data definition has no type or storage class
     433 |         *configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
         |         ^
>> drivers/pinctrl/pinconf-generic.c:433:10: error: type defaults to 'int' in declaration of 'configs' [-Wimplicit-int]
     433 |         *configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
         |          ^~~~~~~
   In file included from include/linux/percpu.h:5,
                    from arch/x86/include/asm/msr.h:16,
                    from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/debugfs.h:15,
                    from drivers/pinctrl/pinconf-generic.c:14:
>> include/linux/alloc_tag.h:263:1: error: braced-group within expression allowed only inside a function
     263 | ({                                                                      \
         | ^
   include/linux/fortify-string.h:767:25: note: in expansion of macro 'alloc_hooks'
     767 | #define kmemdup(...)    alloc_hooks(kmemdup_noprof(__VA_ARGS__))
         |                         ^~~~~~~~~~~
   drivers/pinctrl/pinconf-generic.c:433:20: note: in expansion of macro 'kmemdup'
     433 |         *configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
         |                    ^~~~~~~
>> drivers/pinctrl/pinconf-generic.c:434:9: error: expected identifier or '(' before 'if'
     434 |         if (!*configs) {
         |         ^~
   drivers/pinctrl/pinconf-generic.c:439:9: warning: data definition has no type or storage class
     439 |         *nconfigs = ncfg;
         |         ^
>> drivers/pinctrl/pinconf-generic.c:439:10: error: type defaults to 'int' in declaration of 'nconfigs' [-Wimplicit-int]
     439 |         *nconfigs = ncfg;
         |          ^~~~~~~~
>> drivers/pinctrl/pinconf-generic.c:439:21: error: 'ncfg' undeclared here (not in a function)
     439 |         *nconfigs = ncfg;
         |                     ^~~~
>> drivers/pinctrl/pinconf-generic.c:441:4: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
     441 | out:
         |    ^
>> drivers/pinctrl/pinconf-generic.c:443:9: error: expected identifier or '(' before 'return'
     443 |         return ret;
         |         ^~~~~~
>> drivers/pinctrl/pinconf-generic.c:444:1: error: expected identifier or '(' before '}' token
     444 | }
         | ^
   drivers/pinctrl/pinconf-generic.c: In function 'pinconf_generic_parse_dt_config':
>> drivers/pinctrl/pinconf-generic.c:417:9: warning: control reaches end of non-void function [-Wreturn-type]
     417 |         }
         |         ^


vim +392 drivers/pinctrl/pinconf-generic.c

   359	
   360	/**
   361	 * pinconf_generic_parse_dt_config()
   362	 * parse the config properties into generic pinconfig values.
   363	 * @np: node containing the pinconfig properties
   364	 * @pctldev: pincontrol device
   365	 * @configs: array with nconfigs entries containing the generic pinconf values
   366	 *           must be freed when no longer necessary.
   367	 * @nconfigs: number of configurations
   368	 */
   369	int pinconf_generic_parse_dt_config(struct device_node *np,
   370					    struct pinctrl_dev *pctldev,
   371					    unsigned long **configs,
   372					    unsigned int *nconfigs)
   373	{
   374		unsigned long *cfg;
   375		unsigned int max_cfg, ncfg = 0;
   376		int ret;
   377	
   378		if (!np)
   379			return -EINVAL;
   380	
   381		/* allocate a temporary array big enough to hold one of each option */
   382		max_cfg = ARRAY_SIZE(dt_params);
   383		if (pctldev)
   384			max_cfg += pctldev->desc->num_custom_params;
   385		cfg = kcalloc(max_cfg, sizeof(*cfg), GFP_KERNEL);
   386		if (!cfg)
   387			return -ENOMEM;
   388	
   389		ret = parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
   390		if (ret)
   391			return ret;
 > 392	<<<<<<< HEAD
   393	||||||| parent of e296cfc3eca6 (pinctrl: pinconf-generic: perform basic checks on pincfg properties)
   394		parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
   395	=======
   396	
   397	>>>>>>> e296cfc3eca6 (pinctrl: pinconf-generic: perform basic checks on pincfg properties)
   398		if (pctldev && pctldev->desc->num_custom_params &&
   399			pctldev->desc->custom_params) {
   400	<<<<<<< HEAD
   401			ret = parse_dt_cfg(np, pctldev->desc->custom_params,
   402					   pctldev->desc->num_custom_params, cfg, &ncfg);
   403			if (ret)
   404				return ret;
   405		}
   406	||||||| parent of e296cfc3eca6 (pinctrl: pinconf-generic: perform basic checks on pincfg properties)
 > 407			pctldev->desc->custom_params)
   408			parse_dt_cfg(np, pctldev->desc->custom_params,
   409				     pctldev->desc->num_custom_params, cfg, &ncfg);
   410	
   411		ret = 0;
   412	=======
   413			parse_dt_cfg(np, pctldev->desc->custom_params,
   414				     pctldev->desc->num_custom_params, cfg, &ncfg);
   415			if (ret)
   416				return ret;
 > 417		}
   418	
 > 419		ret = 0;
   420	>>>>>>> e296cfc3eca6 (pinctrl: pinconf-generic: perform basic checks on pincfg properties)
   421	
   422		/* no configs found at all */
   423		if (ncfg == 0) {
   424			*configs = NULL;
   425			*nconfigs = 0;
   426			goto out;
   427		}
   428	
   429		/*
   430		 * Now limit the number of configs to the real number of
   431		 * found properties.
   432		 */
 > 433		*configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
 > 434		if (!*configs) {
   435			ret = -ENOMEM;
   436			goto out;
   437		}
   438	
 > 439		*nconfigs = ncfg;
   440	
 > 441	out:
   442		kfree(cfg);
 > 443		return ret;
 > 444	}
   445	EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
