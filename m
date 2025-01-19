Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B49A3FBA7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737279382; cv=none; b=uNwCbHRLrw9Y4ItR/EPJKUdURwyPuVbPGdeG7VlyQbDA/q/iaor/Y83ckIobUWZjS2MkqdPMLa9iF0wgRVwVBE3ms8mv/zdnkVmjMge/HomILYNIOgVHAqTTa8B4kYmbZfSW0bR5TGFEDJ7R5zYj0El89/Ej4cRF/aJwfjZ0PYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737279382; c=relaxed/simple;
	bh=ig6JlO65H455ooRo3Iu6LTZ2S1MfVHPo0bDoh48/PhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lxs1HEHpzSs6S3uRfQ214BGOntal20PA9PpIAKtnmr1n8qgRiDWCtyaM51Gs5ypMcg5u1GM0K0qU5WrFZQFxFTomBA71gmUvFi91fSC1n/o5FJuQLkdt/EJ8sn/x93iFgG8qx9rV116grGa1J+tcBZAJyxPpBmx7zea1xqr7h14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhxVqfO2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhxVqfO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737279381; x=1768815381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ig6JlO65H455ooRo3Iu6LTZ2S1MfVHPo0bDoh48/PhA=;
  b=YhxVqfO25Dbhhoca9SRG09+F5E2P5m/vxS5eA2SOKCDLZm7WaWSG5Ye/
   1KZ6OO+HP9hdRLYXgcTwNCo/BZxXxbTZa2TCzzmohL68HgqCo72hlRGWc
   hgXo5WiWtNcmkCEj1k1lrmbSlyaRaX1544xk9kEbsiDy5zw53GB2XFhrm
   AOLAqW4xlxNvodJI0MOe1/58/ZULteSrm5hVdfcFopVhJWZwkXErtF3bG
   NAbi/nXovIyRH75dzL2DO1dnoA8fRrbyo2ydV5OrhYRVVrAF4ZVLSW/Dy
   QoHv7g6manM4+64Me98cEcGRJj/D+LeFJ/dUGp9AHpUinmWQRnVQ613GB
   g==;
X-CSE-ConnectionGUID: EIb0f3PgTzSuinKHPUSVdw==
X-CSE-MsgGUID: RIgP+pmzTd2tIGuyYdssmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37773289"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37773289"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 01:36:20 -0800
X-CSE-ConnectionGUID: muN226jqQoqBxeUYbW6LKg==
X-CSE-MsgGUID: hCVheR6NSW28A2GJrUD8cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106659018"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2025 01:36:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZRj7-000VKR-0t;
	Sun, 19 Jan 2025 09:36:17 +0000
Date: Sun, 19 Jan 2025 17:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 45/45] mm/damon/paddr.c:316:30: warning: variable
 'last_addr' set but not used
Message-ID: <202501191712.rj88Gj15-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   38bf43ccce488ca872dbc52673c7a2223fb13598
commit: 38bf43ccce488ca872dbc52673c7a2223fb13598 [45/45] mm/damon/paddr: implement a DAMON operations set for cache address space
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250119/202501191712.rj88Gj15-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191712.rj88Gj15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191712.rj88Gj15-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/damon/paddr.c: In function '__damon_ca_check_access':
>> mm/damon/paddr.c:316:30: warning: variable 'last_addr' set but not used [-Wunused-but-set-variable]
     316 |         static unsigned long last_addr;
         |                              ^~~~~~~~~


vim +/last_addr +316 mm/damon/paddr.c

   309	
   310	/* caddr's access check can reuse almost every pa's access check logic, since
   311	 * r->sampling_addr is a physical address */
   312	
   313	static void __damon_ca_check_access(struct damon_region *r,
   314			struct damon_attrs *attrs)
   315	{
 > 316		static unsigned long last_addr;
   317		static unsigned long last_folio_sz = PAGE_SIZE;
   318		static bool last_accessed;
   319	
   320		last_accessed = damon_pa_young(r->sampling_addr, &last_folio_sz);
   321		damon_update_region_access_rate(r, last_accessed, attrs);
   322	
   323		last_addr = r->sampling_addr;
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
