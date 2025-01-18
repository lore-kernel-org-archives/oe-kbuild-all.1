Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F2B155757
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737201426; cv=none; b=gFnB4xfNylh9FyX8vkjLIzGRfjpEzIhNgc5h4huPQ6bNjtN/AERP8tyt27Pr4UCvHb/BO1ho6KXKjh50tqIuqQiFPq0ZyZud/coGZToYw0seO57DaGuWpMXLJPeREIZZ8lEjvEWaT+10RINt0BGT7bdd3LO9agdbgBi+S7rKQ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737201426; c=relaxed/simple;
	bh=gnIWoOVpcdpXrLhNiSdkcUxV2PyEfdsDoxzJ1vXfx2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOCEltAlBqM2nT3A6MKZjfz/G2Y9419ofsNmDpGCDDfYH2xYxjCywm410h6G976NSEGGRkrM3WeZMq2PWdbsRUSAo7CptLaVq0Bs0QoJNTPjNBtnGY6g7Ca4O2Zc02dKmFojG9EF1grqooptTBQ+hqgyKQKhOAdsZyX4BIcVvT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfSQqQoy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfSQqQoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737201424; x=1768737424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gnIWoOVpcdpXrLhNiSdkcUxV2PyEfdsDoxzJ1vXfx2U=;
  b=XfSQqQoyPTtud/wXRgOUVe0WLwChJkhFqfB6I5xYVuur1A2iw2Aq8UDG
   w2iSVTHIjTX8cHA/evF7kC8o7bU61XTBujgG9EwdqUmwmOJfMR4dAKs/8
   NdRh28bBoZ6W75xY35q0XY4GUj4mxEg+gqA7YE94DAYiQxYo4bMGKHUgA
   DCqJCBEHhetK6hNzHyFr+8tJtJJ/tJ8N646KS/EPcmCKF+dnUh6Up0gTu
   wjkz/AF3GIjm1IoFgnxhdndZ2W/mnHS8qPJHnNw9W0SV/5VrUNoZW4VOi
   sKAJMo9RLvsEkCpZVnIP8ux60YkPljJhHU5mtIqpgUtXJb1gCqDsB9aOl
   Q==;
X-CSE-ConnectionGUID: ZhvWmCPMS5O4DJgBh0s1hg==
X-CSE-MsgGUID: 4NSXJkYPSZyfDzKNPfF5Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48297809"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="48297809"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 03:57:03 -0800
X-CSE-ConnectionGUID: x6mg2vD1TDSjBPhOVMgFSw==
X-CSE-MsgGUID: EbXzLs0sSK2zyUvXeJsztQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105892802"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Jan 2025 03:57:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ7Rk-000UMx-28;
	Sat, 18 Jan 2025 11:57:00 +0000
Date: Sat, 18 Jan 2025 19:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 01/15] mm: Consolidate freeing of typed folios on
 final folio_put()
Message-ID: <202501181951.3qH7Sd3n-lkp@intel.com>
References: <20250117163001.2326672-2-tabba@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117163001.2326672-2-tabba@google.com>

Hi Fuad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/mm-Consolidate-freeing-of-typed-folios-on-final-folio_put/20250118-003538
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/20250117163001.2326672-2-tabba%40google.com
patch subject: [RFC PATCH v5 01/15] mm: Consolidate freeing of typed folios on final folio_put()
config: i386-buildonly-randconfig-004-20250118 (https://download.01.org/0day-ci/archive/20250118/202501181951.3qH7Sd3n-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181951.3qH7Sd3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181951.3qH7Sd3n-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/swap.o: in function `free_typed_folio':
>> swap.c:(.text+0x4f5): undefined reference to `free_huge_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
