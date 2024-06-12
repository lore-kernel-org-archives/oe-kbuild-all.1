Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CC357880
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718219894; cv=none; b=dkj8cNdMPcWrJaXbQvrZxOGv1q1EDK/T1NYsjXzNCA7qU9ozxCTcu8QCz0h8u1CZJn13l/Vf1MdLo449vzc4GHheFG4iDxsEFcCyicIDo/pKKw3blrZkHGw/3Q5Ma5YalTaxI2Q8GjEVObEoyLjhmvbnhGVKCAafkHghlo0YfMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718219894; c=relaxed/simple;
	bh=ZpN59XqA2lEHGu7aIkLsrIqns7BJIYFdDx9Jg4HG4lY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZGSM6NVu7VZaS15eyd+NQLU1jXDVEM3Gm8TuPK8xd/pxO8wVnWO1bQuHPLvNduF5VGYLGwHuvyJBLV3gWuW/QOyhjcpHmaYVVGgLNKx6/VJO6ePjcJW7XtIOosQHuZ/h3K/yeVTcx2KTTpHcoRJWt1Z9aUcGVZx7cjQ1C87JlkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0Lw9G13; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0Lw9G13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718219891; x=1749755891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZpN59XqA2lEHGu7aIkLsrIqns7BJIYFdDx9Jg4HG4lY=;
  b=e0Lw9G13fCatfgc22M2HWh1tIQBUJFwu2q0GxTmSJotJsTdFc7b5GyvF
   nnqLnmdIB747qM8YPwRuQJ24Lypw3ibspw+oEKzm/DxnRzeeP5Xmpbim/
   ZqXRks/BabaUvFa2inijVK9Ji+qOzqyNzickCeG5XvmIaVfNrEvdp6wDG
   v+9IQPRKGr1HsLNqYWVsuWTOOvNopDz4UpzzzljSPTilU9Wm9ROatJnRz
   UoXwmHwq/JSBwPpVIX4O8Wt3NdPLYJ2OPW1ZlMd5NqmAIoIuk7t3khQqS
   7iT3i8nstM9TKeZIHzFF6Vx8GaV8dEafTyTrH5sFhPgCGib/TDGm7r7cI
   Q==;
X-CSE-ConnectionGUID: sXTXCj71TZWQdTKCvrateA==
X-CSE-MsgGUID: +VqAropfSsu7cDPD5shKEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14883117"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14883117"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 12:18:11 -0700
X-CSE-ConnectionGUID: FoKlQb4dRtWXSRLhxeuoag==
X-CSE-MsgGUID: Uyzzr3tyThKbT1WVfmoiew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="39839241"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2024 12:18:10 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHTU0-0001qw-0J;
	Wed, 12 Jun 2024 19:18:08 +0000
Date: Thu, 13 Jun 2024 03:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:z3fold-folio 1/18] mm/zbud.o: warning: objtool:
 __jump_table+0x0: special: can't find orig instruction
Message-ID: <202406130332.2YmOFnwR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git z3fold-folio
head:   b48a1ca6b17de2817b411f2162830f53ce422ffa
commit: 3f7c8aa63a845e6d7ccd756f66e003b023738cab [1/18] mm/zbud: convert init_zbud_page to use a folio
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240613/202406130332.2YmOFnwR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130332.2YmOFnwR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130332.2YmOFnwR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zbud.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction


objdump-func vmlinux.o __jump_table:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
