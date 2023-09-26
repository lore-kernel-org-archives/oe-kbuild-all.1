Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C54D4A52F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695764138; x=1727300138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NX0d9v54fzfLmnQ9a+rSIXcURz3qDWrJqTlgg1Ersbw=;
  b=fW2ULRWcJYJyrUEpGWofwzzBFJXIOy9ZLn3V9ad+JphivIElmD3Fihgp
   uVEHv/Al62ztn/u2UFzEhFCCPs4XOiRLR8m84xnp+qZNqZwjx3cSbcurt
   1y92fiPt7ECmsFfYIcor7/Y+SMlVL51nu9k68k6/5IMhFjQhUYBeBEYsb
   MGaxC2XNGzixS8UOvhFuJYr4IRJ4hYDphWzd9vzVYYnDcyKTL/u9TBuwO
   tDDZ1PUDSbkoW2O9xMjhKNRnqpzmDdLZ7uLnMKIQIW9shitss5YGE9CXx
   LzAIshZkJzK8zRlHop7GNkm4HeA2Y983sNxu86saYGDwEQzgKOmlVvrLC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="467960364"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="467960364"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 14:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="784101631"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="784101631"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2023 14:35:35 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlFiP-0003O6-0F;
	Tue, 26 Sep 2023 21:35:33 +0000
Date: Wed, 27 Sep 2023 05:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 4/5]
 include/linux/sysfs.h:55:15: error: 'struct bin_attribute' has no member
 named 'key'
Message-ID: <202309270503.GgQaxNy0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   bd2b5ff0df3da9b75e684d99cd5b1ed4e74e24db
commit: 0f21042c11c7fa9053d5af1797f5a9380579f4dd [4/5] platform/x86/amd/hsmp: add support for metrics tbl
config: x86_64-randconfig-074-20230927 (https://download.01.org/0day-ci/archive/20230927/202309270503.GgQaxNy0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270503.GgQaxNy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270503.GgQaxNy0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from arch/x86/include/asm/amd_nb.h:6,
                    from drivers/platform/x86/amd/hsmp.c:13:
   drivers/platform/x86/amd/hsmp.c: In function 'hsmp_init_metric_tbl_bin_attr':
>> include/linux/sysfs.h:55:15: error: 'struct bin_attribute' has no member named 'key'
      55 |         (attr)->key = &__key;                           \
         |               ^~
   drivers/platform/x86/amd/hsmp.c:414:9: note: in expansion of macro 'sysfs_attr_init'
     414 |         sysfs_attr_init(&plat_dev.sock[sock_ind].hsmp_attr);
         |         ^~~~~~~~~~~~~~~


vim +55 include/linux/sysfs.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  39  
35960258ed388c Eric W. Biederman 2010-02-12  40  /**
35960258ed388c Eric W. Biederman 2010-02-12  41   *	sysfs_attr_init - initialize a dynamically allocated sysfs attribute
35960258ed388c Eric W. Biederman 2010-02-12  42   *	@attr: struct attribute to initialize
35960258ed388c Eric W. Biederman 2010-02-12  43   *
35960258ed388c Eric W. Biederman 2010-02-12  44   *	Initialize a dynamically allocated struct attribute so we can
35960258ed388c Eric W. Biederman 2010-02-12  45   *	make lockdep happy.  This is a new requirement for attributes
35960258ed388c Eric W. Biederman 2010-02-12  46   *	and initially this is only needed when lockdep is enabled.
35960258ed388c Eric W. Biederman 2010-02-12  47   *	Lockdep gives a nice error when your attribute is added to
35960258ed388c Eric W. Biederman 2010-02-12  48   *	sysfs if you don't have this.
35960258ed388c Eric W. Biederman 2010-02-12  49   */
6992f5334995af Eric W. Biederman 2010-02-11  50  #ifdef CONFIG_DEBUG_LOCK_ALLOC
6992f5334995af Eric W. Biederman 2010-02-11  51  #define sysfs_attr_init(attr)				\
6992f5334995af Eric W. Biederman 2010-02-11  52  do {							\
6992f5334995af Eric W. Biederman 2010-02-11  53  	static struct lock_class_key __key;		\
6992f5334995af Eric W. Biederman 2010-02-11  54  							\
6992f5334995af Eric W. Biederman 2010-02-11 @55  	(attr)->key = &__key;				\
6992f5334995af Eric W. Biederman 2010-02-11  56  } while (0)
6992f5334995af Eric W. Biederman 2010-02-11  57  #else
6992f5334995af Eric W. Biederman 2010-02-11  58  #define sysfs_attr_init(attr) do {} while (0)
6992f5334995af Eric W. Biederman 2010-02-11  59  #endif
6992f5334995af Eric W. Biederman 2010-02-11  60  

:::::: The code at line 55 was first introduced by commit
:::::: 6992f5334995af474c2b58d010d08bc597f0f2fe sysfs: Use one lockdep class per sysfs attribute.

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
