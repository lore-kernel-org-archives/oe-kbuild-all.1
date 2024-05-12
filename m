Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCBCBE4D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 03:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715486264; cv=none; b=HEtgrIVA0VN/CdVsd8I+VDbgoNj1HmJzTK0MjVu4Pp3pQi7NVahpeTGGt+r3/5amkTJ7tU2B1W+00/IHE80Szd9GQIij3kDxI+4FPRExC+JiWqy1bXS8lGjNKy6Gfbrls/exV4kEgnRAgvYiciiKmvGgLzw5LV9/lO8LS6j96WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715486264; c=relaxed/simple;
	bh=doX59x3Kkjs5+UrTqijYpgFfC4kiq6S7oiwncK/pWXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFq9b5xbo3iNsUHXr1icOSeHrHDlAxMveYRVJh11OEXTGyqMnyQtX9RtQQOzee2z/riAl/PYosEYtZouLnY35Pe+Mc5Nl+CwbtXQrX1VY8bLuvdmkqP6svbSdhiicKli/Icgi6NcJuwfzkkhC+nwpbWf8uYxGKncPUR/8q2IzA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqscwuAO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqscwuAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715486262; x=1747022262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=doX59x3Kkjs5+UrTqijYpgFfC4kiq6S7oiwncK/pWXg=;
  b=VqscwuAOAGjkObxnjz9UOOjNQFuLWjPKTV4EIvkTSXg2ZYa0gxbobAWA
   uLYV5/o0Jhtj0SViG/tiekdd8CLnRbmlvkXdKp1W2mM6ns/mtEulTwYJI
   B2lkjZFTust0srBmdaA93CvjgtqGFy8E+gvoMbkh/KsV45IArd+MzabgZ
   ThYnN3uKz1fUWaZk2mQH0a1FwbW0IkfPGLvnKabTo2nA+IoQu5Hu+Nrut
   0XqEVwqpyFIIxczcqcFVX4mOyMBlnXt428quqiWuyMxTOYHooOP3Ab6at
   kziWiM/1NbTDLw7hNIMuQWhLPx3yQpAuBs2AxfCDiL2s7QzFumusNhBJh
   g==;
X-CSE-ConnectionGUID: iDB4izG8T4mWuM290ZG7ng==
X-CSE-MsgGUID: EeSe16ZFRNGKHCI5sbOYZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="28936918"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="28936918"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 20:57:41 -0700
X-CSE-ConnectionGUID: Y4Sc54ECQBWLxpCl+fhl0w==
X-CSE-MsgGUID: 1IvwpRKdRle5Y4mLEwn2pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="30024637"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2024 20:57:38 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s60LA-00089P-13;
	Sun, 12 May 2024 03:57:36 +0000
Date: Sun, 12 May 2024 11:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6573/6591] drivers/crypto/ccp/hygon/hct.c:1332:15:
 warning: no previous prototype for function 'hct_pin_memory'
Message-ID: <202405121139.hYfRuVGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   af8a5753e476c40851cc338e3ac6aa2d962d05a1
commit: 346dc8c7ca8d21796c3ae7fbc1cd7bfcae4eddaf [6573/6591] Add mediated ccp driver support for hygon crypto technology.
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240512/202405121139.hYfRuVGE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121139.hYfRuVGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121139.hYfRuVGE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/hct.c:1332:15: warning: no previous prototype for function 'hct_pin_memory' [-Wmissing-prototypes]
    1332 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hygon/hct.c:1332:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1332 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         | ^
         | static 
   1 warning generated.


vim +/hct_pin_memory +1332 drivers/crypto/ccp/hygon/hct.c

  1331	
> 1332	struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
  1333				unsigned long ulen, unsigned long *n)
  1334	{
  1335		unsigned long npages, size;
  1336		int npinned;
  1337		struct page **pages;
  1338		unsigned long first, last;
  1339	
  1340		if (ulen == 0 || uaddr + ulen < uaddr)
  1341			return NULL;
  1342	
  1343		first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
  1344		last = ((uaddr + ulen - 1) & PAGE_MASK) >> PAGE_SHIFT;
  1345		npages = (last - first + 1);
  1346	
  1347		if (WARN_ON_ONCE(npages > INT_MAX))
  1348			return NULL;
  1349	
  1350		size = npages * sizeof(struct page *);
  1351		if (size > PAGE_SIZE)
  1352			pages = vmalloc(size);
  1353		else
  1354			pages = kmalloc(size, GFP_KERNEL);
  1355	
  1356		if (!pages)
  1357			return NULL;
  1358	
  1359		/* Pin the user virtual address. */
  1360		npinned = pin_user_pages_fast(uaddr, npages, FOLL_WRITE, pages);
  1361		if (npinned != npages)
  1362			goto err;
  1363	
  1364		*n = npages;
  1365		return pages;
  1366	
  1367	err:
  1368		if (npinned > 0)
  1369			unpin_user_pages(pages, npinned);
  1370		kvfree(pages);
  1371		return NULL;
  1372	}
  1373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
