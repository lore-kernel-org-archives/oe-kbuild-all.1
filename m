Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3831C8BF1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Aug 2023 22:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691964885; x=1723500885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNI09pr5OpGXJqnEH2M81fYYaR2kHwr1QrAazqMrD/8=;
  b=jmggrjfWUZlSbE0b3q1XRDrysnV09w2bTFd9lTVke3B1GkI/GyrfcJ17
   SNQ15yeTzWHJTLqDoltR22pZF53ZEMVNeNf8yNSf2vhU9p4T9ISUvgIEV
   CQl1pRp+PwTQo4cAZLPLmJx7E8/0xrQsKxw63Z4bJt4UjrDatRJrGlQ/M
   1D3R4Mkd7RdQtYnMucx7RDJFhY3PJ3bIrgoir18tpIDfKzHUMzYmgV4ri
   VAb8anJtDJADIJGAxAIENJKhSLtBiAlm6paCQQ+XmWDIX0/avzqHMOlb7
   SMsG9JY4TOB6GLocsky0d3f8WprcMS/ktc0QMs8PJcbS1x84YcLwTRu65
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="458291283"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="458291283"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 15:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876741341"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2023 15:14:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVJMA-0009EK-1h;
	Sun, 13 Aug 2023 22:14:42 +0000
Date: Mon, 14 Aug 2023 06:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2196/23513]
 drivers/staging/android/debug_kinfo.c:64:30: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202308140653.EKueXsEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   ee1147625d28317061f5dd303de56f1fadf4eec0
commit: 1a9c7b3e3bdd87a10205891806a0d880fe27230c [2196/23513] ANDROID: staging: add debug-kinfo driver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230814/202308140653.EKueXsEd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308140653.EKueXsEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308140653.EKueXsEd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/android/debug_kinfo.c:64:30: sparse: sparse: Using plain integer as NULL pointer

vim +64 drivers/staging/android/debug_kinfo.c

    57	
    58	static int build_info_set(const char *str, const struct kernel_param *kp)
    59	{
    60		struct kernel_all_info *all_info;
    61		size_t build_info_size;
    62		int ret = 0;
    63	
  > 64		if (all_info_addr == 0 || all_info_size == 0) {
    65			ret = -EPERM;
    66			goto Exit;
    67		}
    68	
    69		all_info = (struct kernel_all_info *)all_info_addr;
    70		build_info_size = sizeof(all_info->info.build_info);
    71	
    72		memcpy(&all_info->info.build_info, str, min(build_info_size - 1, strlen(str)));
    73		update_kernel_all_info(all_info);
    74	
    75		if (strlen(str) > build_info_size) {
    76			pr_warn("%s: Build info buffer (len: %zd) can't hold entire string '%s'\n",
    77					__func__, build_info_size, str);
    78			ret = -ENOMEM;
    79		}
    80	
    81	Exit:
    82		vunmap(all_info_addr);
    83		return ret;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
