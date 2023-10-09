Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA57D347D0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaQolSet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696874987; x=1728410987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z63ykf3UE/XJLXyh9cwApZGQCVUhB4wn+YZPKmiZQEY=;
  b=KaQolSetbhKnqQGTzaHXJIGehKaCH4vNgPdCMcW6sQTDhMrxWTpROXUf
   H8rFdZNTdEwNLczRnyWmSHE9prK/59Cu2OHlvGg1SLHaQYTtCkxY55kl6
   HsdqadXs80B0hP0EsqEr+N/wLrXepugTXM4AA/BddG1nJ8BTyqJUSIAbQ
   AhKxmhWgoaWWxdGUYv/Y6KWKC0Osd22owN4h2i9GZPlCseSKduQ1nbp0G
   cy4lO3zfgI0YkqqyqLnBeIlcJ/viOWuYDHdbrVcuOwrwnN8rN6ILJx4Se
   iQNZ3HmP11pdWkEWMNShsmKXjtAXv2QCZWI5CzGZJ87TfbhdH961wnaqC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363564805"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="363564805"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 11:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="703003591"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="703003591"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Oct 2023 11:09:03 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpuge-0000UO-2z;
	Mon, 09 Oct 2023 18:09:00 +0000
Date: Tue, 10 Oct 2023 02:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 2/3] mm/rmap: convert page_move_anon_rmap() to
 folio_move_anon_rmap()
Message-ID: <202310100112.tFC44qk7-lkp@intel.com>
References: <20231002142949.235104-3-david@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002142949.235104-3-david@redhat.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/mm-rmap-move-SetPageAnonExclusive-out-of-page_move_anon_rmap/20231002-223111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231002142949.235104-3-david%40redhat.com
patch subject: [PATCH v1 2/3] mm/rmap: convert page_move_anon_rmap() to folio_move_anon_rmap()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231010/202310100112.tFC44qk7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100112.tFC44qk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100112.tFC44qk7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/rmap.c:1153: warning: Function parameter or member 'folio' not described in 'folio_move_anon_rmap'
>> mm/rmap.c:1153: warning: Excess function parameter 'page' description in 'folio_move_anon_rmap'


vim +1153 mm/rmap.c

cb67f4282bf969 Hugh Dickins            2022-11-02  1142  
c44b674323f4a2 Rik van Riel            2010-03-05  1143  /**
a75a22c73fad8b David Hildenbrand       2023-10-02  1144   * folio_move_anon_rmap - move a folio to our anon_vma
a75a22c73fad8b David Hildenbrand       2023-10-02  1145   * @page:	The folio to move to our anon_vma
a75a22c73fad8b David Hildenbrand       2023-10-02  1146   * @vma:	The vma the folio belongs to
c44b674323f4a2 Rik van Riel            2010-03-05  1147   *
a75a22c73fad8b David Hildenbrand       2023-10-02  1148   * When a folio belongs exclusively to one process after a COW event,
a75a22c73fad8b David Hildenbrand       2023-10-02  1149   * that folio can be moved into the anon_vma that belongs to just that
a75a22c73fad8b David Hildenbrand       2023-10-02  1150   * process, so the rmap code will not search the parent or sibling processes.
c44b674323f4a2 Rik van Riel            2010-03-05  1151   */
a75a22c73fad8b David Hildenbrand       2023-10-02  1152  void folio_move_anon_rmap(struct folio *folio, struct vm_area_struct *vma)
c44b674323f4a2 Rik van Riel            2010-03-05 @1153  {
595af4c9368aba Matthew Wilcox (Oracle  2022-09-02  1154) 	void *anon_vma = vma->anon_vma;
5a49973d7143eb Hugh Dickins            2016-07-14  1155  
595af4c9368aba Matthew Wilcox (Oracle  2022-09-02  1156) 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
81d1b09c6be66a Sasha Levin             2014-10-09  1157  	VM_BUG_ON_VMA(!anon_vma, vma);
c44b674323f4a2 Rik van Riel            2010-03-05  1158  
595af4c9368aba Matthew Wilcox (Oracle  2022-09-02  1159) 	anon_vma += PAGE_MAPPING_ANON;
414e2fb8ce5a99 Vladimir Davydov        2015-06-24  1160  	/*
414e2fb8ce5a99 Vladimir Davydov        2015-06-24  1161  	 * Ensure that anon_vma and the PAGE_MAPPING_ANON bit are written
b3ac04132c4b9b Matthew Wilcox (Oracle  2022-01-21  1162) 	 * simultaneously, so a concurrent reader (eg folio_referenced()'s
b3ac04132c4b9b Matthew Wilcox (Oracle  2022-01-21  1163) 	 * folio_test_anon()) will not see one without the other.
414e2fb8ce5a99 Vladimir Davydov        2015-06-24  1164  	 */
595af4c9368aba Matthew Wilcox (Oracle  2022-09-02  1165) 	WRITE_ONCE(folio->mapping, anon_vma);
c44b674323f4a2 Rik van Riel            2010-03-05  1166  }
c44b674323f4a2 Rik van Riel            2010-03-05  1167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
