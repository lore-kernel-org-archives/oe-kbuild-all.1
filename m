Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE5DBA49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724739781; cv=none; b=GjcVPzvH/96pJOhBGuKe5QH/DCvFVlABGx+3Z5bjWUEFMXxlaDPqNZ0wreu9qPniLuXZXAalTOibj0/bpB/qY92A6lS6Ke+z2dCRfRoOcNPbXiG5/DJHAOTdSNZOzPs7s/OGI/j2sw+4/hN+HK95buQpHH3NIwQbaSpLgeJIRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724739781; c=relaxed/simple;
	bh=vjv6cq/hUumpq2H0zWrK8gIlsw1TATOpRuKOc1atGpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Il4WeYKAhFrKrJUTNHMQ4X18GuvCj1Kg5p8ZEovAES1LmQLt01KI73vsM9FrMNfH5Sws/afhV1th3bXl8R1e2S+7Bdi9C23+vlNLEDltp+ha34ZUNDUO+Q0n8pUWB5M8q5Pc4u6wHIbt+/qaVlrNFT4ZVOidHVCEIbrOiZ0ncVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnmX0qM2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnmX0qM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724739780; x=1756275780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjv6cq/hUumpq2H0zWrK8gIlsw1TATOpRuKOc1atGpg=;
  b=EnmX0qM2s+fKDcs6L5oe0OYmC+y9ES4kOr2Bh1Rz77MbP5VBU/w7e5/h
   jOyvtOX0BjKjV/r2KajIsRB1YxbOAoVyzGkSlbOdcRLz6RCtJfFusZlCm
   CAr6mkqvnlLG4JnVIgFfxSBmIYEV9aIrAXXjVlB16xUgH/kVeE5mweoUE
   2QfKxjHXV39FZNO9GuHFPRI0xuo0TsfwjmTqt4vl9RoPTEHWRDGXe96XI
   A/hZjr2E1hQWwin+MwT+ykfR8hRLG446mby2MyXQFjSGo5EEPULyC+4Ym
   2aXiJOP5RvJZONnMDq9HVJ453314nWTUUqIXlMEt7j3DOD234fN/th3fl
   g==;
X-CSE-ConnectionGUID: zRA4U3JwTuShGf6mHmVSag==
X-CSE-MsgGUID: tjNLikhnR2y+KJ4Dh4gdUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40666923"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="40666923"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 23:22:59 -0700
X-CSE-ConnectionGUID: aL30MLiURaGOlVDeOAFBVw==
X-CSE-MsgGUID: bjJ5297MQs2v0q8OiR5w6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="67633716"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Aug 2024 23:22:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sipbT-000I8C-2F;
	Tue, 27 Aug 2024 06:22:55 +0000
Date: Tue, 27 Aug 2024 14:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1783/30000] ld.lld: error:
 -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.
  Try: 'ld.lld --help'
Message-ID: <202408271443.DMMfqSKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sami,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   f4e5b5151e55932279287c55d4e4a801fbf1df96
commit: 6f0e552d0f4018b3731866fd18f32c1295175a91 [1783/30000] ANDROID: x86, build: allow LTO_CLANG and THINLTO to be selected
config: x86_64-buildonly-randconfig-001-20240827 (https://download.01.org/0day-ci/archive/20240827/202408271443.DMMfqSKb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271443.DMMfqSKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271443.DMMfqSKb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?
--
   lib/lib.a:irq_regs.o: no symbols
   clang: warning: argument unused during compilation: '-MD' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-MF lib/.lib-ksyms.o.d' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-nostdinc' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-isystem /opt/cross/clang-617a15a9ea/lib/clang/18/include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D __KERNEL__' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D KBUILD_EXTRA_WARN1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D __ASSEMBLY__' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-Werror=unknown-warning-option' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_CFI=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_CFI_SIGNAL_FRAME=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_CFI_SECTIONS=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_SSSE3=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_AVX=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_AVX2=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_AVX512=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_SHA1_NI=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_SHA256_NI=1' [-Wunused-command-line-argument]
>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
