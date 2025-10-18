Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC91354ADF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760787263; cv=none; b=TVnaxyCbGKQaf5I9j4biTv5nwd7oXuaUd9nN2wL2oRr6+A6B5CF+apX7HtqwCuSHygqzwyCF29fv+gI+hf8tvRAF3maa2rmVCLAqK3FMFf94e+wQuNg+GGQvdpkZcie8rb/29XhUbr+xR31PhvuTTjm/k1bLArplghZdx2UZoco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760787263; c=relaxed/simple;
	bh=yjr4jzIXRU6ZSHNS4yyMqvTIdN3dtjiYV4fg5nTmY9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ogS3O2YS2YuMVfzUyCYaVb0Jwxu0ICflwKh6Fxv3cIhxUkxMqcSW8mbgHP/3zVY1r6E+YX3d0WttcBG4UQFQTuTGf2nAbmXTNjgZL7Iw3oPGL2Lij26ozHYHX45Mu9hWWqRpW5rcNRk3WOElJ0xZgO/XNevG4TxSNo11fNAbaYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2O7CZ7U; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2O7CZ7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760787262; x=1792323262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjr4jzIXRU6ZSHNS4yyMqvTIdN3dtjiYV4fg5nTmY9c=;
  b=U2O7CZ7UaTkkTS3eeM5HOGUxm93+RAGGdA8Gi48+OvuppzdTiEaz2mqC
   ovprwa6v73+0MukhBZHTyhwblufTWGwgs+aNo6SLt9Hyy7yDzb+/A6/3S
   xNZ5/RNZ0o1qtwp1qloaNaz0lDXlylWRkTkBtHNM+8bXqQUWKBkK1M8RO
   1c8nLHr79KxmJmG/GL8QNwHK/O7GpGguvK12zDy1FaE+uZHwk3nmV5qU4
   F7uyWCdkxs35R48bndACYAk/IpfZ0IADBpX1czvM69k0gRdoFVwB5E9lr
   i53qvQuloEQI9z4P+L5WFCkI85a+EWV6u6hxejqEJK2Jvg+06KJECTLRZ
   A==;
X-CSE-ConnectionGUID: +dT5OBeEQuaLF+1YxOgX+Q==
X-CSE-MsgGUID: wgwHjo1DQdWAqGCs3HpmDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73661297"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="73661297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 04:34:21 -0700
X-CSE-ConnectionGUID: fpVK99pPTeulQXt47V8p9A==
X-CSE-MsgGUID: oonHqtKjTTeG7g9GbVaz7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182134332"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2025 04:34:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA5CU-0008GB-0Q;
	Sat, 18 Oct 2025 11:34:18 +0000
Date: Sat, 18 Oct 2025 19:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:BITS 5/5] sound/core/oss/rate.c:28:9: warning: 'BITS' macro
 redefined
Message-ID: <202510181912.xbP9Gsb5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux BITS
head:   266545210d5afb06e8040b7c5bb21fd1bc9ff862
commit: 266545210d5afb06e8040b7c5bb21fd1bc9ff862 [5/5] move BITS() macro
config: arm64-randconfig-002-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181912.xbP9Gsb5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181912.xbP9Gsb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181912.xbP9Gsb5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/oss/rate.c:28:9: warning: 'BITS' macro redefined [-Wmacro-redefined]
      28 | #define BITS    (1<<SHIFT)
         |         ^
   include/vdso/bits.h:10:9: note: previous definition is here
      10 | #define BITS(b, e)      ((BIT(e) - BIT(b)) + BIT(e))
         |         ^
   1 warning generated.


vim +/BITS +28 sound/core/oss/rate.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  26  
^1da177e4c3f41 Linus Torvalds 2005-04-16  27  #define SHIFT	11
^1da177e4c3f41 Linus Torvalds 2005-04-16 @28  #define BITS	(1<<SHIFT)
^1da177e4c3f41 Linus Torvalds 2005-04-16  29  #define R_MASK	(BITS-1)
^1da177e4c3f41 Linus Torvalds 2005-04-16  30  

:::::: The code at line 28 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
