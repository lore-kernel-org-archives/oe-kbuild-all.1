Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170FE194C78
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734205751; cv=none; b=YmMwS6yDl3rHbP2rSm7tzC3tgPJ5EdVJTbxtAezCGQyc2Q5LUn/YrE7aT5KkVm7W7WwUu6bTRein12SypZbT8cNhidX/TE4mn1CiPk4Jxt5Kq5iKPOfTKbbXh9CANEmJ2x5h0HBQy4ExyWCaRqk3ZzgyhMsEkRTOkO2sUrCqdZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734205751; c=relaxed/simple;
	bh=Tnu2GP/Lra1ExaRealDsyaw6c5MvITMR9aY6Fbop/78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2LEnmViigL4EQfpBSiQ8FcGEzJHO1FB2YBXsPhJ7grJ0R0Z8ArvsHV0tVdedjAq2uN2YDUMZs3cZYLz613St10a5zB8mXJPvj2/X0j7ico6geuf0sTPSIlIDSdesWxK9TZbwXJngbVFxGa7k/ywghY8Dq5xSoB9S/0BowxIikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcEaBs+n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcEaBs+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734205749; x=1765741749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tnu2GP/Lra1ExaRealDsyaw6c5MvITMR9aY6Fbop/78=;
  b=KcEaBs+neI+++HAt4lXA48gj3nFqtkt5MLNJHGH36At7Hc8yWv8Lyump
   VjMk5QvahrRwPIXHa5nZUx34e/btUhD7qO0GCmEoLQRPLFi9fPAtZnJxq
   alRO98L1p8FHwwy5JA0zo5tinw/Kh0CO92Tdu0zHrkB80dmjCF4F8EFOi
   7iqdaAQZWb+LhobVi/+G8RZLZlPyjTDfh7RZPMkrL+9fbYEu9duEVukwZ
   2OetQkthBOzDyfmrMHwfZDwboVcmKulhSK3XxGlYhj2y/1AhBMXorDJFK
   tDjgh8ELu3kguVbJESz1S0KnpvcA/FacIZnvMIkeCNvckyzsnCo3N225s
   A==;
X-CSE-ConnectionGUID: UYi7DuHoSEGlkEHwm2tu2g==
X-CSE-MsgGUID: lqusXQXBRdqF3LFbFQbOHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34367284"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34367284"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 11:49:09 -0800
X-CSE-ConnectionGUID: 5sRuVRAgQO2ox7ZtXESR1Q==
X-CSE-MsgGUID: RXA68hhhQ/mWOJWVp+F6+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="96900098"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Dec 2024 11:49:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMY8P-000DBP-29;
	Sat, 14 Dec 2024 19:49:05 +0000
Date: Sun, 15 Dec 2024 03:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 01/14] mm: Consolidate freeing of typed folios on
 final folio_put()
Message-ID: <202412150355.ono8jUYs-lkp@intel.com>
References: <20241213164811.2006197-2-tabba@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213164811.2006197-2-tabba@google.com>

Hi Fuad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/mm-Consolidate-freeing-of-typed-folios-on-final-folio_put/20241214-005109
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241213164811.2006197-2-tabba%40google.com
patch subject: [RFC PATCH v4 01/14] mm: Consolidate freeing of typed folios on final folio_put()
config: i386-buildonly-randconfig-002-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150355.ono8jUYs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150355.ono8jUYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150355.ono8jUYs-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/swap.o: in function `free_typed_folio':
>> swap.c:(.text+0x4e9): undefined reference to `free_huge_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
