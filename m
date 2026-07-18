Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8136604F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784378446; cv=none; b=kJhRY/ThnVqEK+TnHcE1eX1zT7d9JcLZdf5Z9j+HGi2JGyTtWejn0Fo4fpqS/3xfriZqW1/j77JN+r45u3/0EGlq03wjxhsJgEacHbC10nIuHx+bcKDwjorFz+woLayK+MGNqE/ZTn9lXRh9J9NjpO1jsRrgZ6rCoWg5AJBZyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784378446; c=relaxed/simple;
	bh=npxSzr2LSRndJ70X5y3FZvPPM7jIw94U3RpaRpqHupc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r4lyyp3SGGaarDOzUvXPS9EbqKg4KUVl0NkB/bBqHR4V0SPTBDBh1JH0Czzm1Ry3tAxhtRtY3hfaAJSzn3wJ+K/0fS/p4FneKhst6BwbqwlAIo7MYSzPX7hQ3pMw8SQCELG9CbhyZYbD/Pm2jJyU9AmBJRdQhW1u2CYBqfifVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lG5uYHJn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lG5uYHJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784378444; x=1815914444;
  h=date:from:to:cc:subject:message-id;
  bh=npxSzr2LSRndJ70X5y3FZvPPM7jIw94U3RpaRpqHupc=;
  b=lG5uYHJnZFBVVpsqt6ELItDkfuv9+mQSr5lnJLKEdK//vgx633SE1AL6
   BeQRVXEhIlKRyOol2IUPlgSHi84Y4Wlpcvum9DZRFDdht3eYg5GH3flBv
   6P721mMHDJ0SFlq3Kk5tvk91KUWnkMZjJ1lSC8zDlkWVpqgDTK8ALtPaF
   8wu+U01FSsfk0MD5uLSQuVA8rLY0X6uIfj6DfdZIbhuDMqItz3G+Q4tfx
   AJRBAGG44hhx6ohx2hurznsXvfkkJ9jSbFDUV9i5GQXfLRZuRo2Cz7bK4
   viGPQjLMzpIdyifDTmFYtAwYJ7c7w3UsWgM7H5DCft1+M882dDPj0a3qX
   w==;
X-CSE-ConnectionGUID: GqCNtAQDTMydoXOS81Kr3w==
X-CSE-MsgGUID: t6UDxx2qTweYvaIvSw5QhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96537827"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96537827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 05:40:44 -0700
X-CSE-ConnectionGUID: Mghm5xM1Qq+PR3Tyr4YBdw==
X-CSE-MsgGUID: 4z77WlZHRi21V22qVdRVeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="255847788"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Jul 2026 05:40:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl4LH-00000000Uly-4AAk;
	Sat, 18 Jul 2026 12:40:33 +0000
Date: Sat, 18 Jul 2026 20:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: vmlinux.o: warning: objtool: kernel_entry+0xfc:
 start_kernel() missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202607182001.2XS0a6EL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 kbuild: distributed build support for Clang ThinLTO
date:   7 weeks ago
config: loongarch-randconfig-r061-20260716 (https://download.01.org/0day-ci/archive/20260718/202607182001.2XS0a6EL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607182001.2XS0a6EL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607182001.2XS0a6EL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: kernel_entry+0xfc: start_kernel() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: smpboot_entry+0x98: start_secondary() missing __noreturn in .c/.h or NORETURN() in noreturns.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
