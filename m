Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051925687
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njg/h9b1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703664381; x=1735200381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xGmFTote/HVWoZYtLbKLsi/mCl59bbd1QqBEnCmEjCA=;
  b=njg/h9b1DGxt/G3Z8AhEj12d6Ek3xx4kkucv5HhOujiFsq0/HSAuOGgR
   7t0UNb8FjSvlLxq/402u4SJM/Ln40+GnVRFE6AfIW5jpTUyp0e1rtdV3q
   OyHYN45uh/8m4l5xbC6L5gu4xaFsOSucOZWFGap9bvf/LXqf/2hX2s2vU
   leXw2049mGDcKRaa+4vXl7clSrTvJ6hu3DaZkIWlUKNbwYgg35vqklVcO
   WRdfyiiZKhvByyrr/lhmtRutaFx7M2CTvF5YIKeAOFuHu0V30+jVQlq7Q
   fzZSWekROoq333AqqbnRObtHQW3/9eeZXmgGF9q61dCCAfUxm1tENQBKJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="375920643"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="375920643"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 00:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="848623686"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="848623686"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2023 00:06:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIOvf-000FD1-0X;
	Wed, 27 Dec 2023 08:06:15 +0000
Date: Wed, 27 Dec 2023 16:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Yew, Chang Ching" <chang.ching.yew@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 2269/30000]
 drivers/media/pci/intel/ici/.././ici/ici-isys-csi2.h:103:1: warning:
 attribute 'packed' is ignored, place it after "struct" to apply attribute to
 type declaration
Message-ID: <202312271644.goEso8tT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   2b69ccfcb3117ca97de0f8d4e752e4776133afb8
commit: e8a0febb1fb5b45f60a2010a90050806aeea9173 [2269/30000] media: intel-ipu4: virtio: IPU virtio backend and frontend drivers base-code
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231227/202312271644.goEso8tT-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312271644.goEso8tT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312271644.goEso8tT-lkp@intel.com/

All warnings (new ones prefixed by >>):

      75 |                                              cnts, cnts | _QW_LOCKED) == cnts);
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   In file included from drivers/media/pci/intel/ici/ici-isys.c:6:
   In file included from include/linux/debugfs.h:15:
   In file included from include/linux/fs.h:235:
   In file included from include/linux/quota.h:40:
   In file included from include/linux/percpu_counter.h:16:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:984:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
     984 |         if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
         |                              ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   In file included from drivers/media/pci/intel/ici/ici-isys.c:10:
   In file included from include/linux/kthread.h:7:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:18:
   include/linux/percpu-refcount.h:183:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
     183 |                 this_cpu_add(*percpu_count, nr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:33: note: expanded from macro 'this_cpu_add'
     511 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:382:11: note: expanded from macro '__pcpu_size_call'
     382 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:372:1: note: expanded from here
     372 | this_cpu_add_8
         | ^
   arch/x86/include/asm/percpu.h:480:35: note: expanded from macro 'this_cpu_add_8'
     480 | #define this_cpu_add_8(pcp, val)                percpu_add_op((pcp), val)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:131:31: note: expanded from macro 'percpu_add_op'
     131 |                               ((val) == 1 || (val) == -1)) ?            \
         |                                               ~~~  ^  ~~
   In file included from drivers/media/pci/intel/ici/ici-isys.c:10:
   In file included from include/linux/kthread.h:7:
   In file included from include/linux/cgroup.h:28:
   In file included from include/linux/cgroup-defs.h:18:
   include/linux/percpu-refcount.h:282:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
     282 |                 this_cpu_sub(*percpu_count, nr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:521:33: note: expanded from macro 'this_cpu_sub'
     521 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:33: note: expanded from macro 'this_cpu_add'
     511 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:382:11: note: expanded from macro '__pcpu_size_call'
     382 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:226:1: note: expanded from here
     226 | this_cpu_add_8
         | ^
   arch/x86/include/asm/percpu.h:480:35: note: expanded from macro 'this_cpu_add_8'
     480 | #define this_cpu_add_8(pcp, val)                percpu_add_op((pcp), val)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:131:31: note: expanded from macro 'percpu_add_op'
     131 |                               ((val) == 1 || (val) == -1)) ?            \
         |                                               ~~~  ^  ~~
   In file included from drivers/media/pci/intel/ici/ici-isys.c:20:
   In file included from drivers/media/pci/intel/ici/../ipu.h:13:
   In file included from drivers/media/pci/intel/ici/../ipu-bus.h:10:
   In file included from include/linux/mm.h:26:
   In file included from include/linux/page_ref.h:7:
   include/linux/page-flags.h:162:21: warning: comparison of integers of different signs: 'const unsigned long' and 'long' [-Wsign-compare]
     162 |         return page->flags == PAGE_POISON_PATTERN;
         |                ~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/pci/intel/ici/ici-isys.c:20:
   In file included from drivers/media/pci/intel/ici/../ipu.h:13:
   In file included from drivers/media/pci/intel/ici/../ipu-bus.h:10:
   In file included from include/linux/mm.h:1167:
   include/linux/vmstat.h:156:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
     156 |         for_each_online_cpu(cpu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:778:36: note: expanded from macro 'for_each_online_cpu'
     778 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
     243 |                 (cpu) < nr_cpu_ids;)
         |                  ~~~  ^ ~~~~~~~~~~
   In file included from drivers/media/pci/intel/ici/ici-isys.c:20:
   In file included from drivers/media/pci/intel/ici/../ipu.h:13:
   In file included from drivers/media/pci/intel/ici/../ipu-bus.h:10:
   In file included from include/linux/mm.h:1167:
   include/linux/vmstat.h:221:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
     221 |         for_each_online_cpu(cpu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:778:36: note: expanded from macro 'for_each_online_cpu'
     778 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
     243 |                 (cpu) < nr_cpu_ids;)
         |                  ~~~  ^ ~~~~~~~~~~
   In file included from drivers/media/pci/intel/ici/ici-isys.c:29:
   In file included from drivers/media/pci/intel/ici/.././ici/ici-isys.h:22:
