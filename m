Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372381CCB45
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723032357; cv=none; b=aibFueJ+UJacrNHvQLdXHW4dIuojszGZowCTllXssd/kXh34qqy1EvY7IjR0JplQqDAQQuROX9AsXc9nQHWGmJRBtpSeXcGub730VjQUNXvxrCVs4ekP3DoFdfH21JXpXIlaiuzjmjBVmp0AxhxJr02M2wWLCrvtMzmsyl5FNmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723032357; c=relaxed/simple;
	bh=R7tauJat0duAbgWUYzTVrPhPklqSHszUVT/zMeOTzUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iL7WzRPxZP/tqvmrLCfBFkbk2eSjiAS+CAUtg3X6qudbCuf6N7KBOt3XxqI4upwXjpaUCfOhMweXK34JAfBSxfJacvQ09yyFzeHefi53F+Qfkw7KKWa5htsAXeG1EgG7vktCjXVQZUXARFgBFJDOWBNkOgSuKbmxwizQssryVSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=If1EvSUk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="If1EvSUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723032355; x=1754568355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R7tauJat0duAbgWUYzTVrPhPklqSHszUVT/zMeOTzUc=;
  b=If1EvSUk7x9islX4Gm4ECjWESI2sV+nC4wPUSIxJYuljZBUf0dyTS8Pq
   PE806rxec35EZtqnRwufRjwykFq2Qm/gnJ4/rL8ScMVXEHsnBvYySlU4r
   j/JQWOfF/OeZ2GrinOpybAQU9o3SjtKFUWUW89uSe92smID3Mc3+5sk8g
   gYZIZdcfJtI6w5uUJdMkg4UtnueCI65t4q6tkVjgjOLoNiayDLY2qpneA
   +BXWLWcKnGu90dgSDM7XhH93x0ZsJ+UiaDJeBji29Lsv7OYiucWza9ndw
   j/CvsS5tedJjy/PgD1fOcZoUYVaCF4/17jkmftMRnh7FHTOvEkPKK6YLc
   A==;
X-CSE-ConnectionGUID: 0afqN3t1SVi56wkuCU+acA==
X-CSE-MsgGUID: fMuFvUTKRBOyf3fKISs/Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24859293"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="24859293"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:05:54 -0700
X-CSE-ConnectionGUID: nRYGGIKOSAWi86HgejQUZA==
X-CSE-MsgGUID: hkam2FIDSM+ZRqANgrOSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="61477416"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2024 05:05:53 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbfQ8-0005Ls-1N;
	Wed, 07 Aug 2024 12:05:41 +0000
Date: Wed, 7 Aug 2024 20:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] mm: keep nid around during hot-remove
Message-ID: <202408072002.GM94ZyeU-lkp@intel.com>
References: <20240806221454.1971755-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806221454.1971755-2-pasha.tatashin@soleen.com>

Hi Pasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on s390/features]
[also build test WARNING on tip/x86/mm linus/master v6.11-rc2]
[cannot apply to akpm-mm/mm-everything next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pasha-Tatashin/mm-keep-nid-around-during-hot-remove/20240807-064754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20240806221454.1971755-2-pasha.tatashin%40soleen.com
patch subject: [PATCH 2/2] mm: keep nid around during hot-remove
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240807/202408072002.GM94ZyeU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408072002.GM94ZyeU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408072002.GM94ZyeU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:575: warning: Function parameter or struct member 'nid' not described in '__remove_pages'


vim +575 mm/memory_hotplug.c

815121d2b5cd56 Yasuaki Ishimatsu 2013-02-22  561  
ea01ea937dcae2 Badari Pulavarty  2008-04-28  562  /**
feee6b29891656 David Hildenbrand 2020-01-04  563   * __remove_pages() - remove sections of pages
7ea6216049ff9c Dan Williams      2019-07-18  564   * @pfn: starting pageframe (must be aligned to start of a section)
ea01ea937dcae2 Badari Pulavarty  2008-04-28  565   * @nr_pages: number of pages to remove (must be multiple of section size)
e8b098fc5747a7 Mike Rapoport     2018-04-05  566   * @altmap: alternative device page map or %NULL if default memmap is used
ea01ea937dcae2 Badari Pulavarty  2008-04-28  567   *
ea01ea937dcae2 Badari Pulavarty  2008-04-28  568   * Generic helper function to remove section mappings and sysfs entries
ea01ea937dcae2 Badari Pulavarty  2008-04-28  569   * for the section of the memory we are removing. Caller needs to make
ea01ea937dcae2 Badari Pulavarty  2008-04-28  570   * sure that pages are marked reserved and zones are adjust properly by
ea01ea937dcae2 Badari Pulavarty  2008-04-28  571   * calling offline_pages().
ea01ea937dcae2 Badari Pulavarty  2008-04-28  572   */
feee6b29891656 David Hildenbrand 2020-01-04  573  void __remove_pages(unsigned long pfn, unsigned long nr_pages,
e769a7b03edb4a Pasha Tatashin    2024-08-06  574  		    struct vmem_altmap *altmap, int nid)
ea01ea937dcae2 Badari Pulavarty  2008-04-28 @575  {
52fb87c81f11da David Hildenbrand 2020-02-03  576  	const unsigned long end_pfn = pfn + nr_pages;
52fb87c81f11da David Hildenbrand 2020-02-03  577  	unsigned long cur_nr_pages;
4b94ffdc4163ba Dan Williams      2016-01-15  578  
943189db4f3ed1 Anshuman Khandual 2022-05-31  579  	if (check_pfn_span(pfn, nr_pages)) {
501350459b1fe7 Rick Wertenbroek  2023-05-10  580  		WARN(1, "Misaligned %s start: %#lx end: %#lx\n", __func__, pfn, pfn + nr_pages - 1);
7ea6216049ff9c Dan Williams      2019-07-18  581  		return;
943189db4f3ed1 Anshuman Khandual 2022-05-31  582  	}
d760afd4d25706 Yasuaki Ishimatsu 2012-10-08  583  
52fb87c81f11da David Hildenbrand 2020-02-03  584  	for (; pfn < end_pfn; pfn += cur_nr_pages) {
dd33ad7b251f90 Michal Hocko      2018-11-02  585  		cond_resched();
52fb87c81f11da David Hildenbrand 2020-02-03  586  		/* Select all remaining pages up to the next section boundary */
a11b9419243b9c David Hildenbrand 2020-04-06  587  		cur_nr_pages = min(end_pfn - pfn,
a11b9419243b9c David Hildenbrand 2020-04-06  588  				   SECTION_ALIGN_UP(pfn + 1) - pfn);
e769a7b03edb4a Pasha Tatashin    2024-08-06  589  		sparse_remove_section(pfn, cur_nr_pages, altmap, nid);
ea01ea937dcae2 Badari Pulavarty  2008-04-28  590  	}
ea01ea937dcae2 Badari Pulavarty  2008-04-28  591  }
ea01ea937dcae2 Badari Pulavarty  2008-04-28  592  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
