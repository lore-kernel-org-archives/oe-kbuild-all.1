Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269F07E5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 01:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675302424; x=1706838424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjiXyCXeq3PWS50hHT4LKkvZZiKI94H3t1r4+4cV70g=;
  b=jung+LzZpoDx2iwJuDwziOedjv5XGigtco8Imvj8cA8H+u7CJSyiRGH1
   OavLAM9A8777l1dRkkyTl/7tM4QI9zWdZxeWu79yg2zIuMx6Q3OaVgXLl
   d11TMdqtwFkPrivVuYEwuL5k2UQhR1ZxcUyIqh+tP5LJCkMIGrbhAjwYK
   Q9SGoQFhkidLlo+/EWwxG7EvFXpLaHJUqM7L98/cWyF0a+gBTGVLpM3ov
   Kp/CG8n6gv/yh4DzX0la+Vc7nB5bNtrytkpVWjtdemYdcyz2hlBrRKwi6
   GGOGfpTdOqxm7VZerUF6NvgP6NfGwuqoxiBfgS7J004llTSknrZWyhUVY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="329615940"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="329615940"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 17:47:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="733773306"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="733773306"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2023 17:47:02 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNOgn-00060W-2G;
	Thu, 02 Feb 2023 01:47:01 +0000
Date: Thu, 2 Feb 2023 09:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/3] drivers/md/dm-bow.c:793:6:
 warning: no previous prototype for 'dm_bow_resume'
Message-ID: <202302020929.ZpQJbB95-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   7a7986f840b09a4a80a6c042bb9316b71ef37b61
commit: f6908a0d69bb0afccc6e3ddbc1876b5005733fa7 [2/3] ANDROID: dm-bow: Fix 5.15 compatibility issue
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302020929.ZpQJbB95-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-5.15
        git checkout f6908a0d69bb0afccc6e3ddbc1876b5005733fa7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/md/dm-bow.c:97:10: warning: no previous prototype for 'range_top' [-Wmissing-prototypes]
      97 | sector_t range_top(struct bow_range *br)
         |          ^~~~~~~~~
   drivers/md/dm-bow.c:103:5: warning: no previous prototype for 'range_size' [-Wmissing-prototypes]
     103 | u64 range_size(struct bow_range *br)
         |     ^~~~~~~~~~
   drivers/md/dm-bow.c:148:6: warning: no previous prototype for 'add_before' [-Wmissing-prototypes]
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         |      ^~~~~~~~~~
>> drivers/md/dm-bow.c:793:6: warning: no previous prototype for 'dm_bow_resume' [-Wmissing-prototypes]
     793 | void dm_bow_resume(struct dm_target *ti)
         |      ^~~~~~~~~~~~~
   drivers/md/dm-bow.c:1103:5: warning: no previous prototype for 'remap_unless_illegal_trim' [-Wmissing-prototypes]
    1103 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c: In function 'dm_bow_map':
   drivers/md/dm-bow.c:1139:51: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1139 |                                 /* pass-through */;
         |                                                   ^
   drivers/md/dm-bow.c:1146:51: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1146 |                                 /* pass-through */;
         |                                                   ^
   drivers/md/dm-bow.c: At top level:
   drivers/md/dm-bow.c:1259:5: warning: no previous prototype for 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
    1259 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:1292:12: warning: no previous prototype for 'dm_bow_init' [-Wmissing-prototypes]
    1292 | int __init dm_bow_init(void)
         |            ^~~~~~~~~~~
   drivers/md/dm-bow.c:1301:6: warning: no previous prototype for 'dm_bow_exit' [-Wmissing-prototypes]
    1301 | void dm_bow_exit(void)
         |      ^~~~~~~~~~~


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
https://github.com/intel/lkp-tests
