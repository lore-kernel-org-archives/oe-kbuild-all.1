Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BEF2FB093
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765632947; cv=none; b=EPyqIIxZ/c310EDcix3mKdq6YqF7nydT03SdmGRlcqwYQUH5773zK9lrxqVwW9V8NmRqJnMQ+aoPcXmkSE5fr3BZts0szbx0qZK7l566zP/zc/5logI7tCZ9jcX51lFprMoWfKJGlmXozREuGy2x9aFPdbuuJqI6wf20I2hB2KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765632947; c=relaxed/simple;
	bh=F4zzT/dt2IajhsELpnZPuwxuyQUlOhJWxpPYQ7p12qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NRZhA7uljVEpUyJT/5dFrqWNnq9DH2BJxMimvLIxVoAuJP1izTQLDipMuYaJP6lNLN1Rr5bOgP6kx2PZFU1YyD86L0WI3gxvurWUpQ0e8erjGdEkYiOvQbH1RvSDY3yNQVO9xd9sbehxChRee5Zj639KjvNjHfOEpyNCr0BlKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVFCBEdP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVFCBEdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765632945; x=1797168945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4zzT/dt2IajhsELpnZPuwxuyQUlOhJWxpPYQ7p12qo=;
  b=XVFCBEdPT5iD2Tru60hyaCqyp6yhbDetIC91qpwZ+WKMjd32lnSmqJld
   WFohH3IclY3bt5yGvh+BaV1qpjC55kAvnLmw/b4Qh5RcLQTn7i6orEoF4
   dykXoz+Jj5gjGsYFXC5zQa/K+sRGogr1nnIp1O1759xwqkenSgQarx6zZ
   9oesGS918ASWPGoTYCQaDA8YSVBKThnV7NJ2FASvafVuGx0IL4PAy7MD5
   Udoj96H53sKMSeXIustIV7eYe4MmTXzh2jN/v3sDSMMdJBFFpMeCQTrri
   zuMUGecC6w0+9eQxietT9O5YphNazjFWztcHH4C93yIjHxI6s6DUakXEl
   w==;
X-CSE-ConnectionGUID: u2CyRh5iSsOy/TOLw1h42g==
X-CSE-MsgGUID: 8kcDuvymTh+qZYneMnTmcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67649606"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67649606"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:35:45 -0800
X-CSE-ConnectionGUID: GxKvh/stR6ObjuMhqcKoDw==
X-CSE-MsgGUID: TjwWO0FJSri5l60kHLibpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201804367"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Dec 2025 05:35:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPmf-000000007gU-27AE;
	Sat, 13 Dec 2025 13:35:41 +0000
Date: Sat, 13 Dec 2025 21:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/md/dm-bow.c:793:6: warning: no previous prototype for function
 'dm_bow_resume'
Message-ID: <202512132136.ig5csQZD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: d242fc9bf14a655afe36d65223e9e0d44d8ce636 [18/18] ANDROID: dm-bow: Fix 5.15 compatibility issue
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512132136.ig5csQZD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132136.ig5csQZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132136.ig5csQZD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm-bow.c:7:
   In file included from drivers/md/dm.h:14:
   In file included from include/linux/device-mapper.h:12:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:97:10: warning: no previous prototype for function 'range_top' [-Wmissing-prototypes]
      97 | sector_t range_top(struct bow_range *br)
         |          ^
   drivers/md/dm-bow.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | sector_t range_top(struct bow_range *br)
         | ^
         | static 
   drivers/md/dm-bow.c:103:5: warning: no previous prototype for function 'range_size' [-Wmissing-prototypes]
     103 | u64 range_size(struct bow_range *br)
         |     ^
   drivers/md/dm-bow.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | u64 range_size(struct bow_range *br)
         | ^
         | static 
   drivers/md/dm-bow.c:148:6: warning: no previous prototype for function 'add_before' [-Wmissing-prototypes]
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         |      ^
   drivers/md/dm-bow.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         | ^
         | static 
>> drivers/md/dm-bow.c:793:6: warning: no previous prototype for function 'dm_bow_resume' [-Wmissing-prototypes]
     793 | void dm_bow_resume(struct dm_target *ti)
         |      ^
   drivers/md/dm-bow.c:793:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     793 | void dm_bow_resume(struct dm_target *ti)
         | ^
         | static 
   drivers/md/dm-bow.c:1103:5: warning: no previous prototype for function 'remap_unless_illegal_trim' [-Wmissing-prototypes]
    1103 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         |     ^
   drivers/md/dm-bow.c:1103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1103 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         | ^
         | static 
   drivers/md/dm-bow.c:1259:5: warning: no previous prototype for function 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
    1259 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         |     ^
   drivers/md/dm-bow.c:1259:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1259 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         | ^
         | static 
   drivers/md/dm-bow.c:1292:12: warning: no previous prototype for function 'dm_bow_init' [-Wmissing-prototypes]
    1292 | int __init dm_bow_init(void)
         |            ^
   drivers/md/dm-bow.c:1292:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1292 | int __init dm_bow_init(void)
         | ^
         | static 
   drivers/md/dm-bow.c:1301:6: warning: no previous prototype for function 'dm_bow_exit' [-Wmissing-prototypes]
    1301 | void dm_bow_exit(void)
         |      ^
   drivers/md/dm-bow.c:1301:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1301 | void dm_bow_exit(void)
         | ^
         | static 
   13 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/dm_bow_resume +793 drivers/md/dm-bow.c

   792	
 > 793	void dm_bow_resume(struct dm_target *ti)
   794	{
   795		struct mapped_device *md = dm_table_get_md(ti->table);
   796		struct bow_context *bc = ti->private;
   797		int ret;
   798	
   799		if (bc->kobj_holder.kobj.state_initialized)
   800			return;
   801	
   802		ret = kobject_init_and_add(&bc->kobj_holder.kobj, &bow_ktype,
   803					   &disk_to_dev(dm_disk(md))->kobj, "%s",
   804					   "bow");
   805		if (ret)
   806			ti->error = "Cannot create sysfs node";
   807	}
   808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
