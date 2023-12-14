Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF467D302
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQCIOn3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702542683; x=1734078683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6uZljv2bIkPW9EPL18TpWUX9ABoK9bO0kk+uCDQC0M=;
  b=hQCIOn3aovLLazeQ0yvSos3NsCgmXB5+lpPEuuTahbSjDtDG0PCgFV92
   HWnkC1fByRE9q8TP8A1UBX/COKEbdYkFas1O0DIKhOzSZ8xwm4tFJ8IPb
   jWU+qx/shyqAGFRLeFJTG7OLTaAd7Qxg+zD9Jet+QEdvMTGcX/MqmOAM9
   +ow6Wjnlo6q5mO7WZnH+7PYolCmzF5P26L+OKKpvBfwFJ9dN9XdqAhY42
   I8loeEWA5U1mFcVPpPOd8XaK2bLaawlq1wpcuUKTC59BdUSEI8kMK+975
   zRo3i23sy0Zv2TrEjn5WjT2Xfiep1xmgQGff6ukEvvuOI9Q7K/78d4Qoc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1918519"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="1918519"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 00:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="767537243"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="767537243"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2023 00:31:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDh7n-000LoT-1x;
	Thu, 14 Dec 2023 08:31:19 +0000
Date: Thu, 14 Dec 2023 16:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: drivers/cpufreq/armada-8k-cpufreq.c:53:40: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202312141651.lCAXGAZ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: f525a670533d961fd72ab748e3aac002d7b3d1b9 cpufreq: ap806: add cpufreq driver for Armada 8K
date:   4 years, 10 months ago
config: arm-randconfig-r131-20231117 (https://download.01.org/0day-ci/archive/20231214/202312141651.lCAXGAZ2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141651.lCAXGAZ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141651.lCAXGAZ2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpufreq/armada-8k-cpufreq.c:53:40: sparse: sparse: Using plain integer as NULL pointer
   drivers/cpufreq/armada-8k-cpufreq.c:155:40: sparse: sparse: Using plain integer as NULL pointer

vim +53 drivers/cpufreq/armada-8k-cpufreq.c

    36	
    37	/* If the CPUs share the same clock, then they are in the same cluster. */
    38	static void __init armada_8k_get_sharing_cpus(struct clk *cur_clk,
    39						      struct cpumask *cpumask)
    40	{
    41		int cpu;
    42	
    43		for_each_possible_cpu(cpu) {
    44			struct device *cpu_dev;
    45			struct clk *clk;
    46	
    47			cpu_dev = get_cpu_device(cpu);
    48			if (!cpu_dev) {
    49				pr_warn("Failed to get cpu%d device\n", cpu);
    50				continue;
    51			}
    52	
  > 53			clk = clk_get(cpu_dev, 0);
    54			if (IS_ERR(clk)) {
    55				pr_warn("Cannot get clock for CPU %d\n", cpu);
    56			} else {
    57				if (clk_is_match(clk, cur_clk))
    58					cpumask_set_cpu(cpu, cpumask);
    59	
    60				clk_put(clk);
    61			}
    62		}
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
