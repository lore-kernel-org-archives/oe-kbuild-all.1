Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495CA2BD01B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 01:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771635940; cv=none; b=NB+fYjkNvjGhyQaI5G3wTuY+JhNi+DN9GEQQCcLApEyo4ouiE4jNBX1RJuPJFTnlIA3McjIwfQrliiMuiWF7hyY9f+itoC02gqAiAWLeXPktJjgTrH3UFGtsLAqM8K179ofibjlqyCI8C3vwTHUyxyw+FjTVEv8MVCLL9a5MXkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771635940; c=relaxed/simple;
	bh=75R3lczeY+Qob2ytVyXZyBm6m6nE7turVv5TuVGf6TM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AXfZAfTvjpGTXstJ7+1MbTxho2S8dz2BaE67QWr7KuSKzZiy8QHNAh/IJ3DAUiRiCIxjAgHl0LsFFb6iwbN7BdRAFd8K4mz76C6hrK5d53QsYjIAPE3zlrra2VLfjdLnSNCyQWywjib2QFXnB3obeeAYorqhKEwbqkkybdDXamU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3n/edUr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3n/edUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771635939; x=1803171939;
  h=date:from:to:cc:subject:message-id;
  bh=75R3lczeY+Qob2ytVyXZyBm6m6nE7turVv5TuVGf6TM=;
  b=Y3n/edUrvTE4mcjmGrxY1h+c8eSIcIbgoZ98aYgJj24g6VD3iPIYLzwb
   fcd8stAvDa+LOoXBl6MAE7Q+seiXlT7oJ2nsOBld0hGVo6TO6D2X+dBcM
   GrYdTJEFc5+b1x5SQrRyyr9ZYWb2pS9NctTzlw9IKXNyGuVkfw+p4usF1
   C5udRGecCPKqwgkeZjYP5PUOAV6SSLpZJ3VvNcbOnDg7rvDmmHxiTqDkg
   Y2Msw5L/zrB5ERDUv4/FdfNzhJd0YSMwb0YDpY8mhQ93v1HTxeADjgPyw
   7WILbr9lEV4gKkN6jDzz+ELRJkD9qQrQUQMvb/VEhNbuaYZQCl2c+0guZ
   w==;
X-CSE-ConnectionGUID: PblrnsgSSku4Io2dP6S7jQ==
X-CSE-MsgGUID: hksAVErgSy6uLtexCHI9qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60303825"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="60303825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 17:05:39 -0800
X-CSE-ConnectionGUID: YRVhnxS2SteCLLtzL6dfAg==
X-CSE-MsgGUID: 0d7nuYRfQDWmoEFp1p+UxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219538854"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Feb 2026 17:05:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtbR8-000000014bj-494C;
	Sat, 21 Feb 2026 01:05:34 +0000
Date: Sat, 21 Feb 2026 09:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: vmlinux.o: warning: objtool: smpboot_entry+0xa4:
 start_secondary() missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202602210907.BdeqLsP5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a95f71ad3e2e224277508e006580c333d0a5fe36
commit: 1b2f4706c6a20ab6ac41533dd8032d54322076e3 LoongArch: Use UNWIND_HINT_END_OF_STACK for entry points
date:   7 weeks ago
config: loongarch-randconfig-r072-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210907.BdeqLsP5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210907.BdeqLsP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210907.BdeqLsP5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kernel_entry+0xf0: start_kernel() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: smpboot_entry+0xa4: start_secondary() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: _samsung_clk_register_pll+0x11c: unreachable instruction
   vmlinux.o: warning: objtool: kernel_kexec+0xdc: machine_kexec() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: gdb_serial_stub+0x7b8: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
