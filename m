Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0BC8F63
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674595163; x=1706131163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8gkutEa5tQN8QTeglkVmqSD9SHmWhGENElV10M2KSvc=;
  b=GmO7Hvw3oDXFghVIx2eb/7gMUFnS/ClZH9fQRvfbiAuxe7lD5BhlMKRa
   5Z4oqQiQR/q2vaVm+8kF8/dghSuplOTp9pTEchHA3JY1qozz0cgA+h+lS
   S2ZY0hN5Lg9ilcx+u0w1XSDgQZhQ6NFfB33gu/OsjRqF/5fMcYoOAifDy
   3j/RlpBH5YzF2F/n2IVvW0ga2plrLzZB0lj609YXwneoFdjv5ZdQqMbDa
   lL7HAPes2KZzT98PZdzcrQ7CzzZsJEI9JBjH97wQKmnr2mCWz+Wjk7A8s
   YVmu+6XXZtda4peVLs+i15d9IIkdR4R8AF7bT77suGaTX7+LP8bvEjKZy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412641847"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="412641847"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 13:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="750960588"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="750960588"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 13:19:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKQhM-0006my-28;
	Tue, 24 Jan 2023 21:19:20 +0000
Date: Wed, 25 Jan 2023 05:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC 10/20] net/kparser: add kParser
Message-ID: <202301250532.PqsD5hEE-lkp@intel.com>
References: <20230124170510.316970-10-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124170510.316970-10-jhs@mojatatu.com>

Hi Jamal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
patch link:    https://lore.kernel.org/r/20230124170510.316970-10-jhs%40mojatatu.com
patch subject: [PATCH net-next RFC 10/20] net/kparser: add kParser
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230125/202301250532.PqsD5hEE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/89890cfe5785baa53d2e7807c96715c394d4cd9c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230125-010934
        git checkout 89890cfe5785baa53d2e7807c96715c394d4cd9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash net/kparser/ net/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/kparser/kparser_condexpr.h:16,
                    from net/kparser/kparser.h:23,
                    from net/kparser/kparser_cmds.c:15:
   net/kparser/kparser_metaextract.h:23:2: error: #error "Cannot determine endianness"
      23 | #error "Cannot determine endianness"
         |  ^~~~~
   In file included from net/kparser/kparser_cmds.c:13:
   net/kparser/kparser_cmds.c: In function 'kparser_link_attach':
