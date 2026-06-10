Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957642857FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 00:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781052837; cv=none; b=pDhEWKac4Ru/3xhTWSkXBm3Syh6e4y7lzr3ZIzxrzAfqA+oRygc9OqOZFYNoZnr6j4zE4hW7tZ2Oz/JgRavoAzSPSEAKUpVtVfK42CEFb/AG2svTk7AysCbp4G1VXXTAhWK4YCNweCBTDbibTrWoSkl6Nwz99MHHPxwHxOUo+eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781052837; c=relaxed/simple;
	bh=cIZezIozr4DtsXksnfv1CdeBRV0+dPRXoCGC51Shv38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i+ZnF1cjOzghqYvlPxWHc3AzLSpd4e6074moQ4/bIx6fSteyWco4OjDxQJ22eNN/5T2aZy3CiIx4koBgn9blCJVYtdtOhGDUhPNcWpldyDA9FMcbgiX9CfVpR9D/CWvBoS/kfkxEXqRqwJ6wZ1PQ/4gbfjCVAqdBiymcu5nYsTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJZllh4e; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJZllh4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781052835; x=1812588835;
  h=date:from:to:cc:subject:message-id;
  bh=cIZezIozr4DtsXksnfv1CdeBRV0+dPRXoCGC51Shv38=;
  b=aJZllh4ehksgnR5I0ET+gsJKBjsiVOGoalRkKsM1As80gbqnlKYXz8uD
   Neu4G12RQvwVA9TlYDCC28R58FxXYEysZUv0glC3sxLLQErb7zzvE99pJ
   FLubmuxKmj19MHlwuVG4ecg2wIqIwzqAnRpzvwpx1CrMedLRB4N+VUvD4
   PcN7H3Oga0Vr5g1QikbaByFPP2sMO2YwDfHynyZQfkvSVb4m8Os71cRVz
   VkVC/NV+uaoMjo+4stLG1z5ALQ0E8XKdaSZ1V03ecsK4Mo8hQhQ7QpBlM
   ZG7WWJHQQyjAg3IJNxB4apr1znMEg7Kb8h2tRehuRLegjtdQE1+6W3sQy
   w==;
X-CSE-ConnectionGUID: 9jk6iaS9TAu46zYIP8fwKA==
X-CSE-MsgGUID: OKRsDFIKTyaCPUr3ALdB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99253808"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="99253808"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 17:53:54 -0700
X-CSE-ConnectionGUID: gYxMMnOgTt28HYUxn3KpKQ==
X-CSE-MsgGUID: 6OJPg+aeRHe+kdd5gRs2KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241883336"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2026 17:53:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX7CX-00000000Kke-2wco;
	Wed, 10 Jun 2026 00:53:49 +0000
Date: Wed, 10 Jun 2026 08:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 11785/12670] net/ipv6/ip6mr.c:295:24:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202606100834.usCNGoLp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: 2c309a863dd6e609b10caa55a362dc48d2e04564 [11785/12670] ip6mr: Free mr_table after RCU grace period.
config: m68k-randconfig-r112-20260610 (https://download.01.org/0day-ci/archive/20260610/202606100834.usCNGoLp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100834.usCNGoLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100834.usCNGoLp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv6/ip6mr.c:295:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:295:24: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:295:24: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:301:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:301:16: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:301:16: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:301:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:301:16: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:301:16: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:312:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:312:16: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:312:16: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:326:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:326:9: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:326:9: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:332:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:332:32: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:332:32: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:336:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:336:9: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:336:9: sparse:    struct mr_table *

vim +295 net/ipv6/ip6mr.c

   283	
   284	bool ip6mr_rule_default(const struct fib_rule *rule)
   285	{
   286		return fib_rule_matchall(rule) && rule->action == FR_ACT_TO_TBL &&
   287		       rule->table == RT6_TABLE_DFLT && !rule->l3mdev;
   288	}
   289	EXPORT_SYMBOL(ip6mr_rule_default);
   290	#else
   291	static struct mr_table *ip6mr_mr_table_iter(struct net *net,
   292						    struct mr_table *mrt)
   293	{
   294		if (!mrt)
 > 295			return rcu_dereference(net->ipv6.mrt6);
   296		return NULL;
   297	}
   298	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
