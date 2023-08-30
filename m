Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167431374
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 03:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693367729; x=1724903729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BINzG93AjWLvRRywILx1lgUZuYmxeUNJ/G+oIy8tdL0=;
  b=HgMTE7obnWnRL/cuLl0obRFag2k+5gPaArNygsbJMzRIigEmKaSe6dXf
   fo7KHOkNVYk+++GCPYEn1sbnUbo+l5nNuZrvMLXTOZ8jZmWhf/1x3L820
   B7x22b+Z9K/0CfdkuXCBrt038UUET+acqV0mUm9Ri49l2daFi/uXOe2Sm
   LuaT+3lcbBIHVQJ+aZ4quFNv7LE5f4BFEDQo7j76Qrtbnq2sh5/P9kphI
   Z4EnPoKbqrmOxwcuUqphF5yQ2prDvPIQSPrNXBC3LwzGnM3BqxvGFzOf8
   zV7iCJlmNVy3aErq2zFeOHdS8aFSJDgE03Hb29GWBSdgb+RGYQtl0d9qE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355050814"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="355050814"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 20:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732450482"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="732450482"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 20:55:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCIg-0009OL-0a;
	Wed, 30 Aug 2023 03:55:26 +0000
Date: Wed, 30 Aug 2023 11:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 571/6555]
 drivers/pkglist/pkglist_none.c:45:12: warning: no previous prototype for
 'pkglist_init'
Message-ID: <202308301141.Ae9AJDT3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 23f2bb7927c105fe2dd9d82410183013695317bd [571/6555] CHROMIUM: drivers: Create pkglist for configuration
config: i386-randconfig-002-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301141.Ae9AJDT3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301141.Ae9AJDT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301141.Ae9AJDT3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from drivers/pkglist/pkglist_none.c:12:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/pkglist/pkglist_none.c: At top level:
>> drivers/pkglist/pkglist_none.c:45:12: warning: no previous prototype for 'pkglist_init' [-Wmissing-prototypes]
      45 | int __init pkglist_init(void)
         |            ^~~~~~~~~~~~
>> drivers/pkglist/pkglist_none.c:51:6: warning: no previous prototype for 'pkglist_exit' [-Wmissing-prototypes]
      51 | void pkglist_exit(void) { }
         |      ^~~~~~~~~~~~


vim +/pkglist_init +45 drivers/pkglist/pkglist_none.c

  > 12	#include <linux/module.h>
    13	#include <linux/pkglist.h>
    14	
    15	kuid_t pkglist_get_appid(const char *key)
    16	{
    17		return make_kuid(&init_user_ns, 0);
    18	}
    19	EXPORT_SYMBOL_GPL(pkglist_get_appid);
    20	
    21	kgid_t pkglist_get_ext_gid(const char *key)
    22	{
    23		return make_kgid(&init_user_ns, 0);
    24	}
    25	EXPORT_SYMBOL_GPL(pkglist_get_ext_gid);
    26	
    27	bool pkglist_user_is_excluded(const char *key, uint32_t user)
    28	{
    29		return false;
    30	}
    31	EXPORT_SYMBOL_GPL(pkglist_user_is_excluded);
    32	
    33	kuid_t pkglist_get_allowed_appid(const char *key, uint32_t user)
    34	{
    35		return make_kuid(&init_user_ns, 0);
    36	}
    37	EXPORT_SYMBOL_GPL(pkglist_get_allowed_appid);
    38	
    39	void pkglist_register_update_listener(struct pkg_list *pkg) { }
    40	EXPORT_SYMBOL_GPL(pkglist_register_update_listener);
    41	
    42	void pkglist_unregister_update_listener(struct pkg_list *pkg) { }
    43	EXPORT_SYMBOL_GPL(pkglist_unregister_update_listener);
    44	
  > 45	int __init pkglist_init(void)
    46	{
    47		return 0;
    48	}
    49	module_init(pkglist_init);
    50	
  > 51	void pkglist_exit(void) { }
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
