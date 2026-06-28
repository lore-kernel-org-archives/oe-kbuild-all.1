Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA635E936
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782645566; cv=none; b=OjhQTbNOiGtSxxyRU2u/C+mMSU8jcBR5zw4BiVQS+g8Kl7+8FRE0LG331R8AaP1BzRw1v2JhkkFD37wHgDVJoeIR+KSiOJH+EdtpVrDrJTQC8QH89sarY11olcxKk6Bly6IOfeKve9WD7wTQnJdktgu8GuK3m43d9BTWDBv+spI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782645566; c=relaxed/simple;
	bh=CvPXvZXNobXJR+3LAMDnfpK4YfiblnrWEw7EYpT6b8s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z7o4KYNlVJEaPqjtytN76vshtLmOdI7nLgCAb7Xo8HoZWfaw0huGcA4B/ICPq3ZqUFgIprmNGRxQFKYnsJU1X7BiM2mvKzu3V90Dwx/rf+9mMxnAI+YFuqG8xtbZSAmO7EDTBy069gLtnvoWJ1k1RlrGcF7HgiFKq+AZIo44gCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZSDufSl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZSDufSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782645564; x=1814181564;
  h=date:from:to:cc:subject:message-id;
  bh=CvPXvZXNobXJR+3LAMDnfpK4YfiblnrWEw7EYpT6b8s=;
  b=RZSDufSl6GybiG8y6Yw81vARp1p9fQ82B9BCQkI8MbZNC33HJFpDgnav
   +7DEDzIWVKcFwzyBqen0mzfOmqGkMQEUD8j9rwrX/MitfUeSbVYPp6WGu
   ft23du7oQkrttMWghkT7uaF9h4070fpOSp20ilWMrys1233kw557ntGIy
   lYzeiJfPU6tscreGB3jqw94Lse9S7ODDLcdS+PmO77UVmTWcxKlBQfaxI
   AeYKh/VrBbbXTOrnojeGdl0kKFluA8FDzSKfn1SJUIS+s7UE8qkA/pTm6
   HqiX/iJo9fKRTjtJMLksKWN62GmhzdN0H3gE1VIDeT5UeWa58h8yMe8wb
   A==;
X-CSE-ConnectionGUID: zmIaGh5BTRipm9lh2DXGmw==
X-CSE-MsgGUID: +lkK1WohSMatgmTVULDncw==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="83392564"
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="83392564"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 04:19:06 -0700
X-CSE-ConnectionGUID: ngYwKnoQQIqNGlOe9zXlBg==
X-CSE-MsgGUID: 7mq9YUE4S1CMjuPqDIHMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="255676684"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Jun 2026 04:19:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdnXS-000000006ID-1UGP;
	Sun, 28 Jun 2026 11:19:02 +0000
Date: Sun, 28 Jun 2026 19:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/bbr3 1/2] ERROR: modpost: "__udivdi3"
 [net/ipv4/tcp_bbr3.ko] undefined!
Message-ID: <202606281944.KVEiIDL7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/bbr3
head:   8d91095085b245c305f2c1d0bde3bd6bc9b00b8c
commit: cee5ff73d51985d6b1f914fae2312ad1af564c2b [1/2] tcp/bbr3: add BBRv3 congestion control
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260628/202606281944.KVEiIDL7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606281944.KVEiIDL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606281944.KVEiIDL7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [net/ipv4/tcp_bbr3.ko] undefined!
>> ERROR: modpost: "__divdi3" [net/ipv4/tcp_bbr3.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
