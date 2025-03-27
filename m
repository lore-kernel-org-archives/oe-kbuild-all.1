Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A2620E330
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070564; cv=none; b=MyAw2+SZlUtNpmx1n/ypMnFkIXawNSE2tWBvcnr+n+xm+Ru2trhrecMjl6w6eqMo7Xkcasw1DMRaBVVvKfZhUNxTI5+AqsWllrYHoROTSz0AoAcj+t6/q7FE0po0Y7L+CzJIIIL5LQwrcrmshkoFF0H/Y7JMueOQBWFWUSTEk34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070564; c=relaxed/simple;
	bh=T4oE6lsD95XSeN1VYehoEOuLbeorYyoujifHj/gbWL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRJ5pb/OflVcYC4XfhwssBb/Z/Oh5QN7SGKKVR5dBhTuMW+s36MyFhp7Q4a1b18CPpJoc3Fdq8ky7jtyMSb1KCKXOJ3xRUhjkh3dU3ceF6sRDsTUrnMCwiZ3YH8EjRqCo0aiWdlUTUHc2SCEivqVeDUwa6DLAKnX2sYSwBpyewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joRvx5sv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joRvx5sv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743070563; x=1774606563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T4oE6lsD95XSeN1VYehoEOuLbeorYyoujifHj/gbWL8=;
  b=joRvx5sv/KdpRMTMJULzRMNvxN23dhnpGpbbnJMBW++crfOwuwJFyEUf
   wDUmzznbTDDkeyeiKoiD1hQYHArlYACREHkJiIKlBEZ+nQj5LjxRPyYQ8
   ZmGBnQWlMDwNq41vV6+Q1BXiXeYf0Y6BndFjbNc7nSsc7kzLC3NzGgRgv
   +9x3JwB6MfK1R6y1dAf11YlBuEM9Ixm2+W03x0cpAfUWkNVXjqBWs3ASd
   NcXw8yinvi656+xLdvh9Gxr3fqzXF0LboxIySNKP//bgKYQkRBEs/U7YV
   lPVbCQXpDPZiameEo7wIPNKyRF95zYDqCNeEdv6eIKv/GVPvSJN4/e+qY
   w==;
X-CSE-ConnectionGUID: Bzw1GyW2QbiX2o3qpAhEIQ==
X-CSE-MsgGUID: lhPO32QaTfKz19vvoXtiTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69755620"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="69755620"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:16:02 -0700
X-CSE-ConnectionGUID: zQiKb/+CSeikO09wQTD49Q==
X-CSE-MsgGUID: eelSXSr0SKaN83CokddREg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="130189393"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2025 03:16:01 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txkHH-0006ZL-1a;
	Thu, 27 Mar 2025 10:15:59 +0000
Date: Thu, 27 Mar 2025 18:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1520/1520] arch/x86/entry/entry_64.o:
 warning: objtool: If this is a retpoline, please patch it in with
 alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.
Message-ID: <202503271858.j6vJ9Bhc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   69d39b683755039471781fee8dc7ed96952f771b
commit: 3acbac72baea337e0ac79801a8ba4b81e3b67014 [1520/1520] x86/speculation: Change FILL_RETURN_BUFFER to work with objtool
config: x86_64-randconfig-161-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271858.j6vJ9Bhc-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271858.j6vJ9Bhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271858.j6vJ9Bhc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x1e1: unsupported intra-function call
>> arch/x86/entry/entry_64.o: warning: objtool: If this is a retpoline, please patch it in with alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
