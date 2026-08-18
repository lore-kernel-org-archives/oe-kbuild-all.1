Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523347FAF8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787073138; cv=none; b=hCx03AkTEaUFWXQOpkyRNtreVWJ7+22F+8iB6j7S4/tpKKaErT8yhD8N8vgCE5vFUi5YbhGPSSl5DlDHz3DM5yJ1WaB/NzHgYDsDuLkt1tPplcM0DFov0hD7rPj8nDb88MuPw1HdkT/QdaZH3Qer5Y0lTyk+NI3aLGIqA0KzIHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787073138; c=relaxed/simple;
	bh=HSdvBKu1DUHOurUUHebLCqmhwAnUBKZW6OStb2VKQMI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uSHs3ic+5+7x/HnyLTqBre4IjishLTUH79eaIxI0ABZwtOOgoHniPbRaiutqtFDKWoo3XLCtP/PuvU+KDv6XQBDrjV+3mmfpTpIXp4n3I3UZBSgW6jhAgCkr84lQTdlNTFKNPYjzalZJuF/EkIz5iiO8qy31sahQvF0Khc1ZhNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfLkWJwq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfLkWJwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787073137; x=1818609137;
  h=date:from:to:cc:subject:message-id;
  bh=HSdvBKu1DUHOurUUHebLCqmhwAnUBKZW6OStb2VKQMI=;
  b=RfLkWJwqoHY8lAljcZGpIRERIaSVah3Urdh5PYmptBPscWi7Ax3tEyIM
   1N1eoo8r2GUN9Sz4fdVXQterQxxi+mxhhco62d9GPaH2+xbvHM5gWCh7V
   WIkbPE5MnQk99xnLc2CGD9W1y5KAvIYqT6d2N1qA4Noyw+egefn4ppxy7
   cZy+CPr9nTGLBhJsyt2OgRNhG23zFcSbbVI02j6uX6d4MeNNQGY4kXsRK
   zk2Ggpc2ynLB2IyfoyVAzboNPMPOX2xmVZm1OWyPItIJmaExRKgXMTmWQ
   ghkY/szIyHOiZDAPYdQ+Ye03i4eL2pwztPkLtk8luWRY4dZnEQ2l8pGLr
   A==;
X-CSE-ConnectionGUID: vAclFRsqQKCveKpKTBEL8g==
X-CSE-MsgGUID: M39eUfQGSBa9xbs9t73qmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87448358"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87448358"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 10:12:16 -0700
X-CSE-ConnectionGUID: VV2xlXVgSgy3tMQbXdP6dw==
X-CSE-MsgGUID: nREWEcrbSuO9U8rZqo3HJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261540242"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2026 10:12:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwNMC-00000000eT0-37cM;
	Tue, 18 Aug 2026 17:12:12 +0000
Date: Wed, 19 Aug 2026 01:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-xarray:main 3/3] lib/xarray.c:2473:25: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202608190353.3r47BrOv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/xarray.git main
head:   863810caeb3cf04ee479f3944a678574001af7a9
commit: 863810caeb3cf04ee479f3944a678574001af7a9 [3/3] XArray: Add CONFIG_DEBUG_XARRAY
config: parisc-randconfig-r111-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190353.3r47BrOv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190353.3r47BrOv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190353.3r47BrOv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/xarray.c:2453:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu * @@
   lib/xarray.c:2453:58: sparse:     expected void const *entry
   lib/xarray.c:2453:58: sparse:     got void [noderef] __rcu *
>> lib/xarray.c:2473:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *entry @@     got void [noderef] __rcu *const xa_head @@
   lib/xarray.c:2473:25: sparse:     expected void *entry
   lib/xarray.c:2473:25: sparse:     got void [noderef] __rcu *const xa_head

vim +2473 lib/xarray.c

ad3d6c7263e368a Matthew Wilcox 2017-11-07  2470  
ad3d6c7263e368a Matthew Wilcox 2017-11-07  2471  void xa_dump(const struct xarray *xa)
ad3d6c7263e368a Matthew Wilcox 2017-11-07  2472  {
ad3d6c7263e368a Matthew Wilcox 2017-11-07 @2473  	void *entry = xa->xa_head;

:::::: The code at line 2473 was first introduced by commit
:::::: ad3d6c7263e368abdc151e1cc13dc78aa39cc7a7 xarray: Add XArray load operation

:::::: TO: Matthew Wilcox <willy@infradead.org>
:::::: CC: Matthew Wilcox <willy@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
