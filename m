Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EB914AAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 08:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693299404; x=1724835404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4DSaE12i/DM3pRmUtQ+rvYAvn6DEWMYXmYhsVto2ry4=;
  b=D6fuhpH7l/eS9mTChvwCxjldCthfe8/puhnLmgoGZkEKQ83OiBgv93OP
   E4GKLWJmHMJVQUBpx3/f3P6ZYrvJAEoGdteEi1I9x/u0SQCjLsmIXkEWk
   O7d1bAl1d49YGujTh4yiQVRYBL1fDUiX/6gKQTFdA7O+tKzRk5DmP45JW
   kFtcJK8vrcAC/Ii1xCsv35FMpuee9tfugTC8AtiwG8EeT4WPuvt7XXNjy
   EtM5dRKf5FAvor9J89YG7GGvKK/mZgcUrK2cdoAQhoPRuFVnf/zcenCOq
   aLaZr9Lsc8JneTa8A68d02Mbf4XFWzZDlAoN++R7tPPMXjZdqn7t+Z8i+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354830158"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="354830158"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 01:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688422808"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="688422808"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 01:56:28 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qauWQ-0008at-2r;
	Tue, 29 Aug 2023 08:56:26 +0000
Date: Tue, 29 Aug 2023 16:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v2-2023-08-28 28/36] drivers/cxl/core/mbox.c:1073:22:
 warning: format '%llx' expects argument of type 'long long unsigned int',
 but argument 4 has type 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202308291618.P2pN2Y3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v2-2023-08-28
head:   4e8d6c7176cb59f986a4365a6c6bd7d3610c229e
commit: 6deafca8bb58e0e77babcd094717373a3f7235f2 [28/36] cxl/mem: Handle DCD add and release capacity events.
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308291618.P2pN2Y3n-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291618.P2pN2Y3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291618.P2pN2Y3n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rbtree.h:24,
                    from include/linux/key.h:15,
                    from include/linux/security.h:27,
                    from drivers/cxl/core/mbox.c:3:
   drivers/cxl/core/mbox.c: In function 'cxl_handle_dcd_release_event':
>> drivers/cxl/core/mbox.c:1073:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    1073 |         dev_dbg(dev, "Release DC extent DPA:0x%llx LEN:%llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/mbox.c:1073:9: note: in expansion of macro 'dev_dbg'
    1073 |         dev_dbg(dev, "Release DC extent DPA:0x%llx LEN:%llx\n",
         |         ^~~~~~~
   drivers/cxl/core/mbox.c:1073:50: note: format string is defined here
    1073 |         dev_dbg(dev, "Release DC extent DPA:0x%llx LEN:%llx\n",
         |                                               ~~~^
         |                                                  |
         |                                                  long long unsigned int
         |                                               %x
   drivers/cxl/core/mbox.c:1073:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    1073 |         dev_dbg(dev, "Release DC extent DPA:0x%llx LEN:%llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/cxl/core/mbox.c:1073:9: note: in expansion of macro 'dev_dbg'
    1073 |         dev_dbg(dev, "Release DC extent DPA:0x%llx LEN:%llx\n",
         |         ^~~~~~~
   drivers/cxl/core/mbox.c:1073:59: note: format string is defined here
    1073 |         dev_dbg(dev, "Release DC extent DPA:0x%llx LEN:%llx\n",
         |                                                        ~~~^
         |                                                           |
         |                                                           long long unsigned int
         |                                                        %x
   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/cxl/cxlpci.h:5,
                    from drivers/cxl/core/mbox.c:8:
   drivers/cxl/core/mbox.c:1078:30: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    1078 |                 dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/cxl/core/mbox.c:1078:17: note: in expansion of macro 'dev_err'
    1078 |                 dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
         |                 ^~~~~~~
   drivers/cxl/core/mbox.c:1078:61: note: format string is defined here
    1078 |                 dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
         |                                                          ~~~^
         |                                                             |
         |                                                             long long unsigned int
         |                                                          %x


vim +1073 drivers/cxl/core/mbox.c

  1063	
  1064	static int cxl_handle_dcd_release_event(struct cxl_memdev_state *mds,
  1065						struct cxl_dc_extent *rel_extent)
  1066	{
  1067		struct device *dev = mds->cxlds.dev;
  1068		struct cxl_dc_extent_data *extent;
  1069		resource_size_t dpa, size;
  1070	
  1071		dpa = le64_to_cpu(rel_extent->start_dpa);
  1072		size = le64_to_cpu(rel_extent->length);
> 1073		dev_dbg(dev, "Release DC extent DPA:0x%llx LEN:%llx\n",
  1074			dpa, size);
  1075	
  1076		extent = xa_erase(&mds->dc_extent_list, dpa);
  1077		if (!extent) {
  1078			dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
  1079			return -EINVAL;
  1080		}
  1081		cxl_dc_extent_put(extent);
  1082		return 0;
  1083	}
  1084	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
