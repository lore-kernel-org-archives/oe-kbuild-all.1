Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D4A10949
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 17:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692207529; x=1723743529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cItrhGBuShBhnl81c80FbA2qmrsbrtWkxfqvYdULB44=;
  b=YU5N0MNurmF7B2+NlZZKb9tC8WefSyxnYEjYgOaykettbelYfBSd4xme
   3Z61CW4EcWmQp8T+whQI1TAX1rFmEnbCMsS4vf7Ke+6zxhJEqOX0Tak8h
   6RtCLoUm7RLDNP5OMrFKLL9aLjdYvwMfXFJqUhDW+zWoCr2Tmy1YRWJO3
   t/4X3172gNQYz/4oXAHcYSqW2b4F1s2DlNmAqNvCcPDwqjOh4leTFGdzh
   9jqa6v0He4erfkTgSSsqe06y0A5rHvy1GOBWPD1dzpzlslldVR9WBbKy3
   1WOWT4qIBlZhP/GZgOgxZ5TMAqZm/EPMRGw72RlPOygecxFiSb/gJHRPI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376322523"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="376322523"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763716114"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="763716114"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 10:38:45 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWKTk-0000TV-1L;
	Wed, 16 Aug 2023 17:38:44 +0000
Date: Thu, 17 Aug 2023 01:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dean Luick <dean.luick@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:for-upstream_20230815-1 22/26]
 drivers/infiniband/hw/hfi1/chip_gen.c:13:6: warning: no previous declaration
 for 'gen_setextled'
Message-ID: <202308170137.jdkNn9Kd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20230815-1
head:   0abd733228fcd2852956680f4afba278548db977
commit: 1f714a9a8c508b4422f75f02c30d0a69e34f65c1 [22/26] RDMA/hfi1: Add JKR external LED functions
config: x86_64-buildonly-randconfig-r001-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170137.jdkNn9Kd-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170137.jdkNn9Kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170137.jdkNn9Kd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/hfi1/chip_gen.c:13:6: warning: no previous declaration for 'gen_setextled' [-Wmissing-declarations]
    void gen_setextled(struct hfi1_pportdata *ppd, u32 on)
         ^~~~~~~~~~~~~
>> drivers/infiniband/hw/hfi1/chip_gen.c:23:6: warning: no previous declaration for 'gen_start_led_override' [-Wmissing-declarations]
    void gen_start_led_override(struct hfi1_pportdata *ppd, unsigned int timeon,
         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/hfi1/chip_gen.c:39:6: warning: no previous declaration for 'gen_shutdown_led_override' [-Wmissing-declarations]
    void gen_shutdown_led_override(struct hfi1_pportdata *ppd)
         ^~~~~~~~~~~~~~~~~~~~~~~~~


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
