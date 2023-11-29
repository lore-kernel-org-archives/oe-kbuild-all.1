Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A54339BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 23:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1wG6Kbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701299590; x=1732835590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B3Pmc/bJMfGydSsp7HHeLKgvHx1bcl85MNeuryNu+hM=;
  b=P1wG6KbulwOdIz/FUVm9G0h3uM/4qe42w8nleEwMk6n7pwcpssNo0tLN
   zExunojmgsFp7HCrI9i8b3tHWNJLhrCF/9nZ4TZp65wF9hNDwwHZ5ldA6
   FLcBDRMpc8ysbKMVltPNUCAoweFHGF3ZZT+gGRHzRjB0ZHkp8w7C73I1m
   TyyCU+Vzb7RlGth0tWgP/UK+yvNRSqcw5ORiMB24VyD5liQN58T5W5b2M
   817jpq5GC5n34DzhTYzpllReB2FqLt+sY66fbSCOMbFhTjfIqyVF5icz9
   V6V6bHowVBUTHOGPcvyZ3ME2PVt1TZQ+13I99oF3maJ0tYnfEYxfYlPsx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14796276"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="14796276"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 15:13:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798085320"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798085320"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Nov 2023 15:13:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Tjs-000146-3B;
	Wed, 29 Nov 2023 23:13:04 +0000
Date: Thu, 30 Nov 2023 07:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Haoran Liu <liuhaoran14@163.com>, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, broonie@kernel.org,
	linux-kernel@vger.kernel.org, Haoran Liu <liuhaoran14@163.com>
Subject: Re: [PATCH] [regulator] pwm-regulator: Add error handling
Message-ID: <202311300304.BQV0GwDE-lkp@intel.com>
References: <20231129130530.33744-1-liuhaoran14@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129130530.33744-1-liuhaoran14@163.com>

Hi Haoran,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.7-rc3]
[also build test ERROR on linus/master next-20231129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haoran-Liu/pwm-regulator-Add-error-handling/20231129-210930
base:   v6.7-rc3
patch link:    https://lore.kernel.org/r/20231129130530.33744-1-liuhaoran14%40163.com
patch subject: [PATCH] [regulator] pwm-regulator: Add error handling
config: i386-randconfig-r081-20231130 (https://download.01.org/0day-ci/archive/20231130/202311300304.BQV0GwDE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300304.BQV0GwDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300304.BQV0GwDE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/pwm-regulator.c:299:2: error: use of undeclared identifier 'ret'
           ret = of_property_read_u32_array(pdev->dev.of_node,
           ^
   drivers/regulator/pwm-regulator.c:302:6: error: use of undeclared identifier 'ret'
           if (ret) {
               ^
   drivers/regulator/pwm-regulator.c:304:48: error: use of undeclared identifier 'ret'
                           "Failed to read pwm-dutycycle-range: %d\n", ret);
                                                                       ^
   drivers/regulator/pwm-regulator.c:305:10: error: use of undeclared identifier 'ret'
                   return ret;
                          ^
   drivers/regulator/pwm-regulator.c:308:2: error: use of undeclared identifier 'ret'
           ret = of_property_read_u32(pdev->dev.of_node,
           ^
   drivers/regulator/pwm-regulator.c:311:6: error: use of undeclared identifier 'ret'
           if (ret) {
               ^
   drivers/regulator/pwm-regulator.c:313:47: error: use of undeclared identifier 'ret'
                           "Failed to read pwm-dutycycle-unit: %d\n", ret);
                                                                      ^
   drivers/regulator/pwm-regulator.c:314:10: error: use of undeclared identifier 'ret'
                   return ret;
                          ^
   8 errors generated.


vim +/ret +299 drivers/regulator/pwm-regulator.c

   289	
   290	static int pwm_regulator_init_continuous(struct platform_device *pdev,
   291						 struct pwm_regulator_data *drvdata)
   292	{
   293		u32 dutycycle_range[2] = { 0, 100 };
   294		u32 dutycycle_unit = 100;
   295	
   296		drvdata->desc.ops = &pwm_regulator_voltage_continuous_ops;
   297		drvdata->desc.continuous_voltage_range = true;
   298	
 > 299		ret = of_property_read_u32_array(pdev->dev.of_node,
   300						"pwm-dutycycle-range",
   301						dutycycle_range, 2);
   302		if (ret) {
   303			dev_err(&pdev->dev,
   304				"Failed to read pwm-dutycycle-range: %d\n", ret);
   305			return ret;
   306		}
   307	
   308		ret = of_property_read_u32(pdev->dev.of_node,
   309						"pwm-dutycycle-unit",
   310						&dutycycle_unit);
   311		if (ret) {
   312			dev_err(&pdev->dev,
   313				"Failed to read pwm-dutycycle-unit: %d\n", ret);
   314			return ret;
   315		}
   316	
   317		if (dutycycle_range[0] > dutycycle_unit ||
   318		    dutycycle_range[1] > dutycycle_unit)
   319			return -EINVAL;
   320	
   321		drvdata->continuous.dutycycle_unit = dutycycle_unit;
   322		drvdata->continuous.min_uV_dutycycle = dutycycle_range[0];
   323		drvdata->continuous.max_uV_dutycycle = dutycycle_range[1];
   324	
   325		return 0;
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
