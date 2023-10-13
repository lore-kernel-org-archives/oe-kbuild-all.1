Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C21E224DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 22:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTUeRkEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697237605; x=1728773605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UbD0g+Eb7D19KRcticMZDvwNza91RxP6Hbq0QAf1tpU=;
  b=RTUeRkEJsOMv9dMrSPJWIKeTp8M4dOtV+lkhVtmOdIjT+Zodzy1oObOp
   p/eCzKGcO3WY23o+0251/vhmk+R1bptq2CvwUv7/AKdrdNHVXXJfVSQDi
   cHSWL4ZCtn/al/mbtOTz224pBo0ZIYYH8BLHXnGZgJcsA8BmzhDZMLLvX
   GT/Q32rQ1d8YkeDze8uCy9L2bS3EmJw6xnPOwT9WCZ+Veg1bTm4yt1t3N
   FNc1lPIGPEMJYqL/ZpCXLTD/+dR1uRDVnsKF3NUswz209SAao4807g9I2
   HgU/HiHQsfSpZUl7VkucHM4DVNgFmliK5gSXnM+mquTkGHnWHvQXPMg/f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388134466"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388134466"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 15:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871267013"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="871267013"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 15:52:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrR1b-0005UP-1Q;
	Fri, 13 Oct 2023 22:52:55 +0000
Date: Sat, 14 Oct 2023 06:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1007/1018] io_uring/zc_rx.c:49:51: warning: right
 shift count >= width of type
Message-ID: <202310140640.EWA4sUCl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: 568ae4bf1dd0e1796a663c6d120199e2f2f52ebb [1007/1018] io_uring: allocate a uarg for freeing zero copy skbs
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231014/202310140640.EWA4sUCl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140640.EWA4sUCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140640.EWA4sUCl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/zc_rx.c: In function 'is_zc_rx_page':
>> io_uring/zc_rx.c:49:51: warning: right shift count >= width of type [-Wshift-count-overflow]
     return PagePrivate(page) && ((page_private(page) >> 48) == 0xface);
                                                      ^~
   io_uring/zc_rx.c: At top level:
   io_uring/zc_rx.c:173:5: warning: no previous declaration for 'io_zc_rx_create_pool' [-Wmissing-declarations]
    int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
        ^~~~~~~~~~~~~~~~~~~~


vim +49 io_uring/zc_rx.c

    46	
    47	static bool is_zc_rx_page(struct page *page)
    48	{
  > 49		return PagePrivate(page) && ((page_private(page) >> 48) == 0xface);
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
