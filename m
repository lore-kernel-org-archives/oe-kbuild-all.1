Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891943BBD7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718448928; cv=none; b=GVUIHPFoJV7TKhTDG4D54Th2A3liCMhOh0Zns5ZhjCSqQgVq9Y7HpdkheS/Zy7ahrGjgiDX7uQPcjfKpTBbCTCmNYjlijFmS+m+HUNLWUzPIOjh1EtOEafh7mAceWhTunyP6Abgn8gyDoydB7DuLF5m7LcWr6joXmObaueZERw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718448928; c=relaxed/simple;
	bh=4pYquGYwdsVfDEQdJhskgow+4xUEyJc4fx7x9R6kzuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuaqpF/kY04xrPFa//B2U8lgMW4gy6ajWLjEA35ilmE+1dOka69N+ExDu7tDylptW8hvwmYtjFNi1RwEdP7k7ZZ+IQuVOUXiTRGBaVDpAECcDblHz4aFurLIn24qHrSwAF6DGh/Jh6r+fAklsnzUN3vK1w6AG9a050kzBz+bmIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMtQ3rfd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMtQ3rfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718448927; x=1749984927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4pYquGYwdsVfDEQdJhskgow+4xUEyJc4fx7x9R6kzuw=;
  b=lMtQ3rfdPeNyKbqdivVDDAdpIGVSi6RNb50i8LAkuPJHM36fV6RA6Fyp
   bt6j70uLEf44s+N+TM3GDVaM1B0z9LpHBh+L4w4MMxqPsM/6ieTRbDcjE
   CSs3PR/vl2Z5MsUwPcq+NLfhZAKuNI63RCnWMhtrkVshMJjwi9Ul4ae3z
   cOZ6KkRHU1QaXhvCrcSsevlFlzemj5BFBuzb/F4oe7w/hLF+PVO75dMui
   6TWPCrEbTKqME/LN88qGRroJn71/7YTlHnIi1esV0aewVo6n36V+p2OtV
   nwHXII6M44TnJM9G0SdGdKpZzHse0k+bUpZHa3RHBkwdn17t53hNcfpjs
   g==;
X-CSE-ConnectionGUID: RINqu3HjSv2Bjq+5wl1ONQ==
X-CSE-MsgGUID: Y3gR4xQOSnCFEmwcfQem3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19124934"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="19124934"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 03:55:26 -0700
X-CSE-ConnectionGUID: NFhIhx1KSbWYtNhlCI9fow==
X-CSE-MsgGUID: h4QgHNloRnyHfr6HsfmoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="78234077"
Received: from lkp-server01.sh.intel.com (HELO 0bcb674f05cd) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jun 2024 03:55:24 -0700
Received: from kbuild by 0bcb674f05cd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIR45-00006A-2d;
	Sat, 15 Jun 2024 10:55:21 +0000
Date: Sat, 15 Jun 2024 18:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 09/12] drm/ttm/pool: Provide a helper to shrink pages
Message-ID: <202406151828.dncRRcNZ-lkp@intel.com>
References: <20240614102548.4364-10-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614102548.4364-10-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20240613]
[cannot apply to linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240614-182911
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240614102548.4364-10-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v4 09/12] drm/ttm/pool: Provide a helper to shrink pages
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240615/202406151828.dncRRcNZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151828.dncRRcNZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151828.dncRRcNZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_pool.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction


objdump-func vmlinux.o __jump_table:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
