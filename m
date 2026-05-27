Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329A3BA22C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870830; cv=none; b=S3oKpXzEnMf4kMvh88GVMiOyJeNWKJoSUxmRz7rNGu+a2eDudmphHPBitEKU2UQfN6/rFl42tXlnX5VeFtSvAP+zk31q/imrzg15VN970hcp1n6xiAsY10zr5By+9ec3S/jAVFoX9R45Yrl5L8ttuat25jYOBE4aJRb8I/Rtq7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870830; c=relaxed/simple;
	bh=bSI62888ste25tqM768T24wLNKXevdSOtaxcnuqjFso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i3ZEXaPQRhjHeDXMHm5hAYVP1TIUh8DhyhZqPMmszw3I2wyiM74U/6TstjvfjVyEgHXf8Gzos6c7ybgV+og2m8jnP9Q9ZpBaE2bVU4/nWCK1Xlx4VmnxPOYi+ZnzLRt+GeL3BQ4mTNJIsO2kCUINDzembxJexk+O4h0yuEYeXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5ZS3rlq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5ZS3rlq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779870828; x=1811406828;
  h=date:from:to:cc:subject:message-id;
  bh=bSI62888ste25tqM768T24wLNKXevdSOtaxcnuqjFso=;
  b=Q5ZS3rlqHebJ4QnlN9LYNpzMTPrjNMy14hPyXqGopKNqHqNezq22pvsP
   Ng9hmxx/vU1l602koqUzZAlFBdqKoPmGk71qgXZvM+219qkwehoAMBnJ5
   0mk7OKbVVUxDVlv2xoGLRRKqGHG494dePvuIVPEl0ZxpnAEv2b4rzQ7+l
   L8k6jt2KaJqFICOrwPbmDw/KaYpSUZvNz7/ofOIk7faj3XvVdbMFKZasX
   bnNLpsuYto8qzWYRUwDJFSf7ze3WtJVsUrpxid3reGwu/7CKJJGkgU6+/
   ZX8iAbwJA9hZVKHKIFD3qI91RtmQTRCimMi9Pijg1DOHM4PmAHu37w5UW
   g==;
X-CSE-ConnectionGUID: hKHiODhoSy+JW6Hbv0Ebgg==
X-CSE-MsgGUID: HiW9tVRlRheQpbFTBfXTBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98117267"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="98117267"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 01:33:43 -0700
X-CSE-ConnectionGUID: ycpfI3OoSeCCLWie2S6LaQ==
X-CSE-MsgGUID: ZuKz8Xk7T2i6EJWC8MH7nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="241340280"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 May 2026 01:33:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS9hr-000000003fy-0dUm;
	Wed, 27 May 2026 08:33:39 +0000
Date: Wed, 27 May 2026 16:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/28]
 fs/binfmt_elf.c:2143:19: error: 'struct linux_binfmt' has no member named
 'min_coredump'
Message-ID: <202605271625.6xhuSbun-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d82d1c962ed8d8ed693448d27aa42a88c54f438d
commit: 58e2fa4ec4b1e15b7c7510bc98befafa31c03f70 [0/28] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-randconfig-006-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271625.6xhuSbun-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271625.6xhuSbun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271625.6xhuSbun-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2143:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


vim +2143 fs/binfmt_elf.c

  2140	
  2141	static int __init init_elf_binfmt(void)
  2142	{
> 2143		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2144		register_binfmt(&elf_format);
  2145		return 0;
  2146	}
  2147	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
