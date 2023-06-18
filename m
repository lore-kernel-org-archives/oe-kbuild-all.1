Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77400A2A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687075751; x=1718611751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GnljtZkMlRcIUtlTcS1tEWcJizu2x1Q70AWZBJBigAo=;
  b=Yv9GaNeV5WqYf94mo/MHOB2ccAqTsYCKnS3mPy0FP9NTrSbi1BgZFot9
   JlHo8IF4teBRhCb92NGzy2renSjuUBz0eg2THzF9eLb6UduqIHltuk0Vm
   qh1QQmEgPERPrTPs4RvN6TJQa3LNwd8bRmmmNcuepNi8htgWtW3g7EEQi
   Jrj6QgpcEaFwLXT0V4n81ebqm+9RQQn9nN5Kd3Jkc36Eey+q2R6dgKajJ
   UH22YN8k5e4LKtCuf1Gbg7te+0A1/wSlrSrMCe20bb2DInOuM0ktmK8aP
   7F/xXlU11IBHxooCMXLcSW4MMehWtM2UoB2XA2z6Jn8th9ye5A0RsG7Vm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="425407288"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="425407288"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 01:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="778640909"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="778640909"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jun 2023 01:09:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAnTA-0003Ys-2c;
	Sun, 18 Jun 2023 08:09:08 +0000
Date: Sun, 18 Jun 2023 16:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 3650/27674]
 drivers/staging/android/debug_kinfo.c:64:30: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202306181540.3jqPKdyU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   31e1367ff78eb68e54a2025e9c6601e3fa6c6312
commit: e7be908f88dbde1df94db83d6c7a23b117de0f36 [3650/27674] ANDROID: staging: add debug-kinfo driver
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230618/202306181540.3jqPKdyU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181540.3jqPKdyU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181540.3jqPKdyU-lkp@intel.com/

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
