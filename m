Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A672FB0A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764976056; cv=none; b=kefZhFkTYCtb+Fwp1o+RQQvKHpSufZq9zIbky1FCv0u6YRjxED2UaJ85MClKpJincgy7zP7znEi9bZSunzHVgJIgjSY8VCz5N99cwIw+Z2bzy7wvdzsnJyxOhqTWsBVfR00/v6ucVgP3fPY7ANppyE+nfetgq99FiWYirn7MOnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764976056; c=relaxed/simple;
	bh=QcdQOXqE4eHQoSEU3tIIUnJ3JoPha88JMhWj4dw+o/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVGcjlDzww/Z8hwBG/58gGe6dq5NpTd3PiprRUEEA5L9Xc1mzQttgkYBSLGUtNQ134EY5hQ1JLTSk11jsnkpWKzkvdpct1CaBTY8wfvlJJs7zbPmrN1M4rxd5xiXqdtHADowiibezWo42E5T6zguokmERaYQubvHuvxutpm18cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUDYZOyC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUDYZOyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764976051; x=1796512051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QcdQOXqE4eHQoSEU3tIIUnJ3JoPha88JMhWj4dw+o/w=;
  b=cUDYZOyCTSKJ48668OaHsF00+mhQA1gP7RAUHNdeODHlylBROSW14aAV
   PwCjMyHAR7PTkxM8lcRvKn4gfEgagxTmZqwkmMgRFdtxD27+mFLtE/Wdb
   fW1jEnRfzBBBcy1wJ5wEdxLTCWK7G5/PCSII1/6GDy/cDBSW5zBHG9LXw
   06cZ9TGA80u1WaGY8jigr/WdQgW6h+8PHTdEEpSCRsCOKAR2UjACIWpGq
   NOyfRsEzvBmlKADDVNwVNwhMtZcMkwZ7nUEvAv1f/1mBRrFNYBzGZkTlp
   nJVFBuuA9hsE/cR+2JLOLO/hKJGolQhdWF5OxeAvsAGslCg6nzGIyf26l
   A==;
X-CSE-ConnectionGUID: /UgVWD9KTZ+WCaMNMOnwlQ==
X-CSE-MsgGUID: JOYN5BTpR1S0V4ewseYg+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="89668518"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="89668518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 15:07:28 -0800
X-CSE-ConnectionGUID: cqKaiW5LR2ulbonbj+Szzw==
X-CSE-MsgGUID: vV3+oR1gRz2j66EYjJ5Z7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="226065045"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2025 15:07:27 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRetY-00000000Fe1-3jtA;
	Fri, 05 Dec 2025 23:07:24 +0000
Date: Sat, 6 Dec 2025 07:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 435/435] Warning:
 kernel/trace/ring_buffer.c:2674 function parameter 'writer' not described in
 '__ring_buffer_alloc'
Message-ID: <202512060745.whBSw5lX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   029c3b29942fa7c9965736a5ab9030f41c9c02d3
commit: 98810c472d88f4a8fd352ad1549f2e9f34d827e3 [435/435] FROMLIST: ring-buffer: Introducing ring-buffer writer
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251206/202512060745.whBSw5lX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060745.whBSw5lX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060745.whBSw5lX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/ring_buffer.c:2674 function parameter 'writer' not described in '__ring_buffer_alloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
