Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909B4221720
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739468774; cv=none; b=rwaSNsbziTFACzLN5ppOkjxoo8qtLPRwnlvnsxYICuMd1MyhfqgR7Q7YJI5gsrHw23RmIERXfLJEkeUAYhOAbc8dvAgS3a+hCk4aKjyLRnSsUtnpolRacdqoB1w92WzfVo0dkG8JFmLoMwOpNpY10urcW+Tnq8Go4TSmswsgzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739468774; c=relaxed/simple;
	bh=nLDf+sUIuk02ownpAEexZUrsUhDqI1wK13rhOEMBosI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BY4Jjay3i5eDerTZiOkMp0qJregwkAYm46cDPdpl2RZ/gnHMsIYxCjJfKyZljQAWbs5+A6gh19ahGDJNFSJJx45cLQm2lFUDfO1uN1OuBVYfkqjnPsRGYtqFsuHSZnv2YGwTMeHicWXvqVEekrnkoRC+w9frPAuCRrSJ76rn4TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJmhxBZ/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJmhxBZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739468771; x=1771004771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLDf+sUIuk02ownpAEexZUrsUhDqI1wK13rhOEMBosI=;
  b=UJmhxBZ/PterN/aCvOyCRWLuM04fyJIR5w6aYBggldZ/DIa3RiFHx8qe
   71hKwzHwMRMintubilPDmoU8GmWtZ7+3gSOQ+F0yrpR9ltR98U24TM3zV
   fUYnF7JCa/hMfwbJWXB6rpJN9P7SKc4UckAjetAyQbJ/HBk9nRLatauru
   hLMsDbWAq/ln8Ar/M1nkYgdH2OJEexnDMGtD2EiFYu3kcmduiUUldQ5nT
   OpFI9o+mcpoIQGpsClqYLxYAM5kquaZa1sgLwMignXjZKpAT/jhUWAUqX
   sNECyKNBt7sqXmUCYg85wfSVY3pPkOVI9kVEdBQCxIi20pcV/Io01l2Pc
   g==;
X-CSE-ConnectionGUID: Gv9t1ahUQSi5TgASd+aqyQ==
X-CSE-MsgGUID: gYW5U7p0QMiHpebAywV+Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="44120528"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="44120528"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 09:46:06 -0800
X-CSE-ConnectionGUID: vgc5rbZpSpaRw/TN4c5iIw==
X-CSE-MsgGUID: K299GsO6TCKtBI3fXrgXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117342994"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2025 09:46:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tidHo-0018WL-2g;
	Thu, 13 Feb 2025 17:46:04 +0000
Date: Fri, 14 Feb 2025 01:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.02.12a 73/77] kernel/rcu/rcutorture.c:2440:42:
 sparse: sparse: symbol 'updownreaders' was not declared. Should it be
 static?
Message-ID: <202502140113.iZOFajfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.02.12a
head:   9909b31f911e4cb67bb84cd07c5172c0823ac549
commit: bc33cbe9ab89abc9ae3d33843c3d84e383ac8677 [73/77] rcutorture: Add tests for SRCU up/down reader primitives
config: nios2-randconfig-r112-20250213 (https://download.01.org/0day-ci/archive/20250214/202502140113.iZOFajfB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250214/202502140113.iZOFajfB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140113.iZOFajfB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/rcu/rcutorture.c:2440:42: sparse: sparse: symbol 'updownreaders' was not declared. Should it be static?
   kernel/rcu/rcutorture.c:444:12: sparse: sparse: context imbalance in 'rcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c:484:13: sparse: sparse: context imbalance in 'rcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:763:38: sparse: sparse: context imbalance in 'srcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:813:34: sparse: sparse: context imbalance in 'srcu_torture_up_read' - unexpected unlock
   kernel/rcu/rcutorture.c:2118:9: sparse: sparse: context imbalance in 'rcutorture_one_extend' - different lock contexts for basic block
   kernel/rcu/rcutorture.c:4165:41: sparse: sparse: context imbalance in 'rcu_torture_init_srcu_lockdep' - unexpected unlock

vim +/updownreaders +2440 kernel/rcu/rcutorture.c

  2439	
> 2440	struct rcu_torture_one_read_state_updown *updownreaders;
  2441	static DEFINE_TORTURE_RANDOM(rcu_torture_updown_rand);
  2442	static int rcu_torture_updown(void *arg);
  2443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
