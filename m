Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778F617623F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724506987; cv=none; b=ZBezx+090XzO7l0USDnjyL1KscFOwe0pcqo/kf4I0auEG6kbSY89OujZRmCuXE2cTu7hIb/6MceecwOu+MFHwjHGCHimoPA2ehRuy2hgXZPUGJdDuu+hIGoqi9B4CT8KMt+U+62gsYp+fqVcgxxgnXN5I/qpoaXRuPKAPxuSD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724506987; c=relaxed/simple;
	bh=sjFNs9qrI9qJPR1eURZmAZ5An/tRgkVIz7CC0EABysA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iL+7ugFJaE0mEO7izc9ZZbvxlNeXNvcstIdhUoBYrmM6C2tkGQc8TexiJQDhqQ3tB0n1S+eS5wJpc0bNcqYQWWJCzWjX4oSiJFS94mh5rSRL2qW692goMr6IJOJ3syp+xzuu5BinYbeZScK4KRibyn9xfDI/uVIFGXRwq+CfSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGM9fO6+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGM9fO6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724506985; x=1756042985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjFNs9qrI9qJPR1eURZmAZ5An/tRgkVIz7CC0EABysA=;
  b=UGM9fO6+ziDnClGF3QayWBn+yPjNjKuhzRc2hFN5VBzXaz/9DoWGNBdZ
   nZkN3ZH30nNo5u8IOkn3+NfcTV5i8rcuzd9Q4I5ebJFULu9n0G1BNONSa
   x/ajSvyj3QCX2g5DZBRHYP/qWykUnsrvhRf95h061zEKVtnnoupqCHAy3
   F3PY1pc4PHtGLE41p+uZ7E0ertJGgoRUOni+mhQaMuvjTN1vNcZsEbsky
   FQR4XA0Z6KTWFDyxnppdndAPl3VuRTcyqIr7/wocmfyCNHgJKjJuBdt1z
   I02+mMXem3t+Yx3CycdvL/KFh85R/BboduTQUt5ozKjzcgVmgkS+Ei5dV
   w==;
X-CSE-ConnectionGUID: 3YvxbyfoTaqa9I4QthQsOA==
X-CSE-MsgGUID: jC0nSwunQjSsPgx0/wSWNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="45497436"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="45497436"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 06:43:05 -0700
X-CSE-ConnectionGUID: 4LAUK0rbRV2IiKBSAmRSMQ==
X-CSE-MsgGUID: fz5C90pjROKnJBLsSE7BAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="62237055"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2024 06:43:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shr2j-000EV1-2j;
	Sat, 24 Aug 2024 13:43:01 +0000
Date: Sat, 24 Aug 2024 21:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cong.wang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [congwang:net-next 7/7] drivers/net/gtp.c:1684:1: warning: label
 'out_rel_sock' defined but not used
