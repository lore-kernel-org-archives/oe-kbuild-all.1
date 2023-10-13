Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603D71108
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 03:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+rxvRIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697168213; x=1728704213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWHYC9mBbcKugzMpYVVGQGHUVrIYmDBefah33QStsDQ=;
  b=L+rxvRIjgHgTE8jMf9kfXFhM+iLCeEGgr8BOgPXsfsLnEMov5tOowBx0
   l7cop06ahd43OSa+kNqfFa2bGyozN8COPGjg12UG7BBLp7uiJn15xr3S9
   3Gp6G2tj9Acsmv1Q0k7gJXfTxNXTsckv/z3TX8/Tkoc4nV2llCyjOxDab
   +jlOnKSrCEGofVUnCy8U9cpmUiOts2hvnAx7QLB1QzEQZNg5iKv5TDTuh
   Zw4qzGE/ofMS6NwFnLbpjQmIwp/9o2/G4SWJkP1DOBxFKewZwz9+4L3qn
   rybf3XqndGBtdT1DmykfkOS83scoRSPOHH83uXHwAQRdfyRs2Woqoxeoj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384931866"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="384931866"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 20:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783980423"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783980423"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 20:36:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr8ym-0004ID-0y;
	Fri, 13 Oct 2023 03:36:48 +0000
Date: Fri, 13 Oct 2023 11:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1573/30000]
 drivers/input/touchscreen/vtl/vtl_ts.c:473:34: warning: 'vtl_ts_dt_ids'
 defined but not used
Message-ID: <202310131138.jD4Q56aG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alejandro,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 3785cf3fded6ec2c0230baf53fca19a1e956446f [1573/30000] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: parisc-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131138.jD4Q56aG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131138.jD4Q56aG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131138.jD4Q56aG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from drivers/input/touchscreen/vtl/vtl_ts.c:26:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c: In function 'vtl_ts_config':
   drivers/input/touchscreen/vtl/vtl_ts.c:65:24: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
      65 |         struct device *dev;
         |                        ^~~
   drivers/input/touchscreen/vtl/vtl_ts.c: At top level:
   drivers/input/touchscreen/vtl/vtl_ts.c:80:6: warning: no previous prototype for 'vtl_ts_free_gpio' [-Wmissing-prototypes]
      80 | void vtl_ts_free_gpio(void)
         |      ^~~~~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:90:6: warning: no previous prototype for 'vtl_ts_hw_reset' [-Wmissing-prototypes]
      90 | void vtl_ts_hw_reset(void)
         |      ^~~~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:278:6: warning: no previous prototype for 'vtl_ts_remove' [-Wmissing-prototypes]
     278 | int  vtl_ts_remove(struct i2c_client *client)
         |      ^~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:366:5: warning: no previous prototype for 'ct36x_test_tp' [-Wmissing-prototypes]
     366 | int ct36x_test_tp(struct i2c_client *client)
         |     ^~~~~~~~~~~~~
   drivers/input/touchscreen/vtl/vtl_ts.c:382:5: warning: no previous prototype for 'vtl_ts_probe' [-Wmissing-prototypes]
     382 | int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
         |     ^~~~~~~~~~~~
>> drivers/input/touchscreen/vtl/vtl_ts.c:473:34: warning: 'vtl_ts_dt_ids' defined but not used [-Wunused-const-variable=]
     473 | static const struct of_device_id vtl_ts_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~


vim +/vtl_ts_dt_ids +473 drivers/input/touchscreen/vtl/vtl_ts.c

   472	
 > 473	static const struct of_device_id vtl_ts_dt_ids[] = {
   474		{ .compatible = "vtl,ct365", },
   475		{ }
   476	};
   477	MODULE_DEVICE_TABLE(of, vtl_ts_dt_ids);
   478	
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
