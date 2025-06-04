Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D11C70813
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 20:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749069996; cv=none; b=OOwrG9uUwfXWpiOkrz9SLv4koKzvLqVlGBSzIiw0cGO6HxoYqgXK2j9P1k+a7wVcHzhvm+NQsR1YCJ4E4Tej+7N6+nUdWWBNpwCAO4vjYzh5fUrrx7kjBg68Ev5lu3nnwIKBQzzGuYvMS2Yjkw790OfCtb+la89amzEULdUW6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749069996; c=relaxed/simple;
	bh=fmZagnfXTPRZnR+Zkz4LGkBCzu2OndqzJ/tkr0LQDQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbbEDS7SeBlqvIv9AD+7SsuijDOVDJaPPMK7WiM+9Uheeq53o1XK0VXoAgTu+GPq9cr7TBXzBu55B0sZV2NuVDOluBcqDfy+mffPZUqD7Gwoxkt0xGlvl07pg5iLejWriDLPTF8Zn2TeQXX+nTLUinOlLMovPkKoCdZFBFRNwXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsv3u9MT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsv3u9MT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749069994; x=1780605994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fmZagnfXTPRZnR+Zkz4LGkBCzu2OndqzJ/tkr0LQDQg=;
  b=gsv3u9MTVD5dYIfwi9ytfkZG5oudcOklL2PdB+Mny0oYL8EHgX8DRO9Q
   /NRmu9/F+nDis1dJr50BhBgO+tyJBaNRFxdJkcYki4UpfJieK612dA0l4
   8nWAxxHBTxwqhe8h16QQ1kbueW/mWegphgjQmH+ZQxLHCo3BmfE49d2nu
   Ep8sUEG6OLtlz8NeKc8PbFGcxJg0Ct5sbDGE71x6uQEs5/z+rMva06O6y
   3MCXTL6/Si4XI2Y+WuacxRMs5lHN9t8if07FqbmoDQLXL1yuKxbDP0yGk
   KheOmNL9E1ykGvH09usvytYxxaSslsvGkqIkj5Ruf8yW4mN5/iY9YWKzR
   A==;
X-CSE-ConnectionGUID: hIaXmc9iTguOM1JnRQEJIA==
X-CSE-MsgGUID: ZNr7okhFQkOwxfSE1lE6aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61789424"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="61789424"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 13:46:34 -0700
X-CSE-ConnectionGUID: 8Zj1OPGsSD2jjgjRN3Y1Nw==
X-CSE-MsgGUID: T9bkNO/0Rr2fCtr7Lv31OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="176175879"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2025 13:46:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMv0I-0003Sl-2C;
	Wed, 04 Jun 2025 20:46:30 +0000
Date: Thu, 5 Jun 2025 04:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cbeznea:for-mainline/SSGRLPCSRC-2694/pm-domain-issue-v3 14/25]
 drivers/thermal/renesas/rzg3s_thermal.c:233:24: warning: unused variable
 'dev'
Message-ID: <202506050453.f3LtK54c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/claudiubeznea/linux.git for-mainline/SSGRLPCSRC-2694/pm-domain-issue-v3
head:   113f0fb8fac8c74f0a0733efec43494f92fad91b
commit: ab76207e3056f357d9111ddcb42074223510165f [14/25] drop devres
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250605/202506050453.f3LtK54c-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050453.f3LtK54c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050453.f3LtK54c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/renesas/rzg3s_thermal.c: In function 'rzg3s_thermal_probe':
>> drivers/thermal/renesas/rzg3s_thermal.c:233:24: warning: unused variable 'dev' [-Wunused-variable]
     233 |         struct device *dev = &pdev->dev;
         |                        ^~~


vim +/dev +233 drivers/thermal/renesas/rzg3s_thermal.c

f29878cde3b657 Claudiu Beznea 2025-03-24  230  
f29878cde3b657 Claudiu Beznea 2025-03-24  231  static int rzg3s_thermal_probe(struct platform_device *pdev)
f29878cde3b657 Claudiu Beznea 2025-03-24  232  {
f29878cde3b657 Claudiu Beznea 2025-03-24 @233  	struct device *dev = &pdev->dev;
f29878cde3b657 Claudiu Beznea 2025-03-24  234  	int ret;
f29878cde3b657 Claudiu Beznea 2025-03-24  235  
f29878cde3b657 Claudiu Beznea 2025-03-24  236  	/*
f29878cde3b657 Claudiu Beznea 2025-03-24  237  	 * Open a devres group to allow using devm_pm_runtime_enable()
f29878cde3b657 Claudiu Beznea 2025-03-24  238  	 * w/o interfeering with dev_pm_genpd_detach() in the platform bus
f29878cde3b657 Claudiu Beznea 2025-03-24  239  	 * remove. Otherwise, durring repeated unbind/bind operations,
f29878cde3b657 Claudiu Beznea 2025-03-24  240  	 * the TSU may be runtime resumed when it is not part of its power
f29878cde3b657 Claudiu Beznea 2025-03-24  241  	 * domain, leading to accessing TSU registers (through
f29878cde3b657 Claudiu Beznea 2025-03-24  242  	 * rzg3s_thermal_change_mode()) without its clocks being enabled
f29878cde3b657 Claudiu Beznea 2025-03-24  243  	 * and its PM domain being turned on.
f29878cde3b657 Claudiu Beznea 2025-03-24  244  	 */
ab76207e3056f3 Claudiu Beznea 2025-05-26  245  	ret = rzg3s_thermal_probe_helper(pdev);
f29878cde3b657 Claudiu Beznea 2025-03-24  246  
f29878cde3b657 Claudiu Beznea 2025-03-24  247  	return ret;
f29878cde3b657 Claudiu Beznea 2025-03-24  248  }
f29878cde3b657 Claudiu Beznea 2025-03-24  249  

:::::: The code at line 233 was first introduced by commit
:::::: f29878cde3b6574d5264a47038d00618a1daf96d thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC

:::::: TO: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
:::::: CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
