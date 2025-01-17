Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C11B0F2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157737; cv=none; b=Sq5q8ETcO6Lzyh8z2FIdP3P7nUr16m/ici+tU+FYUXqUrqm3FYV4ufkXg8bBMt5s7ROP80Ud2Q7OXRZartNmWFRy+uhwaTgcl5mY4CbUIEZfQtm6qMiVQOW3HBrg6lq/WJriJyQv7skqqXI7yEXzuAUcKm5+hNl23KO8c/vwovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157737; c=relaxed/simple;
	bh=corDm2Ul8QOgaXud0mWJn7DrKB2FezG6bic7vA3eA84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXWi+Anm4BfhA7t0V/7xOSIPm8dlQUr4ly6qCbLqVZzPqvF+CVEJFqe/r6BItma+a8Hlp5CLIb5C0Yocbs3sXiZIlxzGnvnLK1fIUrAfHeGItQMdZCGEa9WW97IpL8HmB/f/cN+t7a5Jo9onTOpfgcPzeSKM4mgHDF/I2wB4RxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJ3XHyDz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJ3XHyDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737157736; x=1768693736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=corDm2Ul8QOgaXud0mWJn7DrKB2FezG6bic7vA3eA84=;
  b=iJ3XHyDziERylcLF+SnFBscNlLwCV5umFkvbf6P3Pqv+dhKbnMSJ+Rw3
   uB5zCR0BICKUwWu9bLRiqoTNE5GDRWTqmuVTPU7t25zhoYUi6a9EgDlSk
   8oiRc8A7P5/kBNFEuuWQfVT+cacqkiknVbqVVdQV1ssm4kUcykg0rv/u0
   C7P4aZjRHy4k0X8q3KNXEsdsQg0PonQcfqZmofASBRA57AYu6/iBT8lGd
   PDe+opoMGTaXudBESJihZqSW1xh5QeFMnR8by9YA/pZsombGCllyRYCAt
   8LAkrR6fyP0oaZcXUxLXD2H1BBx2iMbPXRYsP7KF9Va2/Crtq0gTq9NxI
   w==;
X-CSE-ConnectionGUID: 9Wokbe3uTHePcl7DHzHfew==
X-CSE-MsgGUID: tk7XWc34RO+x7gsrPyAuhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49022117"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49022117"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 15:48:52 -0800
X-CSE-ConnectionGUID: YXCAi9v2S3al7ub/N/KQ/Q==
X-CSE-MsgGUID: VoLqflfySIiEkcNFhCvRKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="106118565"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2025 15:48:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYw52-000TrI-3D;
	Fri, 17 Jan 2025 23:48:48 +0000
Date: Sat, 18 Jan 2025 07:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Chenchen <dongchenchen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1407/1407]
 include/linux/kernel.h:851:43: warning: comparison of distinct pointer types
 lacks a cast
Message-ID: <202501180701.f6sYgGum-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   52349611d09c6a9a2b558b3ce1cb1dca0d47dbe8
commit: 7ad207616673722d5cf52c18d9464e0d3184ffc9 [1407/1407] arp: Prevent overflow in arp_req_get().
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250118/202501180701.f6sYgGum-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180701.f6sYgGum-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180701.f6sYgGum-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/list.h:9,
                    from include/linux/module.h:10,
                    from net/ipv4/arp.c:78:
   net/ipv4/arp.c: In function 'arp_req_get':
>> include/linux/kernel.h:851:43: warning: comparison of distinct pointer types lacks a cast
     851 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                           ^~
   include/linux/kernel.h:865:18: note: in expansion of macro '__typecheck'
     865 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/kernel.h:875:31: note: in expansion of macro '__safe_cmp'
     875 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/kernel.h:884:25: note: in expansion of macro '__careful_cmp'
     884 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   net/ipv4/arp.c:1106:33: note: in expansion of macro 'min'
    1106 |                                 min(dev->addr_len, sizeof(r->arp_ha.sa_data)));
         |                                 ^~~
   net/ipv4/arp.o: warning: objtool: missing symbol for section .init.text


vim +851 include/linux/kernel.h

526211bc58c4b3 Ingo Molnar    2009-03-05  837  
^1da177e4c3f41 Linus Torvalds 2005-04-16  838  /*
3c8ba0d61d04ce Kees Cook      2018-03-30  839   * min()/max()/clamp() macros must accomplish three things:
3c8ba0d61d04ce Kees Cook      2018-03-30  840   *
3c8ba0d61d04ce Kees Cook      2018-03-30  841   * - avoid multiple evaluations of the arguments (so side-effects like
3c8ba0d61d04ce Kees Cook      2018-03-30  842   *   "x++" happen only once) when non-constant.
3c8ba0d61d04ce Kees Cook      2018-03-30  843   * - perform strict type-checking (to generate warnings instead of
3c8ba0d61d04ce Kees Cook      2018-03-30  844   *   nasty runtime surprises). See the "unnecessary" pointer comparison
3c8ba0d61d04ce Kees Cook      2018-03-30  845   *   in __typecheck().
3c8ba0d61d04ce Kees Cook      2018-03-30  846   * - retain result as a constant expressions when called with only
3c8ba0d61d04ce Kees Cook      2018-03-30  847   *   constant expressions (to avoid tripping VLA warnings in stack
3c8ba0d61d04ce Kees Cook      2018-03-30  848   *   allocation usage).
3c8ba0d61d04ce Kees Cook      2018-03-30  849   */
3c8ba0d61d04ce Kees Cook      2018-03-30  850  #define __typecheck(x, y) \
3c8ba0d61d04ce Kees Cook      2018-03-30 @851  		(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
3c8ba0d61d04ce Kees Cook      2018-03-30  852  

:::::: The code at line 851 was first introduced by commit
:::::: 3c8ba0d61d04ced9f8d9ff93977995a9e4e96e91 kernel.h: Retain constant expression output for max()/min()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
