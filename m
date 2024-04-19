Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF078286
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713519410; cv=none; b=oFCjPfkuSrU3HkuY9wTMr/TzhSWHgcOeqZbi60/bockRLeJ731bhg5oHAJvpJxjphHS8qNW2n7KRIHNKeh6fSJHFz0XSyi86IcMFvawy6d8jQyL+VcdlxNfCYrg3cYcY1do2j0mEni5jCAHr0tWJypoM9OjS5ePmWZN0jMroTHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713519410; c=relaxed/simple;
	bh=Oqux3eWGUQz8795ks2he7D7B+8787ipKovkLsxz/KZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Og3PGbdRDWNRa6ArVCz0ipSHw3OW9v+C8Hj9TOMdLLKRUQkaV5OvdkM4193c3jrMabgxiSvMyXoekQKgmHpLJCrP1UbCT+4LwC7HIIl0pfEEUqhibc38c3uLC8VH9rZkEB/06eZFdK5d7NwljCNdCe6XIADnzz/ct3Jk9eWXJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMlf66PS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMlf66PS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713519409; x=1745055409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oqux3eWGUQz8795ks2he7D7B+8787ipKovkLsxz/KZ4=;
  b=FMlf66PS8+T8L8XzLfVsOO5QJnsvGE2gaZZzyS4ZiI/O8MCj7WwludkA
   paGfZ4Rbf92xjKeB6i+b7ceHaCDnbXWVgEdEsGaiiWbO1VvwvQBlZmWru
   ryeczTEgMEy0GLiZEZvX2bv1SDYxrpF4hDDH5pOxN8tXfSvmprHDl3ZPq
   weDOLzpZyK+pimeEeB1Uu5SNm+gWOMAlJaiXnMGws8A6RlVA0xwJ+Gpa8
   etTABGL4yZojP/TcpMr9djGD5tt6tDDtFR4FpvjQWuDRbW8A/7upn70Ev
   lt9AJ/NZugUatI3RmIpG89DEJHGEdiEL87EagWN5Dhdu7xm4bhwdTytlf
   g==;
X-CSE-ConnectionGUID: Ve3y2GIQTDeB3dJWtept6A==
X-CSE-MsgGUID: 4AHobq2kTyau/kPklkzbBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8949351"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8949351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 02:36:41 -0700
X-CSE-ConnectionGUID: ydUZA0HNRy6BMA5emOM8Jg==
X-CSE-MsgGUID: UuaO3lLPQ6CfPHYnTHzmJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23261123"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Apr 2024 02:36:40 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxkfd-0009vo-1u;
	Fri, 19 Apr 2024 09:36:37 +0000
Date: Fri, 19 Apr 2024 17:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [vireshk-pm:cpufreq/arm/linux-next 6/10]
 drivers/cpufreq/sun50i-cpufreq-nvmem.c:128:44: warning: '%d' directive
 output may be truncated writing between 1 and 10 bytes into a region of size
 2
Message-ID: <202404191715.LDwMm2gP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next
head:   09d0aaa0ae9c80ff9569393b206226c1008801b1
commit: 6cc4bcceff9af0e6be9738096d95e4ba75e75123 [6/10] cpufreq: sun50i: Refactor speed bin decoding
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240419/202404191715.LDwMm2gP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404191715.LDwMm2gP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404191715.LDwMm2gP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/sun50i-cpufreq-nvmem.c: In function 'sun50i_cpufreq_nvmem_probe':
>> drivers/cpufreq/sun50i-cpufreq-nvmem.c:128:44: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
     128 |         snprintf(name, MAX_NAME_LEN, "speed%d", speed);
         |                                            ^~
   drivers/cpufreq/sun50i-cpufreq-nvmem.c:128:38: note: directive argument in the range [0, 2147483647]
     128 |         snprintf(name, MAX_NAME_LEN, "speed%d", speed);
         |                                      ^~~~~~~~~
   drivers/cpufreq/sun50i-cpufreq-nvmem.c:128:9: note: 'snprintf' output between 7 and 16 bytes into a destination of size 7
     128 |         snprintf(name, MAX_NAME_LEN, "speed%d", speed);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +128 drivers/cpufreq/sun50i-cpufreq-nvmem.c

