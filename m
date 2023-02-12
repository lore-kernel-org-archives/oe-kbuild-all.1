Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3F4A3C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676227972; x=1707763972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0jGGL4VFkcu75kKk18NEY6dQ2B2y89DipLUFRw0064c=;
  b=KroHBFho8mCDhiSByK957NPyEXaX/tbbhc05BhbeTpTG87yYIhy6rQ04
   lms3lEpnAbBxu8pPbO3gcPnBRHKvclXjsLg7B1+/9vDobl9DPuKpSK3VC
   aMG9fliKwIZEfYyH49/dejb26jZsypeCEO10QKVi1dEoCj0P4vZeftiCd
   7HBQoeNezRaLBE13vUdZhG4aEtPmqmg4kWS6CtumBSl6HibAPfWXhD7x7
   GTYVpEwN2/MlCZzhUN6tofRcVPud4oOad/tYwFemYTo66/wBC07AAXI6q
   QIPET8p6Oc/buAweNhd2KsC0+L7OD1aEUvblXCL1MH7EmVIsNukND/U4J
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="358154392"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="358154392"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 10:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="661946326"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="661946326"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Feb 2023 10:52:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRHSz-0007M9-2y;
	Sun, 12 Feb 2023 18:52:49 +0000
Date: Mon, 13 Feb 2023 02:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 18/56]
 drivers/cpufreq/qcom-cpufreq-hw.c:564:17: error: label 'error' used but not
 defined
Message-ID: <202302130257.GBMGLhmX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   7b7e8f94c11499de89119bad8f16b0803b8e5f16
commit: e9743cde78816e6ee903f7599c2184dd2fd897bc [18/56] cpufreq: qcom-hw: Allocate qcom_cpufreq_data during probe
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230213/202302130257.GBMGLhmX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=e9743cde78816e6ee903f7599c2184dd2fd897bc
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.1
        git checkout e9743cde78816e6ee903f7599c2184dd2fd897bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130257.GBMGLhmX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/qcom-cpufreq-hw.c: In function 'qcom_cpufreq_hw_cpu_init':
>> drivers/cpufreq/qcom-cpufreq-hw.c:564:17: error: label 'error' used but not defined
     564 |                 goto error;
         |                 ^~~~


vim +/error +564 drivers/cpufreq/qcom-cpufreq-hw.c

