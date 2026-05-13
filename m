Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142463630A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 04:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778647244; cv=none; b=RuxI+4hpv2OnrAyJBCxbLFWu4z4ABa4N6HOy5kOTNeBhL8+seQSAuzCy9nVlNFh8sAbkRWRV20DtjsAYszrvKJbKssRh6X66pG3khedWtn3AuerGZyNJYeu0oXqqClElZvurO0cYMLH8qQqL5NphiawLY13QEgtpK1yz0hvqjIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778647244; c=relaxed/simple;
	bh=A2MYt6X3AceVB5ddiyNXVfZfTRAFZeN+VNfDQfv/GNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nj62ckI1DseMlCQxo9wH1yQDrrwd3OdVlQk070JjvtUeXAKBw9i1bJCYgQru+9TDxhwBL8FFetnzg/j83vv3dUWTleRWns+bVoD1pEXP2M7zPq7tzsipsL31EDRXYB7tI8t8FldIBYBffR73jm49d3rXYmxxWdx9cCtnUdAjUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAcuQ5sh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAcuQ5sh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778647243; x=1810183243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A2MYt6X3AceVB5ddiyNXVfZfTRAFZeN+VNfDQfv/GNw=;
  b=gAcuQ5shFF6A4fV8TOq5hrhMekdZOAbB5taPTWndrtH67JjBMwfjBkD7
   UdVS/bmbUoWGa4EaTVTwnyKjEWpv0ZWLE8ImKJPq2NLn9C2y7qkzJSeaK
   8syOE1XW0ssi4Xq+sU0zZgYpbU8SdZPyyXrBDa/86fuU6aIaWBzlARLVm
   MBNhSUZXPxtY1SFgkTZLmPBJuDt1sRotm+Tfq3UMeFaRIxB0nIYnurxBK
   Z8VrCHARvyJ3S7djRRKP9Xsv7oPRsZEZd5yiMuSHth4ap/ZNFSU/qVgZU
   23+4/bZSQTwbaPTbo5CO1dZZIkZ5bSNDc60ev8Rq7PQB1GNhDZgikyQFA
   Q==;
X-CSE-ConnectionGUID: DBsdeBjsTReXl+u+xHWgsg==
X-CSE-MsgGUID: Q+vQOD2hTFSqu/lqBEG1fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79462076"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79462076"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 21:40:41 -0700
X-CSE-ConnectionGUID: wJUJkKPQR9a8WkJp+seoag==
X-CSE-MsgGUID: rUSZELysTEKf/ihRRoWgHA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 May 2026 21:40:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN1Od-000000008Sv-1QeJ;
	Wed, 13 May 2026 04:40:35 +0000
Date: Wed, 13 May 2026 06:39:53 +0200
From: kernel test robot <lkp@intel.com>
To: Andre Jun Hirata <andrejhirata@usp.br>, kenneth.feng@amd.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, gabriel.dimant@usp.br,
	guilhermesangabriel@usp.br, Andre Jun Hirata <andrejhirata@usp.br>
Subject: Re: [PATCH v5] drm/amd/pm: Use guard(mutex) instead of manual
 lock+unlock
Message-ID: <202605130638.LqIgORiV-lkp@intel.com>
References: <20260508230312.6108-1-andrejhirata@usp.br>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508230312.6108-1-andrejhirata@usp.br>

Hi Andre,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Jun-Hirata/drm-amd-pm-Use-guard-mutex-instead-of-manual-lock-unlock/20260513-040937
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260508230312.6108-1-andrejhirata%40usp.br
patch subject: [PATCH v5] drm/amd/pm: Use guard(mutex) instead of manual lock+unlock
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260513/202605130638.LqIgORiV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130638.LqIgORiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130638.LqIgORiV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_is_mode1_reset_supported':
>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:247:47: error: expected ';' before '}' token
     247 |         return smu_mode1_reset_is_support(smu)
         |                                               ^
         |                                               ;
     248 | }
         | ~                                              
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c: In function 'amdgpu_dpm_get_vce_clock_state':
>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c:833:31: warning: unused variable 'vstate' [-Wunused-variable]
     833 |         struct amd_vce_state *vstate = NULL;
         |                               ^~~~~~


vim +247 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm.c

   238	
   239	bool amdgpu_dpm_is_mode1_reset_supported(struct amdgpu_device *adev)
   240	{
   241		struct smu_context *smu = adev->powerplay.pp_handle;
   242	
   243		if (!is_support_sw_smu(adev))
   244			return false;
   245	
   246		guard(mutex)(&adev->pm.mutex);
 > 247		return smu_mode1_reset_is_support(smu)
   248	}
   249	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
