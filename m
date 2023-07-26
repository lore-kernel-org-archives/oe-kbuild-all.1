Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4C1DA20
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690382367; x=1721918367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g5Hy3tGZJ8YGcj9wFhnt22w0rijM+umimVQ3/KM8c4I=;
  b=cWBKGF3dvfGi9jCayHhqVGAVvR1wAJf0lrtX9wfHmZqsoee4UTO7+x6N
   rRvtHJo9gpNOBKmchJAaGhfH+1YayVOQQNmXV6v3T780KLInPctNc9iQw
   Ji0GrN5Dm2zO8ipPfMO294o1LCyNX2GdZS1ytsFdUhk7RAFNTwwjfJ1M9
   7DzmEcv5jqdXEwwwBW39sdtU22L0kMBOPxSFaEzDRt0yfF/RnpDdCjlvW
   dSclt743SXXyy8WyRAswI8JyyqA/G7sXCDEwzYPWuUh5ZYU3mlLcizwP6
   WYlzsOgfjWwWeIulwviJN4cCt+TVgpvXQmmLR/3JTpnuqB1L9mGMVh0z4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371644926"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="371644926"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 07:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900445754"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="900445754"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2023 07:39:25 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOffh-00011T-0a;
	Wed, 26 Jul 2023 14:39:25 +0000
Date: Wed, 26 Jul 2023 22:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Merello <andrea.merello@iit.it>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] IIO: MPU6050: fix level-triggered IRQ support caused crash
Message-ID: <202307262233.0dTQw9vi-lkp@intel.com>
References: <20230726090212.10641-1-andrea.merello@iit.it>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726090212.10641-1-andrea.merello@iit.it>

Hi Andrea,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.5-rc3]
[also build test WARNING on linus/master]
[cannot apply to jic23-iio/togreg next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-Merello/IIO-MPU6050-fix-level-triggered-IRQ-support-caused-crash/20230726-172345
base:   v6.5-rc3
patch link:    https://lore.kernel.org/r/20230726090212.10641-1-andrea.merello%40iit.it
patch subject: [RFC] IIO: MPU6050: fix level-triggered IRQ support caused crash
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230726/202307262233.0dTQw9vi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307262233.0dTQw9vi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307262233.0dTQw9vi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:220:13: warning: no previous prototype for 'inv_mpu6050_trigger_irq' [-Wmissing-prototypes]
     220 | irqreturn_t inv_mpu6050_trigger_irq(int irq, void *private)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c:228:13: warning: no previous prototype for 'inv_mpu6050_trigger_thread_fn' [-Wmissing-prototypes]
     228 | irqreturn_t inv_mpu6050_trigger_thread_fn(int irq, void *private)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/inv_mpu6050_trigger_irq +220 drivers/iio/imu/inv_mpu6050/inv_mpu_trigger.c

   219	
 > 220	irqreturn_t inv_mpu6050_trigger_irq(int irq, void *private)
   221	{
   222		struct inv_mpu6050_state *st = private;
   223	
   224		iio_trigger_generic_data_rdy_poll(irq, st->trig);
   225		return IRQ_WAKE_THREAD;
   226	}
   227	
 > 228	irqreturn_t inv_mpu6050_trigger_thread_fn(int irq, void *private)
   229	{
   230		struct inv_mpu6050_state *st = private;
   231		int int_status;
   232	
   233		mutex_lock(&st->lock);
   234		regmap_read(st->map, st->reg->int_status, &int_status);
   235		mutex_unlock(&st->lock);
   236	
   237		return IRQ_HANDLED;
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
