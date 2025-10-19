Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59905191F91
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 20:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760905871; cv=none; b=BQCj/9qmzYIjycC1nIE33syJ/CcNXL+A4FcsFxwMQ39cXBonrLicd145rAsZz6cHFI1LwkoW0tAPfjN17aIHn/DbCO3Tp56n8c5/vMrE//Uru/3xS1YJkFvK9pkljasu0o+utOmPnE0SLugbssMMK7DfYVTXW30zWEYxz/DJNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760905871; c=relaxed/simple;
	bh=MTk7yGIAol5eYqREUypXOu+cd7vVZyYpIO6DxaxMV3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwxOAqHAoU5MHLHvlJz2Zfsn2mQOupPDzaA+w5w1gFdHJTgdd6nWAjuthFn3InD6mq3vGT5AklbeO7gYqSTV0hCyauXIeCeKk84mQa2gClHMj1i6+r9Eatg9S8R3gqhRLlX09bSE78m3/tR6agi08ae3XEcH+rMd5RNG+SBOaoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=je93GJZ3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="je93GJZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760905868; x=1792441868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTk7yGIAol5eYqREUypXOu+cd7vVZyYpIO6DxaxMV3I=;
  b=je93GJZ3STgxuCoAjBrWba0AmDJtg0jBM9oZ96bCohbxYqAG31cTymcP
   YNFK1Fs6mS0UlU3M2eTo3IPcjhMk8GtZoH7VFua68DqAfMlvRjaGJE5G7
   Xjz9G/PLg0vPfR+3nt2FUkiJVu0Hhztgzu1nKMP5OgzequK3qAquWW+lf
   cyNtMNfSw7K7vJ1ensrU+FpJAX7xakVUePP8d4MPd4a6DQSL6fpstzYxm
   pK9/3bXYKkOxVNiLeDL2z3DnwPvGFHH75Ci3IDeHFiUuG2ESkal83NR4G
   uu/eX0trBjBCGHR4fWzx6QxAmhFic5c2ojv3EvMet8j5fxJqfOwc9+1Wp
   g==;
X-CSE-ConnectionGUID: Mo1a3p+URyqbEnJ5gbtebA==
X-CSE-MsgGUID: NTWRdFwzQFGZ7Sztso2NSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62932253"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="62932253"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 13:31:07 -0700
X-CSE-ConnectionGUID: NFRf0JmfQa6fey0TQV8clw==
X-CSE-MsgGUID: tEdJkdE3TUiJ/VOmFBNEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="182318113"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2025 13:31:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAa3U-0009Iz-21;
	Sun, 19 Oct 2025 20:31:04 +0000
Date: Mon, 20 Oct 2025 04:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:void-gfp/v2 2/2] drivers/tty/vt/vc_screen.c:56:54: warning:
 passing argument 1 of 'free_pages' makes pointer from integer without a cast
Message-ID: <202510200449.vxsbuIVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git void-gfp/v2
head:   5bc4806712d9e97f6b0344869d11b529287dc037
commit: 5bc4806712d9e97f6b0344869d11b529287dc037 [2/2] mm, treewide: make addr parameter of free_pages() void *
config: arc-randconfig-002-20251020 (https://download.01.org/0day-ci/archive/20251020/202510200449.vxsbuIVo-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200449.vxsbuIVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510200449.vxsbuIVo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:17,
                    from arch/arc/include/asm/smp.h:104,
                    from arch/arc/include/asm/cmpxchg.h:14,
                    from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from drivers/tty/vt/vc_screen.c:29:
   drivers/tty/vt/vc_screen.c: In function '__free_free_page_ptr':
>> drivers/tty/vt/vc_screen.c:56:54: warning: passing argument 1 of 'free_pages' makes pointer from integer without a cast [-Wint-conversion]
    DEFINE_FREE(free_page_ptr, void *, if (_T) free_page((unsigned long)_T));
   include/linux/cleanup.h:211:71: note: in definition of macro 'DEFINE_FREE'
     static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
                                                                          ^~~~~
   drivers/tty/vt/vc_screen.c:56:44: note: in expansion of macro 'free_page'
    DEFINE_FREE(free_page_ptr, void *, if (_T) free_page((unsigned long)_T));
                                               ^~~~~~~~~
   In file included from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:14,
                    from include/linux/tty.h:5,
                    from drivers/tty/vt/vc_screen.c:33:
   include/linux/gfp.h:383:30: note: expected 'void *' but argument is of type 'long unsigned int'
    extern void free_pages(void *addr, unsigned int order);
                           ~~~~~~^~~~


vim +/free_pages +56 drivers/tty/vt/vc_screen.c

fcdba07ee390d9 Jiri Olsa         2011-02-07  55  
e730c373b6ff16 Jiri Slaby (SUSE  2025-08-14 @56) DEFINE_FREE(free_page_ptr, void *, if (_T) free_page((unsigned long)_T));
e730c373b6ff16 Jiri Slaby (SUSE  2025-08-14  57) 

:::::: The code at line 56 was first introduced by commit
:::::: e730c373b6ff16a177e132859bf6ea4dbb15105f tty/vt: use guard()s

:::::: TO: Jiri Slaby (SUSE) <jirislaby@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
