Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D45189B84
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743849193; cv=none; b=iDZPHP3UkpxxxZEoyZw7AU0xFjRQfxkFoqVj7uR7HDtLxzsvqRgxi68ghffShMYa0E0yCoIR0uCh68mORWCGzrHhytD1U4sAp0AQR9evCuxQ6hnYWSPgA65OJgphf/SgGlYe4YmM3ioD+bRk1TWJmYezANRZXjIvQ9ik+VESMZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743849193; c=relaxed/simple;
	bh=ewkM9e6eOhXSida2FsbZNNmawkh95TVdEvbxu0fxIMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BB2JZPaHmO74mdzvdvn6c21pU9aqP4X31H7NwFaPHw6rA93s+CmrNxFWKenTxC00oQ2W087Uaju3szggBXrWx3j0t44Ipt6TuEDzwOq4umv89bXrjmX6jNEQGW54J5dkNCWRFO3ZkIwwFIjgDXKsBz5tHIJDWrd3U/imwEetERo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWdvYAbJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWdvYAbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743849191; x=1775385191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ewkM9e6eOhXSida2FsbZNNmawkh95TVdEvbxu0fxIMg=;
  b=aWdvYAbJtnjZFfHwLVGtsdtgs9NU5s/GQD2HGebiLTANnNhI6HW8OTwX
   jnrxLwnm3kszqFg7UxT+ZxtDWe6LcPphJ6HPVeX/Kv6QU1F3v12TGFkeN
   dtaYpCqCYNO/vww77wjgV4vr93+ZBLRWMszD/ecSKbcL9oUqPtOkVcWNa
   VDU2F7h60Df/Sq3XeHN2DOO9oZxHO15n4WbSOJ+JcofBeFZvDFcBRhPZd
   cWSPanYfZaVUChAhwFFDMs9CQdvUFtHDuCmaNI8ARTLtWzabd7bhe5Zwi
   4KC84IS7Rmw52uww86ziqaZji51BEBj7rJzMtYdiKk5GulaiZ+PNtnSNa
   w==;
X-CSE-ConnectionGUID: ce81r32MSDOAU3UZRqhsZA==
X-CSE-MsgGUID: dzBAWD1JSiuRJmy8SU4m6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55950203"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="55950203"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 03:33:10 -0700
X-CSE-ConnectionGUID: rXJNqjnfRP6AIDKO+7BITA==
X-CSE-MsgGUID: 3lwM9zBtQYadwRxtYKtCYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="128368735"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Apr 2025 03:33:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u10pn-0001yF-0i;
	Sat, 05 Apr 2025 10:33:07 +0000
Date: Sat, 5 Apr 2025 18:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] docs: Add documentation generation for Kconfig
 symbols
Message-ID: <202504051810.15zA6AL6-lkp@intel.com>
References: <20250404-kconfig-docs-v1-1-4c3155d4ba44@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250404-kconfig-docs-v1-1-4c3155d4ba44@collabora.com>

Hi Nícolas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 405e2241def89c88f008dcb899eb5b6d4be8b43c]

url:    https://github.com/intel-lab-lkp/linux/commits/N-colas-F-R-A-Prado/docs-Add-documentation-generation-for-Kconfig-symbols/20250404-220651
base:   405e2241def89c88f008dcb899eb5b6d4be8b43c
patch link:    https://lore.kernel.org/r/20250404-kconfig-docs-v1-1-4c3155d4ba44%40collabora.com
patch subject: [PATCH RFC 1/2] docs: Add documentation generation for Kconfig symbols
config: arc-randconfig-002-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051810.15zA6AL6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051810.15zA6AL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051810.15zA6AL6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/Config/index.rst: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
