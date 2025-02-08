Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487732C6A3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738998380; cv=none; b=I02oHv0jel6/sS+ddDTk2M1qztCtf5j+9qF+mFwqsc2xKk0cPR6DJ9yEU0MZ0KJum4UsIaHKpwNeRLHKaM1Z7nPA5l2BI1U+C5dLh1RuRHACjpQLw51cDgzMIsp7ahIBU3PIDSDwp3hyzOT3Ov1Wv56HBpyi+GKqcU65ceZrDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738998380; c=relaxed/simple;
	bh=I9krz2YE6kQF4OIcI6TdsAAGuZuWE03WYLs8stJ/BRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PmOr8oprxggc66N5HRXXOLVTRPVFF8zEiR9k5reyviki/u/YIIZjRJP3tMciAq2PlaxzzkSP03MlH71Huy/BbsAkh4LreeS7oLGWhZiXkcF7ggFP/yZbsypRTL3XdS+3PP4vxf563JYcPFXjtLs+9vw5XqMRyoc9xS3XGYZjNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnBJGIyC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnBJGIyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738998378; x=1770534378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9krz2YE6kQF4OIcI6TdsAAGuZuWE03WYLs8stJ/BRY=;
  b=BnBJGIyCNaMT/G4MGa8WDdqZEmkIw8eImkBhW/lKv8dBHgDZujvgI3DL
   PLn3saxRCSzfzC7KHfdmtlRcdwVUNO+bE/yRHKWqYO2Wxdii/sbVTyDK4
   yF+LpA3wC1cGdZOIdB5dXZsmSNFcnqQXKtlrQ46sr2gWUg8433vWPjTHn
   N0HWeKGTq3/wkcPF7XxjtfJEIUEIRL0Unaz8135jv8xcSsua8ZRUld11j
   WbpwVZAoOe1zs2Hl6imFWUJby1L4+UEyOWrqEbGemeDbg+7Mya3AmpjFm
   cYN5jIaVkfEBe/BeLwOKij4/dFtn+cEtsltlhsAbbqO8muMTXEEfpZswV
   w==;
X-CSE-ConnectionGUID: hJtW9mOBSqKDKxOWcpz7vg==
X-CSE-MsgGUID: CoYxq5nQQaeHhvIoiZasqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38841845"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="38841845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 23:06:17 -0800
X-CSE-ConnectionGUID: EI7K5XkARbaRHwPWA7sgWA==
X-CSE-MsgGUID: cbCfro+XQNqQICP26VLdug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="111671361"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2025 23:06:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgeur-000zgL-39;
	Sat, 08 Feb 2025 07:06:13 +0000
Date: Sat, 8 Feb 2025 15:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 24/24] WARNING: modpost: EXPORT symbol
 "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will
 not be versioned.
Message-ID: <202502081458.fmDsxGcd-lkp@intel.com>
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
commit: 851975056da0349bf975a5b389266691881d11ce [24/24] rhashtable: Enable capability analysis
config: mips-maltaaprp_defconfig (https://download.01.org/0day-ci/archive/20250208/202502081458.fmDsxGcd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081458.fmDsxGcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081458.fmDsxGcd-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
>> WARNING: modpost: EXPORT symbol "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_insert_slow" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "rhashtable_walk_start_check" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_walk_start_check" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "rhashtable_insert_slow" [net/bridge/bridge.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
