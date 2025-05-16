Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C20027FD49
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 23:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747438181; cv=none; b=eX25Qh0oxz4Oga3u2J8nmDllx2FVHyJPNADNT2HPKe4TOtN0sYVvXSLtOdRsXdFkT4+/9J2Pt8W3AS2LwnBP9c3W+SpC+lG6usV1iQXeGw6hYuEhfIpF9yItf3P3w+TmDZwYu1WOUhTP0170NLo3U9yJWFr29cE4DRUEB0O5kfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747438181; c=relaxed/simple;
	bh=b3X/FnOmFl03xqbvegT5Xwm5RVz8nuhR7dtuP5gJmSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RpYG12/29OiJjnhOySiYHtzvOAlOHaZWOZBo2f3wPKY2kMCEBjtuM4hNQZgvaB+nh1j/LYcrT2fm2OJcsziA66VgzDN74BskXFGnRz5YcoGDNaLQKz2dRLK1nx04Yrx96HxTOGAYxF9zH43v2B+IH22fzfigRJgDL0+7c1hmMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALWbUvxW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALWbUvxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747438180; x=1778974180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3X/FnOmFl03xqbvegT5Xwm5RVz8nuhR7dtuP5gJmSY=;
  b=ALWbUvxWQZyk2Rum9HQuMzV9OHLK4dhvXU7tAon7RprhYyOmPa5CQUMU
   1k0aveezPaQ/asDTdi9KScv+gOG7wtHd8t6NG1Y0xCWDBR8HEc/lASCdm
   QUuniBVfp31wOWQcd7m2KSQ/587Dt0mQxoz/MgYRjV/xK6ZdN5dpvgjgI
   3bTPa0IZbBVTBvcEEh+YBf0LyW54W/UmR92yrkKO5waZpK6TQtLMZftjY
   LgJi/yMEcPq6LoR1eDTyCRRvq9V1go1IziJygmlb+oNMOVL9e23zKzjwm
   J8N0JV9jytRn4g3hzvZf6IYk2pgk0u4yb5i+YoEzwd8KjuF5i7AdHp+Pr
   g==;
X-CSE-ConnectionGUID: Y7v78FB5QbWLsaCj7oNbOQ==
X-CSE-MsgGUID: jdP8q3xoSQGlJJugRKFfqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49406755"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49406755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 16:29:39 -0700
X-CSE-ConnectionGUID: UvNIartQQpiMowwztG4JtQ==
X-CSE-MsgGUID: VhOJA6V1TCKTs9GUc+Lz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="138745736"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2025 16:29:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG4Uh-000Jn9-24;
	Fri, 16 May 2025 23:29:35 +0000
Date: Sat, 17 May 2025 07:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 70/90] ERROR: modpost: vmlinux: local symbol
 'tty_port_tty_hangup' was exported
Message-ID: <202505170753.EBZyQHhm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   210d0b4d713eac3aee26524e64f86f1e4df08bbb
commit: d43527b566b5e529c8943539889644856287524d [70/90] tty_port: introduce tty_port_tty_vhangup()
config: s390-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170753.EBZyQHhm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170753.EBZyQHhm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170753.EBZyQHhm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: vmlinux: local symbol 'tty_port_tty_hangup' was exported
>> ERROR: modpost: "__tty_port_tty_hangup" [drivers/tty/nozomi.ko] undefined!
>> ERROR: modpost: "__tty_port_tty_hangup" [drivers/tty/rpmsg_tty.ko] undefined!
>> ERROR: modpost: "__tty_port_tty_hangup" [drivers/mmc/core/sdio_uart.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
