Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A41FD9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="go4zBBLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698068634; x=1729604634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K4UJqObl6zJgjmVsgkJezBhlvPx6YnIR7t/szL/xtbA=;
  b=go4zBBLHRHfUPP+fbHrp56lLqjWE6CCa1s3eBkkoVk5+xU28ZX244UTU
   B5vR7TWIpq2ZZ/WDg0jz4lxzH8snZUxwRzYVQeXBhiVD8V/m7iKGOFTm1
   vJaKPslLAx3zrIBSqCUt2kgl97Wmy9e/P0IJjPzPVSa7PgsQ5vn8XszsX
   2qykJlyxL5Z29Mpw7YEIzl5SppzbJ2MgWnSJsrsJbVXw8SwTdMsLLf6JO
   QU3WbfwdCGRMIQivqToOin2D6GYxKbXtOVA0ARokV+bt1XmZHDPBClGRe
   wkY9VfRQFECvENs5NSsNQIEzYOzkVIXwMYTXx/yl6xL4jzyoy+Lj5q+Tc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="367070457"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="367070457"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 06:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="901802816"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="901802816"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2023 06:41:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quvDi-0006wX-1u;
	Mon, 23 Oct 2023 13:43:50 +0000
Date: Mon, 23 Oct 2023 21:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/3] drivers/md/dm-bow.c:793:6:
 warning: no previous prototype for function 'dm_bow_resume'
Message-ID: <202310232155.aAqK3uPH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   ac178987584017ed6d85752157b8af6ab3e429fa
commit: 88e27b17aab604fb2d486e538b2ef55cd967a430 [2/3] ANDROID: dm-bow: Fix 5.15 compatibility issue
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231023/202310232155.aAqK3uPH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310232155.aAqK3uPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310232155.aAqK3uPH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-bow.c:97:10: warning: no previous prototype for function 'range_top' [-Wmissing-prototypes]
   sector_t range_top(struct bow_range *br)
            ^
   drivers/md/dm-bow.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   sector_t range_top(struct bow_range *br)
   ^
   static 
   drivers/md/dm-bow.c:103:5: warning: no previous prototype for function 'range_size' [-Wmissing-prototypes]
   u64 range_size(struct bow_range *br)
       ^
   drivers/md/dm-bow.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 range_size(struct bow_range *br)
   ^
   static 
   drivers/md/dm-bow.c:148:6: warning: no previous prototype for function 'add_before' [-Wmissing-prototypes]
   void add_before(struct rb_root *ranges, struct bow_range *new_br,
        ^
   drivers/md/dm-bow.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void add_before(struct rb_root *ranges, struct bow_range *new_br,
   ^
   static 
>> drivers/md/dm-bow.c:793:6: warning: no previous prototype for function 'dm_bow_resume' [-Wmissing-prototypes]
   void dm_bow_resume(struct dm_target *ti)
        ^
   drivers/md/dm-bow.c:793:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_bow_resume(struct dm_target *ti)
   ^
   static 
   drivers/md/dm-bow.c:1103:5: warning: no previous prototype for function 'remap_unless_illegal_trim' [-Wmissing-prototypes]
   int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
       ^
   drivers/md/dm-bow.c:1103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
   ^
   static 
   drivers/md/dm-bow.c:1259:5: warning: no previous prototype for function 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
   int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
       ^
   drivers/md/dm-bow.c:1259:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
   ^
   static 
   drivers/md/dm-bow.c:1292:12: warning: no previous prototype for function 'dm_bow_init' [-Wmissing-prototypes]
   int __init dm_bow_init(void)
              ^
   drivers/md/dm-bow.c:1292:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init dm_bow_init(void)
   ^
   static 
   drivers/md/dm-bow.c:1301:6: warning: no previous prototype for function 'dm_bow_exit' [-Wmissing-prototypes]
   void dm_bow_exit(void)
        ^
   drivers/md/dm-bow.c:1301:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_bow_exit(void)
   ^
   static 
   8 warnings generated.


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
