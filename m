Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846DF182D0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449660; cv=none; b=bGDDuIVggnqRClV4O2/0EG4Nrwo13REU6O8JPKMM3S0KP7npw9DOVwCbeGZfMVBkgxVtlIywBJZhGa8drAc2z2LSjOI3l4BJ/IM8L7sP6e/BZFX2dP/Axqx72oEe5qwK3s6a8XnbfAX3q1+5uwx+cZQOqt0pxO0X9CdwrE7InGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449660; c=relaxed/simple;
	bh=uBX0xMI3nxPshGz3Hd/QGDU6qrtB3E5zGCNox1NlFm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JC3jo6+DHRTDJvUlTz5Pg7XjhHg8p/2H13lZ7dY95Ba7IJdKsR35x0GQ+z3HLetlLEqj+JyrAWOag0KWSOvS4O5GhteT9WcVTqGLwoaF2NFOrmhdgVyHO3JYNWibRkYZcmeNmt1t5ijPBQnbc3P87Hj4m5IKYshVCRxC801gyns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVX69LMA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVX69LMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751449658; x=1782985658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uBX0xMI3nxPshGz3Hd/QGDU6qrtB3E5zGCNox1NlFm0=;
  b=DVX69LMADdHLIyv80K/8FImVismSEEXCET/s8TOJyDJQSTX8VVZSOyiz
   uSiEW4wjwIXA4dZFXrvhZOBRMP8BnoWhjXPZ7OFAiw7CtY663zNsKbz5g
   b6rzMI+QfMfnf3kssG8gBmUmkY+rmryXn6RzJ8HnLnu0p2+Zwh/V0IiRT
   HdvFFmJvkTd+ywpxC7p2TTQAT5ynkr5XpZ7p0+gt63Sa5r/ym5eRMGyv+
   ANYnDCq7K8TuPNe8vJ6RTzuvne9ieF3VDNps8vxVf0a8/iGLBQVWciHOE
   PEOpG8HOFWqdS0+yb5u30eDrfotpxhmABcAKx5R8KsoaAei2umMnHUcs0
   g==;
X-CSE-ConnectionGUID: 47ZDxR9YS9qB+4QYMtEwSQ==
X-CSE-MsgGUID: JTq1l0qFTFCJH4Fk25ztyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="56357899"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="56357899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 02:47:37 -0700
X-CSE-ConnectionGUID: G89utYFnQiaLdPwLNusvNw==
X-CSE-MsgGUID: m0qCb8vxTvWnhsYkNUcY2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185060416"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2025 02:47:36 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWu3x-0000Gv-1V;
	Wed, 02 Jul 2025 09:47:33 +0000
Date: Wed, 2 Jul 2025 11:47:13 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2999/2999]
 drivers/crypto/ccp/hygon/hct.c:1343:15: warning: no previous prototype for
 'hct_pin_memory'
Message-ID: <202507021158.W1ajhxKz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4755f6a2b98f251edcf63f98f416b5d76425f8c
commit: b7a218b5c46200f323ac0fe07589e0bf0d648069 [2999/2999] crypto: hct: provides hygon crypto technology ccp device driver.
config: x86_64-buildonly-randconfig-2004-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021158.W1ajhxKz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021158.W1ajhxKz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021158.W1ajhxKz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/hct.c:1343:15: warning: no previous prototype for 'hct_pin_memory' [-Wmissing-prototypes]
    1343 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~


vim +/hct_pin_memory +1343 drivers/crypto/ccp/hygon/hct.c

  1342	
> 1343	struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
  1344				unsigned long ulen, unsigned long *n)
  1345	{
  1346		unsigned long npages, size;
  1347		int npinned;
  1348		struct page **pages;
  1349		unsigned long first, last;
  1350	
  1351		if (ulen == 0 || uaddr + ulen < uaddr)
  1352			return NULL;
  1353	
  1354		first = (uaddr & PAGE_MASK) >> PAGE_SHIFT;
  1355		last = ((uaddr + ulen - 1) & PAGE_MASK) >> PAGE_SHIFT;
  1356		npages = (last - first + 1);
  1357	
  1358		if (WARN_ON_ONCE(npages > INT_MAX))
  1359			return NULL;
  1360	
  1361		size = npages * sizeof(struct page *);
  1362		if (size > PAGE_SIZE)
  1363			pages = vmalloc(size);
  1364		else
  1365			pages = kmalloc(size, GFP_KERNEL);
  1366	
  1367		if (!pages)
  1368			return NULL;
  1369	
  1370		/* Pin the user virtual address. */
  1371		npinned = pin_user_pages_fast(uaddr, npages, FOLL_WRITE, pages);
  1372		if (npinned != npages)
  1373			goto err;
  1374	
  1375		*n = npages;
  1376		return pages;
  1377	
  1378	err:
  1379		if (npinned > 0)
  1380			unpin_user_pages(pages, npinned);
  1381		kvfree(pages);
  1382		return NULL;
  1383	}
  1384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