Message-ID: <202408242131.gRQCLcpO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git net-next
head:   838946abe3f368da7b47c1af57777bc172657cf8
commit: 838946abe3f368da7b47c1af57777bc172657cf8 [7/7] l2tp: refactor setup_udp_tunnel_sock()
config: arm-randconfig-002-20240824 (https://download.01.org/0day-ci/archive/20240824/202408242131.gRQCLcpO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408242131.gRQCLcpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408242131.gRQCLcpO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/gtp.c: In function 'gtp_encap_enable_socket':
>> drivers/net/gtp.c:1684:1: warning: label 'out_rel_sock' defined but not used [-Wunused-label]
    1684 | out_rel_sock:
         | ^~~~~~~~~~~~


vim +/out_rel_sock +1684 drivers/net/gtp.c

459aa660eb1d8ce Pablo Neira       2016-05-09  1642  
49ecc587dca2754 Jonas Bonn        2021-02-03  1643  static struct sock *gtp_encap_enable_socket(int fd, int type,
1e3a3abd8b28cfd Andreas Schultz   2017-03-09  1644  					    struct gtp_dev *gtp)
459aa660eb1d8ce Pablo Neira       2016-05-09  1645  {
459aa660eb1d8ce Pablo Neira       2016-05-09  1646  	struct udp_tunnel_sock_cfg tuncfg = {NULL};
49ecc587dca2754 Jonas Bonn        2021-02-03  1647  	struct socket *sock;
1e3a3abd8b28cfd Andreas Schultz   2017-03-09  1648  	struct sock *sk;
49ecc587dca2754 Jonas Bonn        2021-02-03  1649  	int err;
49ecc587dca2754 Jonas Bonn        2021-02-03  1650  
49ecc587dca2754 Jonas Bonn        2021-02-03  1651  	pr_debug("enable gtp on %d, %d\n", fd, type);
49ecc587dca2754 Jonas Bonn        2021-02-03  1652  
49ecc587dca2754 Jonas Bonn        2021-02-03  1653  	sock = sockfd_lookup(fd, &err);
49ecc587dca2754 Jonas Bonn        2021-02-03  1654  	if (!sock) {
49ecc587dca2754 Jonas Bonn        2021-02-03  1655  		pr_debug("gtp socket fd=%d not found\n", fd);
49ecc587dca2754 Jonas Bonn        2021-02-03  1656  		return NULL;
49ecc587dca2754 Jonas Bonn        2021-02-03  1657  	}
459aa660eb1d8ce Pablo Neira       2016-05-09  1658  
940ba14986657a5 Eric Dumazet      2020-01-21  1659  	sk = sock->sk;
940ba14986657a5 Eric Dumazet      2020-01-21  1660  	if (sk->sk_protocol != IPPROTO_UDP ||
940ba14986657a5 Eric Dumazet      2020-01-21  1661  	    sk->sk_type != SOCK_DGRAM ||
940ba14986657a5 Eric Dumazet      2020-01-21  1662  	    (sk->sk_family != AF_INET && sk->sk_family != AF_INET6)) {
49ecc587dca2754 Jonas Bonn        2021-02-03  1663  		pr_debug("socket fd=%d not UDP\n", fd);
49ecc587dca2754 Jonas Bonn        2021-02-03  1664  		sk = ERR_PTR(-EINVAL);
49ecc587dca2754 Jonas Bonn        2021-02-03  1665  		goto out_sock;
459aa660eb1d8ce Pablo Neira       2016-05-09  1666  	}
459aa660eb1d8ce Pablo Neira       2016-05-09  1667  
999cb275c807b92 Pablo Neira Ayuso 2024-05-07  1668  	if (sk->sk_family == AF_INET6 &&
999cb275c807b92 Pablo Neira Ayuso 2024-05-07  1669  	    !sk->sk_ipv6only) {
999cb275c807b92 Pablo Neira Ayuso 2024-05-07  1670  		sk = ERR_PTR(-EADDRNOTAVAIL);
999cb275c807b92 Pablo Neira Ayuso 2024-05-07  1671  		goto out_sock;
999cb275c807b92 Pablo Neira Ayuso 2024-05-07  1672  	}
999cb275c807b92 Pablo Neira Ayuso 2024-05-07  1673  
940ba14986657a5 Eric Dumazet      2020-01-21  1674  	lock_sock(sk);
459aa660eb1d8ce Pablo Neira       2016-05-09  1675  
459aa660eb1d8ce Pablo Neira       2016-05-09  1676  	tuncfg.sk_user_data = gtp;
1e3a3abd8b28cfd Andreas Schultz   2017-03-09  1677  	tuncfg.encap_type = type;
459aa660eb1d8ce Pablo Neira       2016-05-09  1678  	tuncfg.encap_rcv = gtp_encap_recv;
459aa660eb1d8ce Pablo Neira       2016-05-09  1679  	tuncfg.encap_destroy = gtp_encap_destroy;
838946abe3f368d Cong Wang         2024-08-23  1680  	if (setup_udp_tunnel_sock(sock_net(sock->sk), sock, &tuncfg))
838946abe3f368d Cong Wang         2024-08-23  1681  		sk = ERR_PTR(-EBUSY);
838946abe3f368d Cong Wang         2024-08-23  1682  	else
838946abe3f368d Cong Wang         2024-08-23  1683  		sock_hold(sk);
49ecc587dca2754 Jonas Bonn        2021-02-03 @1684  out_rel_sock:
49ecc587dca2754 Jonas Bonn        2021-02-03  1685  	release_sock(sock->sk);
49ecc587dca2754 Jonas Bonn        2021-02-03  1686  out_sock:
1e3a3abd8b28cfd Andreas Schultz   2017-03-09  1687  	sockfd_put(sock);
49ecc587dca2754 Jonas Bonn        2021-02-03  1688  	return sk;
1e3a3abd8b28cfd Andreas Schultz   2017-03-09  1689  }
459aa660eb1d8ce Pablo Neira       2016-05-09  1690  

:::::: The code at line 1684 was first introduced by commit
:::::: 49ecc587dca2754571791bebd36e9e36e2a0d973 Revert "GTP: add support for flow based tunneling API"

:::::: TO: Jonas Bonn <jonas@norrbonn.se>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
