Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAB62578
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 23:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681686982; x=1713222982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AueLHP4Qlgdkta3Vh9kuz1kwa2xDnnBqEV0rUnIWPw4=;
  b=cuYln9BZr2SLH4E1ErlwVXHbmlnbc3c4OX0d9Nw1q9shxQZngQRliyet
   CFpnVPgsKD+QWAHeXBd8vnewsM3MVByscsF8VboOBhTAk3Ug2KStbNgag
   m2h0oIezUhC5wvVbu2UNekV6gEq+KhNwOrecKi+CkSJvdtI95sR6cyf0n
   lBVHFwYUPFLM1PHpRELo7LFVoHaO2CPPlbetSwpUsPeUP0qJuiFdbWVsq
   c2Nhp3Lz9smQJLjB9WaLTyNzBQ4Muc6yeROf2GZ4nfv8b8DYIvRPcQWwk
   xdyHnMEIgGX6MZEDsi2q7DwLTpHrM8MRtRqTbVCHvgWXew3dC9llYJ/qT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="346614694"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="346614694"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 16:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="801880195"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="801880195"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2023 16:16:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poBbY-000btb-10;
	Sun, 16 Apr 2023 23:16:20 +0000
Date: Mon, 17 Apr 2023 07:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.3-rc6-net-next-zii 13/14]
 drivers/platform/x86/scu.c:1321:27: warning: 'ichx_gpiolib_names' defined
 but not used
Message-ID: <202304170741.AzJCd8u0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc6-net-next-zii
head:   22f16af6fd80efa023ad3545ae6b1cf34516d51a
commit: c91f52b66c5d11604c5e47dd29970962d1d05225 [13/14] platform: x86: scu: Add missing static's
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230417/202304170741.AzJCd8u0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/lunn/linux/commit/c91f52b66c5d11604c5e47dd29970962d1d05225
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc6-net-next-zii
        git checkout c91f52b66c5d11604c5e47dd29970962d1d05225
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170741.AzJCd8u0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/scu.c: In function 'scu_populate_unit_info':
   drivers/platform/x86/scu.c:1775:17: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1775 |                 ;
         |                 ^
   drivers/platform/x86/scu.c:1778:17: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1778 |                 ;
         |                 ^
   At top level:
>> drivers/platform/x86/scu.c:1321:27: warning: 'ichx_gpiolib_names' defined but not used [-Wunused-const-variable=]
    1321 | static const char * const ichx_gpiolib_names[128] = {
         |                           ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:254,
                    from drivers/platform/x86/scu.c:25:
   In function 'strncpy',
       inlined from 'scu_object_store' at drivers/platform/x86/scu.c:271:2:
   include/linux/fortify-string.h:68:33: warning: '__builtin_strncpy' output may be truncated copying between 7 and 11 bytes from a string of length 11 [-Wstringop-truncation]
      68 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/fortify-string.h:151:16: note: in expansion of macro '__underlying_strncpy'
     151 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~


vim +/ichx_gpiolib_names +1321 drivers/platform/x86/scu.c

  1319	
  1320	/* SCU specific gpio pin names. Only works if module is built into kernel. */
> 1321	static const char * const ichx_gpiolib_names[128] = {
  1322		[0] = "switch_interrupt",	/* GPI0 */
  1323		[3] = "ac_loss_detect",		/* GPI3 */
  1324		[16] = "debug_out",		/* GPO0 */
  1325		[20] = "switch_reset",		/* GPO3 */
  1326	};
  1327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