f328584f7bff86 Yangtao Li        2019-06-12  108  
f328584f7bff86 Yangtao Li        2019-06-12  109  static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
f328584f7bff86 Yangtao Li        2019-06-12  110  {
298098e55a6fcc Viresh Kumar      2022-05-26  111  	int *opp_tokens;
f328584f7bff86 Yangtao Li        2019-06-12  112  	char name[MAX_NAME_LEN];
f328584f7bff86 Yangtao Li        2019-06-12  113  	unsigned int cpu;
6cc4bcceff9af0 Brandon Cheo Fusi 2024-04-18  114  	int speed;
f328584f7bff86 Yangtao Li        2019-06-12  115  	int ret;
f328584f7bff86 Yangtao Li        2019-06-12  116  
298098e55a6fcc Viresh Kumar      2022-05-26  117  	opp_tokens = kcalloc(num_possible_cpus(), sizeof(*opp_tokens),
f328584f7bff86 Yangtao Li        2019-06-12  118  			     GFP_KERNEL);
298098e55a6fcc Viresh Kumar      2022-05-26  119  	if (!opp_tokens)
f328584f7bff86 Yangtao Li        2019-06-12  120  		return -ENOMEM;
f328584f7bff86 Yangtao Li        2019-06-12  121  
6cc4bcceff9af0 Brandon Cheo Fusi 2024-04-18  122  	speed = sun50i_cpufreq_get_efuse();
6cc4bcceff9af0 Brandon Cheo Fusi 2024-04-18  123  	if (speed < 0) {
298098e55a6fcc Viresh Kumar      2022-05-26  124  		kfree(opp_tokens);
6cc4bcceff9af0 Brandon Cheo Fusi 2024-04-18  125  		return speed;
1aa24a8f3b5133 Xiaobing Luo      2022-04-23  126  	}
f328584f7bff86 Yangtao Li        2019-06-12  127  
f328584f7bff86 Yangtao Li        2019-06-12 @128  	snprintf(name, MAX_NAME_LEN, "speed%d", speed);
f328584f7bff86 Yangtao Li        2019-06-12  129  
f328584f7bff86 Yangtao Li        2019-06-12  130  	for_each_possible_cpu(cpu) {
f328584f7bff86 Yangtao Li        2019-06-12  131  		struct device *cpu_dev = get_cpu_device(cpu);
f328584f7bff86 Yangtao Li        2019-06-12  132  
f328584f7bff86 Yangtao Li        2019-06-12  133  		if (!cpu_dev) {
f328584f7bff86 Yangtao Li        2019-06-12  134  			ret = -ENODEV;
f328584f7bff86 Yangtao Li        2019-06-12  135  			goto free_opp;
f328584f7bff86 Yangtao Li        2019-06-12  136  		}
f328584f7bff86 Yangtao Li        2019-06-12  137  
298098e55a6fcc Viresh Kumar      2022-05-26  138  		opp_tokens[cpu] = dev_pm_opp_set_prop_name(cpu_dev, name);
298098e55a6fcc Viresh Kumar      2022-05-26  139  		if (opp_tokens[cpu] < 0) {
298098e55a6fcc Viresh Kumar      2022-05-26  140  			ret = opp_tokens[cpu];
f328584f7bff86 Yangtao Li        2019-06-12  141  			pr_err("Failed to set prop name\n");
f328584f7bff86 Yangtao Li        2019-06-12  142  			goto free_opp;
f328584f7bff86 Yangtao Li        2019-06-12  143  		}
f328584f7bff86 Yangtao Li        2019-06-12  144  	}
f328584f7bff86 Yangtao Li        2019-06-12  145  
f328584f7bff86 Yangtao Li        2019-06-12  146  	cpufreq_dt_pdev = platform_device_register_simple("cpufreq-dt", -1,
f328584f7bff86 Yangtao Li        2019-06-12  147  							  NULL, 0);
f328584f7bff86 Yangtao Li        2019-06-12  148  	if (!IS_ERR(cpufreq_dt_pdev)) {
298098e55a6fcc Viresh Kumar      2022-05-26  149  		platform_set_drvdata(pdev, opp_tokens);
f328584f7bff86 Yangtao Li        2019-06-12  150  		return 0;
f328584f7bff86 Yangtao Li        2019-06-12  151  	}
f328584f7bff86 Yangtao Li        2019-06-12  152  
f328584f7bff86 Yangtao Li        2019-06-12  153  	ret = PTR_ERR(cpufreq_dt_pdev);
f328584f7bff86 Yangtao Li        2019-06-12  154  	pr_err("Failed to register platform device\n");
f328584f7bff86 Yangtao Li        2019-06-12  155  
f328584f7bff86 Yangtao Li        2019-06-12  156  free_opp:
298098e55a6fcc Viresh Kumar      2022-05-26  157  	for_each_possible_cpu(cpu)
298098e55a6fcc Viresh Kumar      2022-05-26  158  		dev_pm_opp_put_prop_name(opp_tokens[cpu]);
298098e55a6fcc Viresh Kumar      2022-05-26  159  	kfree(opp_tokens);
f328584f7bff86 Yangtao Li        2019-06-12  160  
f328584f7bff86 Yangtao Li        2019-06-12  161  	return ret;
f328584f7bff86 Yangtao Li        2019-06-12  162  }
f328584f7bff86 Yangtao Li        2019-06-12  163  

:::::: The code at line 128 was first introduced by commit
:::::: f328584f7bff86858249bb358f1adcecde48388a cpufreq: Add sun50i nvmem based CPU scaling driver

:::::: TO: Yangtao Li <tiny.windzz@gmail.com>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
