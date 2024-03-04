Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036D8A59
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 04:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709524927; cv=none; b=Z+NIdoqnsxfzFVWv9YBW1By6Hs/6EJJb1mFFyrYvW7yHJPsbs+uooJV3ED+FCr9dwB9sA9qLpkAzoIja6IQDbARSm7aVSIjEZz0LT2nZ8VmGNvZflK1dypBWUxu//1sdUFKeTCn9PblJ20bf91ytd8yu6jBalLe9pZa12RhOumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709524927; c=relaxed/simple;
	bh=WpFFMoyYDHh8ModcIL2/8ZJ/JrSNGt/uCbg4m+ZVkl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UrXs6i4XcSeOqlQQgDmG6wKWuPfthrgZK5Z4HkX/+RS5K/DvIxxSoTUlvfrE5U60d31wHoZS4+IyYEgTTMaC0qXDS0/8NxGnYjaau980lJKhpWPHt0xA0Yeg09IRw968vzq+x7ZcevnbE2c3+a9OzrkMq+ldCTMni5QP6NyvZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bspldQ/I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bspldQ/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709524925; x=1741060925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WpFFMoyYDHh8ModcIL2/8ZJ/JrSNGt/uCbg4m+ZVkl8=;
  b=bspldQ/IaLueUafetzAdk4qtDie5/pHDvHyVhrKIDRTx2P2LuIAUyO1j
   tBjj3HS/7VxnQKuHqDd40tSA87buSuXK2qJsl+XEFjLBAOvQk03N2P7Ac
   OdgcS5A3EJ5UEnoWUxc/ChXSULRbWAzjAgQjamYwVRF2C/LQCYlJCDjP0
   EYUzSDP3+K75Q0bR62PyLzHoVEcYHbzs+OUU2fOJjaA/ymUNb5Hvf/UaG
   YjohmapWdc5dd8VLhJpON3fdyOOdg/IdrbL7ELtmY1Fr7ks40h+SEVcqz
   vR1x9BuiyMNnKVzKR7capX1gnl/9NU8gJOtwWSscsR8oyzj2wFOcO+p1q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7770670"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7770670"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 20:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9216844"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2024 20:02:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgzWa-0002Kc-2w;
	Mon, 04 Mar 2024 04:02:00 +0000
Date: Mon, 4 Mar 2024 12:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 192/29558] net/ipv4/icmp.c:208:30:
 warning: 'icmp_sk_lock' defined but not used
Message-ID: <202403041106.bL6aQ3KB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: e30081fa5b814f5557b6fbd6e73f0cb504f67cbf [192/29558] net: add a lock around icmp_sk()
config: i386-buildonly-randconfig-003-20240303 (https://download.01.org/0day-ci/archive/20240304/202403041106.bL6aQ3KB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403041106.bL6aQ3KB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403041106.bL6aQ3KB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/icmp.c:80:
>> net/ipv4/icmp.c:208:30: warning: 'icmp_sk_lock' defined but not used [-Wunused-const-variable=]
     208 | static DEFINE_LOCAL_IRQ_LOCK(icmp_sk_lock);
         |                              ^~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/icmp_sk_lock +208 net/ipv4/icmp.c

   200	
   201	/*
   202	 *	The ICMP socket(s). This is the most convenient way to flow control
   203	 *	our ICMP output as well as maintain a clean interface throughout
   204	 *	all layers. All Socketless IP sends will soon be gone.
   205	 *
   206	 *	On SMP we have one ICMP socket per-cpu.
   207	 */
 > 208	static DEFINE_LOCAL_IRQ_LOCK(icmp_sk_lock);
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
