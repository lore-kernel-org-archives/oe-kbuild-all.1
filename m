Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79705F510
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 03:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736392600; cv=none; b=Cb+BOp19lyiDMbOIqBHZIzSTH7xFFL1KlhW3OzyeunI/alAQ04XOyJxxGvmh24Mse0EdYaiKUO7H0ty1b/OC14h+ofEm4OPIVuPPSJYA+TuFZBNs9edgdZtT0s8YjFl7trfoxArObYTZt/ahbNQjzs9kHK7/FiNHJ57T4HSZUz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736392600; c=relaxed/simple;
	bh=BYPqAkx8mVOCeMCQhSN3vZ1chAZH97r3/l/q21q/eR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jGxl5wv1zmVtNEWjymT/Y8x1lPfvzy0EkBj6YJ0SqA12GhydYAymf4iBF0loa9Yo+/Puu+bt4Op+HSJ8nbXEx1N004ldIkk/3w1ElO1ky97WJUqt6NMURpMf8n9m5xq/87u+bwCTBWdKat+aWHacEv8Uq/Gcc6Bukl51wEoqqQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvCD1ATJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvCD1ATJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736392598; x=1767928598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BYPqAkx8mVOCeMCQhSN3vZ1chAZH97r3/l/q21q/eR0=;
  b=TvCD1ATJKCUlFZNQ7fLHOMWqAvlSzQWKQmpZH78ptRENjW3dr8iO730t
   HUpw4I52XbMcC5n/tgGGCjgnlm18nltROsg+gvO+V4N73teuydfFoW6k5
   lxr5GmT329lT7Ipz59fN4osMJ36f5gEJUHB8nRx01mxAcv0Vx3roKs0mz
   GuCaEHXs0t/YEDZWaXwHoTyatMhexKQHSTx4ILG262Ci+M8BifFRfxRqH
   s4dYnchhPR3jiaZILI/bO3iVtwyEBQ15FJXDBz7Bw3qGOV6+6YbRMfFq6
   NLwTi5G37/xyrr9CZtMHG153N/ZmTogA4VEnapkVvSFVkU6O6Zb2IpZbP
   Q==;
X-CSE-ConnectionGUID: vcbyKLENSTSgc3W4xLRoqQ==
X-CSE-MsgGUID: wftY6I5NQy6hqSjvY+wirA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="39457464"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="39457464"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 19:16:37 -0800
X-CSE-ConnectionGUID: XCN80CZ2RxSu7q3i28QpUg==
X-CSE-MsgGUID: /T3tiRIETJW40LjgInZ67g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="103783199"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2025 19:16:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVj2A-000Gyf-2P;
	Thu, 09 Jan 2025 03:16:34 +0000
Date: Thu, 9 Jan 2025 11:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2668/2668] fs/erofs/fscache.c:22:33: sparse:
 sparse: symbol 'erofs_fscache_super_index_def' was not declared. Should it
 be static?
Message-ID: <202501091137.E9nwi2KG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ed8467e701e8f5ed9f2b39cf55710a156fc2593f
commit: 6de602b09314b731285d7807eb912ac04dbacfb8 [2668/2668] erofs: register fscache volume
config: x86_64-randconfig-121-20250108 (https://download.01.org/0day-ci/archive/20250109/202501091137.E9nwi2KG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091137.E9nwi2KG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091137.E9nwi2KG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/erofs/fscache.c:7:22: sparse: sparse: symbol 'erofs_fscache_netfs' was not declared. Should it be static?
>> fs/erofs/fscache.c:22:33: sparse: sparse: symbol 'erofs_fscache_super_index_def' was not declared. Should it be static?

vim +/erofs_fscache_super_index_def +22 fs/erofs/fscache.c

     6	
   > 7	struct fscache_netfs erofs_fscache_netfs = {
     8		.name = "erofs",
     9		.version = 0,
    10	};
    11	
    12	int erofs_fscache_register(void)
    13	{
    14		return fscache_register_netfs(&erofs_fscache_netfs);
    15	}
    16	
    17	void erofs_fscache_unregister(void)
    18	{
    19		fscache_unregister_netfs(&erofs_fscache_netfs);
    20	}
    21	
  > 22	const struct fscache_cookie_def erofs_fscache_super_index_def = {
    23		.name = "EROFS.super",
    24		.type = FSCACHE_COOKIE_TYPE_INDEX,
    25		.check_aux = NULL,
    26	};
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
