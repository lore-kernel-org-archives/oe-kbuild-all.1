Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587E28E1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 23:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675986974; x=1707522974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o35DX5X0qeDwTWiT8u5wTftBl3oE9kql+of2Tm9INg8=;
  b=h55VDiT1cmEZY/LjzN53n1hIPJDvGVrcc9+tiX5ZVTboq6wmi4MXcJh6
   d8esWEU5TmsZQqTvILipz8UK//Ggb8KMDocWjRSTSW1VJH68COFunUGl7
   bNcdbVXDBGRo49RZpKlTQKVfwzmfkeIinIJ7Udh39tn+EDWGD8vw9/DuX
   hernLpRXMxTfJwtX/T9cRmfLx8eDIjERFBQRIgCPctngZ1+GVOHtv4WjJ
   wXDrCQ/uVHY6KuAONSZ5TborLqADck/+HlZTGFqQNfDlxsz2xHHwKcfjV
   v4okoNA7fQZ9C42rfgbW2YS+wKfhDP1i32t7kys5M+BL8z74I5iuEiOPc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="332422886"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="332422886"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 15:56:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="810576104"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="810576104"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2023 15:56:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQGlv-0005No-1i;
	Thu, 09 Feb 2023 23:56:11 +0000
Date: Fri, 10 Feb 2023 07:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Message-ID: <202302100742.OdOEN4wp-lkp@intel.com>
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
[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/streams soc/for-next linus/master v6.2-rc7 next-20230209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/v4l-async-Add-some-debug-prints/20230210-061721
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230209221634.35239-1-sakari.ailus%40linux.intel.com
patch subject: [RFC 1/1] v4l: async: Add some debug prints
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230210/202302100742.OdOEN4wp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e7f54a8293c1023ad1d5c5cd757278037d55088f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/v4l-async-Add-some-debug-prints/20230210-061721
        git checkout e7f54a8293c1023ad1d5c5cd757278037d55088f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100742.OdOEN4wp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-async.c: In function 'v4l2_async_nf_can_complete':
   drivers/media/v4l2-core/v4l2-async.c:276:33: error: implicit declaration of function 'deb_dbg'; did you mean 'dev_dbg'? [-Werror=implicit-function-declaration]
     276 |                                 deb_dbg(subdev_notifier->sd->dev,
         |                                 ^~~~~~~
         |                                 dev_dbg
   drivers/media/v4l2-core/v4l2-async.c:289:1: error: invalid storage class for function 'v4l2_async_nf_try_complete'
     289 | v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-async.c:288:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     288 | static int
         | ^~~~~~
   drivers/media/v4l2-core/v4l2-async.c:320:1: error: invalid storage class for function 'v4l2_async_nf_try_all_subdevs'
     320 | v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:322:12: error: invalid storage class for function 'v4l2_async_create_ancillary_links'
     322 | static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:340:12: error: invalid storage class for function 'v4l2_async_match_notify'
     340 | static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c: In function 'v4l2_async_match_notify':
   drivers/media/v4l2-core/v4l2-async.c:393:16: error: implicit declaration of function 'v4l2_async_nf_try_all_subdevs'; did you mean 'v4l2_async_nf_try_complete'? [-Werror=implicit-function-declaration]
     393 |         return v4l2_async_nf_try_all_subdevs(subdev_notifier);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                v4l2_async_nf_try_complete
   drivers/media/v4l2-core/v4l2-async.c: In function 'v4l2_async_nf_can_complete':
   drivers/media/v4l2-core/v4l2-async.c:398:1: error: invalid storage class for function 'v4l2_async_nf_try_all_subdevs'
     398 | v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:435:13: error: invalid storage class for function 'v4l2_async_cleanup'
     435 | static void v4l2_async_cleanup(struct v4l2_subdev *sd)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:448:1: error: invalid storage class for function 'v4l2_async_nf_unbind_all_subdevs'
     448 | v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:470:1: error: invalid storage class for function '__v4l2_async_nf_has_async_subdev'
     470 | __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:497:1: error: invalid storage class for function 'v4l2_async_nf_has_async_subdev'
     497 | v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:521:12: error: invalid storage class for function 'v4l2_async_nf_asd_valid'
     521 | static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/debugfs.h:15,
                    from drivers/media/v4l2-core/v4l2-async.c:8:
   drivers/media/v4l2-core/v4l2-async.c:552:15: error: non-static declaration of 'v4l2_async_nf_init' follows static declaration
     552 | EXPORT_SYMBOL(v4l2_async_nf_init);
         |               ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:28: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:150:41: note: in expansion of macro '_EXPORT_SYMBOL'
     150 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:552:1: note: in expansion of macro 'EXPORT_SYMBOL'
     552 | EXPORT_SYMBOL(v4l2_async_nf_init);
         | ^~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:548:6: note: previous definition of 'v4l2_async_nf_init' with type 'void(struct v4l2_async_notifier *)'
     548 | void v4l2_async_nf_init(struct v4l2_async_notifier *notifier)
         |      ^~~~~~~~~~~~~~~~~~
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
   drivers/media/v4l2-core/v4l2-async.c:552:1: note: in expansion of macro 'EXPORT_SYMBOL'
     552 | EXPORT_SYMBOL(v4l2_async_nf_init);
         | ^~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:554:12: error: invalid storage class for function '__v4l2_async_nf_register'
     554 | static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:615:15: error: non-static declaration of 'v4l2_async_nf_register' follows static declaration
     615 | EXPORT_SYMBOL(v4l2_async_nf_register);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:28: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:150:41: note: in expansion of macro '_EXPORT_SYMBOL'
     150 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:615:1: note: in expansion of macro 'EXPORT_SYMBOL'
     615 | EXPORT_SYMBOL(v4l2_async_nf_register);
         | ^~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:599:5: note: previous definition of 'v4l2_async_nf_register' with type 'int(struct v4l2_device *, struct v4l2_async_notifier *)'
     599 | int v4l2_async_nf_register(struct v4l2_device *v4l2_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:57:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      57 |         static const struct kernel_symbol __ksymtab_##sym               \
         |         ^~~~~~
   include/linux/export.h:96:9: note: in expansion of macro '__KSYMTAB_ENTRY'
--
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
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6:
   drivers/media/v4l2-core/v4l2-async.c:949:17: error: initializer element is not constant
     949 | subsys_initcall(v4l2_async_init);
         |                 ^~~~~~~~~~~~~~~
   include/linux/init.h:253:55: note: in definition of macro '____define_initcall'
     253 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:263:9: note: in expansion of macro '__unique_initcall'
     263 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:265:35: note: in expansion of macro '___define_initcall'
     265 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:289:41: note: in expansion of macro '__define_initcall'
     289 | #define subsys_initcall(fn)             __define_initcall(fn, 4)
         |                                         ^~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:949:1: note: in expansion of macro 'subsys_initcall'
     949 | subsys_initcall(v4l2_async_init);
         | ^~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:950:13: error: initializer element is not constant
     950 | module_exit(v4l2_async_exit);
         |             ^~~~~~~~~~~~~~~
   include/linux/init.h:302:57: note: in definition of macro '__exitcall'
     302 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |                                                         ^~
   drivers/media/v4l2-core/v4l2-async.c:950:1: note: in expansion of macro 'module_exit'
     950 | module_exit(v4l2_async_exit);
         | ^~~~~~~~~~~
>> include/linux/init.h:302:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     302 |         static exitcall_t __exitcall_##fn __exit_call = fn
         |         ^~~~~~
   include/linux/module.h:99:25: note: in expansion of macro '__exitcall'
      99 | #define module_exit(x)  __exitcall(x);
         |                         ^~~~~~~~~~
   drivers/media/v4l2-core/v4l2-async.c:950:1: note: in expansion of macro 'module_exit'
     950 | module_exit(v4l2_async_exit);
         | ^~~~~~~~~~~
   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from drivers/media/v4l2-core/v4l2-async.c:9:
>> include/linux/moduleparam.h:24:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
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


vim +288 drivers/media/v4l2-core/v4l2-async.c

2cab00bb076b9f Sakari Ailus          2017-09-24  257  
2cab00bb076b9f Sakari Ailus          2017-09-24  258  /*
2cab00bb076b9f Sakari Ailus          2017-09-24  259   * Return true if all child sub-device notifiers are complete, false otherwise.
2cab00bb076b9f Sakari Ailus          2017-09-24  260   */
6087b21533fed7 Mauro Carvalho Chehab 2018-10-04  261  static bool
3c8c153914812a Sakari Ailus          2021-03-05  262  v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
2cab00bb076b9f Sakari Ailus          2017-09-24  263  {
2cab00bb076b9f Sakari Ailus          2017-09-24  264  	struct v4l2_subdev *sd;
2cab00bb076b9f Sakari Ailus          2017-09-24  265  
2cab00bb076b9f Sakari Ailus          2017-09-24  266  	if (!list_empty(&notifier->waiting))
2cab00bb076b9f Sakari Ailus          2017-09-24  267  		return false;
2cab00bb076b9f Sakari Ailus          2017-09-24  268  
2cab00bb076b9f Sakari Ailus          2017-09-24  269  	list_for_each_entry(sd, &notifier->done, async_list) {
2cab00bb076b9f Sakari Ailus          2017-09-24  270  		struct v4l2_async_notifier *subdev_notifier =
2cab00bb076b9f Sakari Ailus          2017-09-24  271  			v4l2_async_find_subdev_notifier(sd);
2cab00bb076b9f Sakari Ailus          2017-09-24  272  
2cab00bb076b9f Sakari Ailus          2017-09-24  273  		if (subdev_notifier &&
e7f54a8293c102 Sakari Ailus          2023-02-10  274  		    !v4l2_async_nf_can_complete(subdev_notifier)) {
e7f54a8293c102 Sakari Ailus          2023-02-10  275  			if (subdev_notifier->sd)
e7f54a8293c102 Sakari Ailus          2023-02-10 @276  				deb_dbg(subdev_notifier->sd->dev,
e7f54a8293c102 Sakari Ailus          2023-02-10  277  					"cannot complete\n");
2cab00bb076b9f Sakari Ailus          2017-09-24  278  			return false;
2cab00bb076b9f Sakari Ailus          2017-09-24  279  	}
2cab00bb076b9f Sakari Ailus          2017-09-24  280  
2cab00bb076b9f Sakari Ailus          2017-09-24  281  	return true;
2cab00bb076b9f Sakari Ailus          2017-09-24  282  }
2cab00bb076b9f Sakari Ailus          2017-09-24  283  
2cab00bb076b9f Sakari Ailus          2017-09-24  284  /*
2cab00bb076b9f Sakari Ailus          2017-09-24  285   * Complete the master notifier if possible. This is done when all async
2cab00bb076b9f Sakari Ailus          2017-09-24  286   * sub-devices have been bound; v4l2_device is also available then.
2cab00bb076b9f Sakari Ailus          2017-09-24  287   */
6087b21533fed7 Mauro Carvalho Chehab 2018-10-04 @288  static int
3c8c153914812a Sakari Ailus          2021-03-05  289  v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
2cab00bb076b9f Sakari Ailus          2017-09-24  290  {
2cab00bb076b9f Sakari Ailus          2017-09-24  291  	/* Quick check whether there are still more sub-devices here. */
2cab00bb076b9f Sakari Ailus          2017-09-24  292  	if (!list_empty(&notifier->waiting))
2cab00bb076b9f Sakari Ailus          2017-09-24  293  		return 0;
2cab00bb076b9f Sakari Ailus          2017-09-24  294  
e7f54a8293c102 Sakari Ailus          2023-02-10  295  	if (notifier->sd)
e7f54a8293c102 Sakari Ailus          2023-02-10  296  		deb_dbg(notifier->sd->dev, "trying to complete\n");
e7f54a8293c102 Sakari Ailus          2023-02-10  297  
2cab00bb076b9f Sakari Ailus          2017-09-24  298  	/* Check the entire notifier tree; find the root notifier first. */
2cab00bb076b9f Sakari Ailus          2017-09-24  299  	while (notifier->parent)
2cab00bb076b9f Sakari Ailus          2017-09-24  300  		notifier = notifier->parent;
2cab00bb076b9f Sakari Ailus          2017-09-24  301  
2cab00bb076b9f Sakari Ailus          2017-09-24  302  	/* This is root if it has v4l2_dev. */
e7f54a8293c102 Sakari Ailus          2023-02-10  303  	if (!notifier->v4l2_dev) {
e7f54a8293c102 Sakari Ailus          2023-02-10  304  		if (notifier->sd)
e7f54a8293c102 Sakari Ailus          2023-02-10  305  			deb_dbg(notifier->sd->dev,
e7f54a8293c102 Sakari Ailus          2023-02-10  306  				"V4L2 device not available\n");
2cab00bb076b9f Sakari Ailus          2017-09-24  307  		return 0;
e7f54a8293c102 Sakari Ailus          2023-02-10  308  	}
2cab00bb076b9f Sakari Ailus          2017-09-24  309  
2cab00bb076b9f Sakari Ailus          2017-09-24  310  	/* Is everything ready? */
3c8c153914812a Sakari Ailus          2021-03-05  311  	if (!v4l2_async_nf_can_complete(notifier))
2cab00bb076b9f Sakari Ailus          2017-09-24  312  		return 0;
2cab00bb076b9f Sakari Ailus          2017-09-24  313  
e7f54a8293c102 Sakari Ailus          2023-02-10  314  	deb_dbg(notifier->sd->dev, "complete\n");
e7f54a8293c102 Sakari Ailus          2023-02-10  315  
3c8c153914812a Sakari Ailus          2021-03-05  316  	return v4l2_async_nf_call_complete(notifier);
2cab00bb076b9f Sakari Ailus          2017-09-24  317  }
2cab00bb076b9f Sakari Ailus          2017-09-24  318  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
