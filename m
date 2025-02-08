Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB51E515
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 05:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738992427; cv=none; b=tnzNNwNZ/Zi+xT6UH/75sIwrWETAbIIJUVm+SbYv6lbVOpSEs0neHlIfxPspsXNyHRpDY944pWECYWTlNPt9ulyCygAY6XnuLiA+ztIv9qj63FsyxLtWhFcOeNOLVhzkPiDS47bbZjVIR1ghULSgRuA6AE2zNQ/O2RL+nI7kANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738992427; c=relaxed/simple;
	bh=tvsMFYMTwCN/B9HbELyrwpv5P7ZlooTbaD0Xp5+az58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Worx7kHxPrFhPJ0KfI8PdOMGVLETataOicgJqzzyKJShAppd7aEc7ZxtRdSupHUuuplves0RyY1ANy/d5Plcq4nil4vmBmtWeX2x2zwbCx25bISQdJTdZYtjG2zwXoorEa4iO+lb77MrAAprTjb/r1fwDj79Ohq0DfJHRMi/9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e83NZ/n6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e83NZ/n6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738992426; x=1770528426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tvsMFYMTwCN/B9HbELyrwpv5P7ZlooTbaD0Xp5+az58=;
  b=e83NZ/n6G6AF+1wy6sdfQqH04Su45ohEfzzlFxo2ye17eSh6FOYtjyfq
   oHB3HudHX8y+RVrID9I7rPg84YL1SlknXbmxJkvMHH4AMlDxXg31fxztO
   9A+sV7PTbdo3gRfcYa4p3lDtKGiXA4O+kRoWR2kfcyrZtb0yjG+Lbk+If
   C6tuYFNTp4XO2YT3C3YyabZQiyaFufjsNiGda3cl/MHnDccyx6fWG2/9j
   dWfICOoJnKG7/6Jc8SFDSU3TAlVZBhxnaMbw/bVUX2L41OaQ3sKyo/OUf
   brggr6o7nd2W4729G5urJjgfdRKNuI3cLxGYrF0O+FHuh2cO5e1YuoI1h
   Q==;
X-CSE-ConnectionGUID: w8CEg1o2RzqnUMilO/xXVQ==
X-CSE-MsgGUID: /vFwItwYSoyF/OOk2ZfDXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57174958"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="57174958"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 21:27:05 -0800
X-CSE-ConnectionGUID: c6AFcJuOSJexIHVjwsMWMw==
X-CSE-MsgGUID: niGIMWsRQL+tHCVx7/sF0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="116752642"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Feb 2025 21:27:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgdMr-000zZ7-37;
	Sat, 08 Feb 2025 05:27:01 +0000
Date: Sat, 8 Feb 2025 13:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 23/24] WARNING: modpost: EXPORT symbol
 "stack_depot_save_flags" [vmlinux] version generation failed, symbol will
 not be versioned.
Message-ID: <202502081314.NLEE2Iib-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   851975056da0349bf975a5b389266691881d11ce
commit: a6d8d5b78f921810b8c097b8f14dd700987534be [23/24] stackdepot: Enable capability analysis
config: mips-maltaaprp_defconfig (https://download.01.org/0day-ci/archive/20250208/202502081314.NLEE2Iib-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081314.NLEE2Iib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081314.NLEE2Iib-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
>> WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
