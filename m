Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9EC19C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 00:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aniEdvJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702428499; x=1733964499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o88Xz0lhvhgib7j6iSvVBbvXh1EQNW6XGirQfY1ivhg=;
  b=aniEdvJT/hU+n1aljaoEdavO2N9hrLFW7+jAwRnKmcsaKjPrtQpZT2d+
   NGFgMbibtaNDXvMTpP8SZlB9RTCDBv5ygv3wdcKNjQfDB4l6m1C4LK95I
   BAzWXClEhJ30FgBLhBeAY5W8EqgX4r8L9vj44uXZcZ3s+WSqpy413eSSr
   PrlY1tgdkjWdayFFlVB1fbBGIqFwR54z0Jat3gj1KH3HtLVyeFlPfY7WJ
   ipmMwCWpXz0vzPUrdt+aAWSOPoMV5nDzn5s3Vd7MmvZ6vqhiPoTX4Gf5j
   8p2EmWG475EjkM6fgUmdRShukrjqnski5RWXGzrooW2zDJX0PEIc6vIXI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1974328"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1974328"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 16:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="946987131"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="946987131"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2023 16:48:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDDQ6-000JvH-0F;
	Wed, 13 Dec 2023 00:48:14 +0000
Date: Wed, 13 Dec 2023 08:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: include/linux/avf/virtchnl.h:375:31: error: enumerator value for
 'virtchnl_static_assert_virtchnl_irq_map_info' is not an integer constant
Message-ID: <202312130828.maqZjLW4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf52eed70e555e864120cfaf280e979e2a035c66
commit: f962396ce29244d9a64f241481fa73fa370404c3 ARM: davinci: support multiplatform build for ARM v5
date:   4 years, 3 months ago
config: arm-buildonly-randconfig-r001-20210929 (https://download.01.org/0day-ci/archive/20231213/202312130828.maqZjLW4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130828.maqZjLW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130828.maqZjLW4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/iavf/iavf.h:38,
                    from drivers/net/ethernet/intel/iavf/iavf_main.c:4:
   include/linux/avf/virtchnl.h:147:43: warning: division by zero [-Wdiv-by-zero]
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/avf/virtchnl.h:375:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     375 | VIRTCHNL_CHECK_STRUCT_LEN(14, virtchnl_irq_map_info);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/avf/virtchnl.h:375:31: error: enumerator value for 'virtchnl_static_assert_virtchnl_irq_map_info' is not an integer constant
     375 | VIRTCHNL_CHECK_STRUCT_LEN(14, virtchnl_irq_map_info);
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:147:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^
   include/linux/avf/virtchnl.h:147:43: warning: division by zero [-Wdiv-by-zero]
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/avf/virtchnl.h:441:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     441 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_vlan_filter_list);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:441:30: error: enumerator value for 'virtchnl_static_assert_virtchnl_vlan_filter_list' is not an integer constant
     441 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_vlan_filter_list);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:147:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^
   include/linux/avf/virtchnl.h:147:43: warning: division by zero [-Wdiv-by-zero]
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/avf/virtchnl.h:481:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     481 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_rss_key);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:481:30: error: enumerator value for 'virtchnl_static_assert_virtchnl_rss_key' is not an integer constant
     481 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_rss_key);
         |                              ^~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:147:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^
   include/linux/avf/virtchnl.h:147:43: warning: division by zero [-Wdiv-by-zero]
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/avf/virtchnl.h:489:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     489 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_rss_lut);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:489:30: error: enumerator value for 'virtchnl_static_assert_virtchnl_rss_lut' is not an integer constant
     489 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_rss_lut);
         |                              ^~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:147:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^
   drivers/net/ethernet/intel/iavf/iavf_main.c:151:6: warning: no previous prototype for 'iavf_debug_d' [-Wmissing-prototypes]
     151 | void iavf_debug_d(void *hw, u32 mask, char *fmt_str, ...)
         |      ^~~~~~~~~~~~
   drivers/net/ethernet/intel/iavf/iavf_main.c: In function 'iavf_debug_d':
   drivers/net/ethernet/intel/iavf/iavf_main.c:160:9: warning: function 'iavf_debug_d' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     160 |         vsnprintf(buf, sizeof(buf), fmt_str, argptr);
         |         ^~~~~~~~~
--
   In file included from drivers/net/ethernet/intel/iavf/iavf.h:38,
                    from drivers/net/ethernet/intel/iavf/iavf_ethtool.c:5:
   include/linux/avf/virtchnl.h:147:43: warning: division by zero [-Wdiv-by-zero]
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/avf/virtchnl.h:375:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     375 | VIRTCHNL_CHECK_STRUCT_LEN(14, virtchnl_irq_map_info);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/avf/virtchnl.h:375:31: error: enumerator value for 'virtchnl_static_assert_virtchnl_irq_map_info' is not an integer constant
     375 | VIRTCHNL_CHECK_STRUCT_LEN(14, virtchnl_irq_map_info);
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:147:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^
   include/linux/avf/virtchnl.h:147:43: warning: division by zero [-Wdiv-by-zero]
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/avf/virtchnl.h:441:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     441 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_vlan_filter_list);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:441:30: error: enumerator value for 'virtchnl_static_assert_virtchnl_vlan_filter_list' is not an integer constant
     441 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_vlan_filter_list);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:147:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^
   include/linux/avf/virtchnl.h:147:43: warning: division by zero [-Wdiv-by-zero]
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/avf/virtchnl.h:481:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     481 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_rss_key);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:481:30: error: enumerator value for 'virtchnl_static_assert_virtchnl_rss_key' is not an integer constant
     481 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_rss_key);
         |                              ^~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:147:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^
   include/linux/avf/virtchnl.h:147:43: warning: division by zero [-Wdiv-by-zero]
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/avf/virtchnl.h:489:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     489 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_rss_lut);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:489:30: error: enumerator value for 'virtchnl_static_assert_virtchnl_rss_lut' is not an integer constant
     489 | VIRTCHNL_CHECK_STRUCT_LEN(6, virtchnl_rss_lut);
         |                              ^~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:147:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     147 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^


vim +/virtchnl_static_assert_virtchnl_irq_map_info +375 include/linux/avf/virtchnl.h

62683ab51e487f drivers/net/ethernet/intel/i40evf/i40e_virtchnl.h Greg Rose         2013-12-21  374  
73556269aab30c include/linux/avf/virtchnl.h                      Sridhar Samudrala 2017-05-11 @375  VIRTCHNL_CHECK_STRUCT_LEN(14, virtchnl_irq_map_info);
73556269aab30c include/linux/avf/virtchnl.h                      Sridhar Samudrala 2017-05-11  376  

:::::: The code at line 375 was first introduced by commit
:::::: 73556269aab30c39cba9cf8efafc402d0deb87b2 virtchnl: Add compile time static asserts to validate structure sizes

:::::: TO: Sridhar Samudrala <sridhar.samudrala@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
