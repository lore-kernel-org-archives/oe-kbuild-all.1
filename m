Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AC4165FDA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 17:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715103708; cv=none; b=iSP1oVQdqGzhb5tYW8AJSDOkUX0A9Ra6GLoF8jVdnBxBrp7IUEPCYMDzLNGWjxHhvse3psGmroYgyze6IDfBG9O+MEooX2/gL6/r5MjRcipzHjTfIlPqPMMvpGTcFl6MFkrQJZMU40g9o/+Jvv7tBnIoIMc/ctpapumA9lPuhOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715103708; c=relaxed/simple;
	bh=cMNBSB5Jtt2ZSbHShqLys8iulVd1c5UPdACyL8w7kI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P5dpkco2F2TG1V/FdxSJvDB27wfEtyqkII8yRwYLC6LSR8Q3IqsyAHxf669OF3PzkUU3J7ZSlTt2ZQVizGV0a2234lPB9SflPePxoNqiZCRboh5rOPiNsqjwSt3/l6lu8Obl/qR9YYKHlGF5Zd9R8MHcCczf9rHpCKYjWTMQFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9lFn1e/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9lFn1e/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715103707; x=1746639707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cMNBSB5Jtt2ZSbHShqLys8iulVd1c5UPdACyL8w7kI8=;
  b=N9lFn1e/k8EiHEhrW+uVldree+etqS7ZTtGAub4L2iKLiZwEMmMP0ulP
   nbTMBaabcs3CP7WV5pDbSP2RsucxP1PfaqDhGGn5mIZbn2VXojIuIkb72
   AjpfURl1shYsHv8ofhbMzn/VlX3fJe4rWnq8khNR/ijEOO1ymZ/iZuU6t
   /x6rjuFwuO16Y4taFnfZB84fGKptK3GNANd4n0hdeM/s2yuDh4DZjwWot
   qaOUqVVXc2dVujaSpmS/d57Ts3L2KtZNG6CZNUfnIOqZVwBky4HlekQ43
   ZrbYxuhWgVyoLCHlr9/m33+kIqyPEquZ9mPVlwQ8+aIXgfy+PVcCEq3KB
   A==;
X-CSE-ConnectionGUID: oXsAS7KST4aAecHK7aBgUw==
X-CSE-MsgGUID: 1GrfABQrSKi0aC7HZNwSTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10762302"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="10762302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 10:41:47 -0700
X-CSE-ConnectionGUID: N30CqdReTSKdj4/kwSa92Q==
X-CSE-MsgGUID: qZbGUSf0TZiE6/tFEwRVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="33288812"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2024 10:41:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Oov-0002WC-0m;
	Tue, 07 May 2024 17:41:41 +0000
Date: Wed, 8 May 2024 01:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6513/6518] drivers/crypto/ccp/hygon/hct.c:1332:15:
 warning: no previous prototype for 'hct_pin_memory'
Message-ID: <202405080101.Xn0Qmuz2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   b294718c76ed688d3272e48c431221a8194cd2d3
commit: 346dc8c7ca8d21796c3ae7fbc1cd7bfcae4eddaf [6513/6518] Add mediated ccp driver support for hygon crypto technology.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240508/202405080101.Xn0Qmuz2-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080101.Xn0Qmuz2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080101.Xn0Qmuz2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/hct.c:1332:15: warning: no previous prototype for 'hct_pin_memory' [-Wmissing-prototypes]
    1332 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~
--
>> drivers/crypto/ccp/hygon/hct.c:38: warning: Function parameter or member 'fmt' not described in 'pr_fmt'
>> drivers/crypto/ccp/hygon/hct.c:38: warning: expecting prototype for VERSION_STRING modification instructions(). Prototype was for pr_fmt() instead


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
