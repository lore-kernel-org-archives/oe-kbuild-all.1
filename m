Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A31C5D5A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018143; cv=none; b=HT8WfuSo8r0ZkZLEq7mAB9J7tM4gBCq1tWzBckLnt1Tc/XkOMTjXQF/g4X720h9OU9Wsgs2fNT1TPeeg/IjhUMi3WpceBSbghrXVIn4lmBgghwXXFVC/FThZ78gNdD9okzSB68bo4iGqUvvgt7rJkDepP3t1bC1XWFdnW8HZhrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018143; c=relaxed/simple;
	bh=OYRpBp3oHLUUIA0cEZ9B6Eh2M8KFo+9BmMKtbRqiUt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3TapvK2ArD8yQHx4f2m0DoiNswnF7esuw9Uk1jSoDR4XUGI3YHwuoYHGKhgkM5JVGFbY78W5gW1lQjMuCp2lghq1jg5ZqOcJvOpnDypFytzdK88qGSt7hgim2UNFUK/wD5OUscgyr0dO5ynVm8cR8jzhuQbjldyw7+IzEuMJHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJMLb00v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJMLb00v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751018142; x=1782554142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OYRpBp3oHLUUIA0cEZ9B6Eh2M8KFo+9BmMKtbRqiUt0=;
  b=YJMLb00vJ+VVVm8egk1wljhi6PvIBmb9mqnGBo1Ek9O6cwXk9tIsAJ+F
   7nUuhwSB2Vj8vH6c4zFeAFdnaSfiU0hOcqEuWc+bKd6D04kxVAOa+qnJV
   EN/xPowzN/z7DbdKx/wGOXrubS95+5ljyuvQ8vHqe+xQmCAXQgJBuUhep
   VPYr+lP3GHOahm7zb5uI0EqH/4m9IlDe11ayik20Eg10qk5c98HOQwA8m
   Na1MBKeGeILrFQO+i0vAiJ5mLOrIO838Rvr/RXz1QyCExdBMj8a6tzNVc
   +vOCdt2QT9CHCYp812618B4ZaS3eJ+xlLE1ci52mxKVpR7UMJuq4XpGZ7
   A==;
X-CSE-ConnectionGUID: ygUwgGnWRTu7JCl+5qstYQ==
X-CSE-MsgGUID: YUQ/1LNdSgGKLySnZxlsvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53201877"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53201877"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:55:41 -0700
X-CSE-ConnectionGUID: rtcuhLw9S3iH4klh7A+MLQ==
X-CSE-MsgGUID: gYURfMITSIOknoxoxg/TRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153060396"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jun 2025 02:55:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV5o2-000W2c-1z;
	Fri, 27 Jun 2025 09:55:38 +0000
Date: Fri, 27 Jun 2025 17:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 6/6] fs/binfmt_elf.c:2143:13: error:
 no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202506271753.dckeg6YZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   111ee63e22d9e01cb68d95a9e4012cafa5f4ef08
commit: 58e2fa4ec4b1e15b7c7510bc98befafa31c03f70 [6/6] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-buildonly-randconfig-004-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271753.dckeg6YZ-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271753.dckeg6YZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271753.dckeg6YZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/binfmt_elf.c:2143:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 error generated.


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
