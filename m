Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D1B20102C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740135159; cv=none; b=eq5sSbO+NCkA6CLJ36N+ycYqWzp0MDgBYsaodl6K2hjHLs1JDvQ5Up58qNoz4mw9IZnSu3D+Ou7HGEkfnmAPn59QWqY1X9UNjWR0OdYMUWGIdzz0uRyEkL6lHV/eZuTcui73b3gVqa2HMPsFohN9UAXp1euGYUSlN8O/z/ckLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740135159; c=relaxed/simple;
	bh=PCC+wog9J/NP3oQ5wa1fnfJlFpqW5hP6ullb5ZDn3qA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pakx4+y18Y2thfSpKBxaqdHXsqJNzIXbAExBb9NB2PQ3XjM7z4hgHGYInzg0+twxg3jVRozMib94NiUcrcWFe5CQ70GQKhs0sAINdnBUua/mm3ynYlV9dlQ/UPWhGNzxuhmfGJU+TuOSpylHffbKyqB7AF5tgeySZMQJQhmAGjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USSrDs6b; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USSrDs6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740135158; x=1771671158;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PCC+wog9J/NP3oQ5wa1fnfJlFpqW5hP6ullb5ZDn3qA=;
  b=USSrDs6bqnGW0IZJzu3sS1SbCSp3V5DUOaaub8jEROY3UdzjcpKp/0RT
   PG4tHCXQPVZMTCoGMdGwwZ2XLpY9ATHbkoWsB9wD79Bs6UFMkKxnMTg3h
   NddGEluoY29eh6261n0l1UV7ZU5aAAR6Ex2VGTyKqr5PXTk0pe6kAFghW
   wqfPIXCnBwga6w0l43xQFk5eiXev3WqKO06Rp2fDActGlipge3x9pIwZF
   mK668XbDLUCnxX+/ENOzPKOXtLeJH4uARqvvV0gTZl7jUD+u/CahtGiDp
   eeRmOdCNTQjVWGll+nr0Ncc0xfGTF+QvEpWjfppCZCtvnwepCYJ5GduZb
   w==;
X-CSE-ConnectionGUID: 8gXnNLgKRDSB19f8uVlVYg==
X-CSE-MsgGUID: 3WUysArlRp+vq3XgW4UZgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41217107"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="41217107"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 02:52:37 -0800
X-CSE-ConnectionGUID: x19yqSwcR32FVXIMYZ8vfw==
X-CSE-MsgGUID: yhJnr+ZpQROgU5y3qi7Hag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115532846"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2025 02:52:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlQe2-0005PF-1X
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 10:52:34 +0000
Date: Fri, 21 Feb 2025 18:52:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] WARNING: vmlinux.o(.text+0x3aa): Section
 mismatch in reference from the variable start_here_multiplatform to the
 function .init.text:.early_setup()
Message-ID: <202502211802.uMwLyDYa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 56c46bba9bbfe229b4472a5be313c44c5b714a39 [1/1] powerpc/64: Fix booting large kernels with STRICT_KERNEL_RWX
config: powerpc64-randconfig-003-20250217 (https://download.01.org/0day-ci/archive/20250221/202502211802.uMwLyDYa-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211802.uMwLyDYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211802.uMwLyDYa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> WARNING: vmlinux.o(.text+0x3aa): Section mismatch in reference from the variable start_here_multiplatform to the function .init.text:.early_setup()
   The function start_here_multiplatform() references
   the function __init .early_setup().
   This is often because start_here_multiplatform lacks a __init
   annotation or the annotation of .early_setup is wrong.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
