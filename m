Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7B128FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680006434; x=1711542434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bnq7nBHWiWEcE2PAdLuRWPCqy3nzLeQFBECOslIirXg=;
  b=SLU/iBvtnUm5CACiOVZQJG513IfUml2Ky4/5YPQuXMSoQybwGihOcMsz
   8wTpsBz3kMgKZMic0q6V/Xt5pL009ENCLZrwfuZ+uxF3RAkXOXQAw5iHI
   HIbZXslr3qQanHKCdJTe1LWDOexGgV6A9k0AMAFFiBiefKQJo3VW1M2ny
   bcS5Zz2/amyfUGDHosXaDhKnKzoTiTXxM+B/ittitRCYLkcKbZkinzRbp
   mUV4ZJNdxZVoV7SokjqVxyYDhxTXaLBCz0PBzvxwROhUzt36Qr6yfQHfe
   J5qGQqsm4ajFvA5Lfq1axIDkTwPjNeC789HCYb/0awYe7HISebsq1lHy5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339273778"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="339273778"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 05:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="773136747"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="773136747"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2023 05:27:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph8Pm-000IWX-2n;
	Tue, 28 Mar 2023 12:27:02 +0000
Date: Tue, 28 Mar 2023 20:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 14/21] include/linux/acpi.h:490:19: error:
 'acpi_get_genport_attrs' declared 'static' but never defined
Message-ID: <202303282000.5bSuw1pi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   a3ffd388575a5401efc468d0673218aeb0df5148
commit: 259dcd218ef004d6ba80e19e7bfc83052c71816f [14/21] ACPI: NUMA: Add helper function to retrieve the performance attributes
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230328/202303282000.5bSuw1pi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=259dcd218ef004d6ba80e19e7bfc83052c71816f
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 259dcd218ef004d6ba80e19e7bfc83052c71816f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303282000.5bSuw1pi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/display/intel_display_types.h:29,
                    from drivers/gpu/drm/i915/display/intel_dsi.h:30,
                    from <command-line>:
   include/linux/acpi.h:491:1: error: expected identifier or '(' before '{' token
     491 | {
         | ^
   In file included from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/display/intel_display_types.h:29,
                    from drivers/gpu/drm/i915/display/intel_dsi.h:30,
                    from <command-line>:
>> include/linux/acpi.h:490:19: error: 'acpi_get_genport_attrs' declared 'static' but never defined [-Werror=unused-function]
     490 | static inline int acpi_get_genport_attrs(u8 *device_handle, u64 *val, int type);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +490 include/linux/acpi.h

   489	
 > 490	static inline int acpi_get_genport_attrs(u8 *device_handle, u64 *val, int type);
   491	{
   492		return -EOPNOTSUPP;
   493	}
   494	#endif
   495	extern int acpi_paddr_to_node(u64 start_addr, u64 size);
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
