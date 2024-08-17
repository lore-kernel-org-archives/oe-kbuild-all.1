Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9B6CA6B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 17:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723915611; cv=none; b=G9/IT06RaWHqlVdcoPWsPjE8osRRyCIZIoGtJj5mo4G5HAH/mR8gDR3wsT4hq0pN5JuahOjgbnM5HLYj7uNJjc4xqo4oVZoilsnk2NVM1YDRFYAhbazGnoWIJjDBZthKPjiVpEcRzsZ6iiWqMUIVw+sIiB+MOKvA8kcGPqLOXNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723915611; c=relaxed/simple;
	bh=aOKD4hcYsbSDhtHarUzlkl/9X1snlmfFXE5gev0CHJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORu6+37XNlJES0OrrA2xmGLvpC04+gh6NU59bPSnsUVzGN3ethxt3lwAXZjQ5D/0ctQQaJUu3x9bfPtL7QUyLZ/04eVFf0ygBmekJlwmeNsnT1TOHGkhcEE6zVzNKGxOGl9iyUW5doz11hMpataSIKIEQ6nNrhkzJK2z30eOplw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR/8urb1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR/8urb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723915610; x=1755451610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOKD4hcYsbSDhtHarUzlkl/9X1snlmfFXE5gev0CHJY=;
  b=KR/8urb1w0ty6nKd359nZ77hC0zg5bAKCsXPMr+UEeprs9zSIE+K8L0x
   cbPOVoyV5ja41F6QNhx7rQJESKTbKC7jcNJCddk9pTZCMWvDZk3uT0Aog
   CzSV7E6tgT25+Rhyb60UkpJ4Pdx9WtC8bh3L5zoFQRuNTubZlBJKfKxAI
   K64tMscsiL8ZfK6u+xVAWqCwVx6V725llBeEr+AiNbZCGblny05IDYw1I
   8ugJ0E4D1MWbWcjf9+ocqaKMbBRnmSAGZazpUNTIrP1cD+ePr8uz0PFRt
   RSam4UWBF8GpT7z3Cwc6xwk6741uoMayLTf1mzu6U+rTnCKpJnRyeLRJa
   Q==;
X-CSE-ConnectionGUID: ssgXD3M1RE+cZPKo+bUbTA==
X-CSE-MsgGUID: ehYqEnHUQvGV4SM/FCGexQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="32767333"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="32767333"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 10:26:49 -0700
X-CSE-ConnectionGUID: 2+sSEWxlRfOtUi1RpP7NNQ==
X-CSE-MsgGUID: RMt27BLiQrm62kUmpAFyjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="97462041"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Aug 2024 10:26:47 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfNCP-0007h0-1N;
	Sat, 17 Aug 2024 17:26:45 +0000
Date: Sun, 18 Aug 2024 01:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:mm_id 12/12] mm/rmap.c:1185:20: error: void value
 not ignored as it ought to be
Message-ID: <202408180127.dZhqzQFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux mm_id
head:   3d79f5b8dd7c22fa4d00ea6de3e5d3517482dee4
commit: 3d79f5b8dd7c22fa4d00ea6de3e5d3517482dee4 [12/12] page_mapcount
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240818/202408180127.dZhqzQFg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180127.dZhqzQFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180127.dZhqzQFg-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/rmap.c: In function '__folio_add_rmap':
>> mm/rmap.c:1185:20: error: void value not ignored as it ought to be
    1185 |                 nr = folio_add_large_mapcount(folio, orig_nr_pages, false, vma);
         |                    ^
   mm/rmap.c:1213:20: error: void value not ignored as it ought to be
    1213 |                 nr = folio_inc_large_mapcount(folio, false, vma);
         |                    ^
   mm/rmap.c: In function '__folio_remove_rmap':
   mm/rmap.c:1589:20: error: void value not ignored as it ought to be
    1589 |                 nr = folio_sub_large_mapcount(folio, nr_pages, vma);
         |                    ^
   mm/rmap.c:1623:20: error: void value not ignored as it ought to be
    1623 |                 nr = folio_dec_large_mapcount(folio, vma);
         |                    ^


vim +1185 mm/rmap.c

  1154	
  1155	static __always_inline unsigned int __folio_add_rmap(struct folio *folio,
  1156			struct page *page, int nr_pages, struct vm_area_struct *vma,
  1157			enum rmap_level level, int *nr_pmdmapped)
  1158	{
  1159	#ifdef CONFIG_PAGE_MAPCOUNT
  1160		atomic_t *mapped = &folio->_nr_pages_mapped;
  1161	#endif
  1162		const int orig_nr_pages = nr_pages;
  1163		int first = 0, nr = 0;
  1164	
  1165		__folio_rmap_sanity_checks(folio, page, nr_pages, level);
  1166	
  1167		switch (level) {
  1168		case RMAP_LEVEL_PTE:
  1169			if (!folio_test_large(folio)) {
  1170				nr = atomic_inc_and_test(&folio->_mapcount);
  1171				break;
  1172			}
  1173	
  1174	#ifdef CONFIG_PAGE_MAPCOUNT
  1175			do {
  1176				first += atomic_inc_and_test(&page->_mapcount);
  1177			} while (page++, --nr_pages > 0);
  1178	
  1179			if (first &&
  1180			    atomic_add_return_relaxed(first, mapped) < ENTIRELY_MAPPED)
  1181				nr = first;
  1182	
  1183			folio_add_large_mapcount(folio, orig_nr_pages, false, vma);
  1184	#else /* !CONFIG_PAGE_MAPCOUNT */
> 1185			nr = folio_add_large_mapcount(folio, orig_nr_pages, false, vma);
  1186			if (nr == orig_nr_pages)
  1187				/* Was completely unmapped. */
  1188				nr = folio_large_nr_pages(folio);
  1189			else
  1190				nr = 0;
  1191	#endif /* CONFIG_PAGE_MAPCOUNT */
  1192			break;
  1193		case RMAP_LEVEL_PMD:
  1194			first = atomic_inc_and_test(&folio->_entire_mapcount);
  1195	#ifdef CONFIG_PAGE_MAPCOUNT
  1196			if (first) {
  1197				nr = atomic_add_return_relaxed(ENTIRELY_MAPPED, mapped);
  1198				if (likely(nr < ENTIRELY_MAPPED + ENTIRELY_MAPPED)) {
  1199					*nr_pmdmapped = folio_large_nr_pages(folio);
  1200					nr = *nr_pmdmapped - (nr & FOLIO_PAGES_MAPPED);
  1201					/* Raced ahead of a remove and another add? */
  1202					if (unlikely(nr < 0))
  1203						nr = 0;
  1204				} else {
  1205					/* Raced ahead of a remove of ENTIRELY_MAPPED */
  1206					nr = 0;
  1207				}
  1208			}
  1209			folio_inc_large_mapcount(folio, false, vma);
  1210	#else /* !CONFIG_PAGE_MAPCOUNT */
  1211			if (first)
  1212				*nr_pmdmapped = folio_large_nr_pages(folio);
  1213			nr = folio_inc_large_mapcount(folio, false, vma);
  1214			if (nr == 1)
  1215				/* Was completely unmapped. */
  1216				nr = folio_large_nr_pages(folio);
  1217			else
  1218				nr = 0;
  1219	#endif /* CONFIG_PAGE_MAPCOUNT */
  1220			break;
  1221		}
  1222		return nr;
  1223	}
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
