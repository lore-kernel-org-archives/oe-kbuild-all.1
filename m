Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F233A9C1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396804; cv=none; b=Y+WI9tVozvZdu4wb0ZssFNMLLZXyBlgui2JwHutS/oMe2WNgd7ucFuUbR3dj9hRHJrKEsrvSjR5FxpqtZKY1m9MYnuUjG/nBQyzmYByNeJ75DW/to6kE1np9Xd11MziR5Gcgn5X3t77gqQnUbRZ36zC5uD3PCn3Kk3gB+T+zd+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396804; c=relaxed/simple;
	bh=STDRuKOer+Z0KSd8tKc2uzmqgYHb4grjDjhvXxiYS/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ehItxcJ1nJDRQ7dtDcEgR03rRQb0s60q++RiGnFbwWInz3todGH4XCYFzUoJ7FOC9/XQjcHRE+1cViabVfze+k+NIKWV30lPEZxpZxXTJS8CPE3LSsu28wROe7nXLuMNGEfRr7i3MRaCIOcFH+sUP6Gk9+wCjL7coOi2292kBI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIWfVJVm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIWfVJVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777396801; x=1808932801;
  h=date:from:to:cc:subject:message-id;
  bh=STDRuKOer+Z0KSd8tKc2uzmqgYHb4grjDjhvXxiYS/A=;
  b=JIWfVJVm4Agg7h4fjGnP3/OfSSn1BooRMAoz28lJWJlD2CeZ8VaMdPHX
   oVNf8/ubIqFisRwGAAPFB+/mU/CNV30ZzPnmiVUi5h4Q5WN/KFOdaWBYW
   B8Ur1RfRCBOiGLEToXn7ZAEvdml41/nkP5kGFOnuIM8JsA0bMPI8PoJU6
   hLYlwdBndTsT8tiIl6kcSzVikFTnLtSblHgqJd/9hG0AURjFj1Bb0ij7J
   QuwSNQzx7Aw96+Itc4T3pWWWloj+3ApnSZZusBsz8O/XVAfDgLxQVTX1B
   mfkQGvKIKSYbyXZPLSVX4MX8G4A7K08KbHelPUjV5ZUXj+2iafAG+OAmD
   Q==;
X-CSE-ConnectionGUID: WjlBFa7CTum1JNkLNDwLAg==
X-CSE-MsgGUID: lRT3Jfn9TJyLuTObk/ZODw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82169876"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="82169876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 10:20:01 -0700
X-CSE-ConnectionGUID: i4jIH7msTCuR0dZ31b6S/Q==
X-CSE-MsgGUID: p79tE3coQlO9qvgBvna0NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="233977060"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Apr 2026 10:20:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHm6H-000000004IX-1yBK;
	Tue, 28 Apr 2026 17:19:57 +0000
Date: Tue, 28 Apr 2026 19:19:15 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-fcrypt-pcbc 1/5] ERROR: modpost:
 "fcrypt_preparekey" [net/rxrpc/tests/rxrpc_kunit.ko] undefined!
Message-ID: <202604281915.l6AcOXhE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-fcrypt-pcbc
head:   1971e4c9b1055d6615f079670a73dff1114cacc6
commit: 0f0435e595f1299562a92f035604ea65f1aae1a0 [1/5] net/rxrpc: Add local FCrypt-PCBC implementation
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260428/202604281915.l6AcOXhE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604281915.l6AcOXhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604281915.l6AcOXhE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fcrypt_preparekey" [net/rxrpc/tests/rxrpc_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
