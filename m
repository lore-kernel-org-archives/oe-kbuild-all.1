Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1E624
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 01:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675991895; x=1707527895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sz9I313df7d7kxvv98S0pAaXNw1uOuhaKibCUki6nP8=;
  b=eo+sqIm6Hs9Piy5O9qebbWDplWbexG/ONky9yCEVUNNNRUWttkMKjk8A
   C8Q9SmmPh0tyUuWM72dVGLLUYhifqvwKc2eh1YGuWHxNbNSChVj7N4sjI
   bsGWnQCi9yqWpxPdeNe9ISG33bmHk8BzMYeywGZ622pdr7ETKGA4q127k
   tOKc4FNZOZ9basulwagFvk8GwgFaEMNW4WqWnMEXqDCbxi5r2BOM2Gy+j
   /VNE5HDKtxOGltos4oJk8dTEKBNS9jwg5zAlWndQHeOgMV/rwntkSH02C
   oIAK5MSpNUyCZuD7hpmVQRzcIZJx8T2LoupZVDIik98fdjJvjetshoUCm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="310665960"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="310665960"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 17:18:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="736565400"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="736565400"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2023 17:18:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQI3I-0005QA-2c;
	Fri, 10 Feb 2023 01:18:12 +0000
Date: Fri, 10 Feb 2023 09:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Message-ID: <202302100955.kmsYgxRz-lkp@intel.com>
References: <20230209221634.35239-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209221634.35239-1-sakari.ailus@linux.intel.com>

