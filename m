Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB3E8BFF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 23:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735171125; cv=none; b=urDDykn+1D6FMrKTCs+7chn9ndQH9EGRSDAXyTYANC8raKjDbEoAH+Pq+AbNer9G+clSgnOOxlNAoZ+EkHEawM6nGF8mKW2dwCu5XoW9OHqLaIcyXMqYbdHPKBQa+gvPpYlQgHNtqZOqNtCszsATsK3Pvf6wBW4bHO5sGkH6Mpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735171125; c=relaxed/simple;
	bh=HqsVOmRxmhT4ip31radHOXz4K4yCwJhbZmu7aEvesRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/y5F/SIBW280PENzaWwQK5kDn+XLggE+ZLHOPv+0EBJko35Vsgt64g369xL+T5LNPP/ii1wdFrMrFfTk1Sf9gn1h3OdGfBhJVTP0rVAaW/txBPnN8KpBRPy5SCwF/uitqfvCbLiEyKQK1eK/l9q93ZGNpX9PsvVpxgR6wrJjTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J57J/SKp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J57J/SKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735171123; x=1766707123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HqsVOmRxmhT4ip31radHOXz4K4yCwJhbZmu7aEvesRU=;
  b=J57J/SKp/lWWcKpTEYD1LXqNal1vO4IHn+F8NLiufvYKnIhJD8I9vvIV
   MkBEK/KPK6oM5gO2xZbEPMEiTfgw11iUduADc95BIGk7i6CaE15bhip1p
   oFwML3lcRTjd7/rC5vdxJBMubCRqi8Q9Rn2NlFhcZtYBaV9kfn2fGRrCm
   J0YXbzw5mCW21FxpYCg4tL3o1Moaqc8bA8J8P92EQEUj/Osu/zHZODssD
   wy7t+5qTa3YJhFiOjVUvh6v2kWcmGSnlbxdCUyUtxeChJ3vVEWjodk6UD
   QKIX86AddnhwpP8GrGZXdaWCNhyGJFR0vP8hFllAZadD/DoeRrg3RZlk0
   Q==;
X-CSE-ConnectionGUID: 424FzBILQLqRORvcJaiT8g==
X-CSE-MsgGUID: Y7RUyZVYRUeL6rMkceV7QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39281378"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="39281378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 15:58:43 -0800
X-CSE-ConnectionGUID: U+3viKi4RAK8xMaGBFjptw==
X-CSE-MsgGUID: vEVZvw7PRpiSI5lWCJGkQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="104766508"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Dec 2024 15:58:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQbGw-0002De-0T;
	Wed, 25 Dec 2024 23:58:38 +0000
Date: Thu, 26 Dec 2024 07:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: alejandro.lucero-palau@amd.com, linux-cxl@vger.kernel.org,
	netdev@vger.kernel.org, dan.j.williams@intel.com,
	martin.habets@xilinx.com, edward.cree@amd.com, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, edumazet@google.com,
	dave.jiang@intel.com
Cc: oe-kbuild-all@lists.linux.dev, Alejandro Lucero <alucerop@amd.com>
Subject: Re: [PATCH v8 24/27] sfc: create cxl region
Message-ID: <202412260756.QZSthKpJ-lkp@intel.com>
References: <20241216161042.42108-25-alejandro.lucero-palau@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216161042.42108-25-alejandro.lucero-palau@amd.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/alejandro-lucero-palau-amd-com/cxl-add-type2-device-basic-support/20241217-001923
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241216161042.42108-25-alejandro.lucero-palau%40amd.com
patch subject: [PATCH v8 24/27] sfc: create cxl region
config: x86_64-randconfig-071-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260756.QZSthKpJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260756.QZSthKpJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260756.QZSthKpJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/sfc/efx_cxl.o: in function `efx_cxl_init':
   drivers/net/ethernet/sfc/efx_cxl.c:107: undefined reference to `cxl_get_hpa_freespace'
>> ld: drivers/net/ethernet/sfc/efx_cxl.c:132: undefined reference to `cxl_create_region'
   ld: drivers/net/ethernet/sfc/efx_cxl.o: in function `efx_cxl_exit':
>> drivers/net/ethernet/sfc/efx_cxl.c:157: undefined reference to `cxl_accel_region_detach'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
