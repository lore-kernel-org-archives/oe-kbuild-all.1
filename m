Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFDC28E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 04:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715661261; cv=none; b=ODyCRS/tUISCHBy+iIyWjjLJxjRnE3exMm+XGYTyJ4zGj1sjGXyOmALX++gJjbsTIgR41wkzK/GQEY8keMK8qQL6gf82OhzYK41OLKgA0oQDTdgJ+/Bn6fl8nrphLizT/Fr0Gp5V+f4wh9JcHmQD79b1qnobehQ/DBilt/wOIlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715661261; c=relaxed/simple;
	bh=R3inieFuvU0WsicqW7E6Y8FPrgXWwPyWvo5O9Z3H6Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xkh+aAO4SRnpLJVGVmtdv4iCLX3Gua/EQFXDu8D7bBKtcLd7usAATMzNNra90vh7jEJNK7outScsEqpwL8DiCiqb8G3/JLPUHf5j+TqTdFskXGUw1n61u8TZE9xUhgbil/nppj9lb1UtQjxLmirFbYCgd5D/PUIh7vq0YqVu3ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMgc8n3K; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMgc8n3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715661259; x=1747197259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3inieFuvU0WsicqW7E6Y8FPrgXWwPyWvo5O9Z3H6Qg=;
  b=mMgc8n3KzwG+1fMhuxwpKp+W6cgAIpgjWBMG34K8X0PffdrqQGYlcD70
   /EwaZ8BrRXWIzXgLcp3qUkKmLV1vBXiyhVjcjLNXPA/7tmAzOsw2QFd6f
   JQfD75TpH3CNNjB2A0ozSABeGDXCWtIoQBsJgp2GKmv8pSgByti1l16NY
   ogYOOaotoS5ymyIeldfNBxvYywtWkJtAkyc5w7f/D4bS3f+SNQ0woAHu/
   UIZ1x2MJIQmMVtdDSQJc2q37rTYNWtveLGJLSD6gkbGZZxhXYQunoIF+E
   HO6r4g6VoESa5zxIvYeedyx3oCONg1ywMoTOmQ4wD7KqmecM6u6KN+Xa9
   g==;
X-CSE-ConnectionGUID: 0ydKRCR1SCqI0PT9HwWrgg==
X-CSE-MsgGUID: YOFHYoTCRuuyeRf16M+e/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11797376"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11797376"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 21:34:18 -0700
X-CSE-ConnectionGUID: Z6VQeST9TvyPyKqKUwEEpg==
X-CSE-MsgGUID: zunlFJUYST6SllaodnFVrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="31113368"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2024 21:34:17 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6jri-000B4X-1B;
	Tue, 14 May 2024 04:34:14 +0000
Date: Tue, 14 May 2024 12:34:00 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masahiroy:kbuild 37/45] xtensa-linux-ld:
 arch/xtensa/boot/lib/zmem.o:undefined reference to `__asan_load1_noabort'
Message-ID: <202405141235.6Rmu9UYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   a6ad4c3ff62c557448610da150407c9069a73d6a
commit: 9cf51a6d1de06d2b3f37899c16d0a5723edd1cc9 [37/45] Makefile: remove redundant tool coverage variables
config: xtensa-randconfig-r032-20211203 (https://download.01.org/0day-ci/archive/20240514/202405141235.6Rmu9UYl-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141235.6Rmu9UYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405141235.6Rmu9UYl-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .start VMA [d1000000,d1000007] overlaps section .image VMA [d0003000,d1348367]
>> xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x24): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o: in function `gunzip':
>> zmem.c:(.text+0x9b): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x28): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o: in function `gunzip':
   zmem.c:(.text+0xa6): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x2c): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:zmem.c:(.text+0xc6): more undefined references to `__asan_load1_noabort' follow
>> xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x3c): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o: in function `gunzip':
>> zmem.c:(.text+0x136): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x44): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o: in function `gunzip':
   zmem.c:(.text+0x156): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x48): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:zmem.c:(.text+0x176): more undefined references to `__asan_load4_noabort' follow
>> xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o:(.text+0x58): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/zmem.o: in function `gunzip':
>> zmem.c:(.text+0x1da): undefined reference to `__asan_store4_noabort'
>> xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x0): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
>> inflate.c:(.text+0x4e): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x4): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
   inflate.c:(.text+0x5a): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x8): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x6b): more undefined references to `__asan_load4_noabort' follow
>> xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x18): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
>> inflate.c:(.text+0xab): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x1c): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
   inflate.c:(.text+0xc4): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x24): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
   inflate.c:(.text+0xf2): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x28): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0xfc): more undefined references to `__asan_load4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x30): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
   inflate.c:(.text+0x113): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x34): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
   inflate.c:(.text+0x11f): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x38): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
   inflate.c:(.text+0x12a): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x3c): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
   inflate.c:(.text+0x138): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x40): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_updatewindow':
   inflate.c:(.text+0x146): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:(.text+0x44): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x15b): more undefined references to `__asan_load4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate_workspacesize':
   inflate.c:(.text+0x180): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x1e7): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate_workspacesize':
   inflate.c:(.text+0x184): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x1f3): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate_workspacesize':
   inflate.c:(.text+0x188): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x1ff): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate_workspacesize':
   inflate.c:(.text+0x1b8): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x28f): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate_workspacesize':
   inflate.c:(.text+0x1bc): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x2a0): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate_workspacesize':
   inflate.c:(.text+0x1c0): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x2ab): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate_workspacesize':
   inflate.c:(.text+0x1c4): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x2b6): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x2cc): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x2fc): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x2d0): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x307): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x2d4): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x31f): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateReset':
   inflate.c:(.text+0x2d8): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x330): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x3ac): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x800): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x3b0): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x810): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x3b4): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x824): more undefined references to `__asan_load4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x3e0): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x948): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
>> inflate.c:(.text+0x3e4): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x962): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x3e8): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x993): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x3ec): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x9a2): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x3f0): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x9b7): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x3f8): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x9d8): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x3fc): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x9f3): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x400): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xa02): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x404): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0xa20): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x418): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xa86): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x41c): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xab4): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x420): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xac3): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x424): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0xacf): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x428): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xae4): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x42c): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xaf3): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x430): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xb02): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x434): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0xb10): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x450): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xb84): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x454): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xbbc): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x458): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xbce): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x45c): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xbfa): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x460): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xc1f): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x464): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0xc3e): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x480): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xcec): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x484): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xd20): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x488): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xd38): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x48c): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0xd46): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x494): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xd92): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x498): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xda6): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x49c): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xdbe): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4a0): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xde6): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4a4): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xdf7): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4a8): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0xe0e): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4b8): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xe6a): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4bc): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xe8b): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
>> inflate.c:(.text+0x4c0): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xe98): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
>> inflate.c:(.text+0x4c4): undefined reference to `__asan_store2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xeae): undefined reference to `__asan_store2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4c8): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xede): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4cc): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xeee): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4d0): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xf4c): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4d4): undefined reference to `__asan_store2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xf5f): undefined reference to `__asan_store2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4d8): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xf74): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4dc): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0xf90): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4e0): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0xf9e): more undefined references to `__asan_store4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x4fc): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1048): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x500): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1067): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x504): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1076): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x508): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1096): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x50c): undefined reference to `__asan_store2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x10b6): undefined reference to `__asan_store2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x510): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x10ea): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x514): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1127): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x518): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1173): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x51c): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x11cf): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x520): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1217): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x524): undefined reference to `__asan_store2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1246): undefined reference to `__asan_store2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x528): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1260): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x52c): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1278): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x530): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o:inflate.c:(.text+0x1290): more undefined references to `__asan_load4_noabort' follow
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x53c): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x12ff): undefined reference to `__asan_load1_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x540): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x130a): undefined reference to `__asan_load2_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x544): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1324): undefined reference to `__asan_load4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflateInit2':
   inflate.c:(.text+0x548): undefined reference to `__asan_store4_noabort'
   xtensa-linux-ld: arch/xtensa/boot/lib/inflate.o: in function `zlib_inflate':
   inflate.c:(.text+0x1340): undefined reference to `__asan_store4_noabort'
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
