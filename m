Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD64310A1E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 16:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027219; cv=none; b=ZTsB8uRSaae0Tnj3DVUCjp9jbVG2JpNGMeSKK7QA0rBovEzqSV+DJTnD1R+3ktAVik6LBf2fSATfRbBaS7roFvyPSDLnPdW/Id2qOlSue23YX8ai5BMRFc4Vmh5KgnAs0JyGQl4lz8PczZrgyjcdluiE6qalp7xzr8663Obm8PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027219; c=relaxed/simple;
	bh=m2cZiBHAUUYRsyFC5HzPsujaEhCFfpdF7eWL4Yb9gBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BxdEHkNh7p2uNJ9JZSvKdqDNdjIzvS82JTFdLWoTKgVc420kgJdQ4xkafz6/xEklT/cBf90Nd5JfPxXW0hxv00oGVIPuOo82fjf1fjHQt0wR/Z2af/vkaxL+C58Ry3+FpqBwjEPxb3vipSClXd7cc/cfgMVDyxJGBw/BoW+E3wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuqS2hTg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuqS2hTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760027218; x=1791563218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m2cZiBHAUUYRsyFC5HzPsujaEhCFfpdF7eWL4Yb9gBk=;
  b=FuqS2hTgdTmtuVAMiQ9gVjuVJvzU7S6OunX2SQ4vE6sz7wW3ljj3BAxO
   mDM0UlaXa+16+zaU1BjtPYb4CjwQ4Vtkww46IIhe9O6Y0nwQe5SVc/yP2
   lsS/7uyKoJlZt+Pqi+h0j42SCR7dKQLw571wddxwHdwH27DcrtERq1mqC
   MurqMLimUvztMdrxlKROE3oZ4i4v2sEQiEqM46hUIDluxv0Zoe543QcKn
   8ovX3f9w7Z8ZGsARDTTNgSSl6veeNb5Zhi6YhINCO9oRu0/GnNmlNi4Mm
   vqR3WMRUDnf9Nu4m2MU6d3FNH4xj3FtT3RODcsyzMLkGE7VSn7ald3DV7
   w==;
X-CSE-ConnectionGUID: H2bOwlM8QyOhC64svQNJ9Q==
X-CSE-MsgGUID: xVartv0oQ5mu3TlsFZx2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62271119"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="62271119"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:26:57 -0700
X-CSE-ConnectionGUID: 0sJI8bI1SiO6IV5n4WnGjw==
X-CSE-MsgGUID: nPjV0GJeQjuET3ExeEX6nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="180570810"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2025 09:26:57 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6tTh-0000zv-2v;
	Thu, 09 Oct 2025 16:26:53 +0000
Date: Fri, 10 Oct 2025 00:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 464/541] fs/bcachefs/data/extents.o:
 warning: objtool: bch2_extent_ptr_to_text+0x1d0: stack state mismatch:
 reg1[27]=-1+0 reg2[27]=-2-48
Message-ID: <202510100032.9hCJKLYC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   844a56feb885b00aaaa93b55a7eb27e6495b3379
commit: f3e3820cc3adf8487239fe81974efe2975f9f19f [464/541] bcachefs: move data code to subdir
config: loongarch-randconfig-002-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100032.9hCJKLYC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100032.9hCJKLYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100032.9hCJKLYC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/extents.o: warning: objtool: bch2_extent_ptr_to_text+0x1d0: stack state mismatch: reg1[27]=-1+0 reg2[27]=-2-48

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
