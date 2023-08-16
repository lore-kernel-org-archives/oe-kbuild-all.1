Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE2C392
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 01:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692149669; x=1723685669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4hFaEN/ca6TYvimKMSCnGg5/uP3A+PVl60PgnUYebS0=;
  b=IlbqE7NcDFdVOHufs0BFmSlCT70+lfa5FjzkfddothlJlGl3iIFGUP0Z
   JpDhivQLmmdcaFKLbp4OWu6MbF8Hi0LW2Zl4M7ewLUReSI/2AB9dsB2Xz
   QZHnf7yWlf203liWzm/rXcaVbvgLZ4/WcklCPCsTvPb6VNnX04AUmRieZ
   Efal9ZOpdZnVnVF3cenXaHxRV42HXN+Ba3FpgtYraMa6KtEEMxYlnnkj6
   ENwJVei4bkkP/A4df6Ymqsw70OI6RFCvc51u4DmAf0d4Nl0ln4d+Blj1z
   XnD/HIRc9GeFh0/ppcnAxuHaKqymemwF3FcqVl7gQ75oZX0oU1w6oT4F0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357390993"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="357390993"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 18:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="804014370"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="804014370"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2023 18:34:27 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW5QY-0001Nv-2t;
	Wed, 16 Aug 2023 01:34:26 +0000
Date: Wed, 16 Aug 2023 09:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dean Luick <dean.luick@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:for-upstream_20230815 22/26]
 drivers/infiniband/hw/hfi1/chip_gen.c:13:6: warning: no previous prototype
 for 'gen_setextled'
Message-ID: <202308160959.nYVbHANG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20230815
head:   5536d462af3f2f64d807c8f142bace179036dd1e
commit: 67101d56b7cf4dcd019e447fccb325ca55bd98bf [22/26] RDMA/hfi1: Add JKR external LED functions
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230816/202308160959.nYVbHANG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160959.nYVbHANG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160959.nYVbHANG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/hfi1/chip_gen.c:13:6: warning: no previous prototype for 'gen_setextled' [-Wmissing-prototypes]
      13 | void gen_setextled(struct hfi1_pportdata *ppd, u32 on)
         |      ^~~~~~~~~~~~~
>> drivers/infiniband/hw/hfi1/chip_gen.c:23:6: warning: no previous prototype for 'gen_start_led_override' [-Wmissing-prototypes]
      23 | void gen_start_led_override(struct hfi1_pportdata *ppd, unsigned int timeon,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/hfi1/chip_gen.c:39:6: warning: no previous prototype for 'gen_shutdown_led_override' [-Wmissing-prototypes]
      39 | void gen_shutdown_led_override(struct hfi1_pportdata *ppd)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/gen_setextled +13 drivers/infiniband/hw/hfi1/chip_gen.c

     9	
    10	/*
    11	 * Control the port LED state.  Cancel with gen_shutdown_led_override().
    12	 */
  > 13	void gen_setextled(struct hfi1_pportdata *ppd, u32 on)
    14	{
    15		/* XXX Replace with a CPORT message */
    16		dd_dev_warn(ppd->dd, "%s: on %d, JKR TODO\n", __func__, on);
    17	}
    18	
    19	/*
    20	 * Make the port LED blink in pattern.  Parameters timeon and timeoff are
    21	 * in milliseconds.  Cancel with gen_shutdown_led_override().
    22	 */
  > 23	void gen_start_led_override(struct hfi1_pportdata *ppd, unsigned int timeon,
    24				    unsigned int timeoff)
    25	{
    26		/* XXX Replace with a CPORT message */
    27		dd_dev_warn(ppd->dd, "%s: JKR TODO\n", __func__);
    28	
    29		/* used by the subnet manager to know if it set beaconing */
    30		atomic_set(&ppd->led_override_timer_active, 1);
    31		/* ensure the atomic_set is visible to all CPUs */
    32		smp_wmb();
    33	}
    34	
    35	/*
    36	 * Return to normal LED operation.  This cancels overrides started with
    37	 * gen_setextled() or gen_start_led_override().
    38	 */
  > 39	void gen_shutdown_led_override(struct hfi1_pportdata *ppd)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
