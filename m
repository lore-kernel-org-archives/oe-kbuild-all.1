Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2684C223707
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829979; cv=none; b=LHoB3q8WWesXSlx12R6xLASn8p8iHC3yRgop8OaxdVRB1Tko5Ru3bZqBoYSGRPtzihQoXq0P2Lwq01ll23F3mvEJBy8AmKkQKh9PmapzmPCDxxczanyZJdrt+fVbqnFk4Kt+JxORPxHP9/6TMKapfCG+GQzHjaaYJEzE0zMRJvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829979; c=relaxed/simple;
	bh=1LPItX78rMwPt4MOB50zH6CJeL7P6D0/zAr9F21yAUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ABXnbhWZyqyUNxv0LI/28WYvaIKHlgrrJ6S56dfKn4RP1spgHpm+W3W/DlQuAMasc4/qoNFSYC7tR8AuHGHXueL2Gzn87hqEdkzTB/Oj0s1WP3r8vtfSNjW+ZL30TNBFzOZbbHgx0gg9nfD3LyOcE0++644vGfDcPJXgVAKdjp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOa1sGIF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOa1sGIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744829979; x=1776365979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1LPItX78rMwPt4MOB50zH6CJeL7P6D0/zAr9F21yAUs=;
  b=NOa1sGIF8HWpWeSvBuUKZbgO7B9l0Mg8/54a/uv/4woFHTKIfmyoWbHy
   27ADDIwQr3hK+Vkhc8B1YMBj36ja2PKyWo+9D0ek0ba7uUkakPN/Ha66t
   WImAtBTpTHOuTfZb10IDKZMWs/rmv6r3iLbPs1h6t2vUQ4OAwbrTq5Ilb
   OosCUhN6vZ+N+Ypypf/7ZCJnDjOjKJ5pisIrY5lDJuqqxddpUFdptrYbV
   Zp30WtcE2jm2C/Tx6bWU+RFKtzcKuWq3COWUEN0vuowOuAkXTfZlEHEtA
   H6UHBW/VWoTbTorOsthhbR7YCKYPYYDWOYdFY1CZG8qtm9wTK5A2KhtPW
   Q==;
X-CSE-ConnectionGUID: JweLb14hSxmRRqFwpUsyrg==
X-CSE-MsgGUID: tdpq56LgQQOaqQQYgHx1+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46482168"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46482168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:59:38 -0700
X-CSE-ConnectionGUID: v0gbWSC3QYKUWO7NIxtyfw==
X-CSE-MsgGUID: RScTB9/VTYmk/cs/sFsRvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="153759650"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Apr 2025 11:59:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u57yw-000KDg-1H;
	Wed, 16 Apr 2025 18:59:34 +0000
Date: Thu, 17 Apr 2025 02:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/pgtable_share.c:359:13:
 warning: variable 'error' set but not used
Message-ID: <202504170251.PORg4PUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   2c7dfbdd3c7b70c7b1386b9615f4670e2861d1b0
commit: 8b1eb93240d3b8ee02b4ca41c3c69a9b2c7ad59c [9/9] anolis: mm: pgtable_share: support madvise(MADV_DONTNEED)
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250417/202504170251.PORg4PUr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170251.PORg4PUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170251.PORg4PUr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/pgtable_share.c: In function 'pgtable_share_dontneed_single_vma':
>> mm/pgtable_share.c:359:13: warning: variable 'error' set but not used [-Wunused-but-set-variable]
     359 |         int error;
         |             ^~~~~
--
>> mm/pgtable_share.c:355: warning: Function parameter or member 'start' not described in 'pgtable_share_dontneed_single_vma'
>> mm/pgtable_share.c:355: warning: Function parameter or member 'end' not described in 'pgtable_share_dontneed_single_vma'


vim +/error +359 mm/pgtable_share.c

   347	
   348	/**
   349	 * pgtable_share_dontneed_single_vma - free page cache and flush
   350	 * TLB for all corresponding tasks.
   351	 * @vma: aboriginal vma which pgtable is sharable.
   352	 */
   353	long pgtable_share_dontneed_single_vma(struct vm_area_struct *vma,
   354					       unsigned long start, unsigned long end)
 > 355	{
   356		struct pgtable_share_struct *info;
   357		struct address_space *mapping;
   358		struct file *file;
 > 359		int error;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