>> include/linux/netlink.h:117:22: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ^~~~
   include/linux/netlink.h:131:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     131 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   net/kparser/kparser_cmds.c:88:17: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
      88 |                 NL_SET_ERR_MSG_FMT_MOD(extack,
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/ktime.h:26,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/rhashtable.h:25,
                    from net/kparser/kparser_cmds.c:10:
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:510:9: note: in expansion of macro 'printk'
     510 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:510:16: note: in expansion of macro 'KERN_WARNING'
     510 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   include/linux/net.h:272:17: note: in expansion of macro 'pr_warn'
     272 |                 function(__VA_ARGS__);                          \
         |                 ^~~~~~~~
   include/linux/net.h:286:9: note: in expansion of macro 'net_ratelimited_function'
     286 |         net_ratelimited_function(pr_warn, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:119:17: note: in expansion of macro 'net_warn_ratelimited'
     119 |                 net_warn_ratelimited("%s" fmt "%s", "truncated extack: ",      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     131 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   net/kparser/kparser_cmds.c:88:17: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
      88 |                 NL_SET_ERR_MSG_FMT_MOD(extack,
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   net/kparser/kparser_cmds.c: In function 'alloc_first_rsp':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:480:9: note: in expansion of macro 'printk'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   include/linux/printk.h:480:16: note: in expansion of macro 'KERN_ALERT'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   net/kparser/kparser.h:410:17: note: in expansion of macro 'pr_alert'
     410 |                 pr_alert("kParser:DATA:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);\
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:678:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     678 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI, ":kzalloc failed for rsp, size:%lu\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:480:9: note: in expansion of macro 'printk'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   include/linux/printk.h:480:16: note: in expansion of macro 'KERN_ALERT'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   net/kparser/kparser.h:412:17: note: in expansion of macro 'pr_alert'
     412 |                 pr_alert("kParser:CLI:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);\
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:678:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     678 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI, ":kzalloc failed for rsp, size:%lu\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> net/kparser/kparser.h:414:26: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
     414 |                 pr_debug("kParser:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);   \
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:347:21: note: in definition of macro 'pr_fmt'
     347 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:581:9: note: in expansion of macro 'dynamic_pr_debug'
     581 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   net/kparser/kparser.h:414:17: note: in expansion of macro 'pr_debug'
     414 |                 pr_debug("kParser:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);   \
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:678:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     678 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI, ":kzalloc failed for rsp, size:%lu\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   net/kparser/kparser_cmds.c: In function 'kparser_init':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:480:9: note: in expansion of macro 'printk'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   include/linux/printk.h:480:16: note: in expansion of macro 'KERN_ALERT'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   net/kparser/kparser.h:410:17: note: in expansion of macro 'pr_alert'
     410 |                 pr_alert("kParser:DATA:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);\
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:715:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     715 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:480:9: note: in expansion of macro 'printk'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   include/linux/printk.h:480:16: note: in expansion of macro 'KERN_ALERT'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   net/kparser/kparser.h:410:17: note: in expansion of macro 'pr_alert'
     410 |                 pr_alert("kParser:DATA:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);\
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:715:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     715 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:480:9: note: in expansion of macro 'printk'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   include/linux/printk.h:480:16: note: in expansion of macro 'KERN_ALERT'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   net/kparser/kparser.h:412:17: note: in expansion of macro 'pr_alert'
     412 |                 pr_alert("kParser:CLI:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);\
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:715:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     715 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:480:9: note: in expansion of macro 'printk'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   include/linux/printk.h:480:16: note: in expansion of macro 'KERN_ALERT'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   net/kparser/kparser.h:412:17: note: in expansion of macro 'pr_alert'
     412 |                 pr_alert("kParser:CLI:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);\
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:715:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     715 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> net/kparser/kparser.h:414:26: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     414 |                 pr_debug("kParser:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);   \
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:347:21: note: in definition of macro 'pr_fmt'
     347 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:581:9: note: in expansion of macro 'dynamic_pr_debug'
     581 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   net/kparser/kparser.h:414:17: note: in expansion of macro 'pr_debug'
     414 |                 pr_debug("kParser:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);   \
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:715:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     715 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   net/kparser/kparser.h:414:26: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
     414 |                 pr_debug("kParser:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);   \
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:347:21: note: in definition of macro 'pr_fmt'
     347 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:581:9: note: in expansion of macro 'dynamic_pr_debug'
     581 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   net/kparser/kparser.h:414:17: note: in expansion of macro 'pr_debug'
     414 |                 pr_debug("kParser:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);   \
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:715:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     715 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   net/kparser/kparser_cmds.c: In function 'kparser_config_handler_preprocess':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:480:9: note: in expansion of macro 'printk'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   include/linux/printk.h:480:16: note: in expansion of macro 'KERN_ALERT'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   net/kparser/kparser.h:410:17: note: in expansion of macro 'pr_alert'
     410 |                 pr_alert("kParser:DATA:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);\
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:796:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     796 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI, "[%p %lu %p %p %p %lu %d]\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 9 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:480:9: note: in expansion of macro 'printk'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   include/linux/printk.h:480:16: note: in expansion of macro 'KERN_ALERT'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   net/kparser/kparser.h:410:17: note: in expansion of macro 'pr_alert'
     410 |                 pr_alert("kParser:DATA:[%s:%d]" FMT, __func__, __LINE__, ## ARGS);\
         |                 ^~~~~~~~
   net/kparser/kparser_cmds.c:796:17: note: in expansion of macro 'KPARSER_KMOD_DEBUG_PRINT'
     796 |                 KPARSER_KMOD_DEBUG_PRINT(KPARSER_F_DEBUG_CLI, "[%p %lu %p %p %p %lu %d]\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:480:9: note: in expansion of macro 'printk'
     480 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
..


vim +117 include/linux/netlink.h

2d4bc93368f5a0 Johannes Berg 2017-04-12  107  
51c352bdbcd23d Edward Cree   2022-10-18  108  /* We splice fmt with %s at each end even in the snprintf so that both calls
51c352bdbcd23d Edward Cree   2022-10-18  109   * can use the same string constant, avoiding its duplication in .ro
51c352bdbcd23d Edward Cree   2022-10-18  110   */
51c352bdbcd23d Edward Cree   2022-10-18  111  #define NL_SET_ERR_MSG_FMT(extack, fmt, args...) do {			       \
51c352bdbcd23d Edward Cree   2022-10-18  112  	struct netlink_ext_ack *__extack = (extack);			       \
51c352bdbcd23d Edward Cree   2022-10-18  113  									       \
51c352bdbcd23d Edward Cree   2022-10-18  114  	if (!__extack)							       \
51c352bdbcd23d Edward Cree   2022-10-18  115  		break;							       \
51c352bdbcd23d Edward Cree   2022-10-18  116  	if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,	       \
51c352bdbcd23d Edward Cree   2022-10-18 @117  		     "%s" fmt "%s", "", ##args, "") >=			       \
51c352bdbcd23d Edward Cree   2022-10-18  118  	    NETLINK_MAX_FMTMSG_LEN)					       \
51c352bdbcd23d Edward Cree   2022-10-18  119  		net_warn_ratelimited("%s" fmt "%s", "truncated extack: ",      \
51c352bdbcd23d Edward Cree   2022-10-18  120  				     ##args, "\n");			       \
51c352bdbcd23d Edward Cree   2022-10-18  121  									       \
51c352bdbcd23d Edward Cree   2022-10-18  122  	do_trace_netlink_extack(__extack->_msg_buf);			       \
51c352bdbcd23d Edward Cree   2022-10-18  123  									       \
51c352bdbcd23d Edward Cree   2022-10-18  124  	__extack->_msg = __extack->_msg_buf;				       \
51c352bdbcd23d Edward Cree   2022-10-18  125  } while (0)
51c352bdbcd23d Edward Cree   2022-10-18  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