Hi Sakari,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/streams soc/for-next linus/master v6.2-rc7 next-20230209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/v4l-async-Add-some-debug-prints/20230210-061721
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230209221634.35239-1-sakari.ailus%40linux.intel.com
patch subject: [RFC 1/1] v4l: async: Add some debug prints
config: nios2-randconfig-r021-20230209 (https://download.01.org/0day-ci/archive/20230210/202302100955.kmsYgxRz-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e7f54a8293c1023ad1d5c5cd757278037d55088f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/v4l-async-Add-some-debug-prints/20230210-061721
        git checkout e7f54a8293c1023ad1d5c5cd757278037d55088f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100955.kmsYgxRz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   include/linux/export.h:150:41: note: in expansion of macro '_EXPORT_SYMBOL'
     150 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:849:1: note: in expansion of macro 'EXPORT_SYMBOL'
     849 | EXPORT_SYMBOL(v4l2_async_register_subdev);
         | ^~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:783:5: note: previous definition of 'v4l2_async_register_subdev' with type 'int(struct v4l2_subdev *)'
     783 | int v4l2_async_register_subdev(struct v4l2_subdev *sd)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:57:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      57 |         static const struct kernel_symbol __ksymtab_##sym               \
         |         ^~~~~~
   include/linux/export.h:96:9: note: in expansion of macro '__KSYMTAB_ENTRY'
      96 |         __KSYMTAB_ENTRY(sym, sec)
         |         ^~~~~~~~~~~~~~~
   include/linux/export.h:140:41: note: in expansion of macro '___EXPORT_SYMBOL'
     140 | #define __EXPORT_SYMBOL(sym, sec, ns)   ___EXPORT_SYMBOL(sym, sec, ns)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:150:41: note: in expansion of macro '_EXPORT_SYMBOL'
     150 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:849:1: note: in expansion of macro 'EXPORT_SYMBOL'
     849 | EXPORT_SYMBOL(v4l2_async_register_subdev);
         | ^~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:875:15: error: non-static declaration of 'v4l2_async_unregister_subdev' follows static declaration
     875 | EXPORT_SYMBOL(v4l2_async_unregister_subdev);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:28: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:150:41: note: in expansion of macro '_EXPORT_SYMBOL'
     150 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:875:1: note: in expansion of macro 'EXPORT_SYMBOL'
     875 | EXPORT_SYMBOL(v4l2_async_unregister_subdev);
         | ^~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:851:6: note: previous definition of 'v4l2_async_unregister_subdev' with type 'void(struct v4l2_subdev *)'
     851 | void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:57:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      57 |         static const struct kernel_symbol __ksymtab_##sym               \
         |         ^~~~~~
   include/linux/export.h:96:9: note: in expansion of macro '__KSYMTAB_ENTRY'
      96 |         __KSYMTAB_ENTRY(sym, sec)
         |         ^~~~~~~~~~~~~~~
   include/linux/export.h:140:41: note: in expansion of macro '___EXPORT_SYMBOL'
     140 | #define __EXPORT_SYMBOL(sym, sec, ns)   ___EXPORT_SYMBOL(sym, sec, ns)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:150:41: note: in expansion of macro '_EXPORT_SYMBOL'
     150 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:875:1: note: in expansion of macro 'EXPORT_SYMBOL'
     875 | EXPORT_SYMBOL(v4l2_async_unregister_subdev);
         | ^~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:877:13: error: invalid storage class for function 'print_waiting_subdev'
     877 | static void print_waiting_subdev(struct seq_file *s,
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:903:1: error: invalid storage class for function 'v4l2_async_nf_name'
     903 | v4l2_async_nf_name(struct v4l2_async_notifier *notifier)
         | ^~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:913:12: error: invalid storage class for function 'pending_subdevs_show'
     913 | static int pending_subdevs_show(struct seq_file *s, void *data)
         |            ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/debugfs.h:16:
   drivers/media/v4l2-core/v4l2-async.c:930:23: error: invalid storage class for function 'pending_subdevs_open'
     930 | DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
         |                       ^~~~~~~~~~~~~~~
   include/linux/seq_file.h:197:12: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     197 | static int __name ## _open(struct inode *inode, struct file *file)      \
         |            ^~~~~~
   drivers/media/v4l2-core/v4l2-async.c:930:23: error: initializer element is not constant
     930 | DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
         |                       ^~~~~~~~~~~~~~~
   include/linux/seq_file.h:204:27: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     204 |         .open           = __name ## _open,                              \
         |                           ^~~~~~
   drivers/media/v4l2-core/v4l2-async.c:930:23: note: (near initialization for 'pending_subdevs_fops.open')
     930 | DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
         |                       ^~~~~~~~~~~~~~~
   include/linux/seq_file.h:204:27: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     204 |         .open           = __name ## _open,                              \
         |                           ^~~~~~
   drivers/media/v4l2-core/v4l2-async.c:934:19: error: invalid storage class for function 'v4l2_async_init'
     934 | static int __init v4l2_async_init(void)
         |                   ^~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:944:20: error: invalid storage class for function 'v4l2_async_exit'
     944 | static void __exit v4l2_async_exit(void)
         |                    ^~~~~~~~~~~~~~~
   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from drivers/media/v4l2-core/v4l2-async.c:9:
>> include/linux/module.h:130:49: error: invalid storage class for function '__inittest'
     130 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/module.h:116:41: note: in expansion of macro 'module_init'
     116 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:949:1: note: in expansion of macro 'subsys_initcall'
     949 | subsys_initcall(v4l2_async_init);
         | ^~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-async.c:949:1: warning: 'alias' attribute ignored [-Wattributes]
>> include/linux/module.h:138:49: error: invalid storage class for function '__exittest'
     138 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:950:1: note: in expansion of macro 'module_exit'
     950 | module_exit(v4l2_async_exit);
         | ^~~~~~~~~~~
>> include/linux/module.h:138:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     138 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |         ^~~~~~
   drivers/media/v4l2-core/v4l2-async.c:950:1: note: in expansion of macro 'module_exit'
     950 | module_exit(v4l2_async_exit);
         | ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:950:1: warning: 'alias' attribute ignored [-Wattributes]
   In file included from include/linux/module.h:22:
   include/linux/moduleparam.h:24:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |         ^~~~~~
   include/linux/module.h:165:32: note: in expansion of macro '__MODULE_INFO'
     165 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:235:32: note: in expansion of macro 'MODULE_INFO'
     235 | #define MODULE_AUTHOR(_author) MODULE_INFO(author, _author)
         |                                ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:952:1: note: in expansion of macro 'MODULE_AUTHOR'
     952 | MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
         | ^~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:955:1: error: expected declaration or statement at end of input
     955 | MODULE_LICENSE("GPL");
         | ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/alias +949 drivers/media/v4l2-core/v4l2-async.c

ff3cc65cadb5d7 Sakari Ailus 2021-03-05  948  
ff3cc65cadb5d7 Sakari Ailus 2021-03-05 @949  subsys_initcall(v4l2_async_init);
ff3cc65cadb5d7 Sakari Ailus 2021-03-05  950  module_exit(v4l2_async_exit);
ff3cc65cadb5d7 Sakari Ailus 2021-03-05  951  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
