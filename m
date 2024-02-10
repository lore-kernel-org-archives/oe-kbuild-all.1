Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDD63D0DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707567262; cv=none; b=klwPFJeaKUZNK42ePIyjMP8p2I8LpjdeDJ+3A0pqilPg2gd2K1uIOqn135qPB/kpS4s8hvwhwIG4npo1nGkFq1yzM2EpXPd4W0bYbxOL6GoIU7fBW8wyTrQ/zWIRfRHHl1PbkLlx4hCD5lkuhsJ3dNBBkRC1BCtFzkN7fe2h1WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707567262; c=relaxed/simple;
	bh=wRC60m5i9KWmbRIJ8MGAeVtVxg3PVQ6oOVJ+ZnzkePI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J5e10uSthsYBolnnfyJLlXw/oR6YUB0q+VMGfTb5SMEMH3rrWwTz7uYVBDxawdjqiEoxbbtC1BUVVTGnmOPn3JCfMKU+SMTfVBZAzQvo1f/in1pYVaRoHhoa8Z2iRAAOsqY3RvRlYGxB0ST3FqjYaiEj+LSAFVy8kbX3wlYJtRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwwV7s6c; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwwV7s6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707567260; x=1739103260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wRC60m5i9KWmbRIJ8MGAeVtVxg3PVQ6oOVJ+ZnzkePI=;
  b=AwwV7s6c82oMl3E9Xr/pENK//Qcm7QitRLIerJ9CN488dlvj43Y4iCBv
   6fY+urqaTyxroxQT5rZ+LqWxksyXDzcWPe23frDAdI4HYe3KZ89hQ9C1+
   B1wVeCFwv7rmcriqgPWIxCIzgBN+L3vykaw/ehRogft2zM16kyzXE7Xdp
   upW2/N7ZrVOyXfMSHz/hdG5D2Ffy4EBh2p/RB0jwmHQh4hukOW4Pe5Oj5
   6asLsg0Vf7PuKd3tlm4sMnVMFmC8KVT08FGdAVlMx2HHLEsJV7AWPGJ2+
   towiBfVNLN7YMUAKsSwNn6AIOzHBRjvQLdylkivSe0qxslaDzf5WX2zf2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="436700917"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="436700917"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 04:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2466645"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2024 04:14:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYmFM-0005dO-1d;
	Sat, 10 Feb 2024 12:14:16 +0000
Date: Sat, 10 Feb 2024 20:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [luto:net/recverr 2/2] include/net/ip.h:838:27: error: 'struct
 socket' has no member named '__sk_common'
Message-ID: <202402102050.frb3LT68-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git net/recverr
head:   d3ed76fed22d68d297a7740671c0d010f8ca205d
commit: d3ed76fed22d68d297a7740671c0d010f8ca205d [2/2] [WIP] net/ip: Consolidate RECVERR-vs-sk_err handling
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240210/202402102050.frb3LT68-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102050.frb3LT68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102050.frb3LT68-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/net/busy_poll.h:18,
                    from fs/select.c:33:
   include/net/ip.h: In function 'ip_error_report':
>> include/net/ip.h:838:27: error: 'struct socket' has no member named '__sk_common'
     838 |         if ((harderr && sk->sk_state == TCP_ESTABLISHED) || recverr) {
         |                           ^~
>> include/net/ip.h:839:19: error: 'struct socket' has no member named 'sk_err'
     839 |                 sk->sk_err = err;
         |                   ^~
>> include/net/ip.h:840:33: error: passing argument 1 of 'sk_error_report' from incompatible pointer type [-Werror=incompatible-pointer-types]
     840 |                 sk_error_report(sk);
         |                                 ^~
         |                                 |
         |                                 struct socket *
   In file included from include/net/inet_sock.h:22,
                    from include/net/ip.h:29:
   include/net/sock.h:2513:35: note: expected 'struct sock *' but argument is of type 'struct socket *'
    2513 | void sk_error_report(struct sock *sk);
         |                      ~~~~~~~~~~~~~^~
>> include/net/ip.h:842:1: warning: no return statement in function returning non-void [-Wreturn-type]
     842 | }
         | ^
   cc1: some warnings being treated as errors


vim +838 include/net/ip.h

   814	
   815	/*
   816	 * When an ICMP error is received that matches a datagram socket, some combination of
   817	 * queueing an IP_RECVERR-style message, setting sk_err, and signaling POLLERR needs
   818	 * to happen.
   819	 *
   820	 * Use like this:
   821	 *
   822	 * bool recverr = inet_test_bit(RECVERR, sk) [and account for ipv6]
   823	 * int err = ...;
   824	 * bool harderr;  <- true if the error is 'hard', meaning that it should be reported
   825	 *                   for !RECVERR connected sockets
   826	 * if (recverr)
   827	 * 	ip_icmp_error() or ipv6_icmp_error() as appropriate.
   828	 * ip_error_report(sk, err, harderr, recverr);
   829	 */
   830	static inline bool ip_error_report(struct socket *sk, int err, bool harderr, bool recverr)
   831	{
   832		/*
   833		 * Linux sets sk_err for connected sockets if the error is 'hard' (which makes
   834		 * perfect sense) and for all sockets if RECVERR[6] (which does not make very
   835		 * much sense).  It does indeed make sense that sk_error_report(), which signals
   836		 * POLLERR, is called if RECVERR[6], though.
   837		 */
 > 838		if ((harderr && sk->sk_state == TCP_ESTABLISHED) || recverr) {
 > 839			sk->sk_err = err;
 > 840			sk_error_report(sk);
   841		}
 > 842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
