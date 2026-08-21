Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C648BD51
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 11:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312675; cv=none; b=PF8YnZ3sg8uSbBdVgU/bDu2LlgdSEHr5WnQUWVwslzIGyMSxDIDanpuKUaayTSgqv01sFMGTDMEwU3ZDD6lCEaUU2EZASVZnUFqzHKzOmiU1rZ8nJ7N9aflpxlX8vYViPf/z4heGeMgi6XWu14sEOotFxiMvw+KnY2B3WbqSW+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312675; c=relaxed/simple;
	bh=uKuefCGjQsaIblgTSTSNh0IUxsoBQGgnxNAyaJqMMlY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EV5VV4n+ltP7+eGjy6LWXxKcRlV3nbtXeGLIiRUbajqv4mNQInBPiPACMAj9B2Nl/7B+uEaRbhxc0dpPsjrWET/XLAFU+pyFG8mFXlV1EKUPG5k9lUo2O7h/ckIQwpa8x+ZaERXpc4HEE/ZZcYe5Q1QqZUjwJ6xhajqhX3uVTA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIE9I8ow; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIE9I8ow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312674; x=1818848674;
  h=date:from:to:cc:subject:message-id;
  bh=uKuefCGjQsaIblgTSTSNh0IUxsoBQGgnxNAyaJqMMlY=;
  b=jIE9I8ow647wfdzkjK9JB92qK8wq4FRumA9fgrA6L0HTrAYYVwKsE305
   vcwBs1zh/s+ue0kv6gFDSQFRZB6hIsbctgfDYRbtVx4IhV2YZTPcadNdg
   vnX08gtbaSHA8qVs1guex9p9HXyoJpsOEZEIzOwCj6Jyvg+1WRhU6+YXK
   mQeTTzcNH3KMab0jPEQfyCm1/QiXTeimcnM9dESNO19r7BNAMtCveb+D0
   Dpe6nTpV4c+hgQjjPjl5XFQfHbRqnCxP0+CGrxycw2nCbDEM5Tj+fGlWZ
   wRXqOwjJSA4SO0QPwWoAhMEGv7dmOnRf67FshRMWkH+mlg8FlyNg7q4md
   w==;
X-CSE-ConnectionGUID: 6j6+NcyyQ3+mYt5ZRbMM4A==
X-CSE-MsgGUID: Gt1Ws8qaR9+4K5p1MNY2Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="86979676"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="86979676"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:34 -0700
X-CSE-ConnectionGUID: AVYPIuHsSpmb3PHjAa7tnQ==
X-CSE-MsgGUID: QiMwYZWOQMOtCuoShvea+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="265816484"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Aug 2026 04:44:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxNfi-00000000ppB-14gW;
	Fri, 21 Aug 2026 11:44:30 +0000
Date: Fri, 21 Aug 2026 19:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/node_features_v6
 42/44] Warning: mm/page_alloc.c:7700 function parameter 'alloc_flags' not
 described in 'alloc_contig_frozen_pages'
Message-ID: <202608211959.ah7eprlV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/node_features_v6
head:   38c7f48162aa282dc6a9edfb7011378594057c10
commit: e349bc96af39536035720fe607b05fc4cbd269fc [42/44] mm/page_alloc: let a contiguous search target a private node
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260821/202608211959.ah7eprlV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211959.ah7eprlV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211959.ah7eprlV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:7700 function parameter 'alloc_flags' not described in 'alloc_contig_frozen_pages'
>> Warning: mm/page_alloc.c:7700 function parameter 'alloc_flags' not described in 'alloc_contig_frozen_pages'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
