Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400EA1A83F9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761481361; cv=none; b=I/mSyF30K9FRGsGBLX5lj/6+XwoljRdbmrWfCsEOP8cmD0lyAeTVQ8ssUFUrnkTs7qsj6d/odu4RgdV6STHMcWGld/Lp2svJR6Xjd/Htx8k35dnuQ2KBRPOUDhIkZZCICbrCBRBMorN1yLepMlFSd9W/nszlus8a7eFfp/2JX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761481361; c=relaxed/simple;
	bh=LXLN8X9AbEWFD8ofmnE/RI62aZIX/Df1ntZDIYntuHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ouS9boNlOd9SpT0pCQcuBmVJ/kevUDO0g6T9kfACVYWUFt6AOpMH3OQymq624R5g/q82SN3ePWWOv+dxZhXkVUhc7fIiAd8jNNFbLWNfTEkOM4kmX3cx2TYer9jSjs9pC2mM5YckTJsTf6Dm/tAqCYfM6BjbY/2o9VXfxNMf5PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVMHbGbk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVMHbGbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761481359; x=1793017359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LXLN8X9AbEWFD8ofmnE/RI62aZIX/Df1ntZDIYntuHI=;
  b=GVMHbGbkKftG0VK4CVzNBOAAD1153bTPWZ9oekdUTWWcCrSvnZTKhEps
   ndvpxi0hD3Vxgx9nscXNvDE+zfYb5UYOTsamGywnxWCb/2ldwZXondaKb
   IZKMpjfC1edlV3JXfznqLxz/ThVJHPzhebGBiRpoZtJ3cZNQ97Zed7BWX
   SuLT8ogbk9iTIvLA85iTfUNHEGUnWTIYnqH9r7PKCSjzRsg/C+m0Q36Zn
   YERZ2bynsA6ehd49P1FYAPphrcU1qDYSkRI8KKHPO9JOEOWQ1HXuUJQmn
   pCMU7Va4UEv9DgZOvVp9c9AR3yPYPD9Yl/d9XbavE6MwfwOSRGfivmAt2
   g==;
X-CSE-ConnectionGUID: IdoQ5Uc1QO+8sPK1e67n8Q==
X-CSE-MsgGUID: fcaseBHXSaa7Oo1t8pjAoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73872951"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="73872951"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 05:22:39 -0700
X-CSE-ConnectionGUID: 9dKWkq3cS2OGjpIvly+K0A==
X-CSE-MsgGUID: oPJY8MMsTFugyjL30sifww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="215468861"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2025 05:22:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCzkj-000G6T-2Z;
	Sun, 26 Oct 2025 12:22:04 +0000
Date: Sun, 26 Oct 2025 20:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] fs/binfmt_elf.c:2162:13: error:
 no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202510262035.XsmiTrcB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   46cba2832a67ecdc28866735338d8bb6ef733681
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [0/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-buildonly-randconfig-005-20251026 (https://download.01.org/0day-ci/archive/20251026/202510262035.XsmiTrcB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510262035.XsmiTrcB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510262035.XsmiTrcB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/binfmt_elf.c:17:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/binfmt_elf.c:2162:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 warning and 1 error generated.


vim +2162 fs/binfmt_elf.c

  2159	
  2160	static int __init init_elf_binfmt(void)
  2161	{
> 2162		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2163		register_binfmt(&elf_format);
  2164		return 0;
  2165	}
  2166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
