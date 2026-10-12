Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A32D7386
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 02:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791771357; cv=none; b=cW7Bjbc2rEv+8e+68XeGXVP0tEj7qniiEggdZWUi7ScWIfFLZZAfXIUjoP+PO639KLMCP8bxxzV8Sor1ui53fBcaRDwMjh7DUD+chsNQLSDQtdK2yDg8kfqBGfsakGQGFtz4Kj0fhn8hUvRW/VBgi2fahTWuBvbkH/bLWK1lmks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791771357; c=relaxed/simple;
	bh=AE+aMCHrU8wXIxqWxG4RdnzBvcU9Fi45thM6BAjxx4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sw1ddZ+H2mxMaoltSkg74sZAf9zHDh4wnGI2fKG8KcJ8rHR6XJZXMrlXN8pywpquCUX+v+3vaqKgQp10bXZ+X1XnoPngxkMsEzTPWBOlJC0wm/x8WyH1ksTmyarJF0QfCg/nE9z7Ro26MaKjHDFCGihxOLq8G/8C/1kspyO3MA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVpO1Z3Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVpO1Z3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791771357; x=1823307357;
  h=date:from:to:cc:subject:message-id;
  bh=AE+aMCHrU8wXIxqWxG4RdnzBvcU9Fi45thM6BAjxx4k=;
  b=GVpO1Z3Z7Q8f70kfOW5mEHsdcNKRJ+3TQbjpjOflDsDKeEMe0OIdoMNC
   WD8BEDH/PEdW/85prFW1/+MO8tWOUUWMON0yXKQnd2aUaFvtjPe/hc7H9
   //PUV/l57gJ75bNr3WUEgNpZC1SUsCsa5WKoUO/b0fApTBGKnfUNDEkNB
   5NU0gv/o2HCjO1VWpvo06luCX7on6ORzY1uy1nPDszwvZTfJPbFWyBB8j
   0kod/60AqvKeORmVaDrRUljRvVELkuazBmQi9saqNDS8W64iPB5kLcbJ0
   6JPkY2piiwsgfqDZwgjeWfDNKh0dtep6Y5t9OPoyfIPu5v6hn+EkEaV6V
   w==;
X-CSE-ConnectionGUID: fmMXe+PjSEK62xgZL+A75g==
X-CSE-MsgGUID: dCuimcZKThWeHy1IOna8QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="361430"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="361430"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 19:15:55 -0700
X-CSE-ConnectionGUID: LvlwwF3gQRegq9p+cbh+fw==
X-CSE-MsgGUID: 8TOwGLRNQQG1tQEr+MDBTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="707876"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2026 19:15:53 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG5Zu-000000009oZ-3NW3;
	Mon, 12 Oct 2026 02:15:50 +0000
Date: Mon, 12 Oct 2026 04:15:22 +0200
From: kernel test robot <lkp@intel.com>
To: Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:kernel-7.3/main 131/167] Warning:
 net/sunrpc/xprtrdma/verbs.c:908 function parameter 'gfp' not described in
 'rpcrdma_req_create'
Message-ID: <202610120415.fCgM0jYv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/main
head:   790d686a2be11b8bd1a028272f63bd49da1f7666
commit: de2e6b7a514cd0c25402adcdbb16eaa1c992c98b [131/167] xprtrdma: Allow reclaim when allocating a transport's initial requests
config: sparc64-randconfig-2000-20261012 (https://download.01.org/0day-ci/archive/20261012/202610120415.fCgM0jYv-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610120415.fCgM0jYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610120415.fCgM0jYv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/sunrpc/xprtrdma/verbs.c:908 function parameter 'gfp' not described in 'rpcrdma_req_create'
>> Warning: net/sunrpc/xprtrdma/verbs.c:908 function parameter 'gfp' not described in 'rpcrdma_req_create'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
