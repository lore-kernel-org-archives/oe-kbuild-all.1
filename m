Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156D3D6CDB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 15:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464621; cv=none; b=TvKIb+SwCKd4wCwbueMO3WjYJhhvaYnrcNP1HFt0nS/xr7iLb78WZdelnx2hH2HW0/uvOFm9o5dqym+0I/fLIvOc+f53uNxENdWGUBPZFGING1k5+R5sha7oghOPaAU3YoyEFjUFvP/5Wx5UN61HS70Xk0A3Wf7crTA2D0xcjjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464621; c=relaxed/simple;
	bh=rIZmxtfgkEH+ycPP4ycdwnxRZzNEKp2MNqT+MPMbIg4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K0E2mYgobH2mzlJT1uAyuPZm89O3xxhRpywLO8UG4S3bj3s3WdlRmWZhwcRU26JZoNEMrLn94x0HI4ZuYyh4Eq+0wmwU/fosI9c54jsVRTjDsw8REzVWCZZCJeGUUr/8JYWETHnlNQg6uy7jsRLDA3xL3NYx6LZ7Y+ltrzLVwqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCMmF5+a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCMmF5+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772464620; x=1804000620;
  h=date:from:to:cc:subject:message-id;
  bh=rIZmxtfgkEH+ycPP4ycdwnxRZzNEKp2MNqT+MPMbIg4=;
  b=eCMmF5+aeR0ynhyhGIaaZ6drDDhebrsARAVkVmmpmqyBn/I3yYBmC76A
   VvV1XyqIqby7sCDcCOUKtCC7yGkyubacWlZikpXrX3AhV2hFvqNWRW1o+
   PLFm7bMZ6TMUCsmTmelVbX6zlaKK8CLIGxVhYMscSCtpL9igXJTOKhsoQ
   A8Sgis8qmlNGe47m7EilfvcEhLSdmkfnbNkOlUzzzFAnHGJp9r6LLtHOT
   uCfst7Sok1s4SZrWePpEnWVVpRTwMv54Fvwd22+UIA4EEuyRUHa1zYz+W
   LqIaEQK/4hykI456MBckRwrlEJm3IqfRq8hxr7ccS8NVKjii6BlSfJVp+
   A==;
X-CSE-ConnectionGUID: oIUG/AnXS4WV4korg6PUpQ==
X-CSE-MsgGUID: KpJ/qe3aQ5eEQACV6kUt9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73584885"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73584885"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:16:59 -0800
X-CSE-ConnectionGUID: u3Fc7DEtSaa+yQO3NGbxsg==
X-CSE-MsgGUID: tCpewv9tSeCwuHINppS2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="215652992"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2026 07:16:49 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx50j-0000000010T-3qEE;
	Mon, 02 Mar 2026 15:16:41 +0000
Date: Mon, 02 Mar 2026 23:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Westphal <fw@strlen.de>
Subject: net/netfilter/nf_nat_amanda.c:75:9: sparse: sparse:
 incorrect type in assignment (different modifiers)
Message-ID: <202603022359.3dGE9fwI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: 07919126ecfc392102555a70016db3e591abcb3d netfilter: annotate NAT helper hook pointers with __rcu
date:   13 days ago
config: x86_64-randconfig-r123-20260302 (https://download.01.org/0day-ci/archive/20260302/202603022359.3dGE9fwI-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603022359.3dGE9fwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603022359.3dGE9fwI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nf_nat_amanda.c:75:9: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected unsigned int ( [noderef] __rcu *volatile  )( ... ) @@     got unsigned int ( [noderef] __rcu * )( ... ) @@
   net/netfilter/nf_nat_amanda.c:75:9: sparse:     expected unsigned int ( [noderef] __rcu *volatile  )( ... )
   net/netfilter/nf_nat_amanda.c:75:9: sparse:     got unsigned int ( [noderef] __rcu * )( ... )

vim +75 net/netfilter/nf_nat_amanda.c

16958900578b945 net/ipv4/netfilter/nf_nat_amanda.c Patrick McHardy   2006-12-02  70  
16958900578b945 net/ipv4/netfilter/nf_nat_amanda.c Patrick McHardy   2006-12-02  71  static int __init nf_nat_amanda_init(void)
16958900578b945 net/ipv4/netfilter/nf_nat_amanda.c Patrick McHardy   2006-12-02  72  {
d1332e0ab84479d net/ipv4/netfilter/nf_nat_amanda.c Patrick McHardy   2007-11-05  73  	BUG_ON(nf_nat_amanda_hook != NULL);
53b11308a1b53d7 net/netfilter/nf_nat_amanda.c      Flavio Leitner    2019-04-17  74  	nf_nat_helper_register(&nat_helper_amanda);
a9b3cd7f323b2e5 net/ipv4/netfilter/nf_nat_amanda.c Stephen Hemminger 2011-08-01 @75  	RCU_INIT_POINTER(nf_nat_amanda_hook, help);
16958900578b945 net/ipv4/netfilter/nf_nat_amanda.c Patrick McHardy   2006-12-02  76  	return 0;
16958900578b945 net/ipv4/netfilter/nf_nat_amanda.c Patrick McHardy   2006-12-02  77  }
16958900578b945 net/ipv4/netfilter/nf_nat_amanda.c Patrick McHardy   2006-12-02  78  

:::::: The code at line 75 was first introduced by commit
:::::: a9b3cd7f323b2e57593e7215362a7b02fc933e3a rcu: convert uses of rcu_assign_pointer(x, NULL) to RCU_INIT_POINTER

:::::: TO: Stephen Hemminger <shemminger@vyatta.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
