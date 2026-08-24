Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E029A430CC6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579774; cv=none; b=Aw1RYjXZMfrVSQM5f5qUYgGg23MP3rpwweBxGIqrcqQDbxS+wyt352L/hH4oj+fmMlvreO+IkEyhr/8zaKChaRLqbqe17SbPzR1quIvnlgYKKIMhO/vXc+genVEAniLA7I9eLHmfCrsYwND9bl3mejFYYD1uKcWoYLPZoJUBgOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579774; c=relaxed/simple;
	bh=q3wTf1f327xIGwYOhczcXX+HdJnBpu/SZv6v4m6OsZ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fRSJFNAjw+tfPbpBP9WQl+IzD2pp1Hk5xom/D8yi1JOSY6xiJcLl6Uet+LsW4HECe3J0ll6t2VLPosQlPfbfuzEb8yc2U1jKQdG4HdVRwX0r4UdsX83VQWSav+25edrCnqUbcLUvUwkobgizGLsLAMcCgv9WTai9jcc+7nBd0G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9H8mSqg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9H8mSqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787579771; x=1819115771;
  h=date:from:to:cc:subject:message-id;
  bh=q3wTf1f327xIGwYOhczcXX+HdJnBpu/SZv6v4m6OsZ0=;
  b=m9H8mSqg6kyqcednVE5FkK6amdAt/eqEP8YmuRKsk6tQHlJb1Zo4Rdi8
   sZ9c3AF7TB2J9vo5AFKTHa5Zjz3ZaBlO5nQ5+qRv2PKEY4KxuLF+S0/ZX
   K06xAP1yjm/Zsfbe6NO4xy6IVlTAL7loACO4ZS44z6naluwV010/PkUw3
   9YlXzhS5kW1GBD4DgphdkzgCHCYv1BQwKiHfvHlHlVGMwQnlWDb9l8Z9f
   +pzKSRx8NhvxiDFkECiqJMnUPOmrGnJQgLgTdSU7Vfm9DsxU+pIXmon6K
   DO79ENLiavVNdmNtPhbV7eqK8erCDWZ2FuATtpA6Xj8ZrkOrzsGjslB+R
   Q==;
X-CSE-ConnectionGUID: LdYtfdntSy+evS3UFjALQw==
X-CSE-MsgGUID: hy6WbQ81QS6AzkkFDp0dxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87901427"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87901427"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 06:56:11 -0700
X-CSE-ConnectionGUID: bGipl+XIQqu2gMFBQTYB6A==
X-CSE-MsgGUID: ol1Mc9Z3TLeRK/uQVgE4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="265235239"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 24 Aug 2026 06:56:10 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyV9j-000000000NP-307G;
	Mon, 24 Aug 2026 13:56:07 +0000
Date: Mon, 24 Aug 2026 15:55:51 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip-7.2 649/964] Warning:
 drivers/gpu/drm/drm_gpuvm.c:3177 function parameter 'priv' not described in
 'drm_gpuvm_bo_unmap'
Message-ID: <202608241538.Yt2NxyXc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux asahi-wip-7.2
head:   57124f5176e4a4ceb553942a5f3de94cb5035877
commit: 27443ed82e0168b50d6af080f2c9ddd2b9bcbb9d [649/964] drm/gpuvm: Add drm_gpuvm_bo_unmap()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260824/202608241538.Yt2NxyXc-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608241538.Yt2NxyXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608241538.Yt2NxyXc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gpuvm.c:3177 function parameter 'priv' not described in 'drm_gpuvm_bo_unmap'
>> Warning: drivers/gpu/drm/drm_gpuvm.c:3177 function parameter 'priv' not described in 'drm_gpuvm_bo_unmap'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
