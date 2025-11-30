Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676A82139CE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 03:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764472304; cv=none; b=PRo2QXNr54S4pFF6o5ttaPXLtl6IaXeRGAPfgRk5AqDBnHJyvN3An0GnJMug4xXVKJzTaMhJ7/R2idm4WwJCCPJvn5URC31QKIc3JbTUGC2iTDdozqpIc/1W5yeo0aPAvGXqTAujsR2WgXiyQAZjwVGea9KZiN5MrAvgfGY8QIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764472304; c=relaxed/simple;
	bh=4Z/X47VQk15Bwd25cxNXF8L+VbKl6k3hvCeWHWo+IKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ITX3/P3UleADCvzWpv5HtqGwmNulr0Zb6dD0IfbbKJ0oIoi20gxdvfth3qw+KX7ndSBqusGnnExrxpGM65iIPfCa2wmTxqodRu1pa5zDtGmkwIN44F2kDml/6fBVBnTaQMw5y0+mWqWvotEob4PjibZrOVngXzxpzmLx1HAH7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hza/aCMg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hza/aCMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764472304; x=1796008304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Z/X47VQk15Bwd25cxNXF8L+VbKl6k3hvCeWHWo+IKk=;
  b=hza/aCMgfOtsrw2oHqxr0JvFBn5OzE+qYToUzIBgaXu3HnY8p7EE8f1e
   h1nbaucW9D3zkYibHRHhC7lFjYxiMlCqP1c6L3jOMVZpJ85N789g6EclD
   ZZPJrDsofMUamCImCb7JGd/oDRXc6A/SuXe9P6IUs6m+bEyzE7GE5rJHG
   SshY5Ovv7/7Bnf982B1+8ERKgN0T8vu/XbLQIqUyFAJ24EwAn5B/81dMo
   zaWq+2RqGhP31EjDSEcME7MmmtesRZYEyA/SpLdSD5cnfDGqYbZJYdb+c
   ZvBwx8gfYuwPeKTbP1Y9ARWY/ImQgSX3oKhdPsweWLuGzcXuaIyn8uu4j
   w==;
X-CSE-ConnectionGUID: /SNVRtP4QxqEFv4CHW7KYw==
X-CSE-MsgGUID: 4rWE6qLvQNCMZdsOEfpGNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="89090391"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="89090391"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 19:11:43 -0800
X-CSE-ConnectionGUID: xnmNuJbxTjqpbWlNRgu2qA==
X-CSE-MsgGUID: vG6BIaGYROGDwRE58nk2Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="193552313"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Nov 2025 19:11:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPXqd-000000007kD-0EdU;
	Sun, 30 Nov 2025 03:11:39 +0000
Date: Sun, 30 Nov 2025 11:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lyude Paul <lyude@redhat.com>
Subject: error[E0609]: no field `compat_ioctl` on type
 `bindings::file_operations`
Message-ID: <202511301150.yTtGf0OP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bda50f4333fa61c07f04f790fdd4e2c9f4ca610
commit: c284d3e423382be3591d5b1e402e330e6c3f726c rust: drm: gem: Add GEM object abstraction
date:   7 months ago
config: arm64-randconfig-r073-20251130 (https://download.01.org/0day-ci/archive/20251130/202511301150.yTtGf0OP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301150.yTtGf0OP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301150.yTtGf0OP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `compat_ioctl` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:311:14
   |
   311 |         fops.compat_ioctl = Some(bindings::drm_compat_ioctl);
   |              ^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
