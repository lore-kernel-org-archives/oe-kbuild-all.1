Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787944E021
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547021; cv=none; b=d+9eZqCi1vP7POvHCukk/QKQVC4arrrn/AxUDjF0ZnTnKaZSejEK6jVoGamUduoS9a7oPUeLO8bTPv8s/cBJ0XAWWJrsS5hUfwyQteplduD8WX2GYHWep9gtjseWZQfOMiGkl6QqQeh9snX3TGoPUE637NX3LZjX6eCXsUSjtJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547021; c=relaxed/simple;
	bh=DEmFeuVyqwlp6ZTFguvG2qYmmMJDq1BWcIPjqyBTbkw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JRnFGBahCBsllGG3EZqWzey7+TL5PvRWm6oo8Jh/sDE0qYrSRRal1Xjrt3EdOYKaHy8lzde/dMCz8vQ5FTHa3tAD7ECpd1YJs8UswVKSjhJhply6JhvUVD0OKemWgTIHNhV3HlqEVBnJHFxsII7J0nwuakgbAmm7psHwpFv7OKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juAZPNBw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juAZPNBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791547013; x=1823083013;
  h=date:from:to:cc:subject:message-id;
  bh=DEmFeuVyqwlp6ZTFguvG2qYmmMJDq1BWcIPjqyBTbkw=;
  b=juAZPNBwEdNHRrUd7NQLiUyUU0OJGlt1U7U8Zmky9AtEkDbmqkA7dHxH
   Q9gSo0aYGhGxbuj7YI+QyKLVoVXb+bx92x+yyD9NiWxgcaCR+KtpWHvKB
   ngB+pKfn2E65MhyfBm/F0ts45SHyS3KOZbHH8jLr3inPo+OcUN4dQtGuk
   yod7H8ryC094+G3Ro31JqZ9Y0sOqQAhUcRujRsBvu8INM5NsaLdWJJqio
   IPjLm2Ydu/SbwiFM/SfUzImI/dVFMyJlJJBrz10jQOG+IEgDldN3jTt18
   Ay1XYXXA4gKB6KiAKK6ykLTgh8cyTZrRbGwFchHf1o4yxH5BKWnVq9GBW
   w==;
X-CSE-ConnectionGUID: WDJVHWbJSwyDxPeOjVV6jA==
X-CSE-MsgGUID: qRweXAO1RwaxnfuNYY9QmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="351169"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:56:52 -0700
X-CSE-ConnectionGUID: PUuiWltASaCGRHnXK3OcQQ==
X-CSE-MsgGUID: Ko+RcEgwRmO/m4D/Bc4UBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="741862"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2026 04:56:51 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF9DU-00000000715-0RY4;
	Fri, 09 Oct 2026 11:56:48 +0000
Date: Fri, 09 Oct 2026 13:56:22 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp 27/44] undefined reference to
 `tcp_xdp_disconnect'
Message-ID: <202610091348.67GYQYT0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp
head:   82fde2d34c9c284bba8b2df97ac7f7ab34719853
commit: 9cf0ff35d7d930f7d54bc29857ae0f820b208a09 [27/44] tcp: Send a served connection's segments on a lean path of their own
config: microblaze-randconfig-r2301-20261009 (https://download.01.org/0day-ci/archive/20261009/202610091348.67GYQYT0-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091348.67GYQYT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091348.67GYQYT0-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: net/ipv4/tcp.o: in function `tcp_disconnect':
>> (.text+0x15078): undefined reference to `tcp_xdp_disconnect'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
