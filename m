Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F223E545
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730513113; cv=none; b=g+sWRDP417wDSwZBIkuJWDslaisjmVIqPtqeoGJ5N+M7p71pMaGDWzrv9DJKll5QN9QVr/+8qRBJnJ6HX8+MVvv7cLgZsnJtYTB9RshQygVYMjv8yfnmLdntqNXM3VRXKKSd03S69iRTUq/F6shIlxCbRT8EiRW6MnjC42Vt5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730513113; c=relaxed/simple;
	bh=gme/0XGSkIzyGBJC2thzHwMGvarYC2TDNHu6eAU31XM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9f9ILEo6GPiuAslF0awriSiE7f5Iab6eDEA6Whu4t3gtQJdVkb/yUKW8Yn2wS+JYXp9y+dgs/R37p5aUDItyzSjuKbuSD1wAMsQw4yhN9pyzMFmXsX3tWud+d4WMjocQYu535BzUTIAk+T84tKFJ5nQ8wb5gPwmDmkD0sEIr4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B41PZjtw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B41PZjtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730513112; x=1762049112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gme/0XGSkIzyGBJC2thzHwMGvarYC2TDNHu6eAU31XM=;
  b=B41PZjtwyf7GeFUduP9Xr/DaTxJlshKMaNXyyqIPs29iu4Y6pftBi+6I
   ahT2gP4ru5h03/2wA3QDTz8KBxoqlQgikHuW210WdKmsHaZMRf7+Ry6w6
   +k8fml5cSVZ38q+x4mm7GES5+pcqnFrydaJwm2TC1tB6C0MSSw3/3VZqw
   f4k/VHHo1SRkw8W/F7C8GHmBdVtDILbmJ+hM7KlUBgjYqyL0VjejvMD1O
   d3Z3L09UGSH+JgipJx/LmVmJSvPHu3tMte2vLc8yMRcrGypdeJiE71whf
   jJYRJGoqZATsWoFKYja58or+MEMVoLEDw0/rzRIjPE1CCP4/bqC1o7Chm
   g==;
X-CSE-ConnectionGUID: 0KS3OJ1tSZ68gq0EPA/4wA==
X-CSE-MsgGUID: 6rfYQ7VVQDyTas5d1WROgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30390617"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="30390617"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 19:05:12 -0700
X-CSE-ConnectionGUID: o/UcILWFRFWU6PSVOw9vAw==
X-CSE-MsgGUID: 5HfC/nJiQv+XYxkycK2u5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="87065738"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 19:05:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t73Vk-000iIp-0V;
	Sat, 02 Nov 2024 02:05:08 +0000
Date: Sat, 2 Nov 2024 10:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-group 5/6] io_uring/filetable.h:55:26:
 warning: cast from pointer to integer of different size
Message-ID: <202411020914.n1bLObj1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-group
head:   a2a81f77e792828fb8e8888c201f2ff1448ecf06
commit: 62db18ef7237fef8c03edb11965d083d439c1a2b [5/6] io_uring: extend io_uring_sqe flags bits
config: arc-vdk_hs38_defconfig (https://download.01.org/0day-ci/archive/20241102/202411020914.n1bLObj1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020914.n1bLObj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020914.n1bLObj1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.h:13,
                    from io_uring/io_uring.c:83:
   io_uring/filetable.h: In function 'io_fixed_file_set':
>> io_uring/filetable.h:55:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      55 |         node->file_ptr = (__u64)file |
         |                          ^


vim +55 io_uring/filetable.h

    51	
    52	static inline void io_fixed_file_set(struct io_rsrc_node *node,
    53					     struct file *file)
    54	{
  > 55		node->file_ptr = (__u64)file |
    56			(io_file_get_flags(file) >> REQ_F_SUPPORT_NOWAIT_BIT);
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
