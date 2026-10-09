Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDECB547051
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 00:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507251; cv=none; b=q5GMR6Q3SLKVoEo8vF1r1cgIYMt2AAaKlT0kIHD4ZSQHSUtVYiYz0FpZO3K16pggiAODMqeOo0rV4Ii6CrhZomMoN7SO6jsVTKD+Q9ReqWfvIumm+F4CbK2ul9YUj7seB7AulIVv4k16GTEPPjuhdjweD4cKVq43yM/7O8uuB/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507251; c=relaxed/simple;
	bh=/8gQemSBLrX8SsDy7SyD2HBKI5dvsSZn1u8DGuiold4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=siCElYE/OLNZIuHUibz0rOY96CTLWdf1WYJ7T7F4nyiodAOnQ7Zaqw8Bm6mWP90Dcro8PPIeYtnawX0N4nYQ0ySrdSQOp4xAz3ZcS2RyXn2u067tVQGr0c1ZcpDNQHknqnQ8BNnxCDSDbkwiBYFGyS1eVnmkyO+kdtEJvtSFQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhkU3n0U; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhkU3n0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791507249; x=1823043249;
  h=date:from:to:cc:subject:message-id;
  bh=/8gQemSBLrX8SsDy7SyD2HBKI5dvsSZn1u8DGuiold4=;
  b=XhkU3n0UweMUQDTGbjOw3EM6aozmXfPE5TdLNUtbFj03ulWz5JyOyX2J
   JL7rcac0MFftChq+vmsBIYoUdrgGQkX1D9/jmMfcCePNOKVkaNk2T3aox
   jsNtSK2SbeMS/2pxuuSOH+WOEkZvEP1gpNaK8ZVo25cVlNVghp0mKCXUQ
   baMGo7L8pKE9SMXONlwEXhE5pAcOkXVrPxZS0FMtaLdJPgAMuYaOR3O1u
   /hmelm6hRaqebC67nmNn9TO09r+XCU2zaK8bdovSpj5zq57M/UGNMAhn+
   LoqprBNZHqyKaAl0mM4FlKE6yas/2vKCBy+9kGTC1fDuAfhHRNPvtcAxP
   A==;
X-CSE-ConnectionGUID: kEYL/0rHRSKc7AOnORnn5A==
X-CSE-MsgGUID: j85TUSkhQSKEXdd6QqSi8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="182187"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="182187"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 17:54:08 -0700
X-CSE-ConnectionGUID: kEvG5CBBRZOa7jqTOGcvag==
X-CSE-MsgGUID: sbEnlmjlReeF3ykMdHUZlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="508251"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 Oct 2026 17:54:08 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEys8-000000006Qb-3q0G;
	Fri, 09 Oct 2026 00:54:04 +0000
Date: Fri, 09 Oct 2026 02:53:21 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp 27/44] net/ipv4/tcp_xdp.c:284:53: error:
 'ipv6_specific' undeclared; did you mean 'ipv4_specific'?
Message-ID: <202610090254.hEt1ZCfE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp
head:   1e2d32c5c50580da5c18d62d06b5835a6d4d0ad0
commit: dad071b9c79760e60327587237f9b9225b5c949d [27/44] tcp: Send a served connection's segments on a lean path of their own
config: i386-randconfig-2200-20261009 (https://download.01.org/0day-ci/archive/20261009/202610090254.hEt1ZCfE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090254.hEt1ZCfE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090254.hEt1ZCfE-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp_xdp.c: In function 'xdp_tcp_adopt':
>> net/ipv4/tcp_xdp.c:284:53: error: 'ipv6_specific' undeclared (first use in this function); did you mean 'ipv4_specific'?
     284 |         else if (IS_BUILTIN(CONFIG_IPV6) && ops == &ipv6_specific)
         |                                                     ^~~~~~~~~~~~~
         |                                                     ipv4_specific
   net/ipv4/tcp_xdp.c:284:53: note: each undeclared identifier is reported only once for each function it appears in
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/uapi/linux/filter.h:9,
                    from include/linux/bpf.h:8,
                    from net/ipv4/tcp_xdp.c:32:
   net/ipv4/tcp_xdp.c: In function 'tcp_xdp_disconnect':
   net/ipv4/tcp_xdp.c:311:48: error: 'ipv6_specific' undeclared (first use in this function); did you mean 'ipv4_specific'?
     311 |                 WRITE_ONCE(icsk->icsk_af_ops, &ipv6_specific);
         |                                                ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   net/ipv4/tcp_xdp.c:311:17: note: in expansion of macro 'WRITE_ONCE'
     311 |                 WRITE_ONCE(icsk->icsk_af_ops, &ipv6_specific);
         |                 ^~~~~~~~~~


vim +284 net/ipv4/tcp_xdp.c

   266	
   267	/*
   268	 * Put the socket on the lean transmit path, the first time. Under the socket
   269	 * lock, which __tcp_transmit_skb() holds when it reads the ops; the pointer
   270	 * is swapped whole, so each segment uses one set or the other. Returns false
   271	 * for a socket that is not to be served.
   272	 */
   273	static bool xdp_tcp_adopt(struct sock *sk)
   274	{
   275		struct inet_connection_sock *icsk = inet_csk(sk);
   276		const struct inet_connection_sock_af_ops *ops = icsk->icsk_af_ops;
   277	
   278		if (likely(xdp_tcp_lean_ops(ops)))
   279			return true;
   280		if (xdp_tcp_tx_guarded(sk))
   281			return false;
   282		if (ops == &ipv4_specific)
   283			ops = &xdp_tcp_v4_ops;
 > 284		else if (IS_BUILTIN(CONFIG_IPV6) && ops == &ipv6_specific)
   285			ops = &xdp_tcp_v6_ops;
   286		else if (IS_BUILTIN(CONFIG_IPV6) && sk->sk_family == AF_INET6 &&
   287			 ops->queue_xmit == ip_queue_xmit)
   288			ops = &xdp_tcp_v6_mapped_ops;	/* ipv6_mapped, private to tcp_ipv6.c */
   289		else
   290			return false;
   291		/* Paired with the READ_ONCE() in tcp_setsockopt() and tcp_getsockopt(). */
   292		WRITE_ONCE(icsk->icsk_af_ops, ops);
   293		return true;
   294	}
   295	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
