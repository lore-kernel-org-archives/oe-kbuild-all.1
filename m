Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674541F9416
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 11:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731585217; cv=none; b=RDAnwZjWmIUNcfAXCYXvX5Q9zmMPKzb7BOKSf6dvVyOvOxpeEgMDiIQ9kQInqW3zUGSigZyh9tO9/1Ke1Km+GUHsgL3gbEsF8ZnyQSqEdDz8aOcHEmrL1GphE9Zg5ksk2koALPtGsC4mif4FFLKevmgzh/dCbIiVXoiJ/qeQruk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731585217; c=relaxed/simple;
	bh=FuEauCUbcnmgRfwwKD+D6jAcPoXTz7863lZ/S5yXVGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCa6PXLCvLmzaMnR6v/pWtbvDR/3UKWt4L9MXgfJgSkNyjuaihbFM61cL2QKXRDErSLR5OqEz2qSjJQP65HojIcMs1/1mxvlLYbGWMpV3aQfrYneCmrS0wlev7KHT5vFSSa33Nwuk+NQ36L3ZsEHfpDNkjG2+rxZJQwJ8ZRHToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMCf/KH0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMCf/KH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731585215; x=1763121215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FuEauCUbcnmgRfwwKD+D6jAcPoXTz7863lZ/S5yXVGU=;
  b=dMCf/KH02PpOIYUUrWIuA9NXosz3fpjrqhF0HvxmdBXBjMMqu1/yQCF6
   cQIPQfBYRwTqtorlbwODkPuPrzAABTMe8v3y0AG/Yt+rzI9Br2p0MHnsg
   y+cAmKdH91wc94PmW/xgg7my6QcA5OLrVq0hSk45jZpDNFEpgZRjfwDyy
   gj2UTA2Nau/T2XDnF6TzdCGNEPR/WgPsdUpjq3mh2J8p3mQ6mT7Tv74Kb
   wwqZY4aH4U8VVxiRykBWlWGYIJLyzATVR9nrSC8yYOVRSOyNlo8IlGsBY
   9RW31sNVsoRVh7pvX/4XS57sOnrI2vh+6j9f0YoKF2Cds/VQ/UiWdDrM0
   Q==;
X-CSE-ConnectionGUID: sTO+3/JwSBOHCwgsa0WkXg==
X-CSE-MsgGUID: i2RITyVzT+WTrzzM8LdH0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42948815"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42948815"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 03:53:34 -0800
X-CSE-ConnectionGUID: pWcBrF5YR/yodq3BzPHGww==
X-CSE-MsgGUID: UDPxG8HMRRu3DQ8o5EIKvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88958247"
Received: from lkp-server01.sh.intel.com (HELO cf353f978a24) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Nov 2024 03:53:34 -0800
Received: from kbuild by cf353f978a24 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBYPj-00007B-2Z;
	Thu, 14 Nov 2024 11:53:31 +0000
Date: Thu, 14 Nov 2024 19:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 2/2] mm: guestmem: Convert address_space
 operations to guestmem library
Message-ID: <202411141918.hOFtcGfU-lkp@intel.com>
References: <20241113-guestmem-library-v3-2-71fdee85676b@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-guestmem-library-v3-2-71fdee85676b@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5cb1659f412041e4780f2e8ee49b2e03728a2ba6]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/KVM-guest_memfd-Convert-free_folio-to-release_folio/20241114-063557
base:   5cb1659f412041e4780f2e8ee49b2e03728a2ba6
patch link:    https://lore.kernel.org/r/20241113-guestmem-library-v3-2-71fdee85676b%40quicinc.com
patch subject: [PATCH RFC v3 2/2] mm: guestmem: Convert address_space operations to guestmem library
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241114/202411141918.hOFtcGfU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411141918.hOFtcGfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411141918.hOFtcGfU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/guestmem.c:214: warning: expecting prototype for guestmem_put_folio(). Prototype was for guestmem_punch_hole() instead


vim +214 mm/guestmem.c

   203	
   204	/**
   205	 * guestmem_put_folio() - Helper to punch a hole in a guestmem mapping
   206	 * @mapping: The address space to punch a hole in
   207	 * @offset: The offset to punch a hole at
   208	 * @len: The length of the hole to punch
   209	 *
   210	 * Return: 0 on success, -errno on failure.
   211	 */
   212	int guestmem_punch_hole(struct address_space *mapping, loff_t offset,
   213				loff_t len)
 > 214	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
