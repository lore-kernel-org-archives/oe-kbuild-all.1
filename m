Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9986344
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780097; cv=none; b=F2Mm5iDwE64Om3AgTyeNY+B61xKCjqQQjy4kExJM/Ty0aSj7VSeoGgT9k/ByxYon6jVu5rA/BykizcTNE6cW9fmQheWOXBBaF3tdyrNAanLybfJBbf85h0vUtxNj2P4KrdsW1vDVuk343Gb+mGbLFuI8D5xGCk2U1IXqx+oqDnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780097; c=relaxed/simple;
	bh=4LCr2B8XehYTLoT08eM9G/ZefvjSbMSLC3bbbASTRjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6NxSc9c0Iz/BvkUYOQxoCyMB8TPi0P8XYNMYsnricIkYC4Dbhz18Amk2DDPpDCBA+PbB+SkjiZEQJxctp8IguxvMVH5K3v6cu5Rza3qn8Z+HdEjJ/xCsltbVQtev3H8cDJ7VfZRuSAOlt0nt5/VCgig/2GZX8e35/CSu3ToOk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtcWWw0m; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtcWWw0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743780095; x=1775316095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4LCr2B8XehYTLoT08eM9G/ZefvjSbMSLC3bbbASTRjA=;
  b=LtcWWw0meS14deF/kJRWkDR+Y9R1GdLMvVo0rQaDPKYw/85v6DQYGgRr
   xKyP63EbcWc+q5AOEGfUANvwOxzuG2J/ASQkF5D0dXC3HeEzwrL7s48xP
   GD7i/dP6647MUah8vCBfkaHNsbO5t00VIHSLKnN6LvauDLTAVES0qsJLW
   DSbAyPbPpdPlS5bhpozjRDxg+xCsWdq6rZEhIV3E+k7GZZYQa4ZzWo8nd
   ixJLRnCA8q9Q547heja8QEabWMRKDkif2ulOqbgVMoYc96c9pdo/Gm9fc
   gl/5Ve5tExAHyGBv9K99OQlhuQrq2aQUj2EwwsKx5MCSqtiaRpMu2wm6R
   Q==;
X-CSE-ConnectionGUID: A1Pty9ZaSe6q6W94U6tSFg==
X-CSE-MsgGUID: NgkiT9bIRRCa1pwHydu7IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56592775"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="56592775"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 08:21:35 -0700
X-CSE-ConnectionGUID: w4m2RyOER6CGbFJ32ZYIRA==
X-CSE-MsgGUID: Zt+pkj1eSzuwdNDoZMFxGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128185355"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2025 08:21:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0irL-0001Kl-2X;
	Fri, 04 Apr 2025 15:21:31 +0000
Date: Fri, 4 Apr 2025 23:21:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next PATCH 05/13] net: pcs: lynx: Convert to an MDIO
 driver
Message-ID: <202504042314.UV59nmtB-lkp@intel.com>
References: <20250403181907.1947517-6-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403181907.1947517-6-sean.anderson@linux.dev>

Hi Sean,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-net-Add-binding-for-Xilinx-PCS/20250404-023209
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250403181907.1947517-6-sean.anderson%40linux.dev
patch subject: [RFC net-next PATCH 05/13] net: pcs: lynx: Convert to an MDIO driver
config: loongarch-randconfig-001-20250404 (https://download.01.org/0day-ci/archive/20250404/202504042314.UV59nmtB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504042314.UV59nmtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504042314.UV59nmtB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-lynx.c:414:36: warning: 'lynx_properties' defined but not used [-Wunused-const-variable=]
     414 | static const struct property_entry lynx_properties[] = {
         |                                    ^~~~~~~~~~~~~~~


vim +/lynx_properties +414 drivers/net/pcs/pcs-lynx.c

   413	
 > 414	static const struct property_entry lynx_properties[] = {
   415		PROPERTY_ENTRY_STRING("compatible", "fsl,lynx-pcs"),
   416		{ },
   417	};
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
