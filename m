Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81DFC0B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 03:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730172043; cv=none; b=ketBY4tdIdc1CsISVTxa4RAym8YKFwE9XSYIfNftnl15lhBA/FIe7lnD0mUVeglA1WT1+nzMFhFaXurJxdl9wDLU+cks1IjWXoAuH8eVhxV6tosAcZwzXTh8pGAbR7lNdnAUiVL9mgXW5Wz8MV4Y1L94R0snq2lvjLzEUvRKvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730172043; c=relaxed/simple;
	bh=vaGbgLkdjXBN9vZ0N2Bdbu3wRVXoBRKjBkDQByMyMmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZVJ3/RbpeXjl58Wruvf/MGNIoKH4JoCpYov4CKsuRqsZx6R+K3QZ+0bJrRtKogTpspNKrk9sD1Q8c9u8GzF4Qco1zdPVU12JaXN8jcJCwdoUded+LpPkUBWhO7FG0d7zcfNGlGZn25xIWRAPe068OhDNTFRfIZvI69b3+l8Aus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUuIvmBh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUuIvmBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730172042; x=1761708042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vaGbgLkdjXBN9vZ0N2Bdbu3wRVXoBRKjBkDQByMyMmw=;
  b=BUuIvmBh+mJZ3pAmfmz3+YTDhPHOYGAwIF+4JDnaiCmETmVL+ZMz+qvH
   9HgmWh+5JbJ9NNduSctpoV8IZAnrjSkd1LHO2uq3Bp5MxhS4d97nC2Ab2
   Woe35IKCo8FmXgmX40EOR5QA99a5HSRqvu/uBCPd1R7eQ9KW40Ze473q7
   3NrDVCNqmd1qSfSJYSTy0jLC//pKTLR3tY72a6dd0btVIIxWivhgXBqVw
   3XvzaNTPAa5+M2ogZwiYH6VtIkYAS3o9qzSRpFKA2T2v7lyY4q14UzPgw
   z6XMJJRNwrjAoNB7kVAf/ss5JhCh4V569xNZ3FeOo6QhW10zFhafJFNLT
   Q==;
X-CSE-ConnectionGUID: Jsmyb44rQFu0y1Q6fZ7gag==
X-CSE-MsgGUID: fA/AEZodS9KKGHpKS9cwCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47256458"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47256458"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 20:20:41 -0700
X-CSE-ConnectionGUID: eCbyeTeZT5GIVE1UdF7MOA==
X-CSE-MsgGUID: aQYkE9ZaRhWQEYaz4hxbDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="81969610"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2024 20:20:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5cmb-000dCG-1X;
	Tue, 29 Oct 2024 03:20:37 +0000
Date: Tue, 29 Oct 2024 11:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2024.10.27b 30/35]
 include/linux/rcupdate_wait.h:73:43: error: 'struct task_struct' has no
 member named 'rcu_node_entry'
Message-ID: <202410291131.mflSojdy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2024.10.27b
head:   452a4107123b99087cd0bed226f61436ca9fdd24
commit: 0074845ef7cfbfe41a72bf5561edc18b90b67504 [30/35] rcutorture: Check preemption for failing reader
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241029/202410291131.mflSojdy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291131.mflSojdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291131.mflSojdy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:48:
   include/linux/rcupdate_wait.h: In function 'has_rcu_reader_blocked':
>> include/linux/rcupdate_wait.h:73:43: error: 'struct task_struct' has no member named 'rcu_node_entry'
      73 |                 return list_empty(&current->rcu_node_entry);
         |                                           ^~


vim +73 include/linux/rcupdate_wait.h

    67	
    68	// Has the current task blocked within its current RCU read-side
    69	// critical section?
    70	static inline bool has_rcu_reader_blocked(void)
    71	{
    72		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
  > 73			return list_empty(&current->rcu_node_entry);
    74		else
    75			return false;
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
