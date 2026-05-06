Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE3932A3C9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081294; cv=none; b=Hmp1SGwI74iPkpJ/uO4FqyTkt23bnG/ksVWld2T68LBPJp5Xy6ZEEL56WsQx8wmQpDskMxy8IXUbk5OX6wguTALFXqOrVf6T8Dnsj+d4j2K+e8P8OyuPmLwBDnGIe0ULAIFTCAbe0ZjubYGcxDWyFItrUB9Pv+RqYSsHfLf6AUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081294; c=relaxed/simple;
	bh=Ao4Tim9zLoArjOd9Hv51AkryngSWIjuDrwypvXPUqsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t2GMp8vuN3cQpRaExJ5zBlXUyR9PirrVGz6oz3mq33kZ3NQolNeMUHLYnnDCAsFC93TMolKSOvP5pERJzTBOBtGBUzlpGoClPffzRvIWRSuij4Iy6y2V3RbtjDZPgnUPpFf2Kkmw/XLXoFgdXsSqPbHr+L6KWwlAZHhAzf42KU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9wY+ArB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9wY+ArB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778081293; x=1809617293;
  h=date:from:to:cc:subject:message-id;
  bh=Ao4Tim9zLoArjOd9Hv51AkryngSWIjuDrwypvXPUqsc=;
  b=m9wY+ArBIhF8Ya3zkT+MU1MO0uuNh4lQHcaWnJnhUIrXQOhCHfvdMg9l
   yhNEHdtM+Sv6EaAbMg6sWlMrJwXiqEEXx0JK/qcm9MQXZN0f/KTryLipu
   qXl0J5m5C+ktWo3PEW+ZIk8wYKzZw/BAagvAZrXx/5vlnyodvvAdHix6i
   LvgkM80qi8O66NRwO8tATELrwFUnWnJZVW7AMWtqP/ivdEoD8tKQDZ3dn
   p/Vz7RH+RnML7p6upCDPAXMNmPaERCeC8XXzMRbu8QMQjrx5OkErzrEJR
   mXIisBx2hVL1rC8EfMsj1h689z1mxJhwHlU7hu3PMU8mbsT6xIlOH4Etc
   g==;
X-CSE-ConnectionGUID: kFsmvFXCSNS9Pl8evfUhOg==
X-CSE-MsgGUID: cMHgc+qZTkelwkUF7PFi8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="66546909"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66546909"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 08:28:12 -0700
X-CSE-ConnectionGUID: 7mVGwuzyT4ya8OuH92mGbA==
X-CSE-MsgGUID: SmDdH6L4SBaVIdHe1kzMIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="266524109"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2026 08:28:11 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKeAS-0000000011D-0i8N;
	Wed, 06 May 2026 15:28:08 +0000
Date: Wed, 06 May 2026 23:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 3495/3796] drivers/net/bareudp.c:288:12:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202605062359.e3gOfZCr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   735d2f48cadaa9a87e7c7601667878de70c771c5
commit: bc773b15eb19ae3e27dd3a3377f2fe006ce5f382 [3495/3796] bareudp: Store struct sock in struct bareudp_dev.
config: hexagon-randconfig-r131-20260506 (https://download.01.org/0day-ci/archive/20260506/202605062359.e3gOfZCr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605062359.e3gOfZCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605062359.e3gOfZCr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/bareudp.c:288:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sock *sk @@     got struct sock [noderef] __rcu *sk @@
   drivers/net/bareudp.c:288:12: sparse:     expected struct sock *sk
   drivers/net/bareudp.c:288:12: sparse:     got struct sock [noderef] __rcu *sk
   drivers/net/bareudp.c:623:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] port @@     got unsigned short @@
   drivers/net/bareudp.c:623:20: sparse:     expected restricted __be16 [usertype] port
   drivers/net/bareudp.c:623:20: sparse:     got unsigned short
   drivers/net/bareudp.c:624:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] ethertype @@     got unsigned short @@
   drivers/net/bareudp.c:624:25: sparse:     expected restricted __be16 [usertype] ethertype
   drivers/net/bareudp.c:624:25: sparse:     got unsigned short

vim +288 drivers/net/bareudp.c

   283	
   284	static void bareudp_sock_release(struct bareudp_dev *bareudp)
   285	{
   286		struct sock *sk;
   287	
 > 288		sk = bareudp->sk;
   289		rcu_assign_pointer(bareudp->sk, NULL);
   290		synchronize_net();
   291		udp_tunnel_sock_release(sk);
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
