Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A0D20110B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512995; cv=none; b=q82MG4hS7NS6QrSc80kTBWkOo+6KSVTzPqG+0cSuSnifGJhQjDcwOXoQWgjZqCqS6XZiZ0Dqv68MeZxhjYViTtAnQdWJaTAcHg1g4S8ZwZstDjPqRITHbHgeS/fzqhEdLMdOeluVUtQzgWGjrU1DuCu5p4ZLmr8042ddU8A7qys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512995; c=relaxed/simple;
	bh=z4MbtIB0OY2dBfk49t1tx/xD9z0MWUmCqB9ShiHlcIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYqPBcnaxZ/zKGDnzzdGM3+wLesHY/4tsD0NSjwzn2ja47Qzk/F/NjTZDDBN3t9wMvOFw/G85AfcrDhoYc0bYCfGBSrl73vl5r8aZuicWxelWQZC561yYQQFtpjtjd03YFCPXmMLZckvvRtMhUm9H7ls9W+vd+nyvToesRw8N9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mm8Wzydu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mm8Wzydu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746512993; x=1778048993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z4MbtIB0OY2dBfk49t1tx/xD9z0MWUmCqB9ShiHlcIo=;
  b=mm8Wzydul41jhgindgVilqkuKgKnl/IMRNV+SJbkWwm+y7Kytig6REvB
   AsgZfIgaQidYEJvdY4ggrtUfDXgR4nzSRLG7O90bwJTOXu2yRbU3S5pRI
   DsTiYjWJE7j/Jmb3q0xDPEZ1pWlAgWGQZW0W57uTlE2OP7qZcVXUVzUQT
   WalNPXQhJYKpASOzmlHGDD+h5L08U0bvPYoCOCH290rrekEKD0wqSp6FE
   UGx0dN4QnyfNsqKorCX9ZpkcORIZ7INdzqo84If+DJINEXhOrR7ktRwr+
   IfVWR+lWG2Nn8MS5zsWzAbM3kw7Aj9Gzoqv7E6T9DC1heXpCsn32o1DXF
   w==;
X-CSE-ConnectionGUID: V23XdOfHTVKMmRk5iLhltA==
X-CSE-MsgGUID: SptugUUhTWCS4F9eIXgNhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48171242"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="48171242"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 23:29:53 -0700
X-CSE-ConnectionGUID: JPT7bdNiTXWh+wCleF73wA==
X-CSE-MsgGUID: BU/q5g7wR22I8emT0yYL8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="140640712"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 May 2025 23:29:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCBoK-0006HJ-37;
	Tue, 06 May 2025 06:29:48 +0000
Date: Tue, 6 May 2025 14:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1] mm/vmscan.c:4372:6:
 warning: no previous prototype for 'isolate_folio'
Message-ID: <202505061415.Wosl3Vvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   dda04d45f3e07c3bd3aa78253035119ff68f7ef4
commit: 0e47a7391b3e2e57c4769f14a7be0ba7b56b10ca [0/1] ANDROID: mm: export isolate_folio and reclaim_pages
config: x86_64-buildonly-randconfig-003-20250506 (https://download.01.org/0day-ci/archive/20250506/202505061415.Wosl3Vvg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061415.Wosl3Vvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061415.Wosl3Vvg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:4372:6: warning: no previous prototype for 'isolate_folio' [-Wmissing-prototypes]
    4372 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         |      ^~~~~~~~~~~~~


vim +/isolate_folio +4372 mm/vmscan.c

  4371	
> 4372	bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
  4373	{
  4374		bool success;
  4375	
  4376		/* swap constrained */
  4377		if (!(sc->gfp_mask & __GFP_IO) &&
  4378		    (folio_test_dirty(folio) ||
  4379		     (folio_test_anon(folio) && !folio_test_swapcache(folio))))
  4380			return false;
  4381	
  4382		/* raced with release_pages() */
  4383		if (!folio_try_get(folio))
  4384			return false;
  4385	
  4386		/* raced with another isolation */
  4387		if (!folio_test_clear_lru(folio)) {
  4388			folio_put(folio);
  4389			return false;
  4390		}
  4391	
  4392		/* see the comment on MAX_NR_TIERS */
  4393		if (!folio_test_referenced(folio))
  4394			set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS, 0);
  4395	
  4396		/* for shrink_folio_list() */
  4397		folio_clear_reclaim(folio);
  4398		folio_clear_referenced(folio);
  4399	
  4400		success = lru_gen_del_folio(lruvec, folio, true);
  4401		VM_WARN_ON_ONCE_FOLIO(!success, folio);
  4402	
  4403		return true;
  4404	}
  4405	EXPORT_SYMBOL_GPL(isolate_folio);
  4406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
