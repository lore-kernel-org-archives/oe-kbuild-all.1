Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A819C56D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691212; cv=none; b=umJLZVNAZSw9a55spiHwO/SWbTA5Jgr+J9HxWaVH2MLcSLyBQRtXvW6URmbScHPdTwGyuupRTfLky+kEHhAPxRbB26G7tk6u9M+Pw3mRAk031OgLqwAZbNvoYHnsKywrU2c/59z9K3HNzqFLtoZ6fJS6xZrRgus2ssQfivRM4Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691212; c=relaxed/simple;
	bh=T7NBhRQT+yvsdz4y6hEIRfWytuYUO57gKmJ2qE7j3xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTvIKYbl67IRjUcyIYfDsb8R1F3Z7VQMYNtdNBk1tERcKStu3boLhC3e0bCVYCxJqhfzDIPc02zX8hhi+GigAZvsWEg3Z6JxvVa80qgOA/wDjIW7TNTj0VzJk2z+n8X/xAE+9TwSW/Zmut0XqNaHH/2QsVfOQJehxezviNw8efM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DG98T5a5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DG98T5a5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734691211; x=1766227211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T7NBhRQT+yvsdz4y6hEIRfWytuYUO57gKmJ2qE7j3xs=;
  b=DG98T5a5D21ZvkmOlZ8d0HQMQht1Xy0wsYWR63oWRCmBmQAjQMBrK2pt
   eVAZd+856uFt6H8iYSO8P3JH2gjoHP1XVNLd5FF/TZk/c028SMMy2KTQn
   45xr/FzxIMP4j6KceGz70/xvOcu8IRW0EVtZN8ZTXfI2qpfDA4L9QqX6Y
   adfSxlcX1wRIpicfuGOZGI3Nd0oKerM9PHLjKemjy4oLDlmWlSd32LsQ2
   zcevLU8NlNfQFMOV3BopDIlxkRuRfEGbaejIDBtGJJHIT4E9qxVCNT5Ui
   kZ1Uubuwr0GfJBZXHoY6LZ5kYtrCvKJt1o3v8c1jt1rcMg+4AuPWBE6yW
   Q==;
X-CSE-ConnectionGUID: APTeVRHhSUWfjvgUGoTI3Q==
X-CSE-MsgGUID: BNiOqmpASf+mFHbNQ3hzGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45925896"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45925896"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 02:40:10 -0800
X-CSE-ConnectionGUID: in2UonICQhSfqYGDKKhxNg==
X-CSE-MsgGUID: QS55/FaFRQCHNK8YXdNVzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99300469"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2024 02:40:09 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOaQQ-00014F-1f;
	Fri, 20 Dec 2024 10:40:06 +0000
Date: Fri, 20 Dec 2024 18:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2024-09 2196/29218]
 drivers/staging/android/debug_kinfo.c:64:30: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202412201826.j87gjnLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2024-09
head:   996f9387b1b9b110ed7dea208495739fb5037124
commit: 1a9c7b3e3bdd87a10205891806a0d880fe27230c [2196/29218] ANDROID: staging: add debug-kinfo driver
config: i386-randconfig-r113-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201826.j87gjnLK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201826.j87gjnLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201826.j87gjnLK-lkp@intel.com/

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
