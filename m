Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E6B54763
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594916; cv=none; b=j4mpbRG2DI8Uo8M3y3iqP8aJE2ejaV1aAUgXHc5GnX4fbQBgwYht6UHm8rnXs5l0i/ZRHEJkzZVSGNBm0s9R0oVXckpqLhgnFZ2GVuoL8PrCfDYfMcgIzahHLKYr0O17pwCkCYxPaC7KiW+renn1CKs+EFjIvzF/LCAMMBXblOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594916; c=relaxed/simple;
	bh=l3oAf5ZIl+8lyOa8mGZwGxrx7Rtx0/G0pJmkbjazc+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tduJF+Q+1/v6zC/l17inNoxk1j6mBHAo+Ws67ieGPHNnwqdrNqsZSaOGjuJn/wuOzItOk0s5LaRWaGeCSO0bLjYu+FrPCfCSfxjQqUX0DfAnkQrHcY/Nbizx2M8UqChC0M1SyrrQJ8aD3Rzf1SS65yc3t0847SOLNqwDMkvA8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaYMfx5d; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaYMfx5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765594915; x=1797130915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l3oAf5ZIl+8lyOa8mGZwGxrx7Rtx0/G0pJmkbjazc+U=;
  b=VaYMfx5dzvPj4UGcR+Lox+B2+e1SWSPmiNgeNV9cElkrBt7FgypDY4R1
   tHxptyU3iaoxDnJQE0LsAvB1/JydYx775mMohtA/BYyxEdC2lAkIDv8Jb
   rbpInetUByFFlk7+34LC1qSg81oi5Pan5IjoIHhzfYk//Nlt43w9g20f4
   3o+72mMvRCa6prwvY25YF3aqhkAjtu6p8lMiDUfAqrQRS1KVDNSF9jdwD
   Khquov+fHJ6j/Lo4rGWVpM9q5IcIuT1bxFl2P/Weixu5dKBCA3bXiBNAk
   nP1aDKxBiFIo1qEANiFnG60ZBzkxAn2fq72JCpbISOWvJ/9hgcuct6ha8
   A==;
X-CSE-ConnectionGUID: d1w90SQxSEm0yYuZcZREAw==
X-CSE-MsgGUID: +Dlm5yaERGWnkJWVhgv9og==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71445179"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71445179"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:01:54 -0800
X-CSE-ConnectionGUID: LvvrnGD/RXaYt+szpMKpUQ==
X-CSE-MsgGUID: ZuZe4tUcTmuafV983k3Gyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196524475"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2025 19:01:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFtH-000000006yB-076z;
	Sat, 13 Dec 2025 03:01:51 +0000
Date: Sat, 13 Dec 2025 11:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 0/11]
 drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype for
 'hct_pin_memory'
Message-ID: <202512131008.0bOtAwmX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   691fd54204b78715418b027529c23d3a9eca9456
commit: 43213bf1d133202454c0175eb17f6635626045dc [0/11] anolis: Add mediated ccp driver support for hygon crypto technology.
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131008.0bOtAwmX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131008.0bOtAwmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131008.0bOtAwmX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype for 'hct_pin_memory' [-Wmissing-prototypes]
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~
--
   drivers/crypto/ccp/hygon/hct.c:39: warning: Function parameter or member 'fmt' not described in 'pr_fmt'
>> drivers/crypto/ccp/hygon/hct.c:39: warning: expecting prototype for VERSION_STRING modification instructions(). Prototype was for pr_fmt() instead


vim +/hct_pin_memory +1333 drivers/crypto/ccp/hygon/hct.c

  1332	
> 1333	struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
  1334				unsigned long ulen, unsigned long *n)
  1335	{
  1336		unsigned long npages, size;
  1337		int npinned;
  1338		struct page **pages;
  1339		unsigned long first, last;
  1340	
  1341		if (ulen == 0 || uaddr + ulen < uaddr)
  1342			return NULL;
  1343	
  1344		first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
  1345		last = ((uaddr + ulen - 1) & PAGE_MASK) >> PAGE_SHIFT;
  1346		npages = (last - first + 1);
  1347	
  1348		if (WARN_ON_ONCE(npages > INT_MAX))
  1349			return NULL;
  1350	
  1351		size = npages * sizeof(struct page *);
  1352		if (size > PAGE_SIZE)
  1353			pages = vmalloc(size);
  1354		else
  1355			pages = kmalloc(size, GFP_KERNEL);
  1356	
  1357		if (!pages)
  1358			return NULL;
  1359	
  1360		/* Pin the user virtual address. */
  1361		npinned = pin_user_pages_fast(uaddr, npages, FOLL_WRITE, pages);
  1362		if (npinned != npages)
  1363			goto err;
  1364	
  1365		*n = npages;
  1366		return pages;
  1367	
  1368	err:
  1369		if (npinned > 0)
  1370			unpin_user_pages(pages, npinned);
  1371		kvfree(pages);
  1372		return NULL;
  1373	}
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
