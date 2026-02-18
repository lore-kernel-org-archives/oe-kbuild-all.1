Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827472F1FF1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771450692; cv=none; b=FPgiltjVINUxR3JIB/gtwgfg8cdFH5Me43yI9ZPFyOIX23c23MjjTCV8y6A4L3hgiNJiApBlilAQKgMOZ7VZldNEKWWYiyWfx4KTFRVbsRBi+SKUj68TIQ3tpZf05kx22S2+6x6UdsZSn7Yp9U41SAIebTsp0iqC1P642f7EW5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771450692; c=relaxed/simple;
	bh=5CebzH6+RpKeTB6qYerb88ZishFI//xuQp7kUAU2p3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GAWCBC73b7CZykf/sZdC86x+cIruwZvOyF8iq4CEzmRfyT5YKDZNQrw+UzJTs+hUR60Fe+X2qKIY5KJMZl4TvEFu+3ZBxWZ3ZIHbLWQPyJM+AUyjH0nIOpAlaSK91UzJ5dIzVhgXxHSkTzRGOImkcp7SpvnCLOXf5/gvC6gt1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUe4Bv+r; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUe4Bv+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771450691; x=1802986691;
  h=date:from:to:cc:subject:message-id;
  bh=5CebzH6+RpKeTB6qYerb88ZishFI//xuQp7kUAU2p3Q=;
  b=DUe4Bv+rtXUxFGloPXAys1YvHt9oF0Xm3gwaF2bXViM7C6mb/BHQspK2
   G0vUgEzH6f7D4WvpC5lm/xemDhYaTK43gOuJaG5sTrKbqSlRtqRrpZb+0
   WOHZavAXQs9irjpDxAtZV4MhlSPUoZgtRj0dnI0ZdzJ3HWC24CEaKqZm9
   Nz0YZxv5qJ3/uoiQU8v66ibDJeWb5iBiDuyzrCZZruoeCSN9Ct7odal/1
   1eW/xIiGNuSiY4jYLJekz76DOo1uNap5CxSbxqlXiuEkgUm3zV1iVY3lM
   F+lLzQmFosHqX/wVtshiJRp5HZ2zi3XyabIyw0pW9K1qF+wxTu4qYOQBM
   A==;
X-CSE-ConnectionGUID: bTIQEBGzQ/GcKAzT3dvS8Q==
X-CSE-MsgGUID: Auq0Zc5cR4uXDiVmga/Qfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72437854"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72437854"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 13:38:11 -0800
X-CSE-ConnectionGUID: H++U7KJhTvqGtxb6Jrv6Kg==
X-CSE-MsgGUID: pVIvHyewSJK+BD1b2v0mtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212976114"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2026 13:38:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vspFH-000000012ki-45rG;
	Wed, 18 Feb 2026 21:38:07 +0000
Date: Thu, 19 Feb 2026 05:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 26/27] Warning: mm/rmap.c:1227 function
 parameter 'nr_ptes' not described in 'pfn_mkclean_range'
Message-ID: <202602190537.n7x3fjOo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   1903e57e83c0c0526b0ee193ce32e6aac90863af
commit: 7b50e42cc205cb7ea83bd812494786d350612fe7 [26/27] tmp
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260219/202602190537.n7x3fjOo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190537.n7x3fjOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190537.n7x3fjOo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/rmap.c:1227 function parameter 'nr_ptes' not described in 'pfn_mkclean_range'
>> Warning: mm/rmap.c:1515 function parameter 'nr_ptes' not described in 'folio_add_anon_rmap_ptes'
>> Warning: mm/rmap.c:1815 function parameter 'nr_ptes' not described in 'folio_remove_rmap_ptes'
>> Warning: mm/rmap.c:2890 function parameter 'nr_ptes' not described in '__rmap_walk_file'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
