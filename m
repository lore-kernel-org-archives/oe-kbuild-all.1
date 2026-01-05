Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86A01FC8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 00:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767571219; cv=none; b=b2Fyy9obK6ikmcjLpj68COkVtyBOeZevG/4Mt5hfXMgrdFNjkhWL/ubtz+6txgqiPpGgdq52w+IAXGAEAmL9Z94kN2E+tSvKq9QSV72lnEzxdst2LCQxQ7btgjfYb4rHMaOTHE4os0bawY5hLCTwb3yy0aj1EG701Kur3/D8/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767571219; c=relaxed/simple;
	bh=5OZKyZaMawXFZK7+keKo2rMBFDdw91doLPLybDLVqv4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pfn52dKKXxBWXtIc5Pk1NUGMOmS8Oe9G5yLzvl700kjtPryhROM7WczKtI+xQGKgHWjlm/AamE/KuanFu75Ex94DWWlDDKnz6Qa0xrVmVHVHjAnHq7GlnPsGZEAJE5W3kb7hOjb4YYYM167UkiZBSloxAcAkCfJjHOW2hfFmRXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZH5sZCPk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZH5sZCPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767571218; x=1799107218;
  h=date:from:to:cc:subject:message-id;
  bh=5OZKyZaMawXFZK7+keKo2rMBFDdw91doLPLybDLVqv4=;
  b=ZH5sZCPk2ZoZXba5YunZlIRu5cbhQU0L/JKxa71d8pIy4VNRhTc26QCw
   VA43hO63cGpswmlqy1AWvcyjxtAVvhhedqeL1sQ55Nd5VMFn9Hj69HMkd
   Q/K/++Kh47pdcY7elmSWLbOv9XXMfniQG95a+wqpPoV35UI4xWw0tCFX7
   25XduH7/QsmC5Wx4VdEu/w1HHxajuIm/A6/jDfrBeIYbSxtfRt4K9A8Qk
   U1I3OMBHVG0GO44coxHqwlstSiA9A5czD6pQGNpTt3BlgpzuA7d4cSKFD
   PW5jLSf2VpCyIVKDBqtjxeXbi78efR4ewlgYAU0bvZ8nLRGVWpmtHX+IH
   g==;
X-CSE-ConnectionGUID: iMpbyvEcRRed4kC3Zdctlg==
X-CSE-MsgGUID: sEsB8isBS9qPaL+54Pcqgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="71521844"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="71521844"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 16:00:17 -0800
X-CSE-ConnectionGUID: Omf8jFx7SfaROBfKWRj4rw==
X-CSE-MsgGUID: z9tWHkBPRs6Zr6omMA/iEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="232959205"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jan 2026 16:00:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcY17-000000000pl-0EYZ;
	Mon, 05 Jan 2026 00:00:13 +0000
Date: Mon, 05 Jan 2026 08:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: vmlinux.o: warning: objtool: kernel_kexec+0x7c:
 machine_kexec() missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202601050709.pbU4aEGy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   54e82e93ca93e49cb4c33988adec5c8cb9d0df31
commit: d162feec6b6e7ed97986118450812fdd7e9ba202 LoongArch: Add preparatory infrastructure for kexec_file
date:   3 months ago
config: loongarch-randconfig-r121-20260104 (https://download.01.org/0day-ci/archive/20260105/202601050709.pbU4aEGy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050709.pbU4aEGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050709.pbU4aEGy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kernel_entry+0x0: unreachable instruction
   vmlinux.o: warning: objtool: smpboot_entry+0x0: unreachable instruction
>> vmlinux.o: warning: objtool: kernel_kexec+0x7c: machine_kexec() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
