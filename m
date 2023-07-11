Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D6919BC5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689085927; x=1720621927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaPaAWp912yZxbzWUykOiv6d2w/8QgTlqNDfXdzEyjc=;
  b=XvYVCAVKlfN0r2tYnbyaWk1p3o83ljuA0fLeMgVYcylkE3lFUDpl+jna
   cNm5FfEjKlymwM01tJfvWO/dyQdnYTF96/HB0JbaTS9vjjZ+M5ClTJkgn
   2VcLgd6sseAlVUizkHAF+ezUmKzeDM7JkW7HkMT0gCCIHKNJFF0mguUxm
   8ATtuvqA6U3rojY6dYR80F6bJfHbf5h2/AE69iPg4SlRZAUbKRSBE3nsY
   tea0Yol8MWow/vxbe8MzVtp6C3MC/kYz5FeXZALwhf9T7HfRh1DnEByXY
   ZT/Lwhs0hO2L6ijOfZ6zhQjv3x1uBphVPardANChGYU805j8L7O/KoJC3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="364672928"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="364672928"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 07:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786639199"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="786639199"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jul 2023 07:32:04 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJEPL-0004rL-2r;
	Tue, 11 Jul 2023 14:32:03 +0000
Date: Tue, 11 Jul 2023 22:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hardik T Shah <hardik.t.shah@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [intel-lts:4.19/android_s 3785/30000]
 drivers/base/regmap/regmap-sdwint.c:215:16: warning: no previous prototype
 for 'regmap_init_sdwint'
Message-ID: <202307112259.oNpidw7Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   d86cf6f06c9415a617dd1a1e3c9dc081a3cf0f8f
commit: 2bb2777dedaa6adce2de5a407af68bce8dd6d727 [3785/30000] Soundwire squashed commits
config: i386-randconfig-i005-20230710 (https://download.01.org/0day-ci/archive/20230711/202307112259.oNpidw7Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112259.oNpidw7Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307112259.oNpidw7Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/idr.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:16,
                    from include/linux/sdw_bus.h:29,
                    from drivers/base/regmap/regmap-sdwint.c:22:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   include/linux/sdw_bus.h: At top level:
   include/linux/sdw_bus.h:549:24: warning: 'struct sdw_impl_def_intr_stat' declared inside parameter list will not be visible outside of this definition or declaration
     549 |                 struct sdw_impl_def_intr_stat *intr_status);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/base/regmap/regmap-sdwint.c:215:16: warning: no previous prototype for 'regmap_init_sdwint' [-Wmissing-prototypes]
     215 | struct regmap *regmap_init_sdwint(struct sdw_slv *sdw,
         |                ^~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-sdwint.c:241: warning: Function parameter or member 'sdw' not described in 'devm_regmap_init_sdwint'


vim +/regmap_init_sdwint +215 drivers/base/regmap/regmap-sdwint.c

   205	
   206	/**
   207	 * regmap_init_sdwint(): Initialise register map
   208	 *
   209	 * @sdw: Device that will be interacted with
   210	 * @config: Configuration for register map
   211	 *
   212	 * The return value will be an ERR_PTR() on error or a valid pointer to
   213	 * a struct regmap.
   214	 */
 > 215	struct regmap *regmap_init_sdwint(struct sdw_slv *sdw,
   216				       const struct regmap_config *config)
   217	{
   218		int ret;
   219	
   220		ret = regmap_sdw_config_check(config);
   221		if (ret)
   222			return ERR_PTR(ret);
   223	
   224		return regmap_init(&sdw->dev, &regmap_sdw, &sdw->dev, config);
   225	}
   226	EXPORT_SYMBOL_GPL(regmap_init_sdwint);
   227	
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