>> drivers/media/pci/intel/ici/.././ici/ici-isys-csi2.h:103:1: warning: attribute 'packed' is ignored, place it after "struct" to apply attribute to type declaration [-Wignored-attributes]
     103 | __packed struct ici_isys_mipi_packet_header {
         | ^
   include/linux/compiler_types.h:213:34: note: expanded from macro '__packed'
     213 | #define __packed                __attribute__((packed))
         |                                                ^
   In file included from drivers/media/pci/intel/ici/ici-isys.c:29:
   In file included from drivers/media/pci/intel/ici/.././ici/ici-isys.h:22:
   drivers/media/pci/intel/ici/.././ici/ici-isys-csi2.h:118:1: warning: attribute 'packed' is ignored, place it after "struct" to apply attribute to type declaration [-Wignored-attributes]
     118 | __packed struct ici_isys_csi2_monitor_message {
         | ^
   include/linux/compiler_types.h:213:34: note: expanded from macro '__packed'
     213 | #define __packed                __attribute__((packed))
         |                                                ^
   drivers/media/pci/intel/ici/ici-isys.c:350:17: error: no member named 'acpiname' in 'struct ipu_isys_subdev_info'
     350 |                 if (!sd_info->acpiname) {
         |                      ~~~~~~~  ^
   drivers/media/pci/intel/ici/ici-isys.c:356:47: error: no member named 'acpiname' in 'struct ipu_isys_subdev_info'
     356 |                 if (strcmp(dev_name(&client->dev), sd_info->acpiname)) {
         |                                                    ~~~~~~~  ^
   drivers/media/pci/intel/ici/ici-isys.c:358:38: error: no member named 'acpiname' in 'struct ipu_isys_subdev_info'
     358 |                                 dev_name(&client->dev), sd_info->acpiname);
         |                                                         ~~~~~~~  ^
   include/linux/device.h:1452:39: note: expanded from macro 'dev_dbg'
    1452 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:136:9: note: expanded from macro 'dynamic_dev_dbg'
     136 |                                   ##__VA_ARGS__);               \
         |                                     ^~~~~~~~~~~
   drivers/media/pci/intel/ici/ici-isys.c:368:20: error: no member named 'acpiname' in 'struct ipu_isys_subdev_info'
     368 |         else if (sd_info->acpiname) {
         |                  ~~~~~~~  ^
   drivers/media/pci/intel/ici/ici-isys.c:370:13: error: no member named 'acpiname' in 'struct ipu_isys_subdev_info'
     370 |                         sd_info->acpiname);
         |                         ~~~~~~~  ^
   include/linux/device.h:1452:39: note: expanded from macro 'dev_dbg'
    1452 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:136:9: note: expanded from macro 'dynamic_dev_dbg'
     136 |                                   ##__VA_ARGS__);               \
         |                                     ^~~~~~~~~~~
   drivers/media/pci/intel/ici/ici-isys.c:844:23: warning: comparison of integers of different signs: 'unsigned int' and 'int' [-Wsign-compare]
     844 |         for (i = 0; i < amount; i++) {
         |                     ~ ^ ~~~~~~
   drivers/media/pci/intel/ici/ici-isys.c:862:15: warning: comparison of integers of different signs: 'unsigned int' and 'int' [-Wsign-compare]
     862 |         if (i == amount)
         |             ~ ^  ~~~~~~
   drivers/media/pci/intel/ici/ici-isys.c:902:3: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
     902 |                 trace_printk("E|TMWK\n");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:719:3: note: expanded from macro 'trace_printk'
     719 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:733:30: note: expanded from macro 'do_trace_printk'
     733 |                 __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
         |                                            ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ici/ici-isys.c:902:3: note: treat the string as an argument to avoid this
   include/linux/kernel.h:719:3: note: expanded from macro 'trace_printk'
     719 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^
   include/linux/kernel.h:733:30: note: expanded from macro 'do_trace_printk'
     733 |                 __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
         |                                            ^
   drivers/media/pci/intel/ici/ici-isys.c:908:3: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
     908 |                 trace_printk("E|TMWK\n");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:719:3: note: expanded from macro 'trace_printk'
     719 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:733:30: note: expanded from macro 'do_trace_printk'
     733 |                 __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
         |                                            ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ici/ici-isys.c:908:3: note: treat the string as an argument to avoid this
   include/linux/kernel.h:719:3: note: expanded from macro 'trace_printk'
     719 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^
   include/linux/kernel.h:733:30: note: expanded from macro 'do_trace_printk'
     733 |                 __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
         |                                            ^
   drivers/media/pci/intel/ici/ici-isys.c:990:2: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
     990 |         trace_printk("E|TMWK\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:719:3: note: expanded from macro 'trace_printk'
     719 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:733:30: note: expanded from macro 'do_trace_printk'
     733 |                 __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
         |                                            ^~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ici/ici-isys.c:990:2: note: treat the string as an argument to avoid this
   include/linux/kernel.h:719:3: note: expanded from macro 'trace_printk'
     719 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^
   include/linux/kernel.h:733:30: note: expanded from macro 'do_trace_printk'
     733 |                 __trace_bprintk(_THIS_IP_, trace_printk_fmt, ##args);   \
         |                                            ^
   drivers/media/pci/intel/ici/ici-isys.c:1007:2: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
    1007 |         trace_printk("E|TMWK\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:719:3: note: expanded from macro 'trace_printk'
     719 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/device.h:16:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:14:
   In file included from include/linux/idr.h:16:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:984:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
     984 |         if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
         |                              ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   In file included from drivers/media/pci/intel/ici/ici-isys-csi2.c:6:
   In file included from drivers/media/pci/intel/ici/.././ici/ici-isys.h:17:
   In file included from drivers/media/pci/intel/ici/../ipu.h:13:
   In file included from drivers/media/pci/intel/ici/../ipu-bus.h:10:
   In file included from include/linux/mm.h:20:
   include/linux/percpu-refcount.h:183:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
     183 |                 this_cpu_add(*percpu_count, nr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:33: note: expanded from macro 'this_cpu_add'
     511 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:382:11: note: expanded from macro '__pcpu_size_call'
     382 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:167:1: note: expanded from here
     167 | this_cpu_add_8
         | ^
   arch/x86/include/asm/percpu.h:480:35: note: expanded from macro 'this_cpu_add_8'
     480 | #define this_cpu_add_8(pcp, val)                percpu_add_op((pcp), val)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:131:31: note: expanded from macro 'percpu_add_op'
     131 |                               ((val) == 1 || (val) == -1)) ?            \
         |                                               ~~~  ^  ~~
   In file included from drivers/media/pci/intel/ici/ici-isys-csi2.c:6:
   In file included from drivers/media/pci/intel/ici/.././ici/ici-isys.h:17:
   In file included from drivers/media/pci/intel/ici/../ipu.h:13:
   In file included from drivers/media/pci/intel/ici/../ipu-bus.h:10:
   In file included from include/linux/mm.h:20:
   include/linux/percpu-refcount.h:282:3: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
     282 |                 this_cpu_sub(*percpu_count, nr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:521:33: note: expanded from macro 'this_cpu_sub'
     521 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:33: note: expanded from macro 'this_cpu_add'
     511 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:382:11: note: expanded from macro '__pcpu_size_call'
     382 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:63:1: note: expanded from here
      63 | this_cpu_add_8
         | ^
   arch/x86/include/asm/percpu.h:480:35: note: expanded from macro 'this_cpu_add_8'
     480 | #define this_cpu_add_8(pcp, val)                percpu_add_op((pcp), val)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:131:31: note: expanded from macro 'percpu_add_op'
     131 |                               ((val) == 1 || (val) == -1)) ?            \
         |                                               ~~~  ^  ~~
   In file included from drivers/media/pci/intel/ici/ici-isys-csi2.c:6:
   In file included from drivers/media/pci/intel/ici/.././ici/ici-isys.h:17:
   In file included from drivers/media/pci/intel/ici/../ipu.h:13:
   In file included from drivers/media/pci/intel/ici/../ipu-bus.h:10:
   In file included from include/linux/mm.h:26:
   In file included from include/linux/page_ref.h:7:
   include/linux/page-flags.h:162:21: warning: comparison of integers of different signs: 'const unsigned long' and 'long' [-Wsign-compare]
     162 |         return page->flags == PAGE_POISON_PATTERN;
         |                ~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/pci/intel/ici/ici-isys-csi2.c:6:
   In file included from drivers/media/pci/intel/ici/.././ici/ici-isys.h:17:
   In file included from drivers/media/pci/intel/ici/../ipu.h:13:
   In file included from drivers/media/pci/intel/ici/../ipu-bus.h:10:
   In file included from include/linux/mm.h:1167:
   include/linux/vmstat.h:156:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
     156 |         for_each_online_cpu(cpu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:778:36: note: expanded from macro 'for_each_online_cpu'
     778 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
     243 |                 (cpu) < nr_cpu_ids;)
         |                  ~~~  ^ ~~~~~~~~~~
   In file included from drivers/media/pci/intel/ici/ici-isys-csi2.c:6:
   In file included from drivers/media/pci/intel/ici/.././ici/ici-isys.h:17:
   In file included from drivers/media/pci/intel/ici/../ipu.h:13:
   In file included from drivers/media/pci/intel/ici/../ipu-bus.h:10:
   In file included from include/linux/mm.h:1167:
   include/linux/vmstat.h:221:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
     221 |         for_each_online_cpu(cpu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:778:36: note: expanded from macro 'for_each_online_cpu'
     778 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
     243 |                 (cpu) < nr_cpu_ids;)
         |                  ~~~  ^ ~~~~~~~~~~
   In file included from drivers/media/pci/intel/ici/ici-isys-csi2.c:6:
   In file included from drivers/media/pci/intel/ici/.././ici/ici-isys.h:22:
>> drivers/media/pci/intel/ici/.././ici/ici-isys-csi2.h:103:1: warning: attribute 'packed' is ignored, place it after "struct" to apply attribute to type declaration [-Wignored-attributes]
     103 | __packed struct ici_isys_mipi_packet_header {
         | ^
   include/linux/compiler_types.h:213:34: note: expanded from macro '__packed'
     213 | #define __packed                __attribute__((packed))
         |                                                ^
   In file included from drivers/media/pci/intel/ici/ici-isys-csi2.c:6:
   In file included from drivers/media/pci/intel/ici/.././ici/ici-isys.h:22:
   drivers/media/pci/intel/ici/.././ici/ici-isys-csi2.h:118:1: warning: attribute 'packed' is ignored, place it after "struct" to apply attribute to type declaration [-Wignored-attributes]
     118 | __packed struct ici_isys_csi2_monitor_message {
         | ^
   include/linux/compiler_types.h:213:34: note: expanded from macro '__packed'
     213 | #define __packed                __attribute__((packed))
         |                                                ^
   drivers/media/pci/intel/ici/ici-isys-csi2.c:70:6: warning: no previous prototype for function 'ici_csi2_set_ffmt' [-Wmissing-prototypes]
      70 | void ici_csi2_set_ffmt(struct ici_isys_subdev *asd,
         |      ^
   drivers/media/pci/intel/ici/ici-isys-csi2.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | void ici_csi2_set_ffmt(struct ici_isys_subdev *asd,
         | ^
         | static 
   drivers/media/pci/intel/ici/ici-isys-csi2.c:168:5: warning: no previous prototype for function 'ici_isys_csi2_calc_timing' [-Wmissing-prototypes]
     168 | int ici_isys_csi2_calc_timing(struct ici_isys_csi2
         |     ^
   drivers/media/pci/intel/ici/ici-isys-csi2.c:168:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     168 | int ici_isys_csi2_calc_timing(struct ici_isys_csi2
         | ^
         | static 
   drivers/media/pci/intel/ici/ici-isys-csi2.c:323:5: warning: no previous prototype for function 'ici_csi2_set_stream' [-Wmissing-prototypes]
     323 | int ici_csi2_set_stream(
         |     ^
   drivers/media/pci/intel/ici/ici-isys-csi2.c:323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     323 | int ici_csi2_set_stream(
         | ^
         | static 
   15 warnings generated.
..


vim +103 drivers/media/pci/intel/ici/.././ici/ici-isys-csi2.h

82243dcb96a675 Yew, Chang Ching 2018-10-23   97  
82243dcb96a675 Yew, Chang Ching 2018-10-23   98  /*
82243dcb96a675 Yew, Chang Ching 2018-10-23   99   * This structure defines the MIPI packet header output
82243dcb96a675 Yew, Chang Ching 2018-10-23  100   * from IPU4 MIPI receiver. Due to hardware conversion,
82243dcb96a675 Yew, Chang Ching 2018-10-23  101   * this structure is not the same as defined in CSI-2 spec.
82243dcb96a675 Yew, Chang Ching 2018-10-23  102   */
82243dcb96a675 Yew, Chang Ching 2018-10-23 @103  __packed struct ici_isys_mipi_packet_header {
82243dcb96a675 Yew, Chang Ching 2018-10-23  104  	uint32_t word_count : 16,
82243dcb96a675 Yew, Chang Ching 2018-10-23  105  		 dtype : 13,
82243dcb96a675 Yew, Chang Ching 2018-10-23  106  		 sync : 2,
82243dcb96a675 Yew, Chang Ching 2018-10-23  107  		 stype : 1;
82243dcb96a675 Yew, Chang Ching 2018-10-23  108  	uint32_t sid : 4,
82243dcb96a675 Yew, Chang Ching 2018-10-23  109  		 port_id : 4,
82243dcb96a675 Yew, Chang Ching 2018-10-23  110  		 reserved : 23,
82243dcb96a675 Yew, Chang Ching 2018-10-23  111  		 odd_even : 1;
82243dcb96a675 Yew, Chang Ching 2018-10-23  112  };
82243dcb96a675 Yew, Chang Ching 2018-10-23  113  

:::::: The code at line 103 was first introduced by commit
:::::: 82243dcb96a6754968425b2a13d390b0c4803dab media: intel-ipu4: ici driver base code; WW43 firmware f61e455.

:::::: TO: Yew, Chang Ching <chang.ching.yew@intel.com>
:::::: CC: Pan, Kris <kris.pan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
