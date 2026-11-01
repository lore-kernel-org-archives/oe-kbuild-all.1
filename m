Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565857;
	b=3+X/ly3o8Xt6MQQS1WNvL3wyZz9qpa0tFZFkCZx8nIAjkxiqIYOngQrppkCm9biHNQVn
	 sKX1qqz6mDRCTeQ3Pop1Q0cLNvoC/5my98XK2aT9RX040DWEYP9qC0UJUKHAKiRZ39E10
	 DBVebPOXQXL6gj7ZNeRj8LdITWmIb80lzj0CgKh27ldRaBAGAEsVepn16th1SwUEHzEg3
	 1R/DgUhpOpX2bYIZ3hj3Fn/hU71KAr/7tm0d2S8k+Vz07ao4tPapJ3Xd3Mlp1RCbFvJdE
	 nO5ns/otuCn8OTRRcgKV07deaMJW7KzoZLu99HQTqIX3mq3MPSQMDq2qqsohZr510Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565857;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=J1gawlj//TLUokAuojDa01ean8KAYWfRsg2n27H9Qj8=;
	b=sIsVgz2L1EV8rA01V3dOGvKGUKM0DWLcYyOMjRhLYvK/BxJhxjjdTS0shJCPofbRiLwN
	 JHsxOKyI6MAIQkGBcmBjrFY4e3Cx3xet+mcpV8AJJrXLHQCR3aiAZ1FAHQt6sI8XCEK1T
	 Q7k29cHQhXVrngTKgZZhuNM0bl6oIPTRo98SHMgXlBce0y4JZfGwadllaiN19GEKEIvJm
	 8IZsT/LrOUdGfHgywtO27XD208Fse9WrBEDuiGLjubl3Wo34codFNpyXRRE+rnCg5g7yd
	 YpaZV6VP5c/uHslG0igtbShill8Q0PQSDxdTwqHHgi3P6y31bCoG3zP8P1X0AGSU4kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GoLoBiYY;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05917606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 20:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05917606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GoLoBiYY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793565855; x=1825101855;
  h=date:from:to:cc:subject:message-id;
  bh=KY59pTyAUfBLHuwJvXmtXzBk4meawpqwXCiebMn+EB4=;
  b=GoLoBiYYndyK12xWqKino+AiDRtXXDXojQ2y+PDuyTu7ofIwCQXwcNvw
   sAEuI6WI8QjWzggWEMq9g9HnA2mddrS4GAllTBzaZPVVsU/pedZTix1DB
   74W2kAo/QwqurvxSLwh97cbrj7FrW9YVe7NkT5HfyGUFfHs9KvbXNyLNG
   ZO3lUn2jBAlYfhwA7wgP62eQBb28XhFfE6YEPlLme/gekqaULlRxV9yWh
   tM9MLLGtUWzLU0ffjIK1huTPsZjcwWy6Bd4HXnMIsKelQwabPS8B5wkod
   79WJB6yZrOwJP/2Mp2vbRX2OxXuKzUpTKsqef4WSkeCT2SqePK33r2Ohw
   g==;
X-CSE-ConnectionGUID: l7ewohbiRAaRy3CAbWPx6w==
X-CSE-MsgGUID: XURsxfF3Rv24QDcOkoYCVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2134890"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2134890"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 12:44:14 -0800
X-CSE-ConnectionGUID: 56ZzDfr5Q6uFAbhAMZ58og==
X-CSE-MsgGUID: usO+hRTgQdudg735LTrwBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5991817"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2026 12:44:14 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNcPT-0000000083x-1VpG;
	Sun, 01 Nov 2026 20:44:11 +0000
Date: Sun, 01 Nov 2026 21:43:52 +0100
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:dense_ulong 2/80]
 ../shared/../../../lib/maple_tree.c:69:1: error: static assertion failed
Message-ID: <202611012146.qEcOHpmA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Liam,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git dense_ulong
head:   15f16f9deca2a5bb8d438c9fee24947232c0d24a
commit: 1c170c8a83f0162c9aa193c1e940124a56717fca [2/80] maple_tree: assert the node size
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261101/202611012146.qEcOHpmA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611012146.qEcOHpmA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611012146.qEcOHpmA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from /usr/include/x86_64-linux-gnu/urcu/assert.h:26,
                    from /usr/include/x86_64-linux-gnu/urcu/debug.h:12,
                    from /usr/include/x86_64-linux-gnu/urcu/static/urcu-memb.h:24,
                    from /usr/include/x86_64-linux-gnu/urcu/urcu-memb.h:47,
                    from /usr/include/x86_64-linux-gnu/urcu/urcu.h:25,
                    from /usr/include/x86_64-linux-gnu/urcu.h:6,
                    from ../shared/linux/rcupdate.h:5,
                    from ../shared/shared.h:11,
                    from ../shared/maple-shared.h:8,
                    from ../shared/maple-shim.c:5:
>> ../shared/../../../lib/maple_tree.c:69:1: error: static assertion failed
      69 | static_assert(sizeof(struct maple_node) == 256);
         | ^~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
