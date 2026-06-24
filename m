Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C551F099C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 03:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272879; cv=none; b=WJBaLqyBAfITG19kk5sb7GPbPk2+uHbKpG/L1D9B0KXABnKaN/vpPUgIWVLC03/96QPLjpDvcQvpb4Uo61egW/yTL8aUhFdQ6uP1SgbnMQzGZJOlP1fDEZjwEGXu19ZDoHweyrny3ncmsFWC+ARbvfdVx4C0Y3EXdYpX5DlDXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272879; c=relaxed/simple;
	bh=9OdT+c899JdFGW/+kiHfMwlUTpwEXbeLylCv5vM24/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R67jAY3LD9wM3l7tI0ovQdgetav9VB6KZZ7avueRLd6vhPe1Ciah7R1xnHEg/WzjXySAPq2ScaKi3bggC6FkLGhJ/XLjtH2bSrbhWI3G32QsYcDrq1IvDdzbtMm1Em9SvEspdVy2aIlKvNxnNqLB4Dg9YUb10oUlB1kuzfeIAZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHrmWbvX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHrmWbvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782272878; x=1813808878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9OdT+c899JdFGW/+kiHfMwlUTpwEXbeLylCv5vM24/U=;
  b=aHrmWbvXjxJY/keCBsFetiHe1yoLhOI91sQXylSDGFizuqpajtbDnaTD
   pFDkzTv7HStBITxo5lTkMB1UmO+bx5zkQ18ejMYjqY6Gz2/5336C1/rSP
   GYA1omEbSPkeuGop4a65mTZ4KRGj5/bACCzRyDHld6GQpKdoYE6HNbAQ4
   XEHuZFhHZTYT+rxKNAr2Zax93zwuQ0YW2Ixt1k7kryUnUIeGVU1Tj11dU
   tMdj19KUVj3rlgQODuW+YNVE9UYZRwRyY60hQdB+r+6IhXYM1ICRxzSED
   NBdggjytbR4Focewcyy84ZBpXLA1DLzJeiD9YumjqOGJGG8uOEOhcB/7i
   w==;
X-CSE-ConnectionGUID: rZeLjKWdQpiTVLWBvD2idQ==
X-CSE-MsgGUID: 7nXzzncTR061Sz5CrrfYLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94517717"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="94517717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 20:47:58 -0700
X-CSE-ConnectionGUID: bP7x6XqVSp6V3XRnRNmnWg==
X-CSE-MsgGUID: utJ1Mp5zRCWaqRnbEcVduw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="253566002"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Jun 2026 20:47:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcEaf-0000000036L-1Jpf;
	Wed, 24 Jun 2026 03:47:53 +0000
Date: Wed, 24 Jun 2026 11:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: [linux-next:master 14136/15099]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: error: objtool:
 amdgpu_vm_handle_fault+0x97: sibling call from callable instruction with
 modified stack frame
Message-ID: <202606241110.iUga5vVw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Mikhail,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e5dfb7c84012007c3c7061126491bbc92d71bf1
commit: 14682de8ad377bf13ea66e47c26dcfea0b19a21d [14136/15099] drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
config: x86_64-randconfig-072-20250919 (https://download.01.org/0day-ci/archive/20260624/202606241110.iUga5vVw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241110.iUga5vVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241110.iUga5vVw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: error: objtool: amdgpu_vm_handle_fault+0x97: sibling call from callable instruction with modified stack frame

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
