Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E8F4411
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 03:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707708930; cv=none; b=REFoSBubSTJ2SWzjinlGGDbvs+aKLRhmlTCL9PcXlIjGy6IWf81ri3wLJAVnECvGnYV0iwk9uxG/4/tuxWvOQ9XLNaRTD11AcTHGfXJ6yqccOHKX3vYaDIu5IkX+PD0Y2hdb/bvZNEW+tD0otBGolIEm7deSHt4LsPd9Ga6BW4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707708930; c=relaxed/simple;
	bh=4YAW7QPFFw5JCKiiOuq5n5eADZhT7Dtc4Tsvabg23FI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/fOzKL3SJC9n+7WIAAo2o0gHEl7JLWJ/fHz2M/od2NOjpestDYXUjz31YFu54O2p51sjsEovIh7LwB9wziN+BJdlylgi8dhxkiVkalO1qwA1DhBfDo2E4MG9B5VXfnzd9SyFt14U/bzYufOuIiXJV0w5rPZpMoWGoQGSYuC+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWJ5L/Ed; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWJ5L/Ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707708928; x=1739244928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4YAW7QPFFw5JCKiiOuq5n5eADZhT7Dtc4Tsvabg23FI=;
  b=SWJ5L/EdOPoD4UpvwzXsAjWnkR7xwazXD8X7NXsIfrOEUyJU5WMJ91vQ
   mMSRhnA6X6b5vP6FmJDbSdrApHsuLnOmER3YYvMKLHhLEA1yfF4TR91bZ
   CZj35shj8xufw3LueoexQhgehFPECLuiJDkohYvJHEbpoTeSOld5AqJSE
   W73llIcfbHXcF93tz/Fpjr/9BFoawB1ELYGZJx2NedCZ1mg5RnnuWGl0N
   2ElAHoIhWbs3SPjLgMjuHReq9XIL4iiUFUSZFKS7CJ6mFLA1q67kcTUsd
   E5CTMGX03rEVWoUcXGPY1wxMe/fnDU/AKGTCLsbzehFU20cchz6nNsOif
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5478402"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="5478402"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 19:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="7116329"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2024 19:35:26 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZN6K-0006t4-1F;
	Mon, 12 Feb 2024 03:35:24 +0000
Date: Mon, 12 Feb 2024 11:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap-split 1/2] drivers/misc/cxl/guest.c:230:21: error:
 implicit declaration of function 'bitmap_find_next_zero_area'
Message-ID: <202402121145.quouvE1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bitmap-split
head:   66ecb308874cc02d98589cc983af0ac5a5f9f7e4
commit: 23228578687634d7bb126bd87e3750780f409e66 [1/2] aaa
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240212/202402121145.quouvE1e-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402121145.quouvE1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402121145.quouvE1e-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/cxl/guest.c: In function 'irq_alloc_range':
>> drivers/misc/cxl/guest.c:230:21: error: implicit declaration of function 'bitmap_find_next_zero_area' [-Werror=implicit-function-declaration]
     230 |                 n = bitmap_find_next_zero_area(cur->bitmap, cur->range,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bitmap_find_next_zero_area +230 drivers/misc/cxl/guest.c

14baf4d9c739e6 Christophe Lombard 2016-03-04  221  
14baf4d9c739e6 Christophe Lombard 2016-03-04  222  
14baf4d9c739e6 Christophe Lombard 2016-03-04  223  static int irq_alloc_range(struct cxl *adapter, int len, int *irq)
14baf4d9c739e6 Christophe Lombard 2016-03-04  224  {
14baf4d9c739e6 Christophe Lombard 2016-03-04  225  	int i, n;
14baf4d9c739e6 Christophe Lombard 2016-03-04  226  	struct irq_avail *cur;
14baf4d9c739e6 Christophe Lombard 2016-03-04  227  
14baf4d9c739e6 Christophe Lombard 2016-03-04  228  	for (i = 0; i < adapter->guest->irq_nranges; i++) {
14baf4d9c739e6 Christophe Lombard 2016-03-04  229  		cur = &adapter->guest->irq_avail[i];
14baf4d9c739e6 Christophe Lombard 2016-03-04 @230  		n = bitmap_find_next_zero_area(cur->bitmap, cur->range,
14baf4d9c739e6 Christophe Lombard 2016-03-04  231  					0, len, 0);
14baf4d9c739e6 Christophe Lombard 2016-03-04  232  		if (n < cur->range) {
14baf4d9c739e6 Christophe Lombard 2016-03-04  233  			bitmap_set(cur->bitmap, n, len);
14baf4d9c739e6 Christophe Lombard 2016-03-04  234  			*irq = cur->offset + n;
14baf4d9c739e6 Christophe Lombard 2016-03-04  235  			pr_devel("guest: allocate IRQs %#x->%#x\n",
14baf4d9c739e6 Christophe Lombard 2016-03-04  236  				*irq, *irq + len - 1);
14baf4d9c739e6 Christophe Lombard 2016-03-04  237  
14baf4d9c739e6 Christophe Lombard 2016-03-04  238  			return 0;
14baf4d9c739e6 Christophe Lombard 2016-03-04  239  		}
14baf4d9c739e6 Christophe Lombard 2016-03-04  240  	}
14baf4d9c739e6 Christophe Lombard 2016-03-04  241  	return -ENOSPC;
14baf4d9c739e6 Christophe Lombard 2016-03-04  242  }
14baf4d9c739e6 Christophe Lombard 2016-03-04  243  

:::::: The code at line 230 was first introduced by commit
:::::: 14baf4d9c739e6e69150512d2eb23c71fffcc192 cxl: Add guest-specific code

:::::: TO: Christophe Lombard <clombard@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
