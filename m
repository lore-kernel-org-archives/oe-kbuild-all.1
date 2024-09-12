Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D881BE866
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726160235; cv=none; b=sVSVwifQl8zf7gxM7eWNm6WFEytYVkBMVcj6F0JQ+1G653zj2ML+bjAdEU2si3rWGJEsLt233CAeUMLO7aK/A3Bl+hf9fKzRfLBxzNJ0kCaZcoAI84W5qRphkfq8WN2w7S55pNZV0V1rBUv72QQ0igdxxGES6aPhn6Hd4p/isjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726160235; c=relaxed/simple;
	bh=g1PdMdOkSUfx7X7nIZIT7Va14nrUeRWIVm67Mnm7X2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Faw1O7Eel4Kh0OynF/0Kq2Nv2Iq7CSbe7E0Ddd8W1nziE2rnn2tlgr12RQPHfksuWnb+53Rwia6T0kZBBEE/NBtlqhYjLf2mZ9OBgBGngmLkAcVhFhceiEvE+PrGGdbcrUFesm+eoOVfh+un+0w/3JWdQrXcxbHjIYr32Zid2c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mm8esJof; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mm8esJof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726160233; x=1757696233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1PdMdOkSUfx7X7nIZIT7Va14nrUeRWIVm67Mnm7X2s=;
  b=mm8esJofj/dtmnqx8exFdoo9GByKdytwzY6ALNgdZo0EdiFlL+AtyBO2
   i0pas7mGI/snlQ40cKNdPqGhzAIALBkoCvvQ2g6U4CluUn3Jt258SnAVH
   u3APonc46o1zLJn/m2rye5SM/8F10DO/Rs0K2vD4GEpI4fmHB3gDXYHi/
   5Lt/WMS6cKHMa3BEwhyGbeFkk6Esxj5L78kzT98NIpI31eKK+1rgUm4QC
   n62/9L1riqoYTjWToEJYL2eX7Ldq1C6OTyrwHHCG4hAdOI5eO/AwlLbQp
   TNjPsA814pHID4P9AFH6unKnusi8zX3XKV2gwckLlXa2NLgnxVXKgUwon
   w==;
X-CSE-ConnectionGUID: u1KXEsWJQiKtbKSpRT9s4w==
X-CSE-MsgGUID: zNpFhUc7Q+yRj4QVBcFl0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35622384"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="35622384"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 09:57:12 -0700
X-CSE-ConnectionGUID: gEZcCyf6Sk6YjZZm7L/CzA==
X-CSE-MsgGUID: Q7863vAGQBGgG/aiETCVWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="105238170"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Sep 2024 09:57:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1son80-0005UM-2p;
	Thu, 12 Sep 2024 16:57:08 +0000
Date: Fri, 13 Sep 2024 00:56:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19385/30000]
 drivers/ub/urma/ubcore/ubcore_umem.c:227:21: warning: no previous prototype
 for 'ubcore_umem_get'
Message-ID: <202409130030.E8xxPVNT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8f53b22e47e98837db7830541a369ed0cd5df749
commit: f6206cf05e28a7f455850a4e2de8162890f50073 [19385/30000] ub: add memory map api in ubcore
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240913/202409130030.E8xxPVNT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130030.E8xxPVNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130030.E8xxPVNT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_umem.c:227:21: warning: no previous prototype for 'ubcore_umem_get' [-Wmissing-prototypes]
     227 | struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va, uint64_t len,
         |                     ^~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_umem.c:245:6: warning: no previous prototype for 'ubcore_umem_release' [-Wmissing-prototypes]
     245 | void ubcore_umem_release(struct ubcore_umem *umem)
         |      ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/ubcore_umem_get +227 drivers/ub/urma/ubcore/ubcore_umem.c

   226	
 > 227	struct ubcore_umem *ubcore_umem_get(struct ubcore_device *dev, uint64_t va, uint64_t len,
   228					    union ubcore_umem_flag flag)
   229	{
   230		struct page **page_list;
   231		int ret;
   232	
   233		ret = umem_verify_input(dev, va, len, flag);
   234		if (ret < 0)
   235			return ERR_PTR(ret);
   236	
   237		page_list = (struct page **)__get_free_page(GFP_KERNEL);
   238		if (page_list == 0)
   239			return ERR_PTR(-ENOMEM);
   240	
   241		return ubcore_get_target_umem(dev, va, len, flag, page_list);
   242	}
   243	EXPORT_SYMBOL(ubcore_umem_get);
   244	
 > 245	void ubcore_umem_release(struct ubcore_umem *umem)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
