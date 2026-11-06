Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958320;
	b=k3kLfY7sO0FfXTgfK59Pm857jb61CmGOABpwtX0gC8qGA2lciPic712Pp9TE42tDn0IY
	 iiDKcrW3qgAB2RVegx2n3v/8UM0exKQYSno/VLcvZVMDDt/JFxEO2ZkbvTZ+W9tDmBUY/
	 DxrFeVDkJ6JLVRiIT93b4nMR9umcQkJQv7epPpW4Dkv4lHEHfnHBSBnyBGJNbOT01axH+
	 0vjN8s0zzlP6ahBQ+21m2LlIm/ESBvpp3f5wIh5iCG52RfE1dbilo0AvvWlxgcZqDQCFo
	 p4pXSqC0rRy1DcPLw9bsLC8ok8EyF72t+vRVIQB9xwPhBkB4RrKpf+7Wr6Rq5Tq0sZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958320;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=H5z0h44bpDdSKJNR0+AaajRJlNrefiLb7fXtTi6ryEM=;
	b=G+X2CU/Nvg7WcJHJ9jI/sm+Glqg7wN0eC8QDWWxppSmAV/9CDR+OECRcTF5YxCpEjY9H
	 vvyrv6fPEYHe8APf5AwVjLMkwWTZkUg4P21ndB+21pmiCRjGTN29STelTP6vjO5Byy6LB
	 klUvx6It7sZg6Z9Wp7ogCT7WoWFrWdg5HvVqx23J/rEFtniayfl/cs3kkxMXpn3UsbWGJ
	 EeNsut+rB17OpMwbM+q34e4RUWS2pcZt9mwgvZkwqBga0xRFDii8bjtOGIC+5sU3Abf84
	 Eja+qlT5iZ21ufkgNR4UpozbPZD1YZvfwO6/totEKiiIl0j3MjxNG0T5rUtr2YGK5Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g5xbTKl4;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FA4606A90F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 09:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5FA4606A90F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g5xbTKl4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793958319; x=1825494319;
  h=date:from:to:cc:subject:message-id;
  bh=PRq1oDoWmk2Mb5FIRNK/OQjgvY1nx5a1/OarPhatuHw=;
  b=g5xbTKl4ujA1pdSPJHdBg5TH6b9fFEn4oxEe2T1+FvpPgoDXWvpZVkBW
   z93VUM1+ojmWXBh/TX5Fwe7ZLSydPEWDMG/01FGLr4Iil5pxNUn+GuW/q
   9XesxobMaK62OPBcNsq3DeFzE9P4CWq5mIStbo0mM9XjomHKnafpP45o4
   508qYrcUPO/dNTQZCS/ImlwUHWatIrCH2Sn4P3AiXbZLpC4PAq8Of1hq9
   pF+UmCPDjAmX8SK8XpW48gfo+8ttsMnygCh3vuyXJ6QyOh6UREh5zb2mz
   WIG+luIuVCaar6g6pR85zUruuf6tvQhwryikNtb37guHD+RjoOkLN1ffZ
   w==;
X-CSE-ConnectionGUID: INyMI/jZRlKDm8u+ANlAmQ==
X-CSE-MsgGUID: hHeNGyY6QfqYPHmFm4hrgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2759603"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2759603"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 01:45:18 -0800
X-CSE-ConnectionGUID: GruqIT+HTVGvimdjHrJALA==
X-CSE-MsgGUID: aeFsqZbCQj2lQ73z3mbiUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7577519"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Nov 2026 01:45:17 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPGVX-00000000ABT-0GRJ;
	Fri, 06 Nov 2026 09:45:15 +0000
Date: Fri, 06 Nov 2026 10:45:04 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 24/56]
 rust/helpers/sound.c:74:undefined reference to `snd_pcm_hw_rule_add'
Message-ID: <202611061033.mR5eK0QO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: 6a450838191295e224845ae206d9594315682abc [24/56] ALSA: rust: pcm: Add hw_rule_add and hw_constraint_minmax abstractions
config: um-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611061033.mR5eK0QO-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061033.mR5eK0QO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061033.mR5eK0QO-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: rust/helpers/helpers.o: in function `snd_devm_alloc_pages':
   include/sound/memalloc.h:110:(.text+0x9212): undefined reference to `snd_devm_alloc_dir_pages'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: rust/helpers/helpers.o: in function `rust_helper_snd_pcm_hw_rule_add':
>> rust/helpers/sound.c:74:(.text+0x94aa): undefined reference to `snd_pcm_hw_rule_add'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +74 rust/helpers/sound.c

    64	
    65	/*
    66	 * snd_pcm_hw_rule_add is variadic; provide a fixed 4-dep wrapper.
    67	 * Pass -1 for unused dep slots.
    68	 */
    69	__rust_helper int rust_helper_snd_pcm_hw_rule_add(
    70		struct snd_pcm_runtime *runtime, unsigned int cond, int var,
    71		snd_pcm_hw_rule_func_t func, void *private,
    72		int dep0, int dep1, int dep2, int dep3)
    73	{
  > 74		return snd_pcm_hw_rule_add(runtime, cond, var, func, private,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
