Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C33191D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 21:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338767; cv=none; b=M1ZPDclbZqODEdeRftCtHRis0FSNSbN6rNfEPsv+GPdcK9/dVm5V2KxvL84QqjU2KF95z6ei2cPnAiz71gnBiZ1lXjfZgZ3DFA6tNaNHOMnCL/NkRgv2yedcnJzO1S0j2r6IaFJbh2uTCnd7ma21YSBipskImEjJdnJGUMbak5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338767; c=relaxed/simple;
	bh=bJlfz+d1JqwhDcOkyRemsXc75NgsqNR7txD1tLHvZb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a4cdfqUAscsBNdsfM7hLJUdxdY1nREdkgxf30Evk0PbrMJ+bQeJWRDYgJJaKGnrdktalh4OUpnXmuX/yCGtuUKypyteyBHtFiZuVFclBpF+e6XHfOH/WZpRpe1mrqCbIyxBNxjPwPqdmZ0se1excsRqoLMwXTedkoqzQzHDHYUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQJ4Xjwa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQJ4Xjwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768338766; x=1799874766;
  h=date:from:to:cc:subject:message-id;
  bh=bJlfz+d1JqwhDcOkyRemsXc75NgsqNR7txD1tLHvZb8=;
  b=XQJ4Xjwalw0COxMIzrIuL0wUq9h7ZDFmjM1KEQBCdFQn6um3F+1Fg495
   wqX+opeBrxbORtD2Fku/vFndqEsyW6ebkkw7qm4ar4HdLC8PImn+6asUu
   SS3ib8q8xObpT6IDg0/5KhbwfY7pFETQmQMI335kKCPAOZvwE6qahM3zc
   lhnRs7Nc0CgTF96uETWqQlJ6v4KtW0EGPWdn1MPn0pvCbzT5QMuCRJlSu
   CtY8RoljZ9jBW13x18e4rjH2teZGJa4CD/gj59mqTNmJOe13O7T5RJjQi
   ZzpjYJwrodluNwJOQiUDvSxLeRVyRGjIiFN8oYT1u/ScOWCQ2iPv0GLKA
   A==;
X-CSE-ConnectionGUID: hxFJN/3RTnK1weylBgH2Ig==
X-CSE-MsgGUID: Zf6nWEyVSMSV2wNppnpE/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73475965"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73475965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:12:46 -0800
X-CSE-ConnectionGUID: 8B7zGC8PQBy2vvUPQW2x1A==
X-CSE-MsgGUID: kbqoXfwVTxCiNdUMo0kPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204908526"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jan 2026 13:12:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vflgw-00000000FNU-2FIv;
	Tue, 13 Jan 2026 21:12:42 +0000
Date: Wed, 14 Jan 2026 05:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] fs/binfmt_elf.c:2143:19:
 error: 'struct linux_binfmt' has no member named 'min_coredump'
Message-ID: <202601140509.Ujs5iL0m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0954c27bd6794b82681041439dd14bcc1f51c378
commit: 58e2fa4ec4b1e15b7c7510bc98befafa31c03f70 [0/2] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-randconfig-004-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140509.Ujs5iL0m-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140509.Ujs5iL0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140509.Ujs5iL0m-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/compat_binfmt_elf.c:144:
   fs/binfmt_elf.c: In function 'init_compat_elf_binfmt':
>> fs/binfmt_elf.c:2143:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^
--
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
