Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6521715C6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 02:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676340773; x=1707876773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rKzFyEcq3FzCeccV0ErctTrejgulILBzrRZ+4E+UhnI=;
  b=RcvO54a31Bs6XAVFiaHt/4wi4g/Y0wCRRqXxnBGzDpuabElNiLf5a+Xg
   TwZoSbZhTn9Z0cL576J33LlTEGVYSX0n8r/9iCD0N+30Kq/V07vD06+10
   69PnLW//QQUlStyx+NPK75McrhmWQG81i4NsT5ONVu+5plX7SOFs3+DQe
   R4mG3ydkuRiw34QP9mhVlRbpv2cuMskDwm+TIsMcOcdyRxztBxrBAVztx
   kPNfGR1jrggBCImoG27RRJ8tN/1ifJP5HPI1bL6qpKRxXS6VV24og5S5z
   N3H+gixLUXQqf80OhIP31aJMnjk1JZycyydlBMsRBEn45XGD1O06qoKuh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310690562"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="310690562"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 18:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="662399368"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="662399368"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Feb 2023 18:12:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRkoL-00088h-0d;
	Tue, 14 Feb 2023 02:12:49 +0000
Date: Tue, 14 Feb 2023 10:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Chen <zenghuchen@google.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jesus Sanchez-Palencia <jesussanp@google.com>,
	Mark Slevinsky <markslevinsky@google.com>,
	Jack Chen <zenghuchen@google.com>
Subject: Re: [PATCH] i3c: update dw-i3c-master i3c_clk_cfg function
Message-ID: <202302141029.2CS1z9de-lkp@intel.com>
References: <20230213142336.192875-1-zenghuchen@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213142336.192875-1-zenghuchen@google.com>

Hi Jack,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc8 next-20230213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Chen/i3c-update-dw-i3c-master-i3c_clk_cfg-function/20230213-222533
patch link:    https://lore.kernel.org/r/20230213142336.192875-1-zenghuchen%40google.com
patch subject: [PATCH] i3c: update dw-i3c-master i3c_clk_cfg function
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230214/202302141029.2CS1z9de-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/e85b41ae5bb17077ac7d01bdd13c48ea1f83ea42
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jack-Chen/i3c-update-dw-i3c-master-i3c_clk_cfg-function/20230213-222533
        git checkout e85b41ae5bb17077ac7d01bdd13c48ea1f83ea42
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/i3c/master/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141029.2CS1z9de-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i3c/master/dw-i3c-master.c:544:16: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/i3c/master/dw-i3c-master.c:544:16: sparse:    unsigned long *
>> drivers/i3c/master/dw-i3c-master.c:544:16: sparse:    unsigned char *

vim +544 drivers/i3c/master/dw-i3c-master.c

   517	
   518	static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
   519	{
   520		unsigned long core_rate, core_period;
   521		u32 scl_timing;
   522		u8 hcnt, lcnt;
   523	
   524		core_rate = clk_get_rate(master->core_clk);
   525		if (!core_rate)
   526			return -EINVAL;
   527	
   528		core_period = DIV_ROUND_UP(1000000000, core_rate);
   529	
   530		hcnt = DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period) - 1;
   531		if (hcnt < SCL_I3C_TIMING_CNT_MIN)
   532			hcnt = SCL_I3C_TIMING_CNT_MIN;
   533	
   534		lcnt = DIV_ROUND_UP(core_rate, master->base.bus.scl_rate.i3c) - hcnt;
   535		if (lcnt < SCL_I3C_TIMING_CNT_MIN)
   536			lcnt = SCL_I3C_TIMING_CNT_MIN;
   537	
   538		scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
   539		writel(scl_timing, master->regs + SCL_I3C_PP_TIMING);
   540	
   541		if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
   542			writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
   543	
 > 544		lcnt = max(DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period), lcnt);
   545		scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
   546		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
   547	
   548		lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
   549		scl_timing = SCL_EXT_LCNT_1(lcnt);
   550		lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt;
   551		scl_timing |= SCL_EXT_LCNT_2(lcnt);
   552		lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt;
   553		scl_timing |= SCL_EXT_LCNT_3(lcnt);
   554		lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt;
   555		scl_timing |= SCL_EXT_LCNT_4(lcnt);
   556		writel(scl_timing, master->regs + SCL_EXT_LCNT_TIMING);
   557	
   558		return 0;
   559	}
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
