Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0210A37A849
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 06:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783059113; cv=none; b=KheiQsE0ZPt7x7P6dUn3lI4PcPNOOor1vhWbHE0lwc2Tl50/H9UV3dzH3uLGLPgQSb2WtG5C2IjCHSYAuBL2gYO219TW3mZZ7EwGgUwK2txd4rh3HjzkpGU8JJxgnURWXPbYcZnLfhJ01gdM8onBj+P4dqG/ybta/pkxFWpDVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783059113; c=relaxed/simple;
	bh=GmSiD+ia5bI2D2yxZ7YbZVclZham2HyATqFvwBhSxnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jyTVhhmmukmWByhkDaP66qadze41mXvs3jbav1IsNDPm3BMyWNKpNvfTH587YazsS3AfbqUOx6S6X1M0kN0pe+XhkI+lZNv171gk9n3t8s2bjzLWBNq227RZD2QGwETeCOtSD1o6EvoNkMP+E36AmJZxZOWCmhvW0+wSfimareY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fajApH/y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fajApH/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783059112; x=1814595112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GmSiD+ia5bI2D2yxZ7YbZVclZham2HyATqFvwBhSxnQ=;
  b=fajApH/y6ZfkXw2vtuvT37oDm7SU/JMzQmkIBEbAS10ZSxC/SNJwhAty
   SHbVSRptBT75oeOWk+JH86/ndABRgK8JVFMuIGm9TLSiu33LCN07wbq71
   DPHpfBmuuXu0esmLmEdE2/lvUh+Fqf5pdUN5Se1ux/IpC6SA1jzaB4hTR
   U5OFCxFwfFuaXl6apNW3bVOylHedQvYT+H4Np6LiU8ZnMoxqunuv1fztq
   VU8DoQHYQ8hEHUuL9t64jKd7NVeot7YmF8pZZnXyTMnNKp61PIEPmj0k+
   XYcOvN1h0/3s5RBZjepWTtt4z+QlH+Pi7mVnhq7jls85RX2YUpAIe39lW
   g==;
X-CSE-ConnectionGUID: Y5ZDX5tRRTWn2RNbHvAyLQ==
X-CSE-MsgGUID: UdJOwQD+QSqD81qSDmVQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94408345"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94408345"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 23:11:51 -0700
X-CSE-ConnectionGUID: /gGnGM5IT/ajHffVjW7yTA==
X-CSE-MsgGUID: WwAqAO7ZRhy0kl+Ku67ZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="256926428"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2026 23:11:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfX7V-00000000Bk3-0yhJ;
	Fri, 03 Jul 2026 06:11:29 +0000
Date: Fri, 03 Jul 2026 14:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Infrastructure <z1.linuxinfra@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: [agd5f:amd-staging-drm-next 3123/3402]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: error: objtool:
 amdgpu_vm_handle_fault+0x169: sibling call from callable instruction with
 modified stack frame
Message-ID: <202607031446.1PWG18mN-lkp@intel.com>
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

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e3cc8c108f9a91728f9ff6e24cbf3b41c58b8f8b
commit: 5eef847e04879ec59e4e04fa17a0758fb364f440 [3123/3402] drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
config: x86_64-randconfig-006-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031446.1PWG18mN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031446.1PWG18mN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031446.1PWG18mN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: error: objtool: amdgpu_vm_handle_fault+0x169: sibling call from callable instruction with modified stack frame

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
