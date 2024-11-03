Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866F8146A6F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730635770; cv=none; b=NV03A6gCz0/fD2Zwth7EsT8GY/asQve8tYEHwtzQAnmctZbhl5IguuJ2kSSQIs9KPlhb0BRugIEa36VY6UflIzFeJ9bwJTnDWRJRRMJ6Yayu23fiQrlZpV/wZVX1rLibVDJ9wdJ8+DpD2M5HbujsGKmnDcaYszX25OyJhIAoxCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730635770; c=relaxed/simple;
	bh=R51It1Hyap/05ExlFoSQNxU5B16/U81LT2HLEB7f6po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DNHflfA2G/ARM/vdxceehGtJFb+rxfsHRZFk7VdF1WIo0u9n/9SRdRSUM5zAvEktf2kVW81k7s1pCrZGHYzwFCJa/eJYv4N+xV7gWjPdKr192ho5VThKfztCUoISFHBWJ8hudAHkrxKptERX5TkxdRVfcb6jaoOcqu5BnKrWruI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzHL1nD1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzHL1nD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730635767; x=1762171767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R51It1Hyap/05ExlFoSQNxU5B16/U81LT2HLEB7f6po=;
  b=KzHL1nD1L3rlOExMvxu6p4lNfss5WrFaH5j2DcTiXlUbliWfFNsd1OwM
   fcTlAc3ePogf+pUX1SscNSlAyMbJsB3dXeWKf23OONx9owDzh08++GKXk
   /okXSDYc7z9az/v5AgeL0wsQ3BuUtylQv7cqOdB/QHbKTZFnBxWOEh4/2
   VSZ/q30V/bTXnEzlJJyrE4NpjqQp8b0kzWLmx+/OQnqPC/CSduGZTDOg7
   Ovd72HRoQfHw240h0leVU3949o9jK0n/PbF1DjKHsyZg06jm2fsal2TST
   6vWJGd3gHQSNi6XOBBzXoYzQR1fuZ24jzsyiha9DG4Dl19UOM4WQTLYTK
   g==;
X-CSE-ConnectionGUID: 1DzTMm8jSmunnTImsCvYcg==
X-CSE-MsgGUID: aGaKOOYLTJ6eEcR3b6wq6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="34129742"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="34129742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 04:09:27 -0800
X-CSE-ConnectionGUID: KHh9OM9FTf2ZqRQ9eyAEfw==
X-CSE-MsgGUID: WoQwQEAZRZe+0y6vKdigCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="83072927"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2024 04:09:26 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7ZQ3-000jw5-2j;
	Sun, 03 Nov 2024 12:09:23 +0000
Date: Sun, 3 Nov 2024 20:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2284/2284] fs/proc/base.c:1454:6: warning: no
 previous prototype for 'pbha_bit0_hide_file'
Message-ID: <202411032055.ZoDSmsZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   170b758d064664f953e8f6de41dd4a3ef122443a
commit: bea38841945a52bd03004240eb0da6a5115bae21 [2284/2284] arm64: mm: Hide pbha_bit0 in procfs if pbha is not enabled
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241103/202411032055.ZoDSmsZX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411032055.ZoDSmsZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411032055.ZoDSmsZX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/base.c:1454:6: warning: no previous prototype for 'pbha_bit0_hide_file' [-Wmissing-prototypes]
    1454 | bool pbha_bit0_hide_file(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/pbha_bit0_hide_file +1454 fs/proc/base.c

  1453	
> 1454	bool pbha_bit0_hide_file(const char *name)
  1455	{
  1456		if (!system_support_pbha_bit0() && !strncmp("pbha_bit0", name, 9))
  1457			return true;
  1458	
  1459		return false;
  1460	}
  1461	#else
  1462	static bool pbha_bit0_hide_file(const char *name) { return false; }
  1463	#endif
  1464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
