Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFED21085
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687476230; x=1719012230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mvy5U5mYf3VFUozkAwmUxMllQoZbGQvGT8n49ln8Zos=;
  b=AI0z/Ydon53kDjqtlvVcv8E1JFBw+0kGZ4jOZb7jEQjso1m4iUb7Mav8
   c81gzJ9DLETm2SzGT2wcAJW+RGBP0t1fqmU01DuacXQUPb8iPQqvgiqI0
   SGDAlINatCDlTSZ8RnIHtNn2DJQqJ9bMSNxE11ec8bmkckkWWtjjKCobd
   XvFvT75xegKXQyMVqqwnIUkdHjvdT4NmTnK/4IiCsBoTcCevmX7IT7vHt
   EAL6CnwfknY3PZyhKZxH9MfMCOnZWVIBUFui+Bny1E3vBlyU7rXpr4H71
   BRIikWLqO7G7mX5UowZL1ZhuPKzNIUkPPH3t4hbfon1QPqs9KihSbU1xx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="340239462"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="340239462"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 16:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="828159234"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="828159234"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2023 16:23:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCTeV-0007oZ-2x;
	Thu, 22 Jun 2023 23:23:47 +0000
Date: Fri, 23 Jun 2023 07:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:throwaway 23/23] include/linux/kern_levels.h:5:25: warning:
 format '%u' expects argument of type 'unsigned int', but argument 3 has type
 'long unsigned int'
Message-ID: <202306230717.iip1LQdj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git throwaway
head:   728565a94870aaea0aba1276a17eadf55c1a236b
commit: 728565a94870aaea0aba1276a17eadf55c1a236b [23/23] meh
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306230717.iip1LQdj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230717.iip1LQdj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230717.iip1LQdj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/kthread.h:6,
                    from drivers/md/dm-core.h:13,
                    from drivers/md/dm-ioctl.c:9:
   drivers/md/dm-ioctl.c: In function 'next_target':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   include/linux/device-mapper.h:626:25: note: in expansion of macro 'pr_err'
     626 | #define DMERR(fmt, ...) pr_err(DM_FMT(fmt), ##__VA_ARGS__)
         |                         ^~~~~~
   drivers/md/dm-ioctl.c:1407:17: note: in expansion of macro 'DMERR'
    1407 |                 DMERR("Next target spec (offset %u) is not %u-byte aligned", next,
         |                 ^~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
