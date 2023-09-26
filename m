Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CBB2908
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 08:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695717784; x=1727253784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLEoFveovIH6/mAukYb4Iq8Ft+OqAtTdkH48skK2m0I=;
  b=GyV9IFL5rOv0t4o/zpIGvltbHYT/cNly2F+XqY/CMg0sxjinCLcAHN4u
   HHUrhnBhRv/l1iFa6pmX178ksrBQTy+AzUSGP0V/aQEf0dZMZb6bsHDnH
   wUMiglCSEHDfdAIqOWUcQ1xmBS0pCANnWkcx7WkhCGnuNUlHY4hlXaon/
   AVC0yBHqrG48pBMH/Gzn+D69YvC7GoN9pfOsHJoJDwVY+hpkJJN5YBB7Z
   LhZf5EEtJCIA6jc0nZNoNmy6rYsy3HLHDvynme3X1a/1iPOR/s8+GVb3S
   z1WjHagEKs3RxN83xP+i1wiOFNkaSmDzOYYkBjnZVIUu0VjQxEfmBQvmT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412434147"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="412434147"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 01:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838951591"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="838951591"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2023 01:42:44 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql3eT-0002dD-2T;
	Tue, 26 Sep 2023 08:42:41 +0000
Date: Tue, 26 Sep 2023 16:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Cater <david.cater@idt.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Dylan Yip <dylan.yip@xilinx.com>
Subject: [xilinx-xlnx:master 140/1123] include/linux/container_of.h:22:10:
 warning: array subscript -1 is outside array bounds of 'struct
 i2c_client[0]'
Message-ID: <202309261613.o1GWqW00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: a7bf65796cefd9b26ccf08bf59d0f30e817bfd9b [140/1123] clk: Add ccf driver for IDT 8T49N24x UFT
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20230926/202309261613.o1GWqW00-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309261613.o1GWqW00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309261613.o1GWqW00-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/list.h:5,
                    from include/linux/kobject.h:19,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/clk/idt/clk-idt8t49n24x.c:12:
   drivers/clk/idt/clk-idt8t49n24x.c: In function 'idt24x_remove':
>> include/linux/container_of.h:22:10: warning: array subscript -1 is outside array bounds of 'struct i2c_client[0]' [-Warray-bounds=]
      22 |         ((type *)(__mptr - offsetof(type, member))); })
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/idt/clk-idt8t49n24x-core.h:219:9: note: in expansion of macro 'container_of'
     219 |         container_of(_client, struct clk_idt24x_chip, i2c_client)
         |         ^~~~~~~~~~~~
   drivers/clk/idt/clk-idt8t49n24x.c:603:40: note: in expansion of macro 'to_clk_idt24x_from_client'
     603 |         struct clk_idt24x_chip *chip = to_clk_idt24x_from_client(&client);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/idt/clk-idt8t49n24x.c:601:46: note: at offset -4 into object 'client' of size 4
     601 | static void idt24x_remove(struct i2c_client *client)
         |                           ~~~~~~~~~~~~~~~~~~~^~~~~~
>> drivers/clk/idt/clk-idt8t49n24x.c:609:18: warning: array subscript 0 is outside array bounds of 'struct i2c_client[0]' [-Warray-bounds=]
     609 |         if (!chip->input_clk)
         |                  ^~
   drivers/clk/idt/clk-idt8t49n24x.c:601:46: note: at offset -4 into object 'client' of size 4
     601 | static void idt24x_remove(struct i2c_client *client)
         |                           ~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/clk/idt/clk-idt8t49n24x.c:610:17: warning: array subscript 0 is outside array bounds of 'struct i2c_client[0]' [-Warray-bounds=]
     610 |                 clk_notifier_unregister(
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
     611 |                         chip->input_clk, &chip->input_clk_nb);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/idt/clk-idt8t49n24x.c:601:46: note: at offset -4 into object 'client' of size 4
     601 | static void idt24x_remove(struct i2c_client *client)
         |                           ~~~~~~~~~~~~~~~~~~~^~~~~~


vim +22 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  16   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  19  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  20  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  21  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08 @22  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  

:::::: The code at line 22 was first introduced by commit
:::::: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out container_of() and typeof_member() macros

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
