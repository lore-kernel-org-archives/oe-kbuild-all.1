Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DED6995E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520603; cv=none; b=cY4xnyFNtth4P3UIXDKaITDkA60OkFM61OgdJ0vbzl+h7xquPzV7bpVkPx6hlDFWsCdgzwYmDSm3LK+IqulJEJ/BWZSy461MyD9R+O3uoMgk57M6hjZT4VKdyghbkmABKbpR4woooVXXEjpAprD1eFrVm9sdKciV0WKocPHCRCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520603; c=relaxed/simple;
	bh=SN0un6CjqjbhoffxOsbDmsrPHj2oiNxvye4xBVD5LD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNn+R0auo268QMPWJJ4oMBaI25+32dK7A+ed7YEpBtURepwEZXBozGq2KxK/Md4UcmFlt35a7lkMtb2UKV8/1bxT+VF7tZkxVz8I+ebS+j70hNi8n6IgG/y844Xq2LRoQLCK+sFE/yvGcGWlRNRodpE6C768IOX7h/tArai4qRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVQZ/YD9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVQZ/YD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708520601; x=1740056601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SN0un6CjqjbhoffxOsbDmsrPHj2oiNxvye4xBVD5LD0=;
  b=VVQZ/YD9ydOPGLl/i13/VRZ2cqcO/IoGEhGeC9rpmG4b2EhH1g8zs6Wl
   tQE1s9XzD9PPZ/qXCJSyarcR9K/oDqtEHL+Tz6r7rkwN5eQt9aYy254a+
   AyY2s4gRhFFnqrGH3rEJcqGEpiDZWP26gM6L5k8oPncZTS65gFh6UzPys
   VdKU3DCDmHt69mvS3XaMb3iSXO1O37lxmZoRQzrtMa2O8783yOD6DOTFD
   0MqZh8mshhl9VGTdpKWCrTbqcMqB7U2rLokmePIj/bBon6uFlUQZRMb2g
   57cTTMpfWqsUfRuR5P3scpafqzRoa+gNavEbIKXiWmoXFzZBwvyeWw6OH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5631961"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5631961"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 05:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5103367"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2024 05:03:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcmFi-0005Kk-07;
	Wed, 21 Feb 2024 13:03:10 +0000
Date: Wed, 21 Feb 2024 21:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: include/linux/kernel.h:47:32: error: invalid application of 'sizeof'
 to incomplete type 'const char * const[]'
