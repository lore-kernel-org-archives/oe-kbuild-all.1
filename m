Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D94F88A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286156; cv=none; b=pzKtI24DRZMTblDPprZ4nWCCu2dUCDvEBs+F+Dfx2zYiuIexrRWWWc0yF80I11W5uWMK/R0cdVz3CfZQyhQ5XNPAhcy7p9ocHANBM5WpsI+CNfzOPeGZm2iu9r+LDzh1DHt/owW4j2ckubcgeWJvMu+SRVgSN/jsK8z46DO+X4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286156; c=relaxed/simple;
	bh=HqPS4Fe2/WN6XZ60O9VEIDA0G8BrtY/3ISGO5R8y64c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEOhhyEJ3fq+oteAkJl9Qvj+8GI0TRy4Nl98WZcXPrKsd3/rOCNglSkV6nenC9vnWmwY4nzpJye09Wrv5Fu/XD89UY0AxchBG3c3UCfDTZp91TWy2M652kpFkGENAXpvCt4CuCGbmH7WdDIyrDgozzcUp1uKjj3yKPgQXOvf9vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8fjdpU2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8fjdpU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716286155; x=1747822155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HqPS4Fe2/WN6XZ60O9VEIDA0G8BrtY/3ISGO5R8y64c=;
  b=h8fjdpU2wTbsrfN5w0rbJXSzwS7JZnWrNyPNLlJNUg1Vv7kjvWrtdFhZ
   vV8z3qoLIjlitriDyARn9+QWBNl40XjaeNhjOMpJ9ZWdyejfRD2cCa6g3
   fi/7fxUjnnYDGjmdRqrRQgQi2RgiyUTdTM6GfvM+VmfYuevUuQsdcAi0m
   EgPgc91QGOKCJKIHLeXRSM7pi8SiFe/QjUCsyY/z6+gsU9DDw+OrxFYUG
   IVrDdIDOBgYaWpAOzONDTl8m+nrHmUnOOL7R5T2+ytXEEVSI8VT2v3Yut
   adlZ/4r1SYPBUcJN5N3t5dyOnJdoa2GesSq6A1T4kg3EOX+O+UdppByzt
   w==;
X-CSE-ConnectionGUID: M4Z9n+KHRDWUIspmkifxYg==
X-CSE-MsgGUID: vNIz4n/6RR2RREiaRLh5Vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="37843491"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="37843491"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 03:09:14 -0700
X-CSE-ConnectionGUID: yZdGUZZ9So+J4YdIVriJaQ==
X-CSE-MsgGUID: 3SNGrfWBQwWZ2sxpqdhglQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="32729465"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 May 2024 03:09:13 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9MQh-0006Ga-05;
	Tue, 21 May 2024 10:09:11 +0000
Date: Tue, 21 May 2024 18:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 17/21] drm/ttm: Support drm_exec locking for
 eviction and swapping
Message-ID: <202405211726.jtZtROS2-lkp@intel.com>
References: <20240521071639.77614-18-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521071639.77614-18-thomas.hellstrom@linux.intel.com>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-tip/drm-tip next-20240521]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240521-152156
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240521071639.77614-18-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH v3 17/21] drm/ttm: Support drm_exec locking for eviction and swapping
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240521/202405211726.jtZtROS2-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211726.jtZtROS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211726.jtZtROS2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ttm_bo_validate':
>> (.text+0x7045e1): undefined reference to `drm_exec_snapshot'
>> ld: (.text+0x704694): undefined reference to `drm_exec_restore'
   ld: (.text+0x704710): undefined reference to `drm_exec_restore'
   ld: (.text+0x70476b): undefined reference to `drm_exec_restore'
   ld: vmlinux.o: in function `ttm_lru_walk_for_evict':
>> (.text+0x70556a): undefined reference to `drm_exec_trylock_obj'
>> ld: (.text+0x705744): undefined reference to `drm_exec_lock_obj'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
