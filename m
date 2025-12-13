Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C21220687
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 08:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765613960; cv=none; b=CPhCnGe/vA8l1daos0wJ5MP+jbW83q1aY8T3xiP5KyS1jPbyXx1C+rsxD63xqC+jK+qCMx8crYrOS4kwqa3yBR0LG2zrG34EWBHyWQOXogQ2mhVj0mPvuVVpu0KZWnHrpvegTvGAwyFCx74dq5KE8dwhd/iyEcHS1H7y0gy7/Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765613960; c=relaxed/simple;
	bh=nttAAp7MzYVKpp/V6X0QE1YURkFLWpLV2lIBqrmYqzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SpqykJb/rpbet8kQ5ZGbrbVzUELgzP3MK+vzK3kiCqf9rOlW5LE4IwNs4hh03n5vz4XHO0uMA/uEJeCIc4uuUbqvVB/1MLO4Bvz5j9EOV0QGMLQP0mcQE0lqPUI6fIVViMejFQP/Grj1eUJi0MfocI+rc2IDMEPgA0DVRERfBtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4NS8ONl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4NS8ONl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765613958; x=1797149958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nttAAp7MzYVKpp/V6X0QE1YURkFLWpLV2lIBqrmYqzE=;
  b=b4NS8ONlarZI9N83UFSuSHGmzhDsZGgl8fOnh9p5ZsYRsCPMPw4uoTk6
   Sz+EIg2++thq7T9cXCARv3OSEwRCT/7qdu/dnija5MCWzveLo0ouqZ0Dw
   dJpmCThI2GPd7yY4Iumv3rKEJ2vzVOmd17TVW6/cLTluzb1X0Emm9eOtt
   +kTOLIJLSXSTn1dgntbk0HiaOQ47+rVQxmqfHx1si5Zb1dg8pA8Zv/tgo
   Fn/7RHKQf3PuIAJFTbRXReVUTbeOZYxzPJ5GJv8qQ9OKxzHd5Ts0374ny
   b7ZbmQFqbSDhM26okAirTpqedPlMPgXUpKRw2QVDf8q8gbPkc1uIHJ2ek
   A==;
X-CSE-ConnectionGUID: sNwxUDquSxahcwDzm/Df7A==
X-CSE-MsgGUID: EpnB9UQSRlOGuTXTuAThDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71453473"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71453473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:19:18 -0800
X-CSE-ConnectionGUID: kfUecuE3T/+AJDnD4HC0Qg==
X-CSE-MsgGUID: iiab40rsQxC45dChhXg/Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197037057"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 00:19:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKqQ-000000007IZ-1Ihx;
	Sat, 13 Dec 2025 08:19:14 +0000
Date: Sat, 13 Dec 2025 16:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 3/3] net/core/dev.c:6374:14: sparse:
 sparse: symbol '__netif_receive_skb_hook' was not declared. Should it be
 static?
Message-ID: <202512131623.UDGNYk0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux coroutine/base
head:   3d1468dcf813bc71d425b7ce656a6877d98684e9
commit: 3d1468dcf813bc71d425b7ce656a6877d98684e9 [3/3] Basic Rx integration
config: sh-randconfig-r121-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131623.UDGNYk0H-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131623.UDGNYk0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131623.UDGNYk0H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/dev.c:6374:14: sparse: sparse: symbol '__netif_receive_skb_hook' was not declared. Should it be static?
   net/core/dev.c: note: in included file (through include/linux/filter.h, include/trace/events/xdp.h, include/linux/bpf_trace.h):
   include/net/sch_generic.h:225:30: sparse: sparse: context imbalance in '__dev_queue_xmit' - different lock contexts for basic block
   net/core/dev.c:5242:9: sparse: sparse: context imbalance in 'kick_defer_list_purge' - different lock contexts for basic block
   net/core/dev.c:5335:43: sparse: sparse: context imbalance in 'enqueue_to_backlog' - different lock contexts for basic block
   net/core/dev.c:5751:17: sparse: sparse: context imbalance in 'net_tx_action' - different lock contexts for basic block
   net/core/dev.c:6469:9: sparse: sparse: context imbalance in 'flush_backlog' - different lock contexts for basic block
   net/core/dev.c:6616:9: sparse: sparse: context imbalance in 'process_backlog' - different lock contexts for basic block

vim +/__netif_receive_skb_hook +6374 net/core/dev.c

  6373	
> 6374	noinline int __netif_receive_skb_hook(struct sk_buff *skb)
  6375	{
  6376		return 0;
  6377	}
  6378	ALLOW_ERROR_INJECTION(__netif_receive_skb_hook, ERRNO);
  6379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
