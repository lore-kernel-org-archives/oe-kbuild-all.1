Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A117778B51
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709495523; cv=none; b=ZA2b8dwHqY3rleHn8uKhGQQolvEqtOYx79NlbFMdy5Ts/k3eqDOjEQ9divrhWo8VbgPqlqvGO4+ksG7TjQ9/TwjPPNmOCOCygfKhD/YwMucm0lG1v6S9iTpbUgwdOzzJCz4K/7WchkhJRFvE6uqkbnpA/cZQ3dC/fMB/qkzSVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709495523; c=relaxed/simple;
	bh=57dS57p6ehQ5FPHUWbTdBaPU6+nm+QGrriQTrXKfJus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EluJa28Wl5cpfOFl2pmXdLqI1WSG//1utliHOb3WjSAmMZ1YlHS0rve3uYTJ0FtuXWYLlaJ9wQ4BrCixpssh4coc29jqDGd9drFzqskTdBb5rg2jLP6zf+r1LYn2qZoBW99MvXnpOBm9NR3nP4K5aE88LNjSwWScuep9YX+WbJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luflwJPy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luflwJPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709495522; x=1741031522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=57dS57p6ehQ5FPHUWbTdBaPU6+nm+QGrriQTrXKfJus=;
  b=luflwJPyRDTyk1x//1JZc4DpTCerBXMQyjZiA7jTUio1UA7DrIdIrn+Q
   4DPP3DcQd3de6heY1L0Xr2Z7riixF/RyvbToJAZwvGaI9+cyh+1dL/6A9
   t8Qn2depbfJrzGhpuj4jxFaVxKYUumuN000QH7ZMU1RF3K47ifHqeNq6E
   ToBRXoPywFZPp8uigYPfjWRy3ZaYn+6wP1/m5l5RtII8U+uUMTkNBBl7I
   NC8OUhsOhEYzIDqiQaQCuVeVTekhiV2mWKtjDsmfmQrfTWNKMYB1jFLyf
   h0v8pVwPL/pO0cFxT4CSyU6vVaRLmzq4l67ZoEeHDzKMg5oJaP0x4uQkY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7750599"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="7750599"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 11:52:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13432832"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2024 11:52:00 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgrsL-000240-1D;
	Sun, 03 Mar 2024 19:51:57 +0000
Date: Mon, 4 Mar 2024 03:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 191/29558]
 net/ipv4/tcp_ipv4.c:637:30: warning: 'tcp_sk_lock' defined but not used
Message-ID: <202403040311.eboBzHQA-lkp@intel.com>
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
commit: 802d8bff472e5e90effd7c54240af20b972135e2 [191/29558] net: add back the missing serialization in ip_send_unicast_reply()
config: i386-buildonly-randconfig-003-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040311.eboBzHQA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040311.eboBzHQA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040311.eboBzHQA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/tcp_ipv4.c:65:
>> net/ipv4/tcp_ipv4.c:637:30: warning: 'tcp_sk_lock' defined but not used [-Wunused-const-variable=]
     637 | static DEFINE_LOCAL_IRQ_LOCK(tcp_sk_lock);
         |                              ^~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/tcp_sk_lock +637 net/ipv4/tcp_ipv4.c

   636	
 > 637	static DEFINE_LOCAL_IRQ_LOCK(tcp_sk_lock);
   638	/*
   639	 *	This routine will send an RST to the other tcp.
   640	 *
   641	 *	Someone asks: why I NEVER use socket parameters (TOS, TTL etc.)
   642	 *		      for reset.
   643	 *	Answer: if a packet caused RST, it is not for a socket
   644	 *		existing in our system, if it is matched to a socket,
   645	 *		it is just duplicate segment or bug in other side's TCP.
   646	 *		So that we build reply only basing on parameters
   647	 *		arrived with segment.
   648	 *	Exception: precedence violation. We do not implement it in any case.
   649	 */
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
