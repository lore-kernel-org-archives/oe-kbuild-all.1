Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F531A594
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 05:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICXXhH6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700546076; x=1732082076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nk2eKwYrSn/YReITOMocGbZi9RRDlvIu+Lc6Saoi/+8=;
  b=ICXXhH6nCSeFwETquTvDwPgsPv5lZ21Sux7Wc585AOmMx0pImO7b1l8K
   KOlRTv+Q5OZLHMKMI4l7WOcuAKjEWtOhkVQB1vUDeplhl08QuDxYA93q/
   +6LEUahMK6wahCUHRBsu/8UsRP49YCVztBCL3KHGp+HTfCn2h2gQ7w5DM
   kr4NM2o2uFdWZ8p9NRttaOt5oD4ny9Jc3bdQV4qCBy1WQhDZWmgS/8A4T
   mx+CWveNA7CHZtBf2lmJ5MScwkg5zZsHaOI3/eYQnqyCEbqMHr0kCgdks
   E1AhVTuOsVPaH/bAvFSHgU1c88E4h7sfDJkoeu6xzbBzlK7yEbqAj76Vt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477975665"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="477975665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 21:54:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="14395468"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Nov 2023 21:54:34 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Jhe-0007NF-1W;
	Tue, 21 Nov 2023 05:54:11 +0000
Date: Tue, 21 Nov 2023 13:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] regulator: event: Add regulator netlink event support
Message-ID: <202311211304.w5znAwJu-lkp@intel.com>
References: <20231120194311.3581036-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120194311.3581036-1-naresh.solanki@9elements.com>

Hi Naresh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 753e4d5c433da57da75dd4c3e1aececc8e874a62]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/regulator-event-Add-regulator-netlink-event-support/20231121-034604
base:   753e4d5c433da57da75dd4c3e1aececc8e874a62
patch link:    https://lore.kernel.org/r/20231120194311.3581036-1-naresh.solanki%409elements.com
patch subject: [PATCH v1] regulator: event: Add regulator netlink event support
config: x86_64-buildonly-randconfig-001-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211304.w5znAwJu-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211304.w5znAwJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211304.w5znAwJu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from include/linux/skbuff.h:13,
                    from include/linux/netlink.h:7,
                    from include/net/netlink.h:6,
                    from drivers/regulator/event.c:3:
   drivers/regulator/event.c: In function 'reg_generate_netlink_event':
>> include/linux/kern_levels.h:5:18: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:427:11: note: in definition of macro 'printk_index_wrap'
     427 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/linux/printk.h:129:3: note: in expansion of macro 'printk'
     129 |   printk(fmt, ##__VA_ARGS__);  \
         |   ^~~~~~
   include/linux/printk.h:585:2: note: in expansion of macro 'no_printk'
     585 |  no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~~~~
   include/linux/kern_levels.h:15:20: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG KERN_SOH "7" /* debug-level messages */
         |                    ^~~~~~~~
   include/linux/printk.h:585:12: note: in expansion of macro 'KERN_DEBUG'
     585 |  no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |            ^~~~~~~~~~
   drivers/regulator/event.c:92:2: note: in expansion of macro 'pr_debug'
      92 |  pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |  ^~~~~~~~
   drivers/regulator/event.c:92:20: note: format string is defined here
      92 |  pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |                  ~~^
         |                    |
         |                    long unsigned int
         |                  %llx
   In file included from include/linux/kernel.h:31,
                    from include/linux/skbuff.h:13,
                    from include/linux/netlink.h:7,
                    from include/net/netlink.h:6,
                    from drivers/regulator/event.c:3:
>> include/linux/kern_levels.h:5:18: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:427:11: note: in definition of macro 'printk_index_wrap'
     427 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/linux/printk.h:129:3: note: in expansion of macro 'printk'
     129 |   printk(fmt, ##__VA_ARGS__);  \
         |   ^~~~~~
   include/linux/printk.h:585:2: note: in expansion of macro 'no_printk'
     585 |  no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~~~~
   include/linux/kern_levels.h:15:20: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG KERN_SOH "7" /* debug-level messages */
         |                    ^~~~~~~~
   include/linux/printk.h:585:12: note: in expansion of macro 'KERN_DEBUG'
     585 |  no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |            ^~~~~~~~~~
   drivers/regulator/event.c:92:2: note: in expansion of macro 'pr_debug'
      92 |  pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |  ^~~~~~~~
   drivers/regulator/event.c:92:33: note: format string is defined here
      92 |  pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |                                ~^
         |                                 |
         |                                 unsigned int


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