Message-ID: <202402212058.LYBa3dl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.
date:   2 years, 11 months ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240221/202402212058.LYBa3dl5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402212058.LYBa3dl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402212058.LYBa3dl5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/kernel/process.c:70:6: warning: no previous prototype for '_pm_power_off' [-Wmissing-prototypes]
      70 | void _pm_power_off(void)
         |      ^~~~~~~~~~~~~
   arch/arm64/kernel/process.c:269:6: warning: no previous prototype for '__show_regs' [-Wmissing-prototypes]
     269 | void __show_regs(struct pt_regs *regs)
         |      ^~~~~~~~~~~
   arch/arm64/kernel/process.c:361:5: warning: no previous prototype for 'arch_dup_task_struct' [-Wmissing-prototypes]
     361 | int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/process.c:528:41: warning: no previous prototype for '__switch_to' [-Wmissing-prototypes]
     528 | __notrace_funcgraph struct task_struct *__switch_to(struct task_struct *prev,
         |                                         ^~~~~~~~~~~
   arch/arm64/kernel/process.c:668:25: warning: no previous prototype for 'arm64_preempt_schedule_irq' [-Wmissing-prototypes]
     668 | asmlinkage void __sched arm64_preempt_schedule_irq(void)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   arch/arm64/kernel/cpuinfo.c:40:43: warning: initialized field overwritten [-Woverride-init]
      40 |         [ICACHE_POLICY_VIPT]            = "VIPT",
         |                                           ^~~~~~
   arch/arm64/kernel/cpuinfo.c:40:43: note: (near initialization for 'icache_policy_str[2]')
   arch/arm64/kernel/cpuinfo.c:41:43: warning: initialized field overwritten [-Woverride-init]
      41 |         [ICACHE_POLICY_PIPT]            = "PIPT",
         |                                           ^~~~~~
   arch/arm64/kernel/cpuinfo.c:41:43: note: (near initialization for 'icache_policy_str[3]')
   arch/arm64/kernel/cpuinfo.c:42:43: warning: initialized field overwritten [-Woverride-init]
      42 |         [ICACHE_POLICY_VPIPT]           = "VPIPT",
         |                                           ^~~~~~~
   arch/arm64/kernel/cpuinfo.c:42:43: note: (near initialization for 'icache_policy_str[0]')
   arch/arm64/kernel/cpuinfo.c: In function 'c_show':
>> arch/arm64/kernel/cpuinfo.c:152:54: warning: '%s' directive argument is null [-Wformat-overflow=]
     152 |                         seq_printf(m, "model name\t: %s %s\n",
         |                                                      ^~
--
   In file included from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from mm/vmstat.c:13:
>> include/linux/kernel.h:47:32: error: invalid application of 'sizeof' to incomplete type 'const char * const[]'
      47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^
   mm/vmstat.c:1298:33: note: in expansion of macro 'ARRAY_SIZE'
    1298 | unsigned int vmstat_text_size = ARRAY_SIZE(vmstat_text);
         |                                 ^~~~~~~~~~
--
>> kernel/tkernel/netbind.c:77:37: warning: 'netbind_proc_ops' defined but not used [-Wunused-const-variable=]
      77 | static const struct file_operations netbind_proc_ops = {
         |                                     ^~~~~~~~~~~~~~~~
--
   kernel/tkernel/shield_mounts.c:225:5: warning: no previous prototype for 'shield_mounts_release' [-Wmissing-prototypes]
     225 | int shield_mounts_release(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/shield_mounts.c:229:37: warning: 'shield_mounts_proc_fops' defined but not used [-Wunused-const-variable=]
     229 | static const struct file_operations shield_mounts_proc_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~
--
>> kernel/tkernel/release_suffix.c:46:37: warning: 'release_suffix_proc_fops' defined but not used [-Wunused-const-variable=]
      46 | static const struct file_operations release_suffix_proc_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> kernel/tkernel/netatop/netatop.c:341:15: error: variable 'sockopts' has initializer but incomplete type
     341 | static struct nf_sockopt_ops sockopts = {
         |               ^~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:342:10: error: 'struct nf_sockopt_ops' has no member named 'pf'
     342 |         .pf             = PF_INET,
         |          ^~
   In file included from include/linux/skbuff.h:20,
                    from include/linux/netfilter.h:6,
                    from kernel/tkernel/netatop/netatop.c:87:
>> include/linux/socket.h:165:25: warning: excess elements in struct initializer
     165 | #define AF_INET         2       /* Internet IP Protocol         */
         |                         ^
   include/linux/socket.h:219:25: note: in expansion of macro 'AF_INET'
     219 | #define PF_INET         AF_INET
         |                         ^~~~~~~
   kernel/tkernel/netatop/netatop.c:342:27: note: in expansion of macro 'PF_INET'
     342 |         .pf             = PF_INET,
         |                           ^~~~~~~
   include/linux/socket.h:165:25: note: (near initialization for 'sockopts')
     165 | #define AF_INET         2       /* Internet IP Protocol         */
         |                         ^
   include/linux/socket.h:219:25: note: in expansion of macro 'AF_INET'
     219 | #define PF_INET         AF_INET
         |                         ^~~~~~~
   kernel/tkernel/netatop/netatop.c:342:27: note: in expansion of macro 'PF_INET'
     342 |         .pf             = PF_INET,
         |                           ^~~~~~~
>> kernel/tkernel/netatop/netatop.c:343:10: error: 'struct nf_sockopt_ops' has no member named 'get_optmin'
     343 |         .get_optmin     = NETATOP_BASE_CTL,
         |          ^~~~~~~~~~
   In file included from kernel/tkernel/netatop/netatop.c:105:
>> kernel/tkernel/netatop/netatop.h:29:33: warning: excess elements in struct initializer
      29 | #define NETATOP_BASE_CTL        15661
         |                                 ^~~~~
   kernel/tkernel/netatop/netatop.c:343:27: note: in expansion of macro 'NETATOP_BASE_CTL'
     343 |         .get_optmin     = NETATOP_BASE_CTL,
         |                           ^~~~~~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.h:29:33: note: (near initialization for 'sockopts')
      29 | #define NETATOP_BASE_CTL        15661
         |                                 ^~~~~
   kernel/tkernel/netatop/netatop.c:343:27: note: in expansion of macro 'NETATOP_BASE_CTL'
     343 |         .get_optmin     = NETATOP_BASE_CTL,
         |                           ^~~~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:344:10: error: 'struct nf_sockopt_ops' has no member named 'get_optmax'
     344 |         .get_optmax     = NETATOP_BASE_CTL+6,
         |          ^~~~~~~~~~
>> kernel/tkernel/netatop/netatop.h:29:33: warning: excess elements in struct initializer
      29 | #define NETATOP_BASE_CTL        15661
         |                                 ^~~~~
   kernel/tkernel/netatop/netatop.c:344:27: note: in expansion of macro 'NETATOP_BASE_CTL'
     344 |         .get_optmax     = NETATOP_BASE_CTL+6,
         |                           ^~~~~~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.h:29:33: note: (near initialization for 'sockopts')
      29 | #define NETATOP_BASE_CTL        15661
         |                                 ^~~~~
   kernel/tkernel/netatop/netatop.c:344:27: note: in expansion of macro 'NETATOP_BASE_CTL'
     344 |         .get_optmax     = NETATOP_BASE_CTL+6,
         |                           ^~~~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:345:10: error: 'struct nf_sockopt_ops' has no member named 'get'
     345 |         .get            = getsockopt,
         |          ^~~
>> kernel/tkernel/netatop/netatop.c:345:27: warning: excess elements in struct initializer
     345 |         .get            = getsockopt,
         |                           ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c:345:27: note: (near initialization for 'sockopts')
>> kernel/tkernel/netatop/netatop.c:346:10: error: 'struct nf_sockopt_ops' has no member named 'owner'
     346 |         .owner          = THIS_MODULE,
         |          ^~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from kernel/tkernel/netatop/netatop.c:85:
   include/linux/export.h:16:21: warning: excess elements in struct initializer
      16 | #define THIS_MODULE (&__this_module)
         |                     ^
   kernel/tkernel/netatop/netatop.c:346:27: note: in expansion of macro 'THIS_MODULE'
     346 |         .owner          = THIS_MODULE,
         |                           ^~~~~~~~~~~
   include/linux/export.h:16:21: note: (near initialization for 'sockopts')
      16 | #define THIS_MODULE (&__this_module)
         |                     ^
   kernel/tkernel/netatop/netatop.c:346:27: note: in expansion of macro 'THIS_MODULE'
     346 |         .owner          = THIS_MODULE,
         |                           ^~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gctaskexit':
   kernel/tkernel/netatop/netatop.c:1015:1: warning: old-style function definition [-Wold-style-definition]
    1015 | gctaskexit()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gcsockinfo':
   kernel/tkernel/netatop/netatop.c:1049:1: warning: old-style function definition [-Wold-style-definition]
    1049 | gcsockinfo()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gctaskinfo':
   kernel/tkernel/netatop/netatop.c:1259:1: warning: old-style function definition [-Wold-style-definition]
    1259 | gctaskinfo()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipesockinfo':
   kernel/tkernel/netatop/netatop.c:1332:1: warning: old-style function definition [-Wold-style-definition]
    1332 | wipesockinfo()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipetaskinfo':
   kernel/tkernel/netatop/netatop.c:1360:1: warning: old-style function definition [-Wold-style-definition]
    1360 | wipetaskinfo()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipetaskexit':
   kernel/tkernel/netatop/netatop.c:1388:1: warning: old-style function definition [-Wold-style-definition]
    1388 | wipetaskexit()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'init_module':
   kernel/tkernel/netatop/netatop.c:1673:1: warning: old-style function definition [-Wold-style-definition]
    1673 | init_module()
         | ^~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:1712:13: error: implicit declaration of function 'nf_register_sockopt' [-Werror=implicit-function-declaration]
    1712 |         if (nf_register_sockopt(&sockopts) < 0) {
         |             ^~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:1725:17: error: implicit declaration of function 'nf_unregister_sockopt' [-Werror=implicit-function-declaration]
    1725 |                 nf_unregister_sockopt(&sockopts);
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:1744:9: error: implicit declaration of function 'nf_register_net_hook' [-Werror=implicit-function-declaration]
    1744 |         nf_register_net_hook(&init_net, &hookin_ipv4);                  // register hook
         |         ^~~~~~~~~~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'cleanup_module':
   kernel/tkernel/netatop/netatop.c:1764:1: warning: old-style function definition [-Wold-style-definition]
    1764 | cleanup_module()
         | ^~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:1774:9: error: implicit declaration of function 'nf_unregister_net_hook'; did you mean 'unregister_netdev'? [-Werror=implicit-function-declaration]
    1774 |         nf_unregister_net_hook(&init_net, &hookin_ipv4);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         unregister_netdev
   kernel/tkernel/netatop/netatop.c: At top level:
>> kernel/tkernel/netatop/netatop.c:341:30: error: storage size of 'sockopts' isn't known
     341 | static struct nf_sockopt_ops sockopts = {
         |                              ^~~~~~~~
>> kernel/tkernel/netatop/netatop.c:349:31: warning: 'netatop_proc_fops' defined but not used [-Wunused-variable]
     349 | static struct file_operations netatop_proc_fops = {
         |                               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +47 include/linux/kernel.h

    42	
    43	/**
    44	 * ARRAY_SIZE - get the number of elements in array @arr
    45	 * @arr: array to be sized
    46	 */
  > 47	#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
