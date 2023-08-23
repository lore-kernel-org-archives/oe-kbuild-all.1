Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A59A156E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692818815; x=1724354815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d1jkckCw6cTe7N164hdIGQcusEiCkJ9B9jhSgbhIbf0=;
  b=M2O/04Kx9vu1g03T3Gy6/UzIv+w8af0BZbCxytoWeGt3DjUEI+j6Fq3F
   u0kGZ00py3Rz0lRqLNU16n+1ublRn1uz4quUF++SZhsrKUEo/2564Pkyj
   sxpKLA+EfdFx8srT5tSRTyyHpFMx4vY0q1KtFSm0hZ8L+RSNGwUnsfwTn
   Bf0YBtt9ud7mDDc45mjtbFqRcYUsnelPfPeYqaACmmJN2NzwqWzDXhRHr
   Y4J2+CPMoMGRHiytTq3+Ccd3T8ydkD5K0ZQQ3VLAhp6z3pB6o2yszanaL
   /++1xt94cH78PZ2Aa+dJfA6HfHqW3SQCvXgBf1StxVLgpsXlATzw+uvkn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="359239036"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="359239036"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 12:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="771830935"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="771830935"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 12:26:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYtVF-0001Rw-06;
	Wed, 23 Aug 2023 19:26:53 +0000
Date: Thu, 24 Aug 2023 03:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/3] drivers/md/dm-bow.c:793:6:
 warning: no previous declaration for 'dm_bow_resume'
Message-ID: <202308240324.7PLDhFZ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   1ca64932b3f04590bebd57ecc68bb15c241e0e51
commit: 88e27b17aab604fb2d486e538b2ef55cd967a430 [2/3] ANDROID: dm-bow: Fix 5.15 compatibility issue
config: i386-randconfig-051-20230824 (https://download.01.org/0day-ci/archive/20230824/202308240324.7PLDhFZ6-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240324.7PLDhFZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240324.7PLDhFZ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-bow.c:97:10: warning: no previous declaration for 'range_top' [-Wmissing-declarations]
    sector_t range_top(struct bow_range *br)
             ^~~~~~~~~
   drivers/md/dm-bow.c:103:5: warning: no previous declaration for 'range_size' [-Wmissing-declarations]
    u64 range_size(struct bow_range *br)
        ^~~~~~~~~~
   drivers/md/dm-bow.c:148:6: warning: no previous declaration for 'add_before' [-Wmissing-declarations]
    void add_before(struct rb_root *ranges, struct bow_range *new_br,
         ^~~~~~~~~~
>> drivers/md/dm-bow.c:793:6: warning: no previous declaration for 'dm_bow_resume' [-Wmissing-declarations]
    void dm_bow_resume(struct dm_target *ti)
         ^~~~~~~~~~~~~
   drivers/md/dm-bow.c:1103:5: warning: no previous declaration for 'remap_unless_illegal_trim' [-Wmissing-declarations]
    int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c: In function 'dm_bow_map':
   drivers/md/dm-bow.c:1139:23: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
        /* pass-through */;
                          ^
   drivers/md/dm-bow.c:1146:23: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
        /* pass-through */;
                          ^
   drivers/md/dm-bow.c: At top level:
   drivers/md/dm-bow.c:1259:5: warning: no previous declaration for 'dm_bow_prepare_ioctl' [-Wmissing-declarations]
    int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
        ^~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:1292:12: warning: no previous declaration for 'dm_bow_init' [-Wmissing-declarations]
    int __init dm_bow_init(void)
               ^~~~~~~~~~~
   drivers/md/dm-bow.c:1301:6: warning: no previous declaration for 'dm_bow_exit' [-Wmissing-declarations]
    void dm_bow_exit(void)
         ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


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
