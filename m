Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788870;
	b=jjONG67hzMD1YPEtbHl6q7Z02o96GBc80qSqOKpMRCrYMNX5ghk6jz0lJkY+Iuri8cqv
	 hIT/zC5RdmljLFrOb3uAe7b0Z9bmvmoGv6jsn6uYTTwDdubm6m0MpfBWatKs/PyjKpVPJ
	 OfsNvGIYTjvYJ/0mhCvbYEPpWbxeSZgSr5Yeib7D0KGkLi9bHbKM3T7AirB7SYTefA1Wl
	 bYr/xlG3xwTNB+L1Vb7upWDHnQtSh7uGz6Ocb47UOqOxuB8EgDo+0YZroJVbQQNYqLPQ+
	 rf+9F8fV+Wb92owaSnX4p/goW36cxNKzZFZMnNjmWJqImJ3jcK08bM+b+JSURI1oPyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788870;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TtiiaCFeqtLXGnA0GpTTu12dC+fDzVvWIjzSRct5aYc=;
	b=vkxhhdmNEpSiJBt0S0QGtpaRXxojhxAlcXUrTFL4JA3GS4AHU/rKFCJrnfVCZO5TOomI
	 Dsx+6ZbzLq1OCnqweHzc7cCsYUE7eEodOb9fXGB7e6NxvUv+1XKISDwHDvyGQ3Iyc2pjT
	 O4JKQXpDcvTkALEbd0weql0zJ9gsMiNXgUVgYnimsh4mgu4jFIjpnCn41A6o9/Y8MmE+5
	 e/muxcuzx6NZvbFTVMyEXrcLj9hoqkQ+s7m1D2GI7ieA42C8GWWF0rOzTrzfS6e98+wKS
	 UGce4DEJ8Mo7YXbi26EJN795HKlVb8MLo3Nopdn7lrnaI1tZdTJcaP92pW39KSVW7qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RmWy5+XH;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A773606A329
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 00:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A773606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RmWy5+XH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794788869; x=1826324869;
  h=date:from:to:cc:subject:message-id;
  bh=Ls/0rd3AhZY4FetIF9ozeDQ7xvACYQetDnnTkuy0/yY=;
  b=RmWy5+XHmjj/SqXSYjRCCxI4SkkVt2aYFAvFZzuhtSxspKF/d5eVf7PH
   ZY3z7n8IUQWb7Evcbfnr6uzQohKwAlLvXN102hGRHu2y+flNlOM7EFc3x
   SC+wVbcxws9qMeNPVEzVQwTOY22mFNovk8lSiraIb++ZumrlH0zsb5Sj9
   jbXOhvoC1i44pTo+n8wWWt/vqYf46HvTRCT6Bow5lW9hAFGApI0XKLgJZ
   85FJ8nK+DKv03gjN4hJsKGNg4ROvS020xGytDvLk4KCqwOwbGPP1yID3H
   gl7k6svAJzH3zLPXvu9jhXw5Ph+bFJBzBspAReGiBGB0usa7XTtcpI38t
   g==;
X-CSE-ConnectionGUID: 2WZO4XppTUCaJ7U/Yxq4VA==
X-CSE-MsgGUID: x11Sqqh9QqeBm5Ww/W8h3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3507241"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3507241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 16:27:49 -0800
X-CSE-ConnectionGUID: TtsVxioKSniRqVN26etQQg==
X-CSE-MsgGUID: 6Et6NeMgRSeAf7aim/SxBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9742699"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Nov 2026 16:27:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSkZU-000000017UO-0S06;
	Mon, 16 Nov 2026 00:27:44 +0000
Date: Mon, 16 Nov 2026 08:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Nathan Chancellor <nathan@kernel.org>
Subject: sh4-linux-ld: drivers/media/i2c/tc358746.c:1607:undefined
 reference to `devm_of_clk_add_hw_provider'
Message-ID: <202611160836.dBWEJOjI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Arnd,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa2933aac170dd19c6a7f0d7b81a8f537e40915c
commit: 94bfc7f3b0c7c33331ba4ff6cc64ff309dfcbce8 err.h: use __always_inline on all error pointer helpers
date:   5 months ago
config: sh-randconfig-1001-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160836.dBWEJOjI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160836.dBWEJOjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 94bfc7f3b0c7 ("err.h: use __always_inline on all error pointer helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160836.dBWEJOjI-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   drivers/media/i2c/tc358746.c:1607:(.text+0x1f98): undefined reference to `devm_clk_hw_register'
>> sh4-linux-ld: drivers/media/i2c/tc358746.c:1607:(.text+0x1fa0): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: drivers/media/i2c/tc358746.c:1607:(.text+0x1fa4): undefined reference to `of_clk_hw_simple_get'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
