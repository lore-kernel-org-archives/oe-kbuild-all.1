Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FDB65D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 01:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718761416; cv=none; b=eTW7bqS5louLAwciqSYl4V7kOsSg8xCIb0U/KP3U+NTVD+iWl69FjjlosSwvn9rtzTKUeiUXGcgw+hhb3iUL+yF8iZSZAWA+IqPHHRx1tUwnXpOhMkH1bXTVUNtkt5UlUF4ebwzYBNt03Z+7CSXQ/h1o1yNsREzy3Dqv2BkJCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718761416; c=relaxed/simple;
	bh=cBXFdk8eYGuGizpcQJLYXA9ONjgMCGCVcfhwZ0H+WBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlFM5wB651xFqlWduq5V5rf7kC0UG9e3Oz23g+AcwfP1sqZBTdwv9hP1+4lC67zZLNn1dkdx6miW30NhI4Mmy7VrVyl5dUA2khMFu/i3seSHKVQ6qjvAP0XclbxxNF31O2+NXUSWAU4oDXkX3duP31rsurGxnufe2/qKW9a0hrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mW4qsd8t; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mW4qsd8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718761414; x=1750297414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cBXFdk8eYGuGizpcQJLYXA9ONjgMCGCVcfhwZ0H+WBY=;
  b=mW4qsd8tDeTnopIC3j/6ZV5/WCNVy3sPHy0rXUGaOMfb4K4St18Vqmjq
   /0E+S25723pJ2DLKvA7jNU8/F4MkVag0kJ1Cd9YSAXsACRys6CLYKfuqy
   6uRVX6I7JiWXK4Vts6yRVg9jDk77VkoQm91acBzRFTtIaNQ1pG1G/VUDe
   DBf2gNFgNgnMabBDjUp2YY0UnzzGJglbJ89YmbZihIh+TPqcLMEcoHb3x
   3H461Mi4c0MHoN6Lfpxbax1OzAC7Go3jyBWiGP3fgJcPHFvKrvpPNgA/D
   z955WZxJ2y/O1byZP3Q7SPNOKT65XJCKxb9FznMmxFerJR/ui8HC/wZlJ
   g==;
X-CSE-ConnectionGUID: RDREhQINRiqidWn3GWcOmQ==
X-CSE-MsgGUID: GMxRSlTxQpaaynj3+wo+Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26357687"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26357687"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 18:43:33 -0700
X-CSE-ConnectionGUID: Y+205+gVR1aS8FH4tNSglA==
X-CSE-MsgGUID: lDnMYQV5TzK142mmaMHd+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="79212820"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2024 18:43:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJkME-00068g-1p;
	Wed, 19 Jun 2024 01:43:30 +0000
Date: Wed, 19 Jun 2024 09:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 -next] mm/hugetlb_cgroup: register lockdep key for
 cftype
Message-ID: <202406190956.9j1UCIe5-lkp@intel.com>
References: <20240618071922.2127289-1-xiujianfeng@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618071922.2127289-1-xiujianfeng@huawei.com>

Hi Xiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiu-Jianfeng/mm-hugetlb_cgroup-register-lockdep-key-for-cftype/20240618-152930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240618071922.2127289-1-xiujianfeng%40huawei.com
patch subject: [PATCH v2 -next] mm/hugetlb_cgroup: register lockdep key for cftype
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240619/202406190956.9j1UCIe5-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190956.9j1UCIe5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190956.9j1UCIe5-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hugetlb_cgroup.c: In function 'hugetlb_cgroup_cfttypes_init':
>> mm/hugetlb_cgroup.c:840:42: error: 'struct cftype' has no member named 'lockdep_key'
     840 |                 lockdep_register_key(&cft->lockdep_key);
         |                                          ^~


vim +840 mm/hugetlb_cgroup.c

   815	
   816	static void __init
   817	hugetlb_cgroup_cfttypes_init(struct hstate *h, struct cftype *cft,
   818				     struct cftype *tmpl, int tmpl_size)
   819	{
   820		char buf[32];
   821		int i, idx = hstate_index(h);
   822	
   823		/* format the size */
   824		mem_fmt(buf, sizeof(buf), huge_page_size(h));
   825	
   826		for (i = 0; i < tmpl_size; cft++, tmpl++, i++) {
   827			*cft = *tmpl;
   828			/* rebuild the name */
   829			snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
   830			/* rebuild the private */
   831			cft->private = MEMFILE_PRIVATE(idx, tmpl->private);
   832			/* rebuild the file_offset */
   833			if (tmpl->file_offset) {
   834				unsigned int offset = tmpl->file_offset;
   835	
   836				cft->file_offset = MEMFILE_OFFSET0(offset) +
   837						   MEMFILE_FIELD_SIZE(offset) * idx;
   838			}
   839	
 > 840			lockdep_register_key(&cft->lockdep_key);
   841		}
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
