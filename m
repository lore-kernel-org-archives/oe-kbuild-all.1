Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6F23D301E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271176; cv=none; b=bQvMkWPEAMb65NDRO9aeSrnkGC52Wevb7DjDGkhQuY/Ov0tGCN36LhGgWTIHpLiWQYe4kVshqHVO/RN6f4cHSNVyg4AeDGI0w7K4rdUhRmyPyI48UQFxKvAZbLtOFUPWu8jTjLebsUBVhpcaR0vtjmFte451tKTYUAkMU1KCXjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271176; c=relaxed/simple;
	bh=F2OV47L2w/ST0rEekMcGIjIF9kECPwyjboqV49evCrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F2RG570ZfdkY0T9ybfGXfRQOH0cmNzmnAVE3CEYiDO7qgwoZM61moagBjPyW9g9I92jZ2Wg0+8sZC5yXhe7EQBN11tm913i1Nw6JAmTYwdNQZbaDxKJW3V3ETXR1j8W4j7+6eu92Iaqqd84AnZrZmea/erIYjZTqx5oXa8CmI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgpCX+gD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgpCX+gD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779271176; x=1810807176;
  h=date:from:to:cc:subject:message-id;
  bh=F2OV47L2w/ST0rEekMcGIjIF9kECPwyjboqV49evCrY=;
  b=WgpCX+gDTN+BTyv93cJyt9AOw7YS6M1OIUrRKgb899oUbymn3S+cj0la
   3WeWVJVX9M4xo+vBkMFZRKFP1p6Musag+Ltcxl++F+vwb/4oooyAQd/6C
   reAzOa0hxFdGqEzVbbRAtgOeiL//plhbvEYXzlwyMwo5kL54xUyKlQX65
   qTZECWASt6vIG4Nez/t4XQzsJlDxZuBDCEFIkMNE45aNVD38pnt5zRybu
   ousS2hDDFFXvObmgBNbQcst3LfYFflBbOTiwhft9LyYYmiz0ooVKhTei5
   zzte9OkAp5Z85FZQnUBxaUSKtsFMu1flwD7r/FXNBFxp0PwD3oKQvf8vu
   g==;
X-CSE-ConnectionGUID: Qa2ALhPQR2KXk0SquNuoeA==
X-CSE-MsgGUID: Xiwlj1vtTaqBkfD5/Q8dVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91632787"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="91632787"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 02:59:36 -0700
X-CSE-ConnectionGUID: McN5gAmiQmeyExyeBMFtmQ==
X-CSE-MsgGUID: BV5K9RnJRvyrcHajnYCcjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="263909848"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 20 May 2026 02:59:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPdi7-00000000AVt-3i9g;
	Wed, 20 May 2026 09:59:31 +0000
Date: Wed, 20 May 2026 11:59:20 +0200
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: net/netfilter/nf_conntrack_core.c:2427 function
 parameter 'net' not described in 'nf_ct_iterate_destroy_net'
Message-ID: <202605201150.erOHDrhO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-conntrack-add-dead-flag-to-helpers/20260520-054216
head:   ad36e574200729e56f39ea0d92ee92b376159a62
commit: c9e0857969650e50528b92b2255efd13b22a84b5 netfilter: conntrack: add nf_ct_iterate_destroy_net()
date:   12 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260520/202605201150.erOHDrhO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201150.erOHDrhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201150.erOHDrhO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/netfilter/nf_conntrack_core.c:2427 function parameter 'net' not described in 'nf_ct_iterate_destroy_net'
>> Warning: net/netfilter/nf_conntrack_core.c:2427 function parameter 'net' not described in 'nf_ct_iterate_destroy_net'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
