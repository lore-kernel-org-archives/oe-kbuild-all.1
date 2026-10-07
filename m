Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672294192F9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 22:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791413384; cv=none; b=i/V8fehZpkEcCgEr4fXdisQwOoAYRiMoD39NBKsqsRaAOmj6A4H1vIy6LzxlVBEJ4+czmsYHbbBXcbXjpg3o7/kSqQY5IAmz6JG57TcQ6EeK4NtQ3i3QH9rPisn8XPZZpQ/BHNXDyiF0sUdcOahxmeithxFjBUxV6Ewmz9Wfpl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791413384; c=relaxed/simple;
	bh=Fss9O1iJo2k1dvwy+K86Xw2YSuYvdQZFrYfKz+dLTVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=txOtiZAdGK+4rOpcnAvFBWTIParLT3ms7z89v5ELPsiGs5UiI+6W5OMTIgC3GkQ80yzzzACvkCpFpK6tUSHAS5DSdf0CQ0bqTOvVsjRUap49od4L7YN2/srpbT4wraJa+3r3qe2QBYWVg+yn+ne+C6eweyoSp/i2CjA/6Sxadj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lX5nMMb/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lX5nMMb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791413382; x=1822949382;
  h=date:from:to:cc:subject:message-id;
  bh=Fss9O1iJo2k1dvwy+K86Xw2YSuYvdQZFrYfKz+dLTVU=;
  b=lX5nMMb/nYEMPnQcSfcluLo/iR25GA1HFywbcYiOv4KuGtPQLqC/qGMS
   JpX0psHpbnSza9Yf2cw0ihK3H+4FaRsUTOV/zHigh2L5E9zgz+HXqm5di
   6Lyz1ShIs2jrEjG4BzLCuwqbgp9gpeM43nn1TQ/zVNx2Bmvs0pGrTg41R
   VL/FxLm0yc+kGEsE1kvmU/trCYQKtsrLLjWlGcnWh6CIZuayaXbYA0IsL
   TKuId01RRyH4rp8AH2akh8BVYngwb3Yhm5TNy8i3mFGUANWVMSzmolA9f
   dhrNrPg36NBLL0f9Y+0mt8vuR2OL1v5qVAfPm+bdNn6U483ZlCLXORLJK
   A==;
X-CSE-ConnectionGUID: mq58M6+OSCO+62Sf13WCgA==
X-CSE-MsgGUID: 6CxX+N6JQlGG21F8kiVMIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="296968"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="296968"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 15:49:42 -0700
X-CSE-ConnectionGUID: L9+aKnaVRpygoRgwHCN0mQ==
X-CSE-MsgGUID: EChRErJETs+p90TBrYaC1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="285511510"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 Oct 2026 15:49:40 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEaSA-000000004DJ-2ryT;
	Wed, 07 Oct 2026 22:49:38 +0000
Date: Thu, 08 Oct 2026 00:48:53 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:mlp 58/59] fs/eventpoll.c:2166:undefined
 reference to `sock_from_file'
Message-ID: <202610080055.22iqebug-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux mlp
head:   cb749145988a07c430f0cc8004d3d40b4227fe1f
commit: 54493c2a59093e36a0f02fec2073203cd83bfb10 [58/59] epoll: Prefetch the ready items' files, sockets and socks ahead of delivery
config: powerpc-randconfig-r2104-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080055.22iqebug-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080055.22iqebug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080055.22iqebug-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/eventpoll.o: in function `ep_send_lookahead_step':
>> fs/eventpoll.c:2166:(.text+0xebc): undefined reference to `sock_from_file'


vim +2166 fs/eventpoll.c

  2141	
  2142	static void ep_send_lookahead_step(struct ep_send_lookahead *la,
  2143					   const struct list_head *head)
  2144	{
  2145		struct epitem *next;
  2146		struct sock *sk;
  2147	
  2148		if (la->sock) {
  2149			sk = READ_ONCE(la->sock->sk);
  2150			if (sk) {
  2151				/* what sock_poll and tcp_poll read: the state and
  2152				 * error, the receive queue and sequence numbers, the
  2153				 * wait queue, the send space
  2154				 */
  2155				prefetch(sk);
  2156				prefetch(&sk->__cacheline_group_begin__sock_write_rx);
  2157				prefetch(&sk->__cacheline_group_begin__sock_read_rx);
  2158				prefetch(&sk->__cacheline_group_begin__sock_write_rxtx);
  2159				prefetch(&sk->__cacheline_group_begin__sock_write_tx);
  2160				prefetch(&sk->__cacheline_group_begin__sock_read_tx);
  2161				prefetch(&tcp_sk(sk)->rcv_nxt);
  2162			}
  2163			la->sock = NULL;
  2164		}
  2165		if (la->file) {
> 2166			la->sock = sock_from_file(la->file);
  2167			if (la->sock)
  2168				prefetch(la->sock);
  2169			la->file = NULL;
  2170		}
  2171		if (la->item) {
  2172			la->file = la->item->ffd.file;
  2173			prefetch(la->file);
  2174			next = list_next_entry(la->item, rdllink);
  2175			la->item = &next->rdllink != head ? next : NULL;
  2176			if (la->item)
  2177				prefetch(la->item);
  2178		}
  2179	}
  2180	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
