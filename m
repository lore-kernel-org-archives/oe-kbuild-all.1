Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B223D76026
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 19:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737401528; cv=none; b=WbV5HKhwjrcAWzb8GJuNfrw2RMexmZ7Zh5230ljz3Orna2TVdWDHma3QnsOSTUq/dAfucjX+c79lBrbqu3bYf5B14Q3X7/C1TxbKDNKpvLezj9RqU7JPlTY92FqNMDVFjnMrSK6RNZVIAJwvKkuWlPRPRwfWXqk/s+bdRvZI1Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737401528; c=relaxed/simple;
	bh=CAxPr5M8N/ZTfcix1noCY8UNurLPMN7QWi7q0cqgFwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+bP+aR1qIHrL3vrx9XMnb7JbBXPc8AQR0ED4UjgRiTxtKQzG1W+sIj1psoo6BGRCaQ9DWDiVguEm8M9zZh9oD4XUAh7L99goQOEBhScDuefMieCeyPxq0YbrvE2GZazZMpLzdkAVdEQLRGoIDmbMF+oBLMvUpSoXqx61QwZYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHFpVo9G; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHFpVo9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737401526; x=1768937526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CAxPr5M8N/ZTfcix1noCY8UNurLPMN7QWi7q0cqgFwA=;
  b=JHFpVo9GVdkNGLAsBB3y1U3y96oMCDBcBAMAHrKvu/xqGn6EOqfLZdQl
   PJyvqMqek9ET2Bsbtq+rhY3PM8Agk/idxteSFhZBT2muBtZWnLr8UsHXC
   1qezatxGC+fCJpZr07SL50UpfMQgWsiaKV6HZIDvecVWKDRVzK5WuLAbX
   uBgPGHMMyML3NuZETtd8rxnwL3QZ7w9YbFdApWr+YgP2PWOIBw29ZPWeq
   zrKoG+fLg0/rJQYh8XHYqgY3EOSXdTjwnXJJNwScV3qHUrkK2SH5aw6ef
   1owE5B3V6WTsmL6me8o4LHEyRWrhlHZMppAU2zTvo3ROiZRM4cYox6VQ7
   w==;
X-CSE-ConnectionGUID: q66MtASeTD2Wj1Xae8zuHQ==
X-CSE-MsgGUID: PinuEDvcQyekaecSIlNjPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48470749"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="48470749"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 11:31:50 -0800
X-CSE-ConnectionGUID: GW9rxCSCQymdSpGu0PpnSQ==
X-CSE-MsgGUID: yb41CL23SiWXDAzXSFbdvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111230762"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2025 11:31:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZxUw-000WvH-11;
	Mon, 20 Jan 2025 19:31:46 +0000
Date: Tue, 21 Jan 2025 03:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Basharath Hussain Khaja <basharath@couthit.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 2/2] of: address: Add kunit test for
 __of_address_resource_bounds()
Message-ID: <202501210330.aqouOniZ-lkp@intel.com>
References: <20250120-of-address-overflow-v1-2-dd68dbf47bce@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-of-address-overflow-v1-2-dd68dbf47bce@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/of-address-Fix-empty-resource-handling-in-__of_address_resource_bounds/20250120-221141
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250120-of-address-overflow-v1-2-dd68dbf47bce%40linutronix.de
patch subject: [PATCH 2/2] of: address: Add kunit test for __of_address_resource_bounds()
config: riscv-randconfig-002-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210330.aqouOniZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210330.aqouOniZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210330.aqouOniZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module of_test uses symbol __of_address_resource_bounds from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
