Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD41C69D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 00:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789517243; cv=none; b=gZntU2yRAv8+aFtLAyd6sHsDmHeSuLRLOeqf8VTLAaavB8oOWiktWUFojuiygYFavbMAoVLV47dAd0cMUcot1qe2DoRH+WaseXk/x+Mt8UISF+2txcYJLVWXOk1IJLJH+HIDVnTCu7IHLh9hK/RPy+u6IhqSMcZr2xmE1rAYOKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789517243; c=relaxed/simple;
	bh=R0xAfkbRf10paXrE2yhPfroUhpPLW5c/GJBh1Wv910w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ipl/8OkowoI1+MGjnuodA+pnWPdf/QhI9EDE5TrDmoA6hUASP///PqiYUY5q9ApCQhYPUq6Si/DoWgok549fasSA/3xb4id54hfyrtgDPrIOKASIKafXWmrjhC4kFUrVN1EtE1TolTeTebihXfQlafUUl6aA4dtVd64RxkOjYVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtMjjSnY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtMjjSnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789517242; x=1821053242;
  h=date:from:to:cc:subject:message-id;
  bh=R0xAfkbRf10paXrE2yhPfroUhpPLW5c/GJBh1Wv910w=;
  b=HtMjjSnYKAl7fWV7pQKYmwYeKLC4aqWlA2FrNeGaBPHFnvO9dxLVGcfm
   cAWRbbNucLGREon2MprYoHhSz52LbZd9uaDNPYTfB3ftdVNT/S1EbB4uL
   dyQq4zpdMH0cGXooRZVhoyygzxvD1qIAWr8a6uz+oLf3Q/HYwaVV0j56P
   I+fge3jIWazfmkH695W5QgWgm+DsoNiARy6KJ9QBddtfAeYSFfoSwRYDn
   ZphkUptN1BJlOp/MO6jiGDPXIyIA8IcakQh+ptdEjyITBO/0KuDwMd4Yq
   UC322MJcVqOc6wGBYn86womnUvzIjUutcmdtLIuuHN3k1CokJvz1GNDnm
   Q==;
X-CSE-ConnectionGUID: 5WkOypqTTi2ruFfmZibVKg==
X-CSE-MsgGUID: +Xca/aLHTWixynMpiIYQWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92400234"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92400234"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 17:07:21 -0700
X-CSE-ConnectionGUID: eN2zY4FuQBmCQFircANVZw==
X-CSE-MsgGUID: vdkvS0wtQz2TkUzhbxAVIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1571429"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 15 Sep 2026 17:07:21 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6dBF-000000005Cv-3DC1;
	Wed, 16 Sep 2026 00:07:17 +0000
Date: Wed, 16 Sep 2026 08:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 8/67] Warning: mm/page_alloc.c:7345 function parameter 'pfn' not described in
 'contig_get_lru_folio'
Message-ID: <202609160742.K46xwWVN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: 4af770f6b4623768abd534b154c6d8136f601cac [8/67] mm/page_alloc: let alloc_contig_range() try harder
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260916/202609160742.K46xwWVN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160742.K46xwWVN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160742.K46xwWVN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:7345 function parameter 'pfn' not described in 'contig_get_lru_folio'
>> Warning: mm/page_alloc.c:7345 expecting prototype for alloc_contig_frozen_range(). Prototype was for contig_get_lru_folio() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
