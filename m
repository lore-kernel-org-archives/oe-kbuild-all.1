Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE427263B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 01:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769216933; cv=none; b=jI+rWJOHhGSFurxRbZ5BLtnN477J/wGBRY/KLjpZQ1cKb/u+zW7vekNupaf0X+PurP1cQMyUfNviZ24Q4sETyjVvVfwjGyFeOlNtJwYrvrWtKpLjYVCsZacUKPSv61cBjhsmJ9ea2yRWuupHdE0ZAjevE5p3z8Ro2wVTXZpR0FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769216933; c=relaxed/simple;
	bh=zdqjakMNIZa6q0OUcHU2OQ8u0NM5LTxwtrllGyrqeIE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=npCMYii+FPmzTOWwYeGRDV7cJLm9Tsz4PKiYOxW8WoJzX4VyIQ8gVzj+FiS2tiWUYTmmIrct2bXx26MEEy49mi29fir1gfeSOLPqdfwkGMk8ojOEpE3coWLoDlugRtv5VK8TD4+C5cd68PW7os8RoFLKCuOupH3j/wTS7eo1B9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLiY4Apu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLiY4Apu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769216932; x=1800752932;
  h=date:from:to:cc:subject:message-id;
  bh=zdqjakMNIZa6q0OUcHU2OQ8u0NM5LTxwtrllGyrqeIE=;
  b=WLiY4ApuA4NRyyo4+k3LkayIxCJttZ0P92EaQbbbVv4E+7uJ2Su6bRcW
   /IivgFweCVZE3LEtwyxbLTLjXyqLUvfchnib4a454iow2fPYIVt5aM4V9
   8euYVf6H9GKPtFg2Xahuvma8GTZ+EfRr1Kd1ZYu19PYlEn1/44+Z6o96N
   Gp5FFpiWuQn7H112Q2Jc23A7JudzhSqx89ozbb+II7OdpiZrYrgi+Kwrq
   G3NY/xs+lI994acgK+sfsNI+L1k03s+8ASDuX2o2Ga8mMwslPjQwZO4B6
   e3c0XrBUGsGqdC/s8BI7qJjZBV7LCawZK9CaIBVaAMWRBnKgzoKR1GQ+c
   g==;
X-CSE-ConnectionGUID: FHV+OIjXQdqldSOGgqz+iQ==
X-CSE-MsgGUID: +qZk4jIJQX2/JCk56459YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74103872"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="74103872"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 17:08:51 -0800
X-CSE-ConnectionGUID: jI2abWNwRW6jHjbFoH6WQA==
X-CSE-MsgGUID: rPJZQPSqSIyjzAsVE9yCKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211662203"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2026 17:08:51 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjS8t-000000000qj-3O2g;
	Sat, 24 Jan 2026 01:08:47 +0000
Date: Sat, 24 Jan 2026 02:07:57 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 5/30] warning: public documentation for
 `clist_create` links to private item `CList`
Message-ID: <202601240227.FAEy1RoR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   89462eb192ebd620dca084ef612b250231bc7aa1
commit: 39d0c149fcf8f63632522435df53e3648999d824 [5/30] rust: clist: Add support to interface with C linked lists
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260124/202601240227.FAEy1RoR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240227.FAEy1RoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240227.FAEy1RoR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: public documentation for `clist_create` links to private item `CList`
   --> rust/kernel/clist.rs:280:56
   |
   280 | /// Create a C doubly-circular linked list interface [`CList`] from a raw `list_head` pointer.
   |                                                        ^^^^^ this item is private
   |
   = note: this link will resolve properly if you pass `--document-private-items`
   = note: `#[warn(rustdoc::private_intra_doc_links)]` on by default
--
>> warning: public documentation for `clist_create` links to private item `CList`
   --> rust/kernel/clist.rs:282:28
   |
   282 | /// This macro creates a [`CList<T, OFFSET>`] that can iterate over items of type `$rust_type`
   |                            ^^^^^^^^^^^^^^^^ this item is private
   |
   = note: this link will resolve properly if you pass `--document-private-items`
--
>> warning: public documentation for `clist_create` links to private item `CList`
   --> rust/kernel/clist.rs:297:49
   |
   297 | ///   unmodified for the lifetime of the rust [`CList`].
   |                                                 ^^^^^ this item is private
   |
   = note: this link will resolve properly if you pass `--document-private-items`
--
>> warning: public documentation for `clist_create` links to private item `crate::clist`
   --> rust/kernel/clist.rs:304:36
   |
   304 | /// Refer to the examples in the [`crate::clist`] module documentation.
   |                                    ^^^^^^^^^^^^ this item is private
   |
   = note: this link will resolve properly if you pass `--document-private-items`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
