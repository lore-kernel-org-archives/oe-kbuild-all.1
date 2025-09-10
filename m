Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2650E19DF4A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 01:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757467750; cv=none; b=C7dbuonyXbNc1rXHTuoehCBpoSNwBwISYxVlfX8ZX5YAi54gOYMGZ3+mTQHGp0k8d78Ail4vquXO09Q0Kk3J1DkFMt0wrD5pOsimSHLSfYNA9T//QZjPfEtoHN6cC09Var03VGcBtN0ceE2uSTzcobM7xUleGrnF8S38Zd1jvvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757467750; c=relaxed/simple;
	bh=ywE05WToLpUHQO2zkUpWziW2sv/68Hr8hMuL+DQ7vP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FhkTfM31PCDkUzt0hyyw/6X1G+wDNfM5s7wzmlvXon6DQnFyJNNLiV53zdXKa9z4prQ5ozhiWMrtwc3g8uBZdakExul0LjdZugw0GgLnXhZqD/uhKz6fb6KacxBmyV50joltfOt1/dWCaGQ/hI9NWb4fsx8JyuSardtsUC52Vf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCRb/rN3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCRb/rN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757467749; x=1789003749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ywE05WToLpUHQO2zkUpWziW2sv/68Hr8hMuL+DQ7vP0=;
  b=GCRb/rN3VNyp4IHwYM73suvwsVZf7ZgM63083bXMRCml5+fg4GfAHFEq
   JexxMHYxKfrrCIGaS88WplBbvvZj2K9tujcLVUBCQujNx4wXIxonDFM1/
   v7YStZZKZ1LVYNliBPknZBTGp7Xg0DqxA0+KAPAlm1Sg8Iok0ABAPDbKt
   7VxFuTYogkVT5fkN8JUleSizP/EW0KXAlWa6pbARlqMuDsv3EW096Az1l
   Yc5M+zmI5SNCI/jDHex9TLeDcgexeuo2M0odN8U0rtC1m6M4ajJ/xRTA0
   xMQm48jI0tGpBstAjhgKqtqBZK6uULGQDqJymQu+wTeMyyYYQqfWfHk43
   A==;
X-CSE-ConnectionGUID: 4KG1eu9ER3uIu3k93yoShg==
X-CSE-MsgGUID: GB2z+aZASmyYIAckLq7YLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59831763"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59831763"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 18:29:08 -0700
X-CSE-ConnectionGUID: 9dzJTkRvSg6YR09gz7/TPw==
X-CSE-MsgGUID: xqLUD1v0S42/t1HsCl+Xrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="173156662"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2025 18:29:06 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw9dv-0005Pr-2E;
	Wed, 10 Sep 2025 01:29:03 +0000
Date: Wed, 10 Sep 2025 09:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Li <chrisl@kernel.org>
Subject: [akpm-mm:mm-new 359/411] mm/swap.h:455:24: error: implicit
 declaration of function 'swp_offset'; did you mean 'bh_offset'?
Message-ID: <202509100956.7q0VPOo2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   f4e8f46973fe0c0f579944a37e96ba9efbe00cca
commit: aabe1e0289084317ef7603c14132758fad3a975e [359/411] mm, swap: use the swap table for the swap cache and switch API
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250910/202509100956.7q0VPOo2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100956.7q0VPOo2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100956.7q0VPOo2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:65:
   mm/swap.h: In function 'folio_index':
>> mm/swap.h:455:24: error: implicit declaration of function 'swp_offset'; did you mean 'bh_offset'? [-Wimplicit-function-declaration]
     455 |                 return swp_offset(folio->swap);
         |                        ^~~~~~~~~~
         |                        bh_offset


vim +455 mm/swap.h

   440	
   441	/**
   442	 * folio_index - File index of a folio.
   443	 * @folio: The folio.
   444	 *
   445	 * For a folio which is either in the page cache or the swap cache,
   446	 * return its index within the address_space it belongs to.  If you know
   447	 * the folio is definitely in the page cache, you can look at the folio's
   448	 * index directly.
   449	 *
   450	 * Return: The index (offset in units of pages) of a folio in its file.
   451	 */
   452	static inline pgoff_t folio_index(struct folio *folio)
   453	{
   454		if (unlikely(folio_test_swapcache(folio)))
 > 455			return swp_offset(folio->swap);
   456		return folio->index;
   457	}
   458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
