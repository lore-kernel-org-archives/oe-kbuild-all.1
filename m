Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34C05CBD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 04:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712810169; cv=none; b=eqhrmoB5+e6zutqWkJRss9newrHu67+pGKWkN7jXso5YtMCR8FoHv5mhb6eoSY1Zsy6fHwr2TxH7ld5cjAoBVtjFZBpXqsVwUZS/WzTPnflGAa/uxEdQYo74Ygtg4A3RlatOT6myfaRBKrb0H2VtHhuN25h3aAzQuvB46DNw5vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712810169; c=relaxed/simple;
	bh=jIHcsVxSJba2NCxPwZXOeytrqig/FUvjDLaOoVhzKSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FFS2wydqZ/tGtrAYQ6lfuSyxWeuKxA+scrgSPk6B1ORbCZ+3hbytDsvsmQFhyhlom5rmgeXU++r7aMPSpLInWRLy2LppDv3NDc9Ixs96/ysQmq4DxcoGhaUMd6XE1HA6tWy/m7UFC291mzegIIiRuOBQQfgzdaj/1MhHk8Zc/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1GBduoi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1GBduoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712810168; x=1744346168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jIHcsVxSJba2NCxPwZXOeytrqig/FUvjDLaOoVhzKSg=;
  b=g1GBduoiE2vpjLMd7AWFkDM0UMF/QNV7Ygdvov35t9QLC3Dfz1DZ5Z/g
   YtwDopWk7bmS2sl7GwgyMpvbm4skGR0UX+r3HK+VaqiEr6gTq21PnUY+6
   cbgEJqdYJ5q3mEbRdEbwDugHbscCx1wFk0xV95CR9t2Zw0eJJszklDb2q
   zKDQKwbjY90bBfyS3IRoV2p0hjh8nZLw/d8Nl0iQwEd7emC3E4Tkzb6G2
   xlMdpRM2X2+J4rEi+4xXgxRUHOc8kWU2HObow/he7hasVAEVmg2JnJ/3p
   3A1TkjzIpjSM0RgMI4iJDUeXHw0LLfIYHHS9Mf6Xb+IFw/J2Wd9ySFKAO
   A==;
X-CSE-ConnectionGUID: jo/Sb6WvTd6OCKB5EVNLvw==
X-CSE-MsgGUID: MPj7t5dCRsOtaS1d6/yU+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18913194"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="18913194"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 21:36:07 -0700
X-CSE-ConnectionGUID: ZqwYmI8PR8SarfTV6RFhEQ==
X-CSE-MsgGUID: NB37tx5dQfe9mxtguhTavg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20783081"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Apr 2024 21:36:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rumAN-0008Dq-2U;
	Thu, 11 Apr 2024 04:36:03 +0000
Date: Thu, 11 Apr 2024 12:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/6] mm/page_counter.c:232:59: error: use
 of undeclared identifier 'MCT_MEMORY'
Message-ID: <202404111239.EIYlDPpj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   00829e628b41b68dd6bf2c08e6c4111f2b8ae7ed
commit: 8787ea8cd6b9123d75582491425c4aa1584c6b1e [4/6] mm: memcg: merge multiple page_counters into a single structure
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111239.EIYlDPpj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111239.EIYlDPpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111239.EIYlDPpj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_counter.c:232:59: error: use of undeclared identifier 'MCT_MEMORY'
     232 |                 propagate_protected_usage(c, atomic_long_read(&c->usage[MCT_MEMORY]));
         |                                                                         ^
   mm/page_counter.c:249:59: error: use of undeclared identifier 'MCT_MEMORY'
     249 |                 propagate_protected_usage(c, atomic_long_read(&c->usage[MCT_MEMORY]));
         |                                                                         ^
   2 errors generated.


vim +/MCT_MEMORY +232 mm/page_counter.c

   217	
   218	/**
   219	 * page_counter_set_min - set the amount of protected memory
   220	 * @counter: counter
   221	 * @nr_pages: value to set
   222	 *
   223	 * The caller must serialize invocations on the same counter.
   224	 */
   225	void page_counter_set_min(struct page_counter *counter, unsigned long nr_pages)
   226	{
   227		struct page_counter *c;
   228	
   229		WRITE_ONCE(counter->min, nr_pages);
   230	
   231		for (c = counter; c; c = c->parent)
 > 232			propagate_protected_usage(c, atomic_long_read(&c->usage[MCT_MEMORY]));
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
