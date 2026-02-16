Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF3924503F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 04:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771217845; cv=none; b=kPkgcl10eP4QR/C84BsrfVlHeK9X86XEsLQjXw/eimGiRDs10ZQs8qKn4TPiX9LDgDLQ6SA6mc2XGojn02+GtyQtHUnieLKzee7i9/JlbbO1GfVxxl8zw/NEiuAmzZm5/7zWlBianMZT1IUry0EOCXWZc/82Hp2G33/Ry2304uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771217845; c=relaxed/simple;
	bh=2Ct9oqqvBDEqdnHxxMAkCWjjm9+H5se2OYCVx2rYSmA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QKSvUPTBImZ/GI/yIGnJ7qy4okCF02OA95/bSOUWwhFYCYCPhJBXrNPt+6qpO0U+jviJ5lyK5RywAiQuvHtpP/B5Se9WLdlFZaFTlVE202tkgP3m+6cWYkeDi6lK5JU65SqLV0RQ10rly54oRwDIBn4Tnws7bPJxAc8fCtUIqlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEZnwXEN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEZnwXEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771217843; x=1802753843;
  h=date:from:to:cc:subject:message-id;
  bh=2Ct9oqqvBDEqdnHxxMAkCWjjm9+H5se2OYCVx2rYSmA=;
  b=KEZnwXEN0NAmugDs89e5yrf5RXRhjLIFHoA+aqO/QDFd7Cs+oWReree2
   PivBvkcaOjSnpDv6LoLQC7WtBjidfiU67YD/6WCtpoX/RbovEq+9aMJYV
   W3TFz79kGIKYIQTepjE7q8/+INIxE8AmmyPV/+4haFVg9QEsvYNAGr9fE
   TOHT/xcE9VMHKfJ8itsktn7uCCQSfdw3/rzsOpcKpYkbFqEfrtRwEwAla
   vyRe5sUl7nCAYnaQMHzZMQDC7VSNGnq8lMp0qxLCc39BeiReRiFjHSXt0
   zR/kTVzQDbZAwLjEYbHmWEa/fU7++UFz8uNEAwb8BCn4X+erhc0hHeTMf
   A==;
X-CSE-ConnectionGUID: ZS3jnMKmStS4u56uc7SxoA==
X-CSE-MsgGUID: 1UkSnUJ6Se24hglStFdhpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="74897016"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="74897016"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 20:57:22 -0800
X-CSE-ConnectionGUID: PIkQTyJdSkSR8bkQTcCL8A==
X-CSE-MsgGUID: IzF2cOegSVmhPcv4Ui1bHw==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218050921"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Feb 2026 20:57:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrqff-00000000zPW-1MFZ;
	Mon, 16 Feb 2026 04:57:19 +0000
Date: Mon, 16 Feb 2026 12:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-aes 4/10] ERROR: modpost:
 arch/arm64/crypto/aes-neon-blk: 'neon_aes_ecb_encrypt' exported twice.
 Previous export was in vmlinux
Message-ID: <202602161237.VXa8rEOr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   8895fed4c18339c8cd86e534302a83972a4c8892
commit: b2c5d455805657417955519a5eef1583c06525c7 [4/10] lib/crypto: arm64/aes-cmac: Migrate optimized code into library
config: arm64-randconfig-001-20260215 (https://download.01.org/0day-ci/archive/20260216/202602161237.VXa8rEOr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161237.VXa8rEOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161237.VXa8rEOr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: arch/arm64/crypto/aes-neon-blk: 'neon_aes_ecb_encrypt' exported twice. Previous export was in vmlinux
>> ERROR: modpost: arch/arm64/crypto/aes-neon-blk: 'neon_aes_cbc_encrypt' exported twice. Previous export was in vmlinux
>> ERROR: modpost: arch/arm64/crypto/aes-neon-blk: 'neon_aes_ctr_encrypt' exported twice. Previous export was in vmlinux
>> ERROR: modpost: arch/arm64/crypto/aes-neon-blk: 'neon_aes_xts_encrypt' exported twice. Previous export was in vmlinux
>> ERROR: modpost: arch/arm64/crypto/aes-neon-blk: 'neon_aes_xts_decrypt' exported twice. Previous export was in vmlinux
>> ERROR: modpost: "neon_aes_ctr_encrypt" [arch/arm64/crypto/aes-neon-blk.ko] was exported without definition
>> ERROR: modpost: "neon_aes_ecb_encrypt" [arch/arm64/crypto/aes-neon-blk.ko] was exported without definition
>> ERROR: modpost: "neon_aes_cbc_encrypt" [arch/arm64/crypto/aes-neon-blk.ko] was exported without definition
>> ERROR: modpost: "neon_aes_xts_encrypt" [arch/arm64/crypto/aes-neon-blk.ko] was exported without definition
>> ERROR: modpost: "neon_aes_xts_decrypt" [arch/arm64/crypto/aes-neon-blk.ko] was exported without definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
