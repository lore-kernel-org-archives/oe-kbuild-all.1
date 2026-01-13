Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697EC36D4F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768334327; cv=none; b=AQ/kvLiv3Fh3REKNGRMCBGn8Wxo/gOA+oiPwwahabCq6RkV/SnJFYVmk4Ky9ckqeQLkdw4d5ChPfdjf1rX0GmEQvSKmN+XVLgjhl2zv/bQeZJ7nDI4wyvJOQmxRfmU3fW7lzG+PQMFFrrExTNerCqLVBxnoSxEK4P1gHZfmokmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768334327; c=relaxed/simple;
	bh=LdstebuAq/i7wlc+AuN/qA4MWF4e2oOCkaDTu2aPhOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IJGJuxtn5EHcK3Vpa+ivQ4uSHB3zxpNMM2YhEgjM50vyjM6XZZhq3EfsYSlzY6tfg7EvfkxtqUXqYgqCYfmJDD9cQh3l+eCd9jaEUUuXdWkeEJW1/JqL1GjzV+FXFnCmv1kqgCOSJIbu1yhmyza+2ZC8M6Otnr4xtPaJjUVCwKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJlh53I1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJlh53I1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768334325; x=1799870325;
  h=date:from:to:cc:subject:message-id;
  bh=LdstebuAq/i7wlc+AuN/qA4MWF4e2oOCkaDTu2aPhOs=;
  b=hJlh53I1SYWBvQmkORvgRKroN8SvvtLjBossnI7EityfZ3fLjHSOVKVR
   gbN3QulpkZWbR/HWoDwen3HWlLZsvapve9CKyMMYxdVAKF5taFLHtulp8
   IaFXXEFbb/npe21JgPgI7+Tq7bXWuf5L2swElNPCBddd8bCwIhbp9jCVP
   pDwZkNE9m3DQO531scl4/dDuufBfa40RACE+McFAlSDC+RRAfVZXRo2cR
   p3o9S9OkWkHLsvRtfqIunHQpXpz5NKhuTG4tp8eLuyfxTtnouXLTl5GGK
   hqSXnuK5Q4dEe3MM/ba1h8Sud3uMIVRv4AReIjnSobB/If37Tu4HIVM3m
   g==;
X-CSE-ConnectionGUID: l9SkCTGKTA6BzsDNXM+/xA==
X-CSE-MsgGUID: fK+hNpX4TIOSVuuYAOEYsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95103716"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95103716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:58:42 -0800
X-CSE-ConnectionGUID: jOcVFtRfQzCNU2PP0ZXGmg==
X-CSE-MsgGUID: p4PHPjk7Q5ah+/wabTepRQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 11:58:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfkXH-00000000FJB-0Tnt;
	Tue, 13 Jan 2026 19:58:39 +0000
Date: Wed, 14 Jan 2026 03:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/android/debug_kinfo.c:163:30: error: offsetof of incomplete type
 'struct module'
Message-ID: <202601140318.006TTIDd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0954c27bd6794b82681041439dd14bcc1f51c378
commit: bf309bfecfed8d40a870a96a53d3c3c4448e67bf [2/2] ANDROID: gki_defconfig: enable debug_kinfo
config: arm-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140318.006TTIDd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140318.006TTIDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140318.006TTIDd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:148:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:366:9: note: previous definition is here
     366 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/android/debug_kinfo.c:10:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2177:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/android/debug_kinfo.c:163:30: error: offsetof of incomplete type 'struct module'
     163 |         info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
         |                                     ^        ~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
     348 | struct module;
         |        ^
   2 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +163 drivers/android/debug_kinfo.c

