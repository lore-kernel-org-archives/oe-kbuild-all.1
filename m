Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B321FC0E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 22:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734561757; cv=none; b=Tj7IK040TCpvDDbZjMezwViqePA70GN0Ja19vC0cjuFbZBc4Z58ILHcCUn/tCBg3wGr73You6dnT7hOlw9jylvfB8fx+OYR3Wc2tHlsL1jXf9NLRn+3SGkLMBIjiGMtBLcjHE/vrEWzazOd90YcLPsFqLm+h5I+V1RXIxOTjNhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734561757; c=relaxed/simple;
	bh=qTGSkeVRzk20PIuTMJlDiCQrq9oo6XybBiGGfXZfbOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A/65rnh4MxFInHIwsntkfkN/HIshBwOO0ICYeczSZPGEurjwT1Uor8ZJH0tWLvJegpJXGz38fbCbGxGXPZZY6d9MSlwzIkIfmz7MAJi54bRSSAY9sIHIrb4Zt0KYVL/MH7RA16hawJA85LVVM0ypOPC4flEZOtdT7Xltli9qFMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0beWNMg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0beWNMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734561756; x=1766097756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTGSkeVRzk20PIuTMJlDiCQrq9oo6XybBiGGfXZfbOk=;
  b=F0beWNMgCrYrHidtQ18gC5l2ZUX3fGkxp5mfk2uuiONIYK8fJsPV4V/e
   /sgjYnIuXKtXL60pqc11y+mEdlypquczrLYj7K900S+zUucsbNkejbpXZ
   jF0mBsYQYYwhf3Vh9v853TtOuHdeLlLpnp8Xc35XrUD3zUgGs6ncOt5q7
   7IY/jrHXC3lGR+1vEz2DXLZJNe+bTXGQrNFBzrTKP36IFkqvrbAqyn0vL
   3YRxBMRgrqdLC9lEhBBhCJLbEmxdxribxwFJHBjIc12TNULDZ/L6xWgrt
   dPCeY6QlXi7Jh85Ppw63Mr5NWQD8O+RW6zecJ7eW6ptb0wmMUPa41UhwD
   Q==;
X-CSE-ConnectionGUID: YFVXvq2oTE2BOZNIwOa2xQ==
X-CSE-MsgGUID: csdXxnBUQOClBpIRr0kXnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52584486"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="52584486"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 14:42:35 -0800
X-CSE-ConnectionGUID: 2DpsybquTFCth6TbT51zbA==
X-CSE-MsgGUID: rEGD1nybRTOgZAPevaNxCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98818043"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Dec 2024 14:42:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO2kR-000GgM-1j;
	Wed, 18 Dec 2024 22:42:31 +0000
Date: Thu, 19 Dec 2024 06:41:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:mm_id 18/21] fs/proc/task_mmu.c:33:13: warning:
 '__folio_page_mapped_exclusively' defined but not used
Message-ID: <202412190649.8PiCAQvF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux mm_id
head:   e7b8c73a68a2ea10e565e103199eba2d607cb99a
commit: 73e0bb6a2659c8c77f22c342659bcf7c570127d0 [18/21] fs/proc/task_mmu: remove per-page mapcount dependency for PM_MMAP_EXCLUSIVE (CONFIG_NO_PAGE_MAPCOUNT)
config: i386-buildonly-randconfig-006-20241219 (https://download.01.org/0day-ci/archive/20241219/202412190649.8PiCAQvF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412190649.8PiCAQvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412190649.8PiCAQvF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:33:13: warning: '__folio_page_mapped_exclusively' defined but not used [-Wunused-function]
      33 | static bool __folio_page_mapped_exclusively(struct folio *folio, struct page *page)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__folio_page_mapped_exclusively +33 fs/proc/task_mmu.c

    31	
    32	#ifdef CONFIG_PAGE_MAPCOUNT
  > 33	static bool __folio_page_mapped_exclusively(struct folio *folio, struct page *page)
    34	{
    35		return folio_precise_page_mapcount(folio, page) == 1;
    36	}
    37	#else /* !CONFIG_PAGE_MAPCOUNT */
    38	static bool __folio_page_mapped_exclusively(struct folio *folio, struct page *page)
    39	{
    40		return !folio_likely_mapped_shared(folio);
    41	}
    42	#endif /* CONFIG_PAGE_MAPCOUNT */
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
