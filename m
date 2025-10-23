Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A7B2DC339
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761203943; cv=none; b=rtuxdEhfz1L8GJ+UdikW6E01LtsXKSps4VXH9dMamhKBVqv5urktrvOaQ7wbiehOpaxLBEKNhmIEAvvvhL7wZ4ghIQBPepivzaUVNaqv+S7UaaxIaN4TROALnkZbrLqvAUPq2aR1e6wV+VG0opN98zDmjBmvyCMiKxWHH41iSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761203943; c=relaxed/simple;
	bh=Wdv4KhYwTEUc/LA/L05ZFeU6Lf3l77gTzl2aS1om74o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HT4B/irwrGjVTzndn9HSs0pl1zJFooX5o/ZKGmvufRZ0r0OkS0pyFD1ELyU4CGL6uFqTckw37Brt39vaaQvDmYyl9nrEw09JIJE1g2K5x9llubCbVeM42RbNq5heKCV61TShaj/reEkVijqIN3JpQVyXXQgSdwpsosgYPa1Jbd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STY/skS7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STY/skS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761203941; x=1792739941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wdv4KhYwTEUc/LA/L05ZFeU6Lf3l77gTzl2aS1om74o=;
  b=STY/skS7kHcbbLN1g+l7GsLJ5GaqQahWdVI6g0O9o7F+Hy+nx5cSyAV0
   A+bkoMhpDdobEj/MeH84azZM6d170smCJorwTahZOnQRF2UYnKYFM/cQ1
   RJ2hURw4itV0vocmmZaqHKwA7uQGFHQFkYaKQrLMQvjHjm+kc09W0C67r
   3iDfUBvmCMOp6TQr7SlTRjxGwb82U7UiTdy9EOLwc1lv5iFJnfhffXsGC
   eXkEyQ9oPPE9VMcN/XB49xqhl8j6lsDY8hXiMgoTKFItgjcoHA6LzTfSx
   0xThyZzlVMdqdR20VRGSCo2Q/M9KZU31Yu+fb/B0cpVYBwxW555hfqaxy
   Q==;
X-CSE-ConnectionGUID: 37MCLsCiRoC6Q+uXqyrGdg==
X-CSE-MsgGUID: IIhw+q0WTWuxhOQ6yc/QrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74034002"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74034002"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:19:00 -0700
X-CSE-ConnectionGUID: CJfyOGOqQ6Sa/dhY/2ZvGw==
X-CSE-MsgGUID: I8JKyANbTqWWDWeiP+PORg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184563304"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2025 00:18:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBpb5-000D8v-0M;
	Thu, 23 Oct 2025 07:18:55 +0000
Date: Thu, 23 Oct 2025 15:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>, YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/amd/ras: Fix memory corruption in
 ras_core_convert_timestamp_to_time()
Message-ID: <202510231558.5UzBX0ox-lkp@intel.com>
References: <aPi6I5z5oenppEuu@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPi6I5z5oenppEuu@stanley.mountain>

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251022]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/drm-amd-ras-Fix-memory-corruption-in-ras_core_convert_timestamp_to_time/20251022-190512
base:   next-20251022
patch link:    https://lore.kernel.org/r/aPi6I5z5oenppEuu%40stanley.mountain
patch subject: [PATCH next] drm/amd/ras: Fix memory corruption in ras_core_convert_timestamp_to_time()
config: arm-randconfig-003-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231558.5UzBX0ox-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231558.5UzBX0ox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231558.5UzBX0ox-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
