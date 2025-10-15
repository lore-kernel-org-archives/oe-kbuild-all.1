Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBEC31329D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 07:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760512550; cv=none; b=DGJCBbU7V1j24XfF5zNUTr3mSakn2/sVUSrsnmIwcCogij73jzBIMZM4QO9NK79jU8r/UIZatOACUk+RMK3ijuYX1ChentP2L4WW8IBDcxHRYjMy5qKAMBdgaujtXbeTPb6b8YqMMrHtUDIpAcnvIoSmceLsroUoQM/44KxeSY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760512550; c=relaxed/simple;
	bh=jnENTofPC4iEcJrxE/cJxwjX0apIHOaphtE2QPkRsk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NUdL2a5bfs36FlQ5aTALZqMzAoyHVaFNuYvSFHgFM0c/yrvIjGzDpJo83SqB+4rnLRkdAbRo6EDeD3CEtaEquv8kZVZ6YZjK23/jA1iOc4p2JYM0DwE9J7Rr4spc9eLWao/BcgOEi3itMVFAu3WQXS2qeGLzTj3g5MlY82XL6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXj3AImg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXj3AImg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760512549; x=1792048549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jnENTofPC4iEcJrxE/cJxwjX0apIHOaphtE2QPkRsk0=;
  b=NXj3AImgVhPuxjddj/U5JIdA/1QELMWMcPoQAFezU1ctDOF5sNPszZAH
   r77ek5tFu3+ryMhpjimz3by+buQwmfMXPAlRzCQZzaJTfWQ/iVrrquJyh
   o4mNsZGR+R/3GQxnXczzjbMJVDZDTU3nxe3p3UUfOIvP6aNZMlf8KfPfn
   9Ud+f0YhsnCQ8SYoKt8x1cEF7prytbL67CutlurAuuxVUj14IueYJxRJV
   KW6k7V2/DwcVylosD06/xhe8+CEExhWouvpK9M/aZms68yYq7AeLVj3rU
   vUAqOubQ/KQ36LBbBay0TpQG+14Fz2ybG2sTpY4xNliWea3pMNOi/rOeH
   g==;
X-CSE-ConnectionGUID: IcM7IqolQ7mrinmaUOr4sA==
X-CSE-MsgGUID: /eYz3zhzQsCNPRa6yTlCUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="72953403"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="72953403"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 00:15:48 -0700
X-CSE-ConnectionGUID: wXV+dM7GSCeHScVmnEBChQ==
X-CSE-MsgGUID: rbcbutDiQTCz7drrcKFm+w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1a91aa8e7fc2) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2025 00:15:46 -0700
Received: from kbuild by 1a91aa8e7fc2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8vjc-00000000029-1m9X;
	Wed, 15 Oct 2025 07:15:44 +0000
Date: Wed, 15 Oct 2025 09:15:04 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 1227/1572] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:761 function parameter 'af' not
 described in 'amdgpu_fence_driver_guilty_force_completion'
Message-ID: <202510150946.2SFlT3tW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   13863a59e410cab46d26751941980dc8f088b9b3
commit: ff780f4f80323148d43198f2052c14160c8428d3 [1227/1572] drm/amdgpu: set an error on all fences from a bad context
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20251015/202510150946.2SFlT3tW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150946.2SFlT3tW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510150946.2SFlT3tW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:761 function parameter 'af' not described in 'amdgpu_fence_driver_guilty_force_completion'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
