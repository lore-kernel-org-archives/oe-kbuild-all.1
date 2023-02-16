Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAD723A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676565015; x=1708101015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=di7EZdNoRmlP0WE1ZjrXILhp/vEnUm4WSOx5lQZVkcA=;
  b=l0f//NqOUj/7/f0YQo3JGV+y+GncRRPxAIPesEGvfkzpG6KJwYLAXcx8
   09SD+v8KoChLYuZ3YIIYPeToFmJo4iSiCTB7tixoE89OAKbbGxf/nD8yH
   tRh2wdX5eTCwwkiLoPWEbCHJRlEdYtKgtoOnS76ahhfchtD25dL9KKaeQ
   6MUps9t9I73zrvN/XkqFe7AsUMeo6apeglP8gfNgYnVwpF6V+Vd776OZ8
   3XzBl/sOm4Jvid45xlOwdWp/dkevT2UweS5hBPk1AB+slCFNXwVJrBar4
   IAam79k2ZktW0MwrsKJEWhLzpvluD9aUMWcQhdWqnCkbCcp+OqnZCYins
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315459528"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="315459528"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 08:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672210170"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="672210170"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Feb 2023 08:13:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSgsz-000AKv-29;
	Thu, 16 Feb 2023 16:13:29 +0000
Date: Fri, 17 Feb 2023 00:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Lucero <alejandro.lucero-palau@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@nvidia.com>
Subject: [ammarfaizi2-block:netdev/net-next/master 27/39]
 drivers/net/ethernet/sfc/efx_devlink.c:185:58: error: expected ')' before
 'build_id'
Message-ID: <202302170047.EjCPizu3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block netdev/net-next/master
head:   40967f77dfa9fa728b7f36a5d2eb432f39de185c
commit: 14743ddd2495c96caa18e382625c034e49a812e2 [27/39] sfc: add devlink info support for ef100
config: ia64-randconfig-r036-20230213 (https://download.01.org/0day-ci/archive/20230217/202302170047.EjCPizu3-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/14743ddd2495c96caa18e382625c034e49a812e2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block netdev/net-next/master
        git checkout 14743ddd2495c96caa18e382625c034e49a812e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/ethernet/sfc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170047.EjCPizu3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/sfc/efx_devlink.c: In function 'efx_devlink_info_running_v2':
>> drivers/net/ethernet/sfc/efx_devlink.c:185:58: error: expected ')' before 'build_id'
     185 |                 memset(&build_date, 0, sizeof(build_date)
         |                       ~                                  ^
         |                                                          )
     186 | #endif
     187 |                 build_id = MCDI_DWORD(outbuf, GET_VERSION_V2_OUT_SUCFW_CHIP_ID);
         |                 ~~~~~~~~                                  
>> drivers/net/ethernet/sfc/efx_devlink.c:197:55: error: expected ';' before '}' token
     197 |                                                  buf);
         |                                                       ^
         |                                                       ;
     198 |         }
         |         ~                                              


vim +185 drivers/net/ethernet/sfc/efx_devlink.c

   157	
   158			devlink_info_version_running_put(req,
   159							 EFX_DEVLINK_INFO_VERSION_FW_MGMT_CMC,
   160							 buf);
   161		}
   162	
   163		ver.words = (__le16 *)MCDI_PTR(outbuf, GET_VERSION_V2_OUT_VERSION);
   164		offset = snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
   165				  le16_to_cpu(ver.words[0]), le16_to_cpu(ver.words[1]),
   166				  le16_to_cpu(ver.words[2]), le16_to_cpu(ver.words[3]));
   167		if (flags & BIT(EFX_VER_FLAG(MCFW_EXT_INFO))) {
   168			build_id = MCDI_DWORD(outbuf, GET_VERSION_V2_OUT_MCFW_BUILD_ID);
   169			snprintf(&buf[offset], EFX_MAX_VERSION_INFO_LEN - offset,
   170				 " (%x) %s", build_id,
   171				 MCDI_PTR(outbuf, GET_VERSION_V2_OUT_MCFW_BUILD_NAME));
   172		}
   173		devlink_info_version_running_put(req,
   174						 DEVLINK_INFO_VERSION_GENERIC_FW_MGMT,
   175						 buf);
   176	
   177		if (flags & BIT(EFX_VER_FLAG(SUCFW_EXT_INFO))) {
   178			ver.dwords = (__le32 *)MCDI_PTR(outbuf,
   179							GET_VERSION_V2_OUT_SUCFW_VERSION);
   180	#ifdef CONFIG_RTC_LIB
   181			tstamp = MCDI_QWORD(outbuf,
   182					    GET_VERSION_V2_OUT_SUCFW_BUILD_DATE);
   183			rtc_time64_to_tm(tstamp, &build_date);
   184	#else
 > 185			memset(&build_date, 0, sizeof(build_date)
   186	#endif
   187			build_id = MCDI_DWORD(outbuf, GET_VERSION_V2_OUT_SUCFW_CHIP_ID);
   188	
   189			snprintf(buf, EFX_MAX_VERSION_INFO_LEN,
   190				 "%u.%u.%u.%u type %x (%ptRd)",
   191				 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
   192				 le32_to_cpu(ver.dwords[2]), le32_to_cpu(ver.dwords[3]),
   193				 build_id, &build_date);
   194	
   195			devlink_info_version_running_put(req,
   196							 EFX_DEVLINK_INFO_VERSION_FW_MGMT_SUC,
 > 197							 buf);
   198		}
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
