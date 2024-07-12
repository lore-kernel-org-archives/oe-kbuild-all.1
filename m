Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE981C8C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720754527; cv=none; b=JVASsgaciZlQkgGmDOBvUJXq87R7Xdkh1lH7Ga2Lbcv/Nv9lYg8ZBt0NfGtWFnv4A31NfhkQrknJ6+8zzJq6zLPNmxi8PkRhAdAuustym7zZsw1gHqkQIxW81XTWlaSh8an7AsDs7lgElJXhNzy64Es1y6y0UEqhiOrcE3kN9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720754527; c=relaxed/simple;
	bh=AnCL4iWoi92MAGUQJMJC6wnIVCROAMbzH6phHry9Vxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ms70C9Lv/mOd11CY8VzYAuDZ1PboXEpddhjUdCmRtpLy/A+vcum1GbUIGUJQMAmcJruZnTqVP1QYXx/OWcW+XRo0q/6eAkD0/s86/pR5UfnvHcnhxVwXy2zJGXO2co+g9UUKJFSjwyxQeqVymyDXN3XLC9cuEePIpcRg1x6AwWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzpdAUY5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzpdAUY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720754525; x=1752290525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnCL4iWoi92MAGUQJMJC6wnIVCROAMbzH6phHry9Vxw=;
  b=kzpdAUY5nwIcpq9O3BFqQavTnSDzMt61yMrYU1j9cpIMyzssqIR/j/zc
   oa62q5u3QcDyfwrbNImtWZTonuVGUJWzDHvao5YIu3TpL+kPKmlH7Ig0n
   gDqik0l14NNkmivR1aPmQf6KiOWY+wiug0r1wvAKVFxFlPpNcfkY9UaYL
   hFJwfXyhRjXgQkYmVhLTp/LPTndSs28UK3xJ39Oj4t14wAWUheTdpkzco
   X+auRdkqSEQjjc+8O8g3+QPFdVWKyG8OqVM69RRwOkdrZozJBrQ4x7jmU
   Q0/Jjjg7OSyNlrt1k8fZLlr2upFLQi2J4jjnDZHnCSTXsVs6kcdSysMnx
   A==;
X-CSE-ConnectionGUID: 5DVqiF5fR1SUyqMsaggskA==
X-CSE-MsgGUID: u/35azgKQ2+s/q8OzrBUgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18296470"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="18296470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 20:22:05 -0700
X-CSE-ConnectionGUID: i0pumumzS76vJ3Bl8XZPdQ==
X-CSE-MsgGUID: pXBGfgaaRsyXjvWGRrRylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="53614314"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jul 2024 20:22:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS6rB-000aIQ-0V;
	Fri, 12 Jul 2024 03:22:01 +0000
Date: Fri, 12 Jul 2024 11:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12508/12643] ERROR: start_text address is
 c000000000000400, should be c000000000000200
Message-ID: <202407121159.Djj8V7io-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 37c34bb9e957411c48734d722bb33114835d70e1 [12508/12643] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
config: powerpc64-randconfig-r031-20211017 (https://download.01.org/0day-ci/archive/20240712/202407121159.Djj8V7io-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121159.Djj8V7io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121159.Djj8V7io-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: start_text address is c000000000000400, should be c000000000000200
   ERROR: try to enable LD_HEAD_STUB_CATCH config option
   ERROR: see comments in arch/powerpc/tools/head_check.sh

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
