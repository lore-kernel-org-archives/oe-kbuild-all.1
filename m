Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32761DD55A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502276; cv=none; b=Iv/zg8FhlmAPaFUTZ4Gjsnb3g8MpOmSO+iDG1aLsqUDHaIgT6rNClGTY8hhMMGunkrH9zMqkZi2H2F0KBBtydov9b582yIb2hBkKvEl1ZCz2t709Kb/2ZVbnUq+WsFgaXgWwZisiyXwFXt07IH+WH0f7kDrCcWV/J9DWTNYquoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502276; c=relaxed/simple;
	bh=up32KFavyQeLfZiIXMSjqzgGIirR3ln+iZHVq7xHUaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GrcOR517GBJP3niblyaD3mTgPRyw1F+cyKV36vfg/bEDv3IiZj/Tu3DA1Jzr7gR7MMScWHQz8n2GSevJFOe5R37u0njZAVM6Qr9OpvNqbJDpasolCHjIg1LH4DGJ6wQVIgQCZyLwtGd34Tgls6+yt6f3kkc1P2Nt/5q0f8v78C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETvA8vtA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETvA8vtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731502274; x=1763038274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=up32KFavyQeLfZiIXMSjqzgGIirR3ln+iZHVq7xHUaY=;
  b=ETvA8vtAMN0Kb5yuBhhwse9I3Myrdge7yYduU7k1X3gdPVJWxLnYIuLy
   7mCFKwtASmgH3TgsKxQdbIko70orAuKW7mP5VriaiRcIu1rQh3PmfFfTd
   MgpEj5fhGnT5Y+kh5j2xo8JBR8AmSB6ihbUL9qNGcuRiiD764kgYYaJtS
   oLQKQUd3q+JbbbFhb3VHfIjG2J22qiq//Bph74e8Mujjvn+DLdthQd2+S
   eOAAq4RryWexrf7Tj+q0ejbK3JF+T1V7KtflnIYtBTp9lPFlClunEuqcA
   u5WIhghNfQEmuSkqvDHT7LamgQj8CjgX01NHaq/Rrhgxmw9OZ8Z1OPP4q
   A==;
X-CSE-ConnectionGUID: bnNF1dpOTZy/EW/KsNIRfw==
X-CSE-MsgGUID: S6LaCdu8Q/iBxb8CWFWiiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48901436"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="48901436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 04:51:13 -0800
X-CSE-ConnectionGUID: 3+xce7mhS62D/Px4h2uyTw==
X-CSE-MsgGUID: oCfeUcNrSuaO3yO5fp9dkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="92828917"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2024 04:51:12 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBCpx-0000OD-2D;
	Wed, 13 Nov 2024 12:51:09 +0000
Date: Wed, 13 Nov 2024 20:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 922/30000] ld.lld: error:
 -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.
  Try: 'ld.lld --help'
Message-ID: <202411132007.YQ25gIF4-lkp@intel.com>
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
head:   069e12986fd81e33097f806c8f2787f5d5416bfd
commit: 6f0e552d0f4018b3731866fd18f32c1295175a91 [922/30000] ANDROID: x86, build: allow LTO_CLANG and THINLTO to be selected
config: x86_64-buildonly-randconfig-002-20241113 (https://download.01.org/0day-ci/archive/20241113/202411132007.YQ25gIF4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411132007.YQ25gIF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411132007.YQ25gIF4-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: argument unused during compilation: '-MD' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-MF arch/x86/lib/.lib-ksyms.o.d' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-nostdinc' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-isystem /opt/cross/clang-ab51eccf88/lib/clang/19/include' [-Wunused-command-line-argument]
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
   clang: warning: argument unused during compilation: '-D CC_USING_FENTRY' [-Wunused-command-line-argument]
>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?
--
   clang: warning: argument unused during compilation: '-MD' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-MF lib/.lib-ksyms.o.d' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-nostdinc' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-isystem /opt/cross/clang-ab51eccf88/lib/clang/19/include' [-Wunused-command-line-argument]
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
   clang: warning: argument unused during compilation: '-D CC_USING_FENTRY' [-Wunused-command-line-argument]
>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?
--
>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
