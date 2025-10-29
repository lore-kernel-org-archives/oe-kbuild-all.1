Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65534A764
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 17:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761757879; cv=none; b=a7JpmjGj4floBv3NxJ/L1syTekzwLUTMYIeANkBNl533XlfxWYeGGZ2MCya7SnrvGR3nbZh5tPzHvjigiyjxDsTJXmPt0U9Zalb9W645rB6bka9JGxW3DFBebdUcPZF9Ks2Pr9BQzsTVp+TcNDedH+u17oNka8EDjSGNsj9U0J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761757879; c=relaxed/simple;
	bh=iyar2uTOdGVCwWk7buefD2Fr1qU6+IjebcU2Xdtk1MA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NkE13pWXp440aRiNASqaebwhH2wOOQlCA9tZBN8nJqejhoUjSlbjaXDs4nY0i60jOii7IGseeD4RGSdgNGjqX1eZAHRkXG/pYAJeF/gTi9CbFgIeARg2LZxOnu2cuslnNppGlSY++AxhZnuwHIWT2seFTgekNmwExHmR8AtvFmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUV9PDDU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUV9PDDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761757877; x=1793293877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iyar2uTOdGVCwWk7buefD2Fr1qU6+IjebcU2Xdtk1MA=;
  b=DUV9PDDUeCrTddOA+/GH1z69MmlnuMhtrqvYxilUn3hnJdw/GiClu3mC
   CgPHQ0nsDSgck6NzWocSFf21/yhxVkTY1548gVJl0ZGQTsEeblsg6nBsv
   rXknsE42sLOC470w4dUvpAS1n5Yr4LFvpixEn4y0Gx0GphOYzxoaISYFO
   u9r/fPcB0ngAT4xFAwU2w8caOaaM2o+MtHkvMLzNrTHblWzUnNyKmBNVa
   8ieDppM7W+/+VUtnNezfJYdEJHnBE+p49/rv5RBRIZqn/ikYnnacD31Pz
   RKiImzKShGvKz7wF+ZkEM45Me1fqg8pVph0FVBPVBoMpmJahm28ZRS7K5
   g==;
X-CSE-ConnectionGUID: TO/ARg8IQbSbYUlyTvdm1A==
X-CSE-MsgGUID: 6Vhu0UcLSeCJWI/QBayXTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74564067"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="74564067"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:11:16 -0700
X-CSE-ConnectionGUID: 3KI/URUSS02TnM2fViq32A==
X-CSE-MsgGUID: CE+EGKyVSQ68vGmQrAfNTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="186469718"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2025 10:11:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE9h1-000KpV-2n;
	Wed, 29 Oct 2025 17:10:53 +0000
Date: Thu, 30 Oct 2025 01:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 4411/4731] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function
 parameter 'connector' not described in 'amdgpu_dm_connector_detect'
Message-ID: <202510300152.UG9LOpTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 8223a605744bb471f31018eac9075a539415b16f [4411/4731] drm/amd/display: Refactor amdgpu_dm_connector_detect (v2)
config: parisc-randconfig-002-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300152.UG9LOpTY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300152.UG9LOpTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300152.UG9LOpTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function parameter 'connector' not described in 'amdgpu_dm_connector_detect'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function parameter 'force' not described in 'amdgpu_dm_connector_detect'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
