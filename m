Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F01DEFDD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739402160; cv=none; b=ZrJmUe2PMKGoR1iigb6xwYOHuMC5HpyNR0lVAUjfwJgU+kcPRDVcf5/zflL2vMh1Qr8QWL7ePCeBkxXWOYCaD1sSIq4nKkHYu5Es2MwNGoAd1rwFgD52BQI4+YU6Xa1WdpS80omeF5Zj0dover2jYnD+/KEgkHpg+7lfKQbfVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739402160; c=relaxed/simple;
	bh=izRYm4uwZus1EYIMUch5gllmCOHKEB0XSAPXmwN9VQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiO0dbR2vZPZveCPBUtn7GqjQcbdHG8gjJnZmklw1/NkIidNK541G1Ev6wLepnX4EOtKLOD63+/JoqXxlX1Per3nY7vN+Uz00QLmXcMl00KTbVqUIQDs14vXufqXBQTp2eeSz4xbsdwT/BAL2D90wDxWfdWAa6AGWPU4gz/6Q1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kB2IkPLX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kB2IkPLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739402159; x=1770938159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izRYm4uwZus1EYIMUch5gllmCOHKEB0XSAPXmwN9VQk=;
  b=kB2IkPLXcYBmtGToDKzQulchZb90euM1Sd66CepBpwGGcdND5eIzr0wD
   6OcwHS+C2TkLw6i7yCbE+7XS7yC+GCnntM9wAU4ZwGLHlpGPdKSGzV2zz
   WYcvt4oLLsjm9XUZbH2HsvqjjoU6iSJKUP5ZJvGW7nKOAZgEnTyEHfayQ
   z1RbpRf4be274Ldf7hyo91uElsdpD936ZL38+4c+/ocf5xVSO62QPBpUz
   5Wp3nqcfFbwlX5rBQwufC43TjPIwg+xJEJb9aGMyJKmJ2WW+WvfsDYE06
   JT7vGA8sKEycs5uRgAIcVmYFcb1wR6Hn6thAZk7IDMrJ7DkAgsNVUq8WF
   g==;
X-CSE-ConnectionGUID: RnwUk60xTLyKrbVdoF+BUw==
X-CSE-MsgGUID: JvFznOP8T32qWxkR7fex9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40231720"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="40231720"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 15:15:58 -0800
X-CSE-ConnectionGUID: E7J6gnmiQtyiAKHsObnPSw==
X-CSE-MsgGUID: mal+fvEJQ7SQSFtzHiABQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="113165085"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Feb 2025 15:15:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiLxT-0016Fr-0u;
	Wed, 12 Feb 2025 23:15:55 +0000
Date: Thu, 13 Feb 2025 07:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/binfmt_elf.c:2162:19: error:
 'struct linux_binfmt' has no member named 'min_coredump'
Message-ID: <202502130753.12gF9JLV-lkp@intel.com>
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
head:   33f3d212e8d80da8f8fb647de5199976d1fc93dd
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [1/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-buildonly-randconfig-002-20250213 (https://download.01.org/0day-ci/archive/20250213/202502130753.12gF9JLV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130753.12gF9JLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502130753.12gF9JLV-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^
--
   In file included from fs/compat_binfmt_elf.c:144:
   fs/binfmt_elf.c: In function 'init_compat_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


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
