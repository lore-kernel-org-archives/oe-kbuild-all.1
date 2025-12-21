Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE8F2580F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 21:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353813; cv=none; b=bq+KL++zBBlYng+is4Z4Ovc4+JesI/Y6nubw4Jqe9I/++Ywj3Tgv06Y02C6zQO4xJlR/aD/2WucXJyTP1M/1wsAfIMew+XGK63S+YAt4RMP/5DdF8fx7JnE4lT5fsPyOasq8khy8ZoTBTrkwNGA5Of7NNvmNQ5gvhn46QXgCcTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353813; c=relaxed/simple;
	bh=wK4hv0liv6fI13orAi0jiRtUoKbQmRln9wYbtPfdaww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MvIt9JGSRNNh06Z1e7p3Fh/ZwPuAmpsjE2fKmGbOl51YTYgVFWFWVUwTrtlx2xP3TUgi+sbCT5SpPO6zc7JepYumLdY43pVSPqRLawhU19mQl+7ZKjkz5ND0wd1K1slmqiLOGA12Xl+3dS6mjm9GIEV832TtmMiLnt6y+YrZS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1Uri3d/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1Uri3d/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766353812; x=1797889812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wK4hv0liv6fI13orAi0jiRtUoKbQmRln9wYbtPfdaww=;
  b=R1Uri3d/MVYx7jOZRaN02mWDZLt3KtRel1s4dSUCHBlFtzNbgw58knEZ
   MSqzHKTz8YLc2ucFV4necaiHeTFgxWjLNqARYFK5ruPDxNhVjYMycB6ex
   oZyZdi8IeufJyrqkzraFnXwu7p84gsqDgj+8ptw3c2pXGA6TmLl17udtT
   YiZXu1mXoOqYW28b//h+/So+cEw0r5E2u/GslypZNKlMkhW0HM7XF0TjR
   l+dp5wKcAt6xTSwkwp9v1UgaHXmD5Tt3Cn1OA33RCcPiQYyKUVsd/fAsv
   h/Q046N6NQBz9j4BzZTHYbXb55/wMGJmdtpsUA932csxNqNSUkoR4CndF
   w==;
X-CSE-ConnectionGUID: tvJtvSkGSFmioVXruC3taw==
X-CSE-MsgGUID: aimCH8q0QBezeM/sL+z2Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68297119"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68297119"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 13:50:11 -0800
X-CSE-ConnectionGUID: uo4ihW/PTWSHu3aVVECjsA==
X-CSE-MsgGUID: YRLluMLfRx2WOVe2/d3vTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199388689"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 13:50:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXRJW-000000005Fk-2E3C;
	Sun, 21 Dec 2025 21:50:06 +0000
Date: Sun, 21 Dec 2025 22:49:44 +0100
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-new 98/101] htmldocs:
 Documentation/admin-guide/laptops/index.rst:7: WARNING: toctree contains
 reference to nonexisting document 'admin-guide/laptops/laptop-mode'
 [toc.not_readable]
Message-ID: <202512212211.GvfwAGPP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   287373d0b6ee3872d95edfd1921fb2f18535d6cd
commit: 7cc91bf52584387445d654cde466ba5cb1235757 [98/101] mm/block/fs: remove laptop_mode
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512212211.GvfwAGPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212211.GvfwAGPP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/pci.h
   ERROR: Cannot find file ./include/linux/mod_devicetable.h
   WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
   ERROR: Cannot find file ./include/linux/bootconfig.h
   WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>> Documentation/admin-guide/laptops/index.rst:7: WARNING: toctree contains reference to nonexisting document 'admin-guide/laptops/laptop-mode' [toc.not_readable]
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   WARNING: No kernel-doc for file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h


vim +7 Documentation/admin-guide/laptops/index.rst

b02f1651ff7758 Documentation/laptops/index.rst Mauro Carvalho Chehab 2019-04-18  6  
b02f1651ff7758 Documentation/laptops/index.rst Mauro Carvalho Chehab 2019-04-18 @7  .. toctree::

:::::: The code at line 7 was first introduced by commit
:::::: b02f1651ff7758c4db0d759ab765d39986a79f5a docs: laptops: convert to ReST

:::::: TO: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
