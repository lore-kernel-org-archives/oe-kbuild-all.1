Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A27305684
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250788; cv=none; b=bz4cbRWT03M9LCd0LoxGHKwTXWTVgnYH66/XYHkthMMCRrREYIpUUMEwJraH5Lv6C8pGwGs8CxX0i1Hq3lpQsOqvNBfIuw7oLaRJaRwHkRrmGO698cedtsT3tE774EXvtfJYVT7VuHYwmTKdhe+ok6wSzqFmy+XP9FzUYigSTOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250788; c=relaxed/simple;
	bh=qXOR7XQ5fDnDFE0l0vwIIFpvZRG3jiMwWcZpXX9yrQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gFf3lNqrtliNmNrJJdl9h0kF/SJir5RN+dVYxLV/uS2wgBwUKIWibYjqNmb/JKhHjwCKyLcspYqTfCx1hq8q2pQ+KrBKQJ1Z1hsIUKqyYpJW6iYwV16RnSbfWqzU0vU/2yr8QUWXVtKHketmYkOl1xLhMiKCV09rjhZI67pbFUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y97bmEvT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y97bmEvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781250787; x=1812786787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXOR7XQ5fDnDFE0l0vwIIFpvZRG3jiMwWcZpXX9yrQU=;
  b=Y97bmEvTxslKmLM9adPLWcniWMZYFi4isXYzXD0BcZORR+pS7oO7oi+T
   DpwrhPkhE1WLb42yQkX7WW8pbK2L7rXPrPSI0SC+LeL5150e5sr9mdMOr
   erOAU7cK8rQQ0slSQbas7VVoAJWDtcWIjNrVaQYFHJw7FZEoMz4ktCb23
   EGoPB15vrinfdYWG/i3Qufwv50/DAkz/Ipfm4D9jEHGs1SnscsPO9xkxN
   7f9Ul7eUfd+qcwhKx6YlMMJy9u7lYpxmOtnmbS5clgode6+AL7w9ClKgH
   P3dVKjdvz5V7zpqQic59mm5t9QP2LYO+IggLpWzDDM3ZQ6SZfLeAnR66g
   A==;
X-CSE-ConnectionGUID: IG6HnDU3RdG2XYokNUj0zQ==
X-CSE-MsgGUID: E06aA6mtTl6gDXRCDAWjRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82084011"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82084011"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 00:53:06 -0700
X-CSE-ConnectionGUID: GqXjVVQYToeWn8+DDWSppg==
X-CSE-MsgGUID: CVnKEaUaSvCaoSUGEyY/Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="270788447"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jun 2026 00:53:04 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXwhJ-000000004EH-3WN1;
	Fri, 12 Jun 2026 07:53:01 +0000
Date: Fri, 12 Jun 2026 09:52:28 +0200
From: kernel test robot <lkp@intel.com>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: oe-kbuild-all@lists.linux.dev, =?utf-8?Q?"Micka=C3=ABl?= =?utf-8?Q?_Sala=C3=BCn"?= <mic@digikod.net>,
 linux-doc@vger.kernel.org
Subject: [mic:next 15/15] htmldocs:
 Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted
 text or phrase reference start-string without end-string. [docutils]
Message-ID: <202606120923.1nYYlfdb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   a6f0a6f5377fae42a8028f63c89d544c68f24b60
commit: a6f0a6f5377fae42a8028f63c89d544c68f24b60 [15/15] landlock: Add documentation for UDP support
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260612/202606120923.1nYYlfdb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120923.1nYYlfdb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Scope flags
   ~~~~~~~~~~~ [docutils]
>> Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
>> Documentation/userspace-api/landlock.rst:768: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:40: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]


vim +768 Documentation/userspace-api/landlock.rst

   767	
 > 768	Starting with the Landlock ABI version 10, it is possible to restrict
   769	setting the local port of UDP sockets with the
   770	``LANDLOCK_ACCESS_NET_BIND_UDP`` right. This includes restricting the
   771	ability to trigger autobind of an ephemeral port by the kernel by e.g.
   772	sending a first datagram or setting the remote peer of a socket.
   773	The ``LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP`` right controls setting the
   774	remote port of UDP sockets (via :manpage:`connect(2)), and sending
   775	datagrams to an explicit remote port (ignoring any destination set on
   776	UDP sockets, via e.g. :manpage:`sendto(2)).
   777	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
