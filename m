Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724B95B1FB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 20:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714940205; cv=none; b=fSnjkxytKxlPbKN+c4nk4oN7vcksKizXpaowwEq4m764u7BZco0ewTckroGMjim4JzzMV+ryqgtRUcO1oP29Do/YVdUU2vcd8c7uTVO8u17OR3HhW1Qb7XjBtvbeEMnewYlS4X2o27YqInQml269KUE5qU8iaJ4JB00IiOwOxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714940205; c=relaxed/simple;
	bh=yQUBUHqAGLWUz2HHrHw0p85m9YGd5bOYeGIoB4MpquY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPlHXSP/1LX9P1lMpm8/ZRu//0+iy+wXRX5q1oALaCXIVySrlffHKhTm56znlSMW2Scl4+TsZJbnGYyUzIyPp8kpdpNtWxPIa0FcFHru1lS7tcGFGYbidIx5G0Jle0fhyqU1xuJX9+UbDjWnBHgGjhtDzcfFqFPHlKRsTLYExj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aga0/enD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aga0/enD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714940204; x=1746476204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQUBUHqAGLWUz2HHrHw0p85m9YGd5bOYeGIoB4MpquY=;
  b=Aga0/enDtMFZfTaw1Bqx9ANWaAG0iAp/vpBiP13OxEGGE3OrF6e46Ox+
   tFKI5uq53O86LxQXDUimhuMWyHWfeamElTnJDIG7MrhHaWhtx1+WWtGl5
   fqa1Eghg0wPPD3YkSs4Cf6TugpoMftXA9JFvKM9xRnsSBjRyevT3WmFeL
   YTX4Qil9Ei0993vlbBOOnlPcgyADYNyncej2ql6NFGQHvr1JoAEBvpaog
   fgdHCImX7OF0bkfTW2wKAkSN3p/QJa5vpDPXV+c0XH/A98JkDVaSF9Xac
   djOumhKo/g48V02os7knPYBrtlD2pHeUFMr1x8TzaHiVKhk0xwuZdC/Bw
   A==;
X-CSE-ConnectionGUID: kr+h9kwDSLSPn6n8rPctWA==
X-CSE-MsgGUID: EEokogkGRMaxTz/ODurLcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21231644"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="21231644"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 13:16:43 -0700
X-CSE-ConnectionGUID: bwYkImRhTF6gGeAtX/LkBg==
X-CSE-MsgGUID: d8XIO+W8S9O3M1hR0mb64w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="27973442"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 May 2024 13:16:42 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3iHn-0000Ar-2t;
	Sun, 05 May 2024 20:16:39 +0000
Date: Mon, 6 May 2024 04:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3_test 9/9]
 mm/page_frag_cache.c:24:28: warning: variable 'order' set but not used
Message-ID: <202405060457.V2zXQhJd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3_test
head:   128485e995fc7e92dfb438c15e97da66fc1d5240
commit: 128485e995fc7e92dfb438c15e97da66fc1d5240 [9/9] mm: page_frag: reuse existing space for 'size' and 'pfmemalloc'
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240506/202405060457.V2zXQhJd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060457.V2zXQhJd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060457.V2zXQhJd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_frag_cache.c: In function '__page_frag_cache_refill':
>> mm/page_frag_cache.c:24:28: warning: variable 'order' set but not used [-Wunused-but-set-variable]
      24 |         unsigned int size, order;
         |                            ^~~~~


vim +/order +24 mm/page_frag_cache.c

    20	
    21	static struct page *__page_frag_cache_refill(struct page_frag_cache *nc,
    22						     gfp_t gfp_mask)
    23	{
  > 24		unsigned int size, order;
    25		gfp_t gfp = gfp_mask;
    26		struct page *page;
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
