Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84021C123
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVik5345"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308473; x=1729844473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+MMaJD/uFuZDtjo4XI6Y72JQRGgvkRpHzO6wXyOGNlk=;
  b=KVik5345GD/CdJUNqSIB856Ix6wNoz4gmycj6lffPEEtbxGmneoxMPxl
   LBImVQ7HcXAPwVOdm5yAYUKKY2HW2dk5+q0GvxIwk+05ZmgxiPsv8szYj
   e3nZylKKFTGhwzCTbwTwZF9SaxJiL749KEDT+769S+dQnqSmOEWh5kBYd
   wvu1y1BTx1dwj7qbSi/O7E5rFaGOKjM1T6rp/nHPaL3uehhuySnMafwzd
   EiVsFJTgzGrorKRQNO0FGffsQpZgAo8Wk2JV6sCl+rH/o0vwENiiAclqA
   TuRAXsCsZgKPUQ265nvzCedMIG3oLVbx5LT403ap0DD3Y/OkG6TfA0U35
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367698238"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="367698238"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="373205"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2023 01:20:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvvc5-0009d1-12;
	Thu, 26 Oct 2023 08:21:09 +0000
Date: Thu, 26 Oct 2023 16:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] firmware: arm_scmi: support clock denied attributes
Message-ID: <202310261600.BinnN8W6-lkp@intel.com>
References: <20231026034125.1823954-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026034125.1823954-1-peng.fan@oss.nxp.com>

Hi Peng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on next-20231025]
[cannot apply to clk/clk-next linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/firmware-arm_scmi-support-clock-denied-attributes/20231026-113745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20231026034125.1823954-1-peng.fan%40oss.nxp.com
patch subject: [RFC] firmware: arm_scmi: support clock denied attributes
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231026/202310261600.BinnN8W6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261600.BinnN8W6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261600.BinnN8W6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk-scmi.c: In function 'scmi_clk_set_rate':
>> drivers/clk/clk-scmi.c:79:13: warning: unused variable 'rate1' [-Wunused-variable]
      79 |         u64 rate1 = 0;
         |             ^~~~~


vim +/rate1 +79 drivers/clk/clk-scmi.c

    73	
    74	static int scmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
    75				     unsigned long parent_rate)
    76	{
    77		struct scmi_clk *clk = to_scmi_clk(hw);
    78		const struct scmi_clock_info *info = clk->info;
  > 79		u64 rate1 = 0;
    80	
    81		if (info->flags & SCMI_CLOCK_SET_RATE_DENIED)
    82			return -EACCES;
    83	
    84		return scmi_proto_clk_ops->rate_set(clk->ph, clk->id, rate);
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
