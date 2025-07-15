Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD65186294
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752591062; cv=none; b=BKRvdOpE5a4pqmQniS71WVrNH65Pbw78oyGrJuhg+A+tfz+gRH/Vv9qMfXh3HHqfUQFufWNuOLEvhn6TD0qsAg2gA79yxx1w4ma9AduH5e9YBmt1097rJwSt1IVQ4tUOE83JgMFf6ueGj6Jr3nm35irufCtgTTJqb1VGxSCWYlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752591062; c=relaxed/simple;
	bh=JEqdwEe16FP9Ngfd9Gih1pGJ8dvLFVNz5xRtzuKKZVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8UsF3J07wWxLYBUmP/mc1+BYg5FO1gPVrNbD8EPGh2kZSLTuogXjFCKti1fJ6r3bJDLFZvaK4xKEVqYm4mR+z6oKomvoRc4ClG7C3ZA4ceX6J9lp6N2JWORHCU0ZU9b+yv6MKleo6/fVV7kqPyeMh5PlaAN6tnx2rMKbwjm3v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wj0RS04w; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wj0RS04w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752591059; x=1784127059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEqdwEe16FP9Ngfd9Gih1pGJ8dvLFVNz5xRtzuKKZVg=;
  b=Wj0RS04wI3i30zEWvMYDMzzxrKzaB3wzIccfi/Z3v2Ge9pvnsbgfUL3E
   +QHywqtMVLWy8W67YxiN4RNBXVqI/+Lg5muOQab9qRB/c+vTkp/mwF1CU
   c1b77Xnm4K8e1t9D8KjURS0AWqP151HsOdgCP1rg3jyjDk9CM8NxRB6CW
   uHbgAUpEK2GS1LGn/YeoKriMdoL62LSU8PKEJNREaohav+9fuDs2Q9brT
   pB8YyPLV6TW/LdgzQS/4QLyi6D3dW1AeAE4v8PJWCr3Vd7AGSyDXw5NXJ
   hwgk0V4xTieixfMw/JljvVZQMKaK12GpE9iQVC8LGmMbPHFT+GJymCI+1
   Q==;
X-CSE-ConnectionGUID: mutWGF2TQcmNj8yU0j6Vkg==
X-CSE-MsgGUID: 24Hifuq+QBWjh9qMh/7tuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54938884"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54938884"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 07:50:59 -0700
X-CSE-ConnectionGUID: FmtyxfGoScqUAhSnI4Np+w==
X-CSE-MsgGUID: mr54KYh4QtKj5vA4+COhTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="180940791"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jul 2025 07:50:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubgzf-000BCd-2d;
	Tue, 15 Jul 2025 14:50:55 +0000
Date: Tue, 15 Jul 2025 22:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] ld.lld: error: no input files
Message-ID: <202507152244.9QaWJhiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ferry,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   9117970143cf69ace484f08b1d545a03f57c69ff
commit: d8c8d96e4a922ac40a4dc2c16c3a5e554cac1d99 [1/1] anolis: virtio-blk: add ext_feature negotiation method and ring-pair feature bit
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250715/202507152244.9QaWJhiW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507152244.9QaWJhiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507152244.9QaWJhiW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: no input files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