1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  @10  #include <linux/kallsyms.h>
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   11  #include <linux/vmalloc.h>
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   12  #include <linux/module.h>
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   13  #include <linux/of_address.h>
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   14  #include <linux/of_reserved_mem.h>
f0c48487a5a7ab drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-26   15  #include <linux/pgtable.h>
107e653168387d drivers/staging/android/debug_kinfo.c Jone Chou     2021-09-10   16  #include <asm/module.h>
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   17  #include "debug_kinfo.h"
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   18  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   19  /*
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   20   * These will be re-linked against their real values
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   21   * during the second link stage.
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   22   */
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   23  extern const unsigned long kallsyms_addresses[] __weak;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   24  extern const int kallsyms_offsets[] __weak;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   25  extern const u8 kallsyms_names[] __weak;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   26  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   27  /*
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   28   * Tell the compiler that the count isn't in the small data section if the arch
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   29   * has one (eg: FRV).
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   30   */
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   31  extern const unsigned int kallsyms_num_syms __weak
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   32  __section(".rodata");
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   33  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   34  extern const unsigned long kallsyms_relative_base __weak
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   35  __section(".rodata");
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   36  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   37  extern const u8 kallsyms_token_table[] __weak;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   38  extern const u16 kallsyms_token_index[] __weak;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   39  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   40  extern const unsigned int kallsyms_markers[] __weak;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   41  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   42  static void *all_info_addr;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   43  static u32 all_info_size;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   44  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   45  static void update_kernel_all_info(struct kernel_all_info *all_info)
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   46  {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   47  	int index;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   48  	struct kernel_info *info;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   49  	u32 *checksum_info;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   50  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   51  	all_info->magic_number = DEBUG_KINFO_MAGIC;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   52  	all_info->combined_checksum = 0;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   53  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   54  	info = &(all_info->info);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   55  	checksum_info = (u32 *)info;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   56  	for (index = 0; index < sizeof(*info) / sizeof(u32); index++)
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   57  		all_info->combined_checksum ^= checksum_info[index];
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   58  }
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   59  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   60  static int build_info_set(const char *str, const struct kernel_param *kp)
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   61  {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   62  	struct kernel_all_info *all_info;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   63  	size_t build_info_size;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   64  	int ret = 0;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   65  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   66  	if (all_info_addr == 0 || all_info_size == 0) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   67  		ret = -EPERM;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   68  		goto Exit;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   69  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   70  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   71  	all_info = (struct kernel_all_info *)all_info_addr;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   72  	build_info_size = sizeof(all_info->info.build_info);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   73  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   74  	memcpy(&all_info->info.build_info, str, min(build_info_size - 1, strlen(str)));
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   75  	update_kernel_all_info(all_info);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   76  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   77  	if (strlen(str) > build_info_size) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   78  		pr_warn("%s: Build info buffer (len: %zd) can't hold entire string '%s'\n",
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   79  				__func__, build_info_size, str);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   80  		ret = -ENOMEM;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   81  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   82  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   83  Exit:
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   84  	return ret;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   85  }
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   86  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   87  static const struct kernel_param_ops build_info_op = {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   88  	.set = build_info_set,
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   89  };
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   90  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   91  module_param_cb(build_info, &build_info_op, NULL, 0200);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   92  MODULE_PARM_DESC(build_info, "Write build info to field 'build_info' of debug kinfo.");
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   93  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   94  static int debug_kinfo_probe(struct platform_device *pdev)
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   95  {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   96  	struct device_node *mem_region;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   97  	struct reserved_mem *rmem;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   98  	struct kernel_all_info *all_info;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   99  	struct kernel_info *info;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  100  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  101  	mem_region = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  102  	if (!mem_region) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  103  		dev_warn(&pdev->dev, "no such memory-region\n");
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  104  		return -ENODEV;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  105  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  106  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  107  	rmem = of_reserved_mem_lookup(mem_region);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  108  	if (!rmem) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  109  		dev_warn(&pdev->dev, "no such reserved mem of node name %s\n",
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  110  				pdev->dev.of_node->name);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  111  		return -ENODEV;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  112  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  113  
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  114  	/* Need to wait for reserved memory to be mapped */
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  115  	if (!rmem->priv) {
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  116  		return -EPROBE_DEFER;
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  117  	}
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  118  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  119  	if (!rmem->base || !rmem->size) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  120  		dev_warn(&pdev->dev, "unexpected reserved memory\n");
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  121  		return -EINVAL;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  122  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  123  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  124  	if (rmem->size < sizeof(struct kernel_all_info)) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  125  		dev_warn(&pdev->dev, "unexpected reserved memory size\n");
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  126  		return -EINVAL;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  127  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  128  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  129  	all_info_addr = rmem->priv;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  130  	all_info_size = rmem->size;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  131  
440b6d482f0c06 drivers/staging/android/debug_kinfo.c Jone Chou     2021-04-21  132  	memset(all_info_addr, 0, sizeof(struct kernel_all_info));
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  133  	all_info = (struct kernel_all_info *)all_info_addr;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  134  	info = &(all_info->info);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  135  	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  136  	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  137  	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  138  	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  139  	info->num_syms = kallsyms_num_syms;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  140  	info->name_len = KSYM_NAME_LEN;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  141  	info->bit_per_long = BITS_PER_LONG;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  142  	info->module_name_len = MODULE_NAME_LEN;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  143  	info->symbol_len = KSYM_SYMBOL_LEN;
3777f3811a7f55 drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  144  	if (!info->enabled_base_relative)
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  145  		info->_addresses_pa = (u64)__pa_symbol((volatile void *)kallsyms_addresses);
3777f3811a7f55 drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  146  	else {
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  147  		info->_relative_pa = (u64)__pa_symbol((volatile void *)kallsyms_relative_base);
3777f3811a7f55 drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  148  		info->_offsets_pa = (u64)__pa_symbol((volatile void *)kallsyms_offsets);
3777f3811a7f55 drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  149  	}
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  150  	info->_stext_pa = (u64)__pa_symbol(_stext);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  151  	info->_etext_pa = (u64)__pa_symbol(_etext);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  152  	info->_sinittext_pa = (u64)__pa_symbol(_sinittext);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  153  	info->_einittext_pa = (u64)__pa_symbol(_einittext);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  154  	info->_end_pa = (u64)__pa_symbol(_end);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  155  	info->_names_pa = (u64)__pa_symbol((volatile void *)kallsyms_names);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  156  	info->_token_table_pa = (u64)__pa_symbol((volatile void *)kallsyms_token_table);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  157  	info->_token_index_pa = (u64)__pa_symbol((volatile void *)kallsyms_token_index);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  158  	info->_markers_pa = (u64)__pa_symbol((volatile void *)kallsyms_markers);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  159  	info->thread_size = THREAD_SIZE;
a806a7915c0377 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-21  160  	info->swapper_pg_dir_pa = (u64)__pa_symbol(swapper_pg_dir);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  161  	strlcpy(info->last_uts_release, init_utsname()->release, sizeof(info->last_uts_release));
180f8b73199bd6 drivers/staging/android/debug_kinfo.c Jone Chou     2020-12-21  162  	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
180f8b73199bd6 drivers/staging/android/debug_kinfo.c Jone Chou     2020-12-21 @163  	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
b8d72cb07e32f7 drivers/android/debug_kinfo.c         Kuan-Ying Lee 2023-12-28  164  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  165  	update_kernel_all_info(all_info);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  166  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  167  	return 0;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  168  }
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  169  

:::::: The code at line 163 was first introduced by commit
:::::: 180f8b73199bd665c03ff43853170280fc82e02d ANDROID: kernel: add module info for debug_kinfo

:::::: TO: Jone Chou <jonechou@google.com>
:::::: CC: Jone Chou <jonechou@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
