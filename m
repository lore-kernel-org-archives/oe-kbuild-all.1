Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6939E6CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737939; cv=none; b=jUQvc33g7ov9EKo58FQVLKC+1vCK2lkzjjKXyOzjTvcCvQJVaY0zJwjMajVeXz2x/rhE6qP9vfEr/PAVcZhhh1L4b7wjId+aUULyWgiZvE0oZo/u1PmGdOkuhttFCMDqHUSAuHZ2ZPAOaedXCbpRoeGHaFM9O7Uv9lv7KqU4imM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737939; c=relaxed/simple;
	bh=OlkdjzuVOi9z4NPPUuSL0p51tYWRM4T1TvomF+a/yOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDAyMIu7+sjT0r46UGai1W4TBOfiH5uqCe6b+ImoW4TDn80D8Dzj26WC7JPizT4J4fJ2Mqkoh5ssInazS2Kan6TrknCuuOlEAQ2dm/DbpXcc5w810cxfGofQxIF1g0vLs4JqlQ4nQwpSsal7hoT4J5n1EbUBH7P+3CEo/n6EcII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jb8rjhHD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jb8rjhHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737938; x=1805273938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlkdjzuVOi9z4NPPUuSL0p51tYWRM4T1TvomF+a/yOA=;
  b=Jb8rjhHDSDMchUyCQ4b3u71I8MDSniQ/fX2hoh3eXOpfaziz8VuBn3ai
   2dSVYq7FGmTSNdnJsqHVw/SQRnf3yeS9Hgapa/tP0zv12yt4Bekg5H8YP
   g+BFhsQmPUC5Wk4eW1JtX4olCtLEM5Pdrr8vISwhwuTy6tQp4FpEDuhcV
   86TDFri6DaNsCQK4zN2DRCVbc3tlQR7ygFHEBPhbuiPQ5ik4aatiNkD85
   sZn2yKoAFifkQu9qcJRX6GX2fIa0HGZTRyv9INtQXAh05oPd0i7yiunNY
   UQ7pItVMtCRU0dcN5eHh3ZrXRW6ZMG1l8xIgVi8U6zmlBgtBF58gkQn9R
   g==;
X-CSE-ConnectionGUID: zAi9MCfGSiKpNUQkOu1m2A==
X-CSE-MsgGUID: iZ6WePa1QPGh509aPscY4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85461721"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85461721"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:58:57 -0700
X-CSE-ConnectionGUID: TMKcp+2HTRS7Mh9m6Hh72Q==
X-CSE-MsgGUID: LvAsp+W6SuC7aoTr8fbcaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222426303"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 01:58:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2QGL-000000004P7-03yL;
	Tue, 17 Mar 2026 08:58:53 +0000
Date: Tue, 17 Mar 2026 09:58:40 +0100
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, rppt@kernel.org,
	pratyush@kernel.org, linux-kernel@vger.kernel.org,
	dmatlack@google.com, akpm@linux-foundation.org, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] liveupdate: Make unregister functions return void
Message-ID: <202603170941.c2zUXqhx-lkp@intel.com>
References: <20260317025049.494931-6-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317025049.494931-6-pasha.tatashin@soleen.com>

Hi Pasha,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.0-rc4 next-20260316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pasha-Tatashin/liveupdate-Protect-file-handler-list-with-rwsem/20260317-105522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260317025049.494931-6-pasha.tatashin%40soleen.com
patch subject: [PATCH 5/6] liveupdate: Make unregister functions return void
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260317/202603170941.c2zUXqhx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603170941.c2zUXqhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603170941.c2zUXqhx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kexec_core.c:18:
   include/linux/liveupdate.h: In function 'liveupdate_unregister_flb':
>> include/linux/liveupdate.h:274:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     274 |         return -EOPNOTSUPP;
         |                ^
   include/linux/liveupdate.h:271:20: note: declared here
     271 | static inline void liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/return +274 include/linux/liveupdate.h

cab056f2aae725 Pasha Tatashin 2025-12-18  270  
e62bd1ab0687a1 Pasha Tatashin 2026-03-16  271  static inline void liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
cab056f2aae725 Pasha Tatashin 2025-12-18  272  					     struct liveupdate_flb *flb)
cab056f2aae725 Pasha Tatashin 2025-12-18  273  {
cab056f2aae725 Pasha Tatashin 2025-12-18 @274  	return -EOPNOTSUPP;
cab056f2aae725 Pasha Tatashin 2025-12-18  275  }
cab056f2aae725 Pasha Tatashin 2025-12-18  276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
