Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAA10A39
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 05:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNM/+mK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702703892; x=1734239892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SX46Dw+00tAbBA2ZKR+yQ4o9konrQKBfizXmRSbHYKk=;
  b=dNM/+mK+O2ChM9BCaqUjJkrRZXPl/rLTiMzVAXPhMncUrTrhUU91yXB0
   +Pnj16XAkZ0U6es39l/+zGrykORa1fj+FOzQrmIBsPifWZX1BHS3KfQLV
   XHx39/2/hy0w5PRh7W6uzkaN/gsBpFRn7yg0pkFictTjtGoREBuLYXO3i
   iAu9z/zMjgK0fckyqzwKPtapYJZU6rKkPahUyciVntBAU/W/1S47SE44W
   pPkXo5D1PLljG00MUZ7S9XC0Et5p+dw4PK2jOYEjgGmawlxF7anR9/l4e
   ARqY5N6OzuquPR7jSYHzKehNDW4vXtFwPDUSuaw/mKXesl2ZJMA1OTB6/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2445995"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2445995"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 21:18:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="948190436"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="948190436"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2023 21:18:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEN3t-0001Bs-2R;
	Sat, 16 Dec 2023 05:18:05 +0000
Date: Sat, 16 Dec 2023 13:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [linux-next:master 7499/8213]
 drivers/net/ethernet/intel/ice/ice_base.c:525:16: error: variable 'desc' has
 initializer but incomplete type
Message-ID: <202312161324.nZN1zCQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: d68d707dcbbf6a9cfe378fc2eb3ffffd5b47727e [7499/8213] ice: Support XDP hints in AF_XDP ZC mode
config: arc-randconfig-002-20231215 (https://download.01.org/0day-ci/archive/20231216/202312161324.nZN1zCQT-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161324.nZN1zCQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161324.nZN1zCQT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_base.c: In function 'ice_xsk_pool_fill_cb':
>> drivers/net/ethernet/intel/ice/ice_base.c:525:16: error: variable 'desc' has initializer but incomplete type
     525 |         struct xsk_cb_desc desc = {};
         |                ^~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_base.c:525:28: error: storage size of 'desc' isn't known
     525 |         struct xsk_cb_desc desc = {};
         |                            ^~~~
>> drivers/net/ethernet/intel/ice/ice_base.c:525:28: warning: unused variable 'desc' [-Wunused-variable]


vim +/desc +525 drivers/net/ethernet/intel/ice/ice_base.c

   521	
   522	static void ice_xsk_pool_fill_cb(struct ice_rx_ring *ring)
   523	{
   524		void *ctx_ptr = &ring->pkt_ctx;
 > 525		struct xsk_cb_desc desc = {};
   526	
   527		XSK_CHECK_PRIV_TYPE(struct ice_xdp_buff);
   528		desc.src = &ctx_ptr;
   529		desc.off = offsetof(struct ice_xdp_buff, pkt_ctx) -
   530			   sizeof(struct xdp_buff);
   531		desc.bytes = sizeof(ctx_ptr);
   532		xsk_pool_fill_cb(ring->xsk_pool, &desc);
   533	}
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
