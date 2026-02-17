Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE39263F44
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 07:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771312348; cv=none; b=IXY9rXxkH9gkJj5k8ETBCBWqJ8RDZwyaZlR1Nha83hqvccmS8YD6s0bMPBd9Y9WDUltthmTThCRATO+rAV6/6nWl3suQ3/7vCDRP+0YFXNqnSafzVFYXKjHo+8h2fXEr3H3JTVFCvpC+74uLuLdkzomwgCbQ71f1wQ0XA5NhoO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771312348; c=relaxed/simple;
	bh=nUcRkIRdEZHfKYdajHqBYykAXag6alqiwaMLOC0LFHA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lLv4YnQZcY7K1X6kVUJrgKl7UNAmR++XIM0+BZpTnQJ0nYJNGyvrXS89jv3HGLsG9VyvAh5BbBgEi5BrT445+nMvYDn2xSG+5BtA/JTB2vrGyXzO3dV7ZKnzHIkU8Vm73hZhMlfrl14UyP4aeo5TQUvU8KrtIRmqvcP+Yqn0ME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7w6mVxj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7w6mVxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771312346; x=1802848346;
  h=date:from:to:cc:subject:message-id;
  bh=nUcRkIRdEZHfKYdajHqBYykAXag6alqiwaMLOC0LFHA=;
  b=b7w6mVxjrJomtyBNVvG6+4DskvWSx/HAwVbZaV9hUmAiX0CTxK8tBZCv
   C7OoWs5Dg2jScB4+T88VO/XweMTjnSDAuZJyboJj5HVwVCz8BFsL1XYbd
   qCyoABOI1uWQcnkKZV96JCvCup5auNS6BnBh2f0FCskdpClg5yUeikDvC
   fwUnQVT67zCbz2YVz92erXIS3T1LC7OaKSnXE0y5jXe6K/J8NlkYBDE9X
   120hVQ9LP3hP5TzVh3ABbj79gxyEO4YOABRrRDsnXDBnShlTYr4DV7sef
   8uO9m4ClnGGauZWg9Ah2W1gqnkQiiHdlBxUQmRA5s1R8N7w97KcoSdZZv
   g==;
X-CSE-ConnectionGUID: J+FPuQDTTAK25aqm/jiFUw==
X-CSE-MsgGUID: MW9ph6mKS62nmI5ErOXoOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83008244"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="83008244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 23:12:26 -0800
X-CSE-ConnectionGUID: fts9DwmDRIq/VKmb/lsvuQ==
X-CSE-MsgGUID: T9Igv7oBTxqnNU0LhSR18Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212726734"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Feb 2026 23:12:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsFFu-000000010iW-27q4;
	Tue, 17 Feb 2026 07:12:22 +0000
Date: Tue, 17 Feb 2026 15:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 28/28] drivers/tty/tty_port.c:418:
 warning: Function parameter or member 'async' not described in
 '__tty_port_tty_hangup'
Message-ID: <202602171544.sqZC6hD2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00b026c92cf1e03031af63a20c025efe227505fc
commit: 4607e4a625234c79c1814cf8fb89ca7b81b71c6a [28/28] FROMGIT: tty: introduce and use tty_port_tty_vhangup() helper
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260217/202602171544.sqZC6hD2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171544.sqZC6hD2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171544.sqZC6hD2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/tty_port.c:418: warning: Function parameter or member 'async' not described in '__tty_port_tty_hangup'
   drivers/tty/tty_port.c:418: warning: expecting prototype for tty_port_tty_hangup(). Prototype was for __tty_port_tty_hangup() instead


vim +418 drivers/tty/tty_port.c

3e61696bdc2103 drivers/char/tty_port.c Alan Cox          2009-01-02  411  
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  412  /**
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  413   * tty_port_tty_hangup - helper to hang up a tty
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  414   * @port: tty port
cb6f6f9877928f drivers/tty/tty_port.c  Jiri Slaby        2021-11-26  415   * @check_clocal: hang only ttys with %CLOCAL unset?
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  416   */
4607e4a625234c drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  417) void __tty_port_tty_hangup(struct tty_port *port, bool check_clocal, bool async)
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07 @418  {
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  419  	struct tty_struct *tty = tty_port_tty_get(port);
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  420  
4607e4a625234c drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  421) 	if (tty && (!check_clocal || !C_CLOCAL(tty))) {
4607e4a625234c drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  422) 		if (async)
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  423  			tty_hangup(tty);
4607e4a625234c drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  424) 		else
4607e4a625234c drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  425) 			tty_vhangup(tty);
4607e4a625234c drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  426) 	}
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  427  	tty_kref_put(tty);
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  428  }
4607e4a625234c drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  429) EXPORT_SYMBOL_GPL(__tty_port_tty_hangup);
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  430  

:::::: The code at line 418 was first introduced by commit
:::::: aa27a094e2c2e0cc59914e56113b860f524f4479 TTY: add tty_port_tty_hangup helper

:::::: TO: Jiri Slaby <jslaby@suse.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
