Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B41E5716
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 05:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747114699; cv=none; b=i21QMlLTbvQty0rJSV/ExmgatdN5eT0+h+MeOFr1PRh7Q+jwdTJeJvfPA/RK92sO0qbInX2SI1GkspMu/zy6JqhkxNwQ++5WTEtulKpK5Pk1Y8iYHiwHMBHIUKiRM/haPautGlWI5tkaxKhvj9haJUJ4HFglIoppZVOiVI/wZJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747114699; c=relaxed/simple;
	bh=i+J9Ik2pi9xbkAKtxdEabZFN2JpPP5trKFNArRxuAuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjmYmoJFsE8HNA5AcEI6eWPYScfR2TbJp9Go35/b1SH95JKpRvmmqEW+YSfpTQaIRrl7jMATlfI42fN3e9Fui1tRs7PfbTTDSl5dc5sLGenpmWCaL6LborsNYyXZ0U/CKPM4LzcLJ4qluMeX/kru6pH9U0FdAO7QvVakDb9cHr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rafn9eeH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rafn9eeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747114696; x=1778650696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i+J9Ik2pi9xbkAKtxdEabZFN2JpPP5trKFNArRxuAuk=;
  b=Rafn9eeHtehdYdkGxIiBgA4j3hTCMNvqxWeGtCXe2H5vArsT+axlZKAR
   gtlCI0Dy2VPGED/a3+e2IIDrDQXDz1t1HuC4/8JDl8k3CWrgVX2jNBOq1
   XVheORlC+rHuZOjV7Gqh49SGEFLh8iVYVlS9d0lZzcw28xb7wezejPXAs
   Z6dt/fZsP/sh1mPrkZMa4ZT3rdTesjjmaRhHPRUKGt+Dxfderbrb42RYa
   y0VLJGMP2unq2GDwWz/tKRgEF4PKTB07A0WnYnLBZNQWRMtvlKM7csgU6
   MGecmGQuqJGfrx2GCtyHIwSaU4iPV2ssdF3SQ59ZsWogHf38XV+XGPCP6
   Q==;
X-CSE-ConnectionGUID: cSU66jhBRsGxYOSETbN5Ug==
X-CSE-MsgGUID: IvF5GQLlTu2IhGPedm3wZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="71450815"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="71450815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 22:38:13 -0700
X-CSE-ConnectionGUID: ZiF53FBiTc29dDxLFf6PEg==
X-CSE-MsgGUID: dsa6mdrGSgONL9Efv21b3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137625484"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2025 22:38:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEiLB-000FkH-1c;
	Tue, 13 May 2025 05:38:09 +0000
Date: Tue, 13 May 2025 13:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/boot 6/10] vmlinux.o: warning: objtool:
 __sev_es_nmi_complete+0x5a: call to __kcsan_check_access() leaves
 .noinstr.text section
Message-ID: <202505131323.rs2DCGPp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
head:   ed4d95d033e359f9445e85bf5a768a5859a5830b
commit: a3cbbb4717e120f9e53fa7685909b310f7e99bf5 [6/10] x86/boot: Move SEV startup code into startup/
config: x86_64-randconfig-103-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131323.rs2DCGPp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131323.rs2DCGPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131323.rs2DCGPp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __sev_es_nmi_complete+0x5a: call to __kcsan_check_access() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
