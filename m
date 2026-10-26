Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050466;
	b=17nt5SXiuU0qXd0ILKxcPTfjnvvunvaHuJ8TPdMcyj2CLhNQIQR0FDa0AvZviEhM4wJ6
	 bFUaeRm9+LwbbBBJ6MEwMZqARH/Tu2c+dS7+/Oe95NejyGxlSzUhdiEJ5lkEaIld36b2z
	 G9kx703X2VqEJRc1/5mmSZe0gvG4KtrR+jjxirNZd8QemDHyGlvlnY5QxGJvhaNEtS5H1
	 zT6uNBZud6FEwbGPbU/dxPmqoQvnDeNBePaqOLm5UIIP6os9kyGt3fb/eKLXjO5n2hQIJ
	 fJN2YFcPZLylfmyJbBD+3h+wrvJrqfudcVJqDTDt9WoLAejYoPzEDfltEp6tGxHw4Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050466;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=HQfKZJkvXIyx5POLX86OCrV9qSBFFNSywvhSKEux6Mk=;
	b=SgjsrCffqvUKwI02A9wpsm+qJjXe6XT1iIdIyAZ/qVYkKAYdrnQ6xnxRGOOFgoytYw/q
	 tmhSyN7YH9D4koqHBaNLB5LAy8z9aF9kIc+ysge3XzYISDKrZJK57U6mDZvav1s1GI4hW
	 rtrrlFmej6TmEgNZfHQBq4XdV8+jDLVIvyys9nsSlWyQgwO77tEOZKjK/yg+y4OZC6QSx
	 lfJV/lJKdqKhjFSZDqSrpNA33mWlqpFoz+VES3GwCp5WrrHre75cN6Or6xuLRMj92Zwhg
	 zWHCianOEp1mSZ+yxZK5QGkwVi/vuToKxG6YVbwDTlibxKiz7oSZCnc9t5RH3aOh3Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iPp7hGNw;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5DE606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 21:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D5DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iPp7hGNw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793050465; x=1824586465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mXt9CtYwyEqSs5405StSJDEF5YaNHya6u9GrK0WY6Ik=;
  b=iPp7hGNwUMcVgXUtsZHWif21mCKtMzW7hvFO6Dfw3NnPkNoq6fWzVM7L
   vbm5sk9403T1BQm303O89Yvbw7L5yFCyk2U9GRXG1zLVr+P3aN4ycIiBX
   Q8WzHUJLmsv6TwUYU7kEUGq/7QwAsvwwSAMzdApQA9Pn9Hsqew8c66i9H
   TBUdoMOuq2ws7xQCWJ67juAXMN545KInLtIHIzsU0BL690hHOqFBao3FZ
   aZKrLFKNl7hugLC3N7Y+4Ek1WH8NkT9mYsdKBviGzOtsSrlSKQFD555e5
   pUX3w+0RtGJWvVrolL+efmDmYln+aCPFm9fHu3lUechO0V6LWgmf0vBFH
   A==;
X-CSE-ConnectionGUID: UpL3Y4rUTAWZ6N1ygc8jlg==
X-CSE-MsgGUID: Qk3L2rrCTeOP6Ko75IrguA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1620076"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1620076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:34:25 -0700
X-CSE-ConnectionGUID: EaDQeEQYQG6tVvW0MUGTQA==
X-CSE-MsgGUID: uVn1PY8bTkinI0X1MrKz8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4482786"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Oct 2026 14:34:24 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLSKi-00000000WVH-3v3O;
	Mon, 26 Oct 2026 21:34:20 +0000
Date: Tue, 27 Oct 2026 05:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>
Subject: ERROR: modpost: lib/lz4/lz4_compress.ko: symbol
 '__divsi3_table' undefined!
Message-ID: <202610270503.NGox5O6j-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21a7f44fd0765fcc5194130b28767786eba1d1e7
commit: 2180d11e06fb56fd13643ae59964f144896870be nios2: ksyms: Declare __mulsi3 export
date:   7 days ago
config: nios2-randconfig-1000-20261027 (https://download.01.org/0day-ci/archive/20261027/202610270503.NGox5O6j-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270503.NGox5O6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2180d11e06fb ("nios2: ksyms: Declare __mulsi3 export")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270503.NGox5O6j-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/lz4/lz4_compress.ko: symbol '__divsi3_table' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
