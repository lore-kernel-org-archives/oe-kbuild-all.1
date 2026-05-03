Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ADF12D1F1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 07:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777792168; cv=none; b=eshAH+sNR106HV2RHFX1PllS+kEHa63c43NM4kFr6b93XnOPOJ9es1XDZxBTvUx2cVShM3ifGC2oWFzowIJQh0IhOmut2vLDVIZ2tajhHSor5q8E51SBY+qodSR4Jm+Ejqrx9VdeukLwrRGq2CizbfwAUUCo1WrqCWjoRxR5XJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777792168; c=relaxed/simple;
	bh=E1E4P73o3K12lA9KcK6wXtU+cp4KrSbw9gGIvw4REX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aXL8ZH6N89yE941MGob0T5Y5nXL/vmHYq+gAjtJX6lJXMEb7pwYpaE/DxGragMeg01b5uDVQK+/a1p8IbC09wrYnFGmJLo2jqZsXdv++NwRoNbZfhgPJLD8nXa25mmtjQhKcd0r5XZ/AYt0U0meGrKx6BwIM4OFpQM1Bz29C5js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdIRCNDr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdIRCNDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777792167; x=1809328167;
  h=date:from:to:cc:subject:message-id;
  bh=E1E4P73o3K12lA9KcK6wXtU+cp4KrSbw9gGIvw4REX4=;
  b=gdIRCNDrfqJO5BCOw7UffLMv4+xFRrJxjxNUNNvNcP/OiKG9y6qTfcli
   2qdgjOVgco7rFMHia//NwOB8LoQgp9tXot1HIdSNhKNnGqkg8I9uTfG5q
   tR6OlKA4O9vmB/rxVSxaXpz1WSdZs2Sye9B765+Z0dUFdbCSkgsE3et4G
   uHK23xC4JdOop3V/xIC9RGJkj7LnKHrbCE4+hLx50LjDIE+Xux7y8XczF
   S0+zOufWccQxPYUNugf8rclISbwHjhSq5OG/JSosGI/yILSzbF+tWhXvt
   u4sIEUZyqtJcUyMTCXwDOJFoXAXiVBkEpONfSRn/XtwM8IiOP70nJA1rV
   g==;
X-CSE-ConnectionGUID: XhOPLyQ7T9GWPa8/PkPvKA==
X-CSE-MsgGUID: GSn7pbN2QRqnAsTHTiJ25Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89789763"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89789763"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 00:09:26 -0700
X-CSE-ConnectionGUID: IFNDigCaRaeA368el94TjQ==
X-CSE-MsgGUID: OXs9tSVURi+PDhoIjAnjrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="258588919"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2026 00:09:25 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJQx9-000000002IP-13iu;
	Sun, 03 May 2026 07:09:23 +0000
Date: Sun, 03 May 2026 15:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 51/69] Warning: mm/rmap.c:1306 function
 parameter 'nr_ptes' not described in 'pfn_mkclean_range'
Message-ID: <202605031550.VABy1iDQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: 31f670864922c11937d9351a9e3ca96f715d7cfe [51/69] treewide: The rest of the owl
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031550.VABy1iDQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031550.VABy1iDQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031550.VABy1iDQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/rmap.c:1306 function parameter 'nr_ptes' not described in 'pfn_mkclean_range'
>> Warning: mm/rmap.c:1595 function parameter 'nr_ptes' not described in 'folio_add_anon_rmap_ptes'
>> Warning: mm/rmap.c:1903 function parameter 'nr_ptes' not described in 'folio_remove_rmap_ptes'
>> Warning: mm/rmap.c:3039 function parameter 'nr_ptes' not described in '__rmap_walk_file'
>> Warning: mm/rmap.c:1306 function parameter 'nr_ptes' not described in 'pfn_mkclean_range'
>> Warning: mm/rmap.c:1595 function parameter 'nr_ptes' not described in 'folio_add_anon_rmap_ptes'
>> Warning: mm/rmap.c:1903 function parameter 'nr_ptes' not described in 'folio_remove_rmap_ptes'
>> Warning: mm/rmap.c:3039 function parameter 'nr_ptes' not described in '__rmap_walk_file'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