275157b367f479 Thara Gopinath        2021-08-09  519  
2849dd8bc72b62 Taniya Das            2018-12-14  520  static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
2849dd8bc72b62 Taniya Das            2018-12-14  521  {
bd74e286b35413 Manivannan Sadhasivam 2020-09-08  522  	struct platform_device *pdev = cpufreq_get_driver_data();
bd74e286b35413 Manivannan Sadhasivam 2020-09-08  523  	struct device *dev = &pdev->dev;
2849dd8bc72b62 Taniya Das            2018-12-14  524  	struct of_phandle_args args;
2849dd8bc72b62 Taniya Das            2018-12-14  525  	struct device_node *cpu_np;
55538fbc79e926 Taniya Das            2019-01-31  526  	struct device *cpu_dev;
dcd1fd724c19fe Manivannan Sadhasivam 2020-09-15  527  	struct qcom_cpufreq_data *data;
2849dd8bc72b62 Taniya Das            2018-12-14  528  	int ret, index;
2849dd8bc72b62 Taniya Das            2018-12-14  529  
55538fbc79e926 Taniya Das            2019-01-31  530  	cpu_dev = get_cpu_device(policy->cpu);
55538fbc79e926 Taniya Das            2019-01-31  531  	if (!cpu_dev) {
55538fbc79e926 Taniya Das            2019-01-31  532  		pr_err("%s: failed to get cpu%d device\n", __func__,
55538fbc79e926 Taniya Das            2019-01-31  533  		       policy->cpu);
55538fbc79e926 Taniya Das            2019-01-31  534  		return -ENODEV;
55538fbc79e926 Taniya Das            2019-01-31  535  	}
55538fbc79e926 Taniya Das            2019-01-31  536  
2849dd8bc72b62 Taniya Das            2018-12-14  537  	cpu_np = of_cpu_device_node_get(policy->cpu);
2849dd8bc72b62 Taniya Das            2018-12-14  538  	if (!cpu_np)
2849dd8bc72b62 Taniya Das            2018-12-14  539  		return -EINVAL;
2849dd8bc72b62 Taniya Das            2018-12-14  540  
2849dd8bc72b62 Taniya Das            2018-12-14  541  	ret = of_parse_phandle_with_args(cpu_np, "qcom,freq-domain",
2849dd8bc72b62 Taniya Das            2018-12-14  542  					 "#freq-domain-cells", 0, &args);
2849dd8bc72b62 Taniya Das            2018-12-14  543  	of_node_put(cpu_np);
2849dd8bc72b62 Taniya Das            2018-12-14  544  	if (ret)
2849dd8bc72b62 Taniya Das            2018-12-14  545  		return ret;
2849dd8bc72b62 Taniya Das            2018-12-14  546  
2849dd8bc72b62 Taniya Das            2018-12-14  547  	index = args.args[0];
dcd1fd724c19fe Manivannan Sadhasivam 2020-09-15  548  	data->soc_data = of_device_get_match_data(&pdev->dev);
e9743cde78816e Manivannan Sadhasivam 2022-11-02  549  	data = &qcom_cpufreq.data[index];
2849dd8bc72b62 Taniya Das            2018-12-14  550  
2849dd8bc72b62 Taniya Das            2018-12-14  551  	/* HW should be in enabled state to proceed */
e9743cde78816e Manivannan Sadhasivam 2022-11-02  552  	if (!(readl_relaxed(data->base + data->soc_data->reg_enable) & 0x1)) {
2849dd8bc72b62 Taniya Das            2018-12-14  553  		dev_err(dev, "Domain-%d cpufreq hardware not enabled\n", index);
e9743cde78816e Manivannan Sadhasivam 2022-11-02  554  		return -ENODEV;
2849dd8bc72b62 Taniya Das            2018-12-14  555  	}
2849dd8bc72b62 Taniya Das            2018-12-14  556  
e9743cde78816e Manivannan Sadhasivam 2022-11-02  557  	if (readl_relaxed(data->base + data->soc_data->reg_dcvs_ctrl) & 0x1)
c377d4ba86e913 Bjorn Andersson       2022-02-09  558  		data->per_core_dcvs = true;
c377d4ba86e913 Bjorn Andersson       2022-02-09  559  
2849dd8bc72b62 Taniya Das            2018-12-14  560  	qcom_get_related_cpus(index, policy->cpus);
b48cd0d12f8e3b Yury Norov            2022-01-23  561  	if (cpumask_empty(policy->cpus)) {
2849dd8bc72b62 Taniya Das            2018-12-14  562  		dev_err(dev, "Domain-%d failed to get related CPUs\n", index);
2849dd8bc72b62 Taniya Das            2018-12-14  563  		ret = -ENOENT;
2849dd8bc72b62 Taniya Das            2018-12-14 @564  		goto error;
2849dd8bc72b62 Taniya Das            2018-12-14  565  	}
2849dd8bc72b62 Taniya Das            2018-12-14  566  
dcd1fd724c19fe Manivannan Sadhasivam 2020-09-15  567  	policy->driver_data = data;
f0712ace7fe072 Taniya Das            2021-08-23  568  	policy->dvfs_possible_from_any_cpu = true;
2849dd8bc72b62 Taniya Das            2018-12-14  569  
dcd1fd724c19fe Manivannan Sadhasivam 2020-09-15  570  	ret = qcom_cpufreq_hw_read_lut(cpu_dev, policy);
2849dd8bc72b62 Taniya Das            2018-12-14  571  	if (ret) {
2849dd8bc72b62 Taniya Das            2018-12-14  572  		dev_err(dev, "Domain-%d failed to read LUT\n", index);
e9743cde78816e Manivannan Sadhasivam 2022-11-02  573  		return ret;
2849dd8bc72b62 Taniya Das            2018-12-14  574  	}
2849dd8bc72b62 Taniya Das            2018-12-14  575  
55538fbc79e926 Taniya Das            2019-01-31  576  	ret = dev_pm_opp_get_opp_count(cpu_dev);
55538fbc79e926 Taniya Das            2019-01-31  577  	if (ret <= 0) {
55538fbc79e926 Taniya Das            2019-01-31  578  		dev_err(cpu_dev, "Failed to add OPPs\n");
e9743cde78816e Manivannan Sadhasivam 2022-11-02  579  		return -ENODEV;
55538fbc79e926 Taniya Das            2019-01-31  580  	}
55538fbc79e926 Taniya Das            2019-01-31  581  
266991721c15f9 Shawn Guo             2021-01-13  582  	if (policy_has_boost_freq(policy)) {
266991721c15f9 Shawn Guo             2021-01-13  583  		ret = cpufreq_enable_boost_support();
266991721c15f9 Shawn Guo             2021-01-13  584  		if (ret)
266991721c15f9 Shawn Guo             2021-01-13  585  			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
266991721c15f9 Shawn Guo             2021-01-13  586  	}
266991721c15f9 Shawn Guo             2021-01-13  587  
e9743cde78816e Manivannan Sadhasivam 2022-11-02  588  	return qcom_cpufreq_hw_lmh_init(policy, index);
2849dd8bc72b62 Taniya Das            2018-12-14  589  }
2849dd8bc72b62 Taniya Das            2018-12-14  590  

:::::: The code at line 564 was first introduced by commit
:::::: 2849dd8bc72b62a315854863c84c523176bd55ce cpufreq: qcom-hw: Add support for QCOM cpufreq HW driver

:::::: TO: Taniya Das <tdas@codeaurora.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
