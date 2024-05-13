Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87755152DF7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 13:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715607153; cv=none; b=ppeFUPfsEXtYRFoxTirknudHL5zA+h8WsjzItwSlp9BkeSgU1qJcMul0E6GRw8+zPN1uAqEhXojKQb3fENdF1AUjHzrDGgamLU9eMcY4i/LnR/AlqEMOKD8gsEzeyh3wHIfWSY2fcFFSzEVoHtSZzP/ArN5acARqtXJoFJgKdiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715607153; c=relaxed/simple;
	bh=FAIzuGTlDMO7Sp7w6Eno/I/YyI9Zc4o75wkJYh6NSag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HAkLTSkCYy2fZQJtuMpzgE8TxwjsrE+ND3nuqbrrX/kfkKexCCrZJ3oj+6jVGZmUBPDBQjWz30BowzOePr4PwBWYJD5RKafZimJSnBbl+tS6LO2yjduqKmgrUJa1885vuoRKloYwqf8okqtHFoEHvKtO4umrwSrtIe1Td8R+CDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JI5Qe2CV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JI5Qe2CV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715607151; x=1747143151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FAIzuGTlDMO7Sp7w6Eno/I/YyI9Zc4o75wkJYh6NSag=;
  b=JI5Qe2CVg/uc7+lQeUg2YSpuzAkqvGkmQ26i5fgRzjdWn2NBjiipdr7m
   lUBotoLQUxJnDZcC8zJg6Xnsc0Cp0m6hz5EC4M8Xk42d5tfZ+Se6PzicI
   6cmaHdmo4drgjHYiOu7OYbIvk48CNsaCUWq+RyuFVMnChxflHBYGc5vgY
   Yhqic+JtYAJur2b7i7bVEevJY+JaYtjCMjANg9YdSx1RI3/q0YEUwos/2
   6ZLi6iMOhq7uDU7dWm3QJ/OsVDVjCPm65xYlNgonbbfFxR7My+CDohZnH
   k00cjPjMDfsi8SbpNI15+CRQpjWhN2j2ErMdcL9Z3Q0TXet1Bkc2aBK2B
   A==;
X-CSE-ConnectionGUID: cJST6YPFSYuT5LGdC7olrA==
X-CSE-MsgGUID: dpUzVdIlReCqEdiOOHButw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="29059821"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="29059821"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 06:32:30 -0700
X-CSE-ConnectionGUID: WSaT7DKqSH+6fwX0GNr3ug==
X-CSE-MsgGUID: 8ozxJwkRSAC9WL6QVBhL8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30380077"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2024 06:32:30 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6Vn1-000A8Z-1E;
	Mon, 13 May 2024 13:32:27 +0000
Date: Mon, 13 May 2024 21:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12200/12793] xtensa-linux-ld:
 arch/xtensa/boot/lib/zmem.o:undefined reference to `__tsan_read1'
Message-ID: <202405132146.zRvUhujg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba6c795dc73c22ce2c86006f17c4aa802db2a60
commit: 9cf51a6d1de06d2b3f37899c16d0a5723edd1cc9 [12200/12793] Makefile: remove redundant tool coverage variables
config: xtensa-randconfig-r006-20221202 (https://download.01.org/0day-ci/archive/20240513/202405132146.zRvUhujg-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405132146.zRvUhujg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405132146.zRvUhujg-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .start VMA [d1000000,d1000007] overlaps section .image VMA [d0003000,d1566a8f]
>> xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0xc): undefined reference to `__tsan_read1'
>> xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x10): undefined reference to `__tsan_read4'
>> xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x14): undefined reference to `__tsan_write4'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x43): undefined reference to `__tsan_read1'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x4e): undefined reference to `__tsan_read1'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o: in function `gunzip':
>> zmem.c:(.text+0x70): undefined reference to `__tsan_read1'
>> xtensa-linux-ld: zmem.c:(.text+0x7b): undefined reference to `__tsan_read1'
   xtensa-linux-ld: zmem.c:(.text+0x93): undefined reference to `__tsan_read1'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:zmem.c:(.text+0xb3): more undefined references to `__tsan_read1' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o: in function `gunzip':
>> zmem.c:(.text+0xd6): undefined reference to `__tsan_read4'
>> xtensa-linux-ld: zmem.c:(.text+0xf0): undefined reference to `__tsan_read4'
>> xtensa-linux-ld: zmem.c:(.text+0x10a): undefined reference to `__tsan_write4'
   xtensa-linux-ld: zmem.c:(.text+0x11c): undefined reference to `__tsan_read4'
   xtensa-linux-ld: zmem.c:(.text+0x137): undefined reference to `__tsan_write4'
   xtensa-linux-ld: zmem.c:(.text+0x154): undefined reference to `__tsan_write4'
   xtensa-linux-ld: zmem.c:(.text+0x163): undefined reference to `__tsan_read4'
   xtensa-linux-ld: zmem.c:(.text+0x173): undefined reference to `__tsan_write4'
   xtensa-linux-ld: zmem.c:(.text+0x17d): undefined reference to `__tsan_write4'
   xtensa-linux-ld: zmem.c:(.text+0x18b): undefined reference to `__tsan_write4'
   xtensa-linux-ld: zmem.c:(.text+0x1a4): undefined reference to `__tsan_read4'
   xtensa-linux-ld: zmem.c:(.text+0x1b3): undefined reference to `__tsan_write4'
>> xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text.startup+0x0): undefined reference to `__tsan_init'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o: in function `_sub_I_00099_0':
>> zmem.c:(.text.startup+0xa): undefined reference to `__tsan_init'
>> xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x14): undefined reference to `__tsan_read4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x1f): undefined reference to `__tsan_read4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x36): undefined reference to `__tsan_read4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x45): undefined reference to `__tsan_read4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
>> inflate.c:(.text+0x55): undefined reference to `__tsan_read4'
>> xtensa-linux-ld: inflate.c:(.text+0x6f): undefined reference to `__tsan_write4'
>> xtensa-linux-ld: inflate.c:(.text+0x86): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xb9): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xc5): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xd8): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xe4): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xef): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xfc): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x108): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x114): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x127): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x137): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x146): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x174): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0x193): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x1a3): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x1af): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x1bb): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x1c7): undefined reference to `__tsan_write4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate_workspacesize':
>> inflate.c:(.text+0x1d2): undefined reference to `__tsan_write4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x1de): more undefined references to `__tsan_write4' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x24b): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x25f): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0x268): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x27b): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x288): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x2c4): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x2d7): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x2e3): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x2fc): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x310): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x31b): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x32b): undefined reference to `__tsan_write4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x42c): undefined reference to `__ubsan_handle_out_of_bounds'
>> xtensa-linux-ld: inflate.c:(.text+0x430): undefined reference to `__tsan_write2'
>> xtensa-linux-ld: inflate.c:(.text+0x434): undefined reference to `__tsan_read2'
>> xtensa-linux-ld: inflate.c:(.text+0x438): undefined reference to `__tsan_write1'
   xtensa-linux-ld: inflate.c:(.text+0x460): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x472): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x48b): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x49b): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x4ac): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x4ba): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x4ce): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x4e4): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x4f3): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x508): undefined reference to `__tsan_read4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x51e): more undefined references to `__tsan_read4' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x5d4): undefined reference to `__tsan_write4'
>> xtensa-linux-ld: inflate.c:(.text+0x5f4): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0x634): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x652): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x66f): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x686): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x69c): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x6af): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x6be): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x6d6): undefined reference to `__tsan_write4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x6e8): more undefined references to `__tsan_write4' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
>> inflate.c:(.text+0x718): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0x753): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x762): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x76e): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x784): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x793): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x7a2): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x7b0): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x7c0): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x7cf): undefined reference to `__tsan_write4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x7de): more undefined references to `__tsan_write4' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x82e): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x86e): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x887): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0x8a8): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x8ce): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x8e4): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x8f4): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x907): undefined reference to `__tsan_write4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x916): more undefined references to `__tsan_write4' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x9e6): undefined reference to `__tsan_read1'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xa22): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xa3a): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xa46): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xa8b): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xa9a): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xaa6): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xac7): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0xafb): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xb0e): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xb27): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xb54): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xb62): undefined reference to `__tsan_write4'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0xb78): more undefined references to `__tsan_write4' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xb8e): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0xbb7): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xbd2): undefined reference to `__ubsan_handle_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xbee): undefined reference to `__ubsan_handle_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xbfe): undefined reference to `__tsan_write2'
   xtensa-linux-ld: inflate.c:(.text+0xc2e): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xc3c): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xca3): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xcb1): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xcc5): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xcf8): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xd0e): undefined reference to `__ubsan_handle_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xd22): undefined reference to `__ubsan_handle_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xd30): undefined reference to `__tsan_write2'
   xtensa-linux-ld: inflate.c:(.text+0xd53): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xd62): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xd76): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xd83): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xd98): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xdb0): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xdb8): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xdd6): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0xde3): undefined reference to `__tsan_read2'
   xtensa-linux-ld: inflate.c:(.text+0xe00): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0xe16): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xe47): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xe60): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xe6e): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0xe8b): undefined reference to `__ubsan_handle_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xea2): undefined reference to `__tsan_write2'
   xtensa-linux-ld: inflate.c:(.text+0xeb0): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xebe): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xf0c): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0xf27): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xf53): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xf66): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0xf83): undefined reference to `__ubsan_handle_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0xf96): undefined reference to `__tsan_read2'
   xtensa-linux-ld: inflate.c:(.text+0x100c): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0x1027): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0x1052): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0x106b): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x109c): undefined reference to `__tsan_read1'
   xtensa-linux-ld: inflate.c:(.text+0x10b7): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0x10e2): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0x10fb): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x1117): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x1124): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x115a): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x1172): undefined reference to `__ubsan_handle_out_of_bounds'
   xtensa-linux-ld: inflate.c:(.text+0x117a): undefined reference to `__tsan_write2'
   xtensa-linux-ld: inflate.c:(.text+0x119e): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x11b2): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x11c6): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x11fd): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x1219): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x1227): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x123b): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x124d): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x1273): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x1282): undefined reference to `__tsan_write4'
   xtensa-linux-ld: inflate.c:(.text+0x1292): undefined reference to `__tsan_read4'
   xtensa-linux-ld: inflate.c:(.text+0x12a3): undefined reference to `__tsan_write4'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
