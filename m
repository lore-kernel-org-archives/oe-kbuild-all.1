Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54E522F19
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 02:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738376459; cv=none; b=Yr0sNGGsPKdyTONCAvWmsZQgAZ3qy7QCuf1QCwCEm7eWhh0JudXBs/mdelXttUO2tZoOU+tNynI0ksSx0xxZY7cqlNfmVWlt5fdH6USkNSKR+QrcT3T4DJKzvV4uNkZAo0Uiy8m6dL5QIerjjrFsMAq2Gf3BTyfEGMqF0XaqehQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738376459; c=relaxed/simple;
	bh=CTKVgvGkg9VyTZeXwEnh8HsnFKwW3NCBu/sWBs3eb/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mRDBk/3Wcae+d2O6QUN75ipMHYZaIGPJdc3cc0S5ETpla5w8EA2VT56pEWOGP0kbAR9/bO9YvAUeBF3bu7aRd+k05gAxObSGoPmRfDlleK8tfk5Ok0cRW4yf7+xOFBRSIzmXnuTETOrERP3psWzo12VHsVeZjTdX6XmZ/V+/Ojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRiHSGzt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRiHSGzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738376458; x=1769912458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTKVgvGkg9VyTZeXwEnh8HsnFKwW3NCBu/sWBs3eb/w=;
  b=iRiHSGztj2eTF1S9IQ3CHDGfOKicLDK3n39NouYe0RF5QEUfZnSgIXG1
   gq1DaQq2QGBEr3e4JbrZdaD3nYhAcf1Y/pn9XqsdrknlD4FHIzxL96ZGs
   7QwRC9wo/1vp1JS9iGDERfjWefpLu2zYb5SMPeKP2RJhXjg+QtqajSvHy
   /dIbzaDGDEcvBnCT58II3IO6b88/ySTxI4Ye/CywzNCtontj3fD4PO+sS
   XPpt7dAjwh+WaNqbHWcsa+PWslKtNsBkK5uVCrHMN/rTIguWuGFtStfhW
   loVwSFXBE3nllYLtN40fPcUKWv4RzsCPWglhydicX1g8CKpqxnToJjtyZ
   w==;
X-CSE-ConnectionGUID: r50cL1g1STCcOFOTQmQ3Pw==
X-CSE-MsgGUID: OPxAXkImQqekakfbiQYIVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="42605225"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="42605225"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 18:20:57 -0800
X-CSE-ConnectionGUID: 49fWJJIsS8ahlL7yczOfzQ==
X-CSE-MsgGUID: UMRD+HdPThioT32xeDfJRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="109921708"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jan 2025 18:20:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te37u-000ncl-10;
	Sat, 01 Feb 2025 02:20:54 +0000
Date: Sat, 1 Feb 2025 10:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-mk-pte 5/9] include/linux/mm.h:1920:21:
 warning: infinite recursion detected
Message-ID: <202502011011.X8b6KKrk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-mk-pte
head:   44333e58349adcdfcb5b34f6086bf7c01dfd9c9a
commit: f440c1507240c6d4edbb5c3e336375dd186f9a91 [5/9] mm: Introduce a common definition of mk_pte()
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20250201/202502011011.X8b6KKrk-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011011.X8b6KKrk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502011011.X8b6KKrk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/highmem.c:20:
   include/linux/mm.h: In function 'mk_pte':
>> include/linux/mm.h:1920:21: warning: infinite recursion detected [-Winfinite-recursion]
    1920 | static inline pte_t mk_pte(struct page *page, pgprot_t pgprot)
         |                     ^~~~~~
   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30:
   arch/sparc/include/asm/pgtable_32.h:258:41: note: recursive call
     258 | #define pfn_pte(pfn, prot)              mk_pte(pfn_to_page(pfn), prot)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1922:16: note: in expansion of macro 'pfn_pte'
    1922 |         return pfn_pte(page_to_pfn(page), pgprot);
         |                ^~~~~~~


vim +1920 include/linux/mm.h

  1918	
  1919	#ifndef mk_pte
> 1920	static inline pte_t mk_pte(struct page *page, pgprot_t pgprot)
  1921	{
  1922		return pfn_pte(page_to_pfn(page), pgprot);
  1923	}
  1924	#endif
  1925	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
