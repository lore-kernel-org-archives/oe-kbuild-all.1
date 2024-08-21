Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186BA1803E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 03:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724211607; cv=none; b=b68cB+3A7oM2Ferkhfp/d7OYAaTm9Nw6GZ8NwfYJ8IXr56enpZbCgGtBowxoeYRYWiNfM219tCLu0LYyMHQNmIlcyKA3vkvIiqaIQl8/e+bqXhuTneF9dpOEepvR5SC7FipEaqSrZyQKyIjcHNlMwJrgzeJ2c0hwQLK+EdC92oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724211607; c=relaxed/simple;
	bh=cVWN5b3b4wjnXRF/75rsFC8arlw3W8g7xE9DDisYBLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4TM3l+Q3JGG1DBZUaeChouap3UyOITMTlVIdo3RorYFnMlepQFAwnkbYflqwrJ8KoIJ30UA/BwFUkk2T7nxdrt41thln7z2bdQURFECIL1xQBkWR/70u/dIkZrHzi1CtTBnWURJf+/caHPqQrrM1Uz6py8QdS62ZD3jxcfNdgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EACSdQHl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EACSdQHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724211607; x=1755747607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVWN5b3b4wjnXRF/75rsFC8arlw3W8g7xE9DDisYBLg=;
  b=EACSdQHlGM9GOeE7pTkW5jhpqLrnKF5nZzhpvC0WXWSBrt4W8IkwpTTV
   oFtaJw/H06crLiG/vN36Hlc1vi9n6tiTPrk1M++X9T5FCEaAR5pa4LLkZ
   xZuqMi5BWbINlp0E8Z19B16EdwEh0lc6D4T5CuuwwP4kNn36Q1RL3yjDZ
   9JL1sT8qopU/G1imTytY4ciVJo10qecoABgyDiYQWDSQGjy4R5FUjWain
   w5mJq0kHrgpZu+sEwtpl0i5BzAOXzGP5Jz1flB1MdFHBLBB2MH9hexVzX
   2yozg7608vwvarCHm4QXbUfv7XPOGtR6xpzQWGNRbXlk1q3GccQT61h1D
   w==;
X-CSE-ConnectionGUID: XaXBfxcYRTGy+li+bnkJoA==
X-CSE-MsgGUID: CiUCVCLgRX+FwSyreIzxCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33935779"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="33935779"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 20:40:06 -0700
X-CSE-ConnectionGUID: 5lu3XuyDRoCCtp+OvOvQmA==
X-CSE-MsgGUID: bzRDS9MnQQ2+Df+CGO6Y/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="65645400"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Aug 2024 20:40:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgcCY-000Ar5-0T;
	Wed, 21 Aug 2024 03:40:02 +0000
Date: Wed, 21 Aug 2024 11:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 7840/7904]
 mm/compaction.c:766:15: error: redefinition of 'isolate_and_split_free_page'
Message-ID: <202408211143.RgdPFXlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   965c5bcac1fe560c973001599bd2364659dc788c
commit: 8cd9aa93b7269460e8d5e4407738f21fe5d6e720 [7840/7904] ANDROID: implement wrapper for reverse migration
config: i386-buildonly-randconfig-006-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211143.RgdPFXlA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211143.RgdPFXlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211143.RgdPFXlA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/compaction.c:766:15: error: redefinition of 'isolate_and_split_free_page'
     766 | unsigned long isolate_and_split_free_page(struct page *page,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/compaction.c:14:
   include/linux/compaction.h:241:22: note: previous definition of 'isolate_and_split_free_page' with type 'long unsigned int(struct page *, struct list_head *)'
     241 | static unsigned long isolate_and_split_free_page(struct page *page,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:56:27: warning: 'HPAGE_FRAG_CHECK_INTERVAL_MSEC' defined but not used [-Wunused-const-variable=]
      56 | static const unsigned int HPAGE_FRAG_CHECK_INTERVAL_MSEC = 500;
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compaction.h:241:22: warning: 'isolate_and_split_free_page' defined but not used [-Wunused-function]
     241 | static unsigned long isolate_and_split_free_page(struct page *page,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ADI_AXI_ADC
   Depends on [n]: IIO [=y] && HAS_IOMEM [=y] && OF [=n]
   Selected by [y]:
   - AD9467 [=y] && IIO [=y] && SPI [=y]


vim +/isolate_and_split_free_page +766 mm/compaction.c

   765	
 > 766	unsigned long isolate_and_split_free_page(struct page *page,
   767							struct list_head *list)
   768	{
   769		unsigned long isolated;
   770		unsigned int order;
   771	
   772		if (!PageBuddy(page))
   773			return 0;
   774	
   775		order = buddy_order(page);
   776		isolated = __isolate_free_page(page, order);
   777		if (!isolated)
   778			return 0;
   779	
   780		set_page_private(page, order);
   781		list_add(&page->lru, list);
   782	
   783		split_map_pages(list);
   784	
   785		return isolated;
   786	}
   787	EXPORT_SYMBOL_GPL(isolate_and_split_free_page);
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
