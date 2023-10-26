Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3713944F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAiu+o72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698297004; x=1729833004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnuZnEP0bYBAlgCAS/q5QM5ogHbkbzmkftB5R72sHx4=;
  b=NAiu+o72QUe0zDZyjL8KlsrZZKYbKA6N8MTpeN9j8HXA9AD+CZFQjPdW
   twcnbsuKtt+J2fids/ZLTAsGLrQdtOXo93sllS+U7srW1svr8KOwTm3Vu
   rHmQm/vGxBnplnYRxoPeRjm7Em0BJKOIvckC+43yn41zCQmJJmcPA6abR
   kkhZTMnhi3jF5Ulvj7cicQcloRxYt9nhGBpdp1arZUm6tVBVUV7xYFzTM
   /62jp3skxSxDy2kbvKpGfF1LyuuiJMZjSAA9ep+kKLW2l+eiSAZTfONMa
   HWCEsG/PYuc0LxCjSbmEyr+OEfzsR2GNg4FSoC2WjWuo117OZ42oP19tY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="366810423"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="366810423"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 22:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="322085"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2023 22:09:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvsd4-0009UF-0c;
	Thu, 26 Oct 2023 05:09:58 +0000
Date: Thu, 26 Oct 2023 13:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 8/12] mm/huge_memory.c:2843:28: warning:
 unused variable 'order'
Message-ID: <202310261315.7mWYgux4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   82848f6a0bb0f5bd8b59fa78e219fa92d0aca078
commit: 1a6ac9ab15f14f841cf1cc7530a4567b63e92705 [8/12] mm/rmap: use MM assigned RMAP ID to account RMAP values in folio metadata
config: loongarch-randconfig-002-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261315.7mWYgux4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261315.7mWYgux4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261315.7mWYgux4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/huge_memory.c: In function 'folio_undo_large_rmappable':
>> mm/huge_memory.c:2843:28: warning: unused variable 'order' [-Wunused-variable]
    2843 |         const unsigned int order = folio_order(folio);
         |                            ^~~~~


vim +/order +2843 mm/huge_memory.c

  2840	
  2841	void folio_undo_large_rmappable(struct folio *folio)
  2842	{
> 2843		const unsigned int order = folio_order(folio);
  2844		struct deferred_split *ds_queue;
  2845		unsigned long flags;
  2846	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
