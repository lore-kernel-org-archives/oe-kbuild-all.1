Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D31FBC8E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 03:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763435671; cv=none; b=dwX7JvkBAGpTsoIj9j7mIfI7kaUDNqqnWbBMQCf/Ix+s8YctZu6+C8fO8JzDkVuCeC+gRsWLbOt/gj0xio/3LEQr5DifRz2hHDNtrvrvDx51DnLYfdxsbMhbiTvSUKk+Xx0fSVkogRbXS6aQGcfh8vurfBDLHV0yrkHMstsVfyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763435671; c=relaxed/simple;
	bh=3uHJBRBavLKjG+Fk9uVvz0dJKhfa16dsDbx7bPTKgEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hGgCVgrdaDo/TbA1VwEQ8/jEKFzIlaIL4qDfGpbMWQdZNKKI7B6ZZYSa2l1WnKW9dq3WbWk4aoJuxHTKbDbC8Z4cn0onbFnIUBt6Xfx2ZOYwFCAPpzrvCm4F1WXFYIC7YDUNusGLdNOZmU+p0iZDGz0pL6dzexZdzXITCeMaBp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jb0W5nWS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jb0W5nWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763435670; x=1794971670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3uHJBRBavLKjG+Fk9uVvz0dJKhfa16dsDbx7bPTKgEI=;
  b=Jb0W5nWSiEZNwMJD2Azg3yWhr/TgCwe9MZL1pNKtlisMbmNe5a35IKeN
   d9xU5iz08uaD1GVeOvI7rs75DRoUXjRXe+kV9ZWVayhrn4e9ncPIpZlaX
   4b/nDoHpFYH4YzRy2k/FiyNJ8hU6WC762iFY+m6AYDgvGIS6QCzEUn9o5
   Z5r0rs1mfqa+k2OyiQqHmol1iIssef+DdAWt6hdWayN35kXhfoM0WIypC
   S5J3NedYXcl/ILqtSXkMJMwho541It5HYqC4yF/Z0V3cl1FDAEPyFD0VZ
   PH96IVJHCWTvrlCNT8IY4nOBBrYY+1e5B5iI971+s5LOjXdl4EVZStQEo
   w==;
X-CSE-ConnectionGUID: XvKWU416QZmH9AlJr446gg==
X-CSE-MsgGUID: hmbld7LpSFKgJfLC9cEEYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65382332"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="65382332"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 19:14:29 -0800
X-CSE-ConnectionGUID: D3dDzbRLRaKtihXOucyncg==
X-CSE-MsgGUID: D5Ulr6qXSXWEb6QLLG7sQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="190651242"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2025 19:14:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLCAj-0001HP-3B;
	Tue, 18 Nov 2025 03:14:25 +0000
Date: Tue, 18 Nov 2025 11:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/9] ERROR: modpost: "mldsa_65_verify"
 [lib/crypto/tests/mldsa_kunit.ko] undefined!
Message-ID: <202511181118.Qn4uQCAR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   e298b80f8063fcbc335870ff3f1d59dae4d5116a
commit: 07d3d88631ed18eaf8c87bb7b310c2673be68be3 [5/9] crypto: Add ML-DSA-65 pure rejection test vectors as a kunit test
config: arm-randconfig-002-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181118.Qn4uQCAR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181118.Qn4uQCAR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181118.Qn4uQCAR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mldsa_65_verify" [lib/crypto/tests/mldsa_kunit.ko] undefined!
ERROR: modpost: "mldsa_44_verify" [lib/crypto/tests/mldsa_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
