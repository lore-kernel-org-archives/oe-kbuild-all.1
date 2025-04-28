Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404631AD3E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889585; cv=none; b=hdGceSD75vc1JJC7sdbYtG2Lhcp/D9W6uQsGk3vyNQuGPiw2N+UBWELFIhWq9svNpEeT5ReCKI0sQALdOJSL951kLB9f3fRQVxdNajlRTIUcttkxtwpz0OtIcwgjaECE7CYy+8zEeuqHU2YEw5+m0F8HS7AkhKB4TyBqU6ww3BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889585; c=relaxed/simple;
	bh=xQ90zB7+vPwwhI3B6Iq39KxC9KveBoFhqH5TcwNKBVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IaS1ZtV3vAFd4NkCAWRPGEGZNJb7AVfAKx8g7ja5iShD0JlT+iP6TLhBYw6sfzdRmEcn2D1oIg0ZCWJ6pJRA7MFojoHCA5Wt12VjacnO3aEDUeFYZDDiYORO8cFWI1+F3+6dVssHzM0TlPhRUetT7sVbqRKWABlNBqN0MzSRDBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUxFPw8w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUxFPw8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889583; x=1777425583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xQ90zB7+vPwwhI3B6Iq39KxC9KveBoFhqH5TcwNKBVI=;
  b=NUxFPw8wYgCzevSDk8MLg6j0guO4wq3OhxqS1De973CHteI0OsJq6vXW
   /nORFMEJq5wcBZ0wsFsw0CidFAKifRAjvfRIUMUSgC4P2OfBATG3KQrjE
   j9eQXT99gDqFwaYFN9LzIvMHCdwYii20FJi6hUGX6HYG6BfG8xlrfkRQ+
   udoCGdmRQYeJS6xJD5asEl53OonmUxX0Yy3716gY5cqR6BconAbdTdSSE
   kfdV72V5w5OrD6CGE2W/+wtcB9EA1aTxzDsbdLK7oCoqF3JoKO7AMR3ub
   QqCvd4u5ssrqUikquaVQRRAoJdKzk9u0f6vMdOIXDdLTkwlngiuHQXOeO
   w==;
X-CSE-ConnectionGUID: 8HSPIK4QQFmVpN4x7fja+g==
X-CSE-MsgGUID: /Ulem+hMT6OLVdVVyxNSdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165286"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51165286"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: Pd6BuMBxTpOdI9uiEvWAmg==
X-CSE-MsgGUID: Uyl8r5I1RsydFUwCMb9gAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164775824"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Zd9-00004a-0x;
	Tue, 29 Apr 2025 01:19:27 +0000
Date: Tue, 29 Apr 2025 06:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] include/linux/kern_levels.h:5:25:
 warning: format '%ld' expects argument of type 'long int', but argument 2
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202504290641.ll53oEqJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eugene,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: 1be052b20ba04b635cf87bcff80de5314697953e [1/1] ANDROID: Initial commit of Incremental FS
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20250429/202504290641.ll53oEqJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290641.ll53oEqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290641.ll53oEqJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/incfs/format.c:5:
   fs/incfs/format.c: In function 'incfs_read_next_metadata_record':
>> include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:306:16: note: in expansion of macro 'KERN_WARNING'
     306 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   include/linux/printk.h:307:17: note: in expansion of macro 'pr_warning'
     307 | #define pr_warn pr_warning
         |                 ^~~~~~~~~~
   fs/incfs/format.c:616:17: note: in expansion of macro 'pr_warn'
     616 |                 pr_warn("incfs: The record is too large. Size: %ld",
         |                 ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
