Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3E20F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684484902; x=1716020902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0EHfp11jvflqasRQ44A6T4gE6CI8AfL2uH69Y9naM1w=;
  b=cxTCwa3Uc0wsoo4Ax+zZVngur93kHSDCpFnbuditTmZKX1LjJ0zJM12/
   yX1FkfkGVAf3hYbmQAB8DA2zLHOzIQlltFyZJn+P+m+H/ePJjx19fk6Pi
   Olq6d2BjTwTxAm6bA8zwPDyJKMStMetoHn0QMCdMSzyhtHsFxkYV0jtTs
   2dzv5bQt1qOexofiVKy7CA1Hf8Qp1Lso+6Ap29WGegMOTI24sP9AQ87c0
   v3TYaEarkXzmu5Y61Cs7JneUUiyXBEzGFikBOLylYprN6Q83REhCLY3ga
   LOZn/zoHeQ2pdn/wh6YziFYxyrIkuTwkoDeFTrkQ6OA1bGcUPNQAAM0qZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="331922321"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="331922321"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="814640214"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="814640214"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 May 2023 01:28:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzvT1-000Ahy-1L;
	Fri, 19 May 2023 08:28:03 +0000
Date: Fri, 19 May 2023 16:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/3] drivers/md/dm-bow.c:793:6:
 warning: no previous prototype for function 'dm_bow_resume'
Message-ID: <202305191634.XAUVBoFH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   ddfd56a6adbcd1dde446f561e51b68e99e7a0d77
commit: 88e27b17aab604fb2d486e538b2ef55cd967a430 [2/3] ANDROID: dm-bow: Fix 5.15 compatibility issue
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230519/202305191634.XAUVBoFH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout 88e27b17aab604fb2d486e538b2ef55cd967a430
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305191634.XAUVBoFH-lkp@intel.com/

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
