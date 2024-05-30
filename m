Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74E2183969
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059984; cv=none; b=HcZhGN7PrcUUg34JTTdEDqA+ZXKgCX9gglpHJf5EH/sXSSV+Ne4/wfOiLN/veoK6ni+mX6+LncnecZPxd4qRKRk7VzXz4cIKaCU9jRAxGCDtdQYZdFOyD4zC6H7xo6Qs5SY1QM+1ZnTv5oBDQjYyTLpiQt5y2k+qhtULdisfH0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059984; c=relaxed/simple;
	bh=6l3+p4NSvOUE9t1ohwKUVidYq/uYDStWZq7KZRvzydQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bAq3lxkjHuCEWbjJfzfl2IoUeOnArJpc2O2eQlpqRzAygP/vJ6r4iCqjaWEiITygXCJRmLK2VYN9p7GKQqDYNaxy1GkVZbFGAyU5bGMAglzpBFJ2azb2FA8ZeoUHVcKOBXP2ttxiMfB4H6EYoy7dfHp4aodlVfgCcbudEN3BRLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8vra/ZY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8vra/ZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717059982; x=1748595982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6l3+p4NSvOUE9t1ohwKUVidYq/uYDStWZq7KZRvzydQ=;
  b=k8vra/ZYS9kZEWLd04lQwSD6hq9iiOG5+fXP0nd+PlwWnWHRInbYx/VN
   kPkyF+9NjXtMsipGczltRh6cnuYMqLvvN4V02toQ23jByZvEiRaDVSP/i
   3TPq8JaBnalHU6UkkRor3X40vL9vDL+NftMslCgcUEaPrh7B6NEitXUud
   0KAyhyG/R0oyvX4Qr8FxHZF7gBo8QrA7e5AMZPA8v8Mtzhd8jTVl2XLy/
   vCOVl6CGwdR2WiBO6svW3WsXuHLriRVQvgWKwjjnOD0YweOQDGq2otDoc
   6uIQkhdgoTXe6LDaqJwSQpDdqQ5L79yjMAG9HLl2WHpazeWbVTl6AR706
   w==;
X-CSE-ConnectionGUID: Wl27HKw7QNCpOzHcp+Rj6w==
X-CSE-MsgGUID: JiPms7V2Q1SqDcPvrdKwYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24939232"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24939232"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 02:06:19 -0700
X-CSE-ConnectionGUID: l52WcXfsTySd1vbgG5BNNA==
X-CSE-MsgGUID: 7WIcrcIaSw6eVKok4toNLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35692461"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2024 02:06:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCbjj-000F2v-0m;
	Thu, 30 May 2024 09:06:15 +0000
Date: Thu, 30 May 2024 17:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19767/22580] fs/cifs/transport.c:108
 _cifs_mid_q_entry_release() warn: always true condition
 '(((midEntry->command)) >= 0) => (0-u16max >= 0)'
Message-ID: <202405301643.qKz6P2N2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   001f12b6928e25e5551ad2fbae86556c280757a1
commit: 28b546c67ad5b05406ea31184515152c8b0abeba [19767/22580] CIFS: Fix retry mid list corruption on reconnects
config: x86_64-randconfig-161-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301643.qKz6P2N2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301643.qKz6P2N2-lkp@intel.com/

smatch warnings:
fs/cifs/transport.c:108 _cifs_mid_q_entry_release() warn: always true condition '(((midEntry->command)) >= 0) => (0-u16max >= 0)'

vim +108 fs/cifs/transport.c

^1da177e4c3f415 Linus Torvalds  2005-04-16   85  
696e420bb2a6624 Lars Persson    2018-06-25   86  static void _cifs_mid_q_entry_release(struct kref *refcount)
696e420bb2a6624 Lars Persson    2018-06-25   87  {
28b546c67ad5b05 Pavel Shilovsky 2022-08-27   88  	struct mid_q_entry *midEntry =
28b546c67ad5b05 Pavel Shilovsky 2022-08-27   89  			container_of(refcount, struct mid_q_entry, refcount);
1047abc159b4eb4 Steve French    2005-10-11   90  #ifdef CONFIG_CIFS_STATS2
2dc7e1c03316940 Pavel Shilovsky 2011-12-26   91  	__le16 command = midEntry->server->vals->lock_cmd;
1047abc159b4eb4 Steve French    2005-10-11   92  	unsigned long now;
1047abc159b4eb4 Steve French    2005-10-11   93  #endif
7c9421e1a9ce8d1 Pavel Shilovsky 2012-03-23   94  	midEntry->mid_state = MID_FREE;
8097531a5cb55c6 Jeff Layton     2011-01-11   95  	atomic_dec(&midCount);
7c9421e1a9ce8d1 Pavel Shilovsky 2012-03-23   96  	if (midEntry->large_buf)
^1da177e4c3f415 Linus Torvalds  2005-04-16   97  		cifs_buf_release(midEntry->resp_buf);
b8643e1b5253a6a Steve French    2005-04-28   98  	else
b8643e1b5253a6a Steve French    2005-04-28   99  		cifs_small_buf_release(midEntry->resp_buf);
1047abc159b4eb4 Steve French    2005-10-11  100  #ifdef CONFIG_CIFS_STATS2
1047abc159b4eb4 Steve French    2005-10-11  101  	now = jiffies;
1047abc159b4eb4 Steve French    2005-10-11  102  	/* commands taking longer than one second are indications that
1047abc159b4eb4 Steve French    2005-10-11  103  	   something is wrong, unless it is quite a slow link or server */
020eec5f712ffb4 Steve French    2018-08-01  104  	if (time_after(now, midEntry->when_alloc + HZ) &&
020eec5f712ffb4 Steve French    2018-08-01  105  	    (midEntry->command != command)) {
468d677954c0d94 Steve French    2018-08-04  106  		/* smb2slowcmd[NUMBER_OF_SMB2_COMMANDS] counts by command */
468d677954c0d94 Steve French    2018-08-04  107  		if ((le16_to_cpu(midEntry->command) < NUMBER_OF_SMB2_COMMANDS) &&
468d677954c0d94 Steve French    2018-08-04 @108  		    (le16_to_cpu(midEntry->command) >= 0))
468d677954c0d94 Steve French    2018-08-04  109  			cifs_stats_inc(&midEntry->server->smb2slowcmd[le16_to_cpu(midEntry->command)]);
468d677954c0d94 Steve French    2018-08-04  110  
020eec5f712ffb4 Steve French    2018-08-01  111  		trace_smb3_slow_rsp(le16_to_cpu(midEntry->command),
020eec5f712ffb4 Steve French    2018-08-01  112  			       midEntry->mid, midEntry->pid,
020eec5f712ffb4 Steve French    2018-08-01  113  			       midEntry->when_sent, midEntry->when_received);
020eec5f712ffb4 Steve French    2018-08-01  114  		if (cifsFYI & CIFS_TIMER) {
0b456f04bcdf5b1 Andy Shevchenko 2014-08-27  115  			pr_debug(" CIFS slow rsp: cmd %d mid %llu",
1047abc159b4eb4 Steve French    2005-10-11  116  			       midEntry->command, midEntry->mid);
0b456f04bcdf5b1 Andy Shevchenko 2014-08-27  117  			pr_info(" A: 0x%lx S: 0x%lx R: 0x%lx\n",
1047abc159b4eb4 Steve French    2005-10-11  118  			       now - midEntry->when_alloc,
1047abc159b4eb4 Steve French    2005-10-11  119  			       now - midEntry->when_sent,
1047abc159b4eb4 Steve French    2005-10-11  120  			       now - midEntry->when_received);
1047abc159b4eb4 Steve French    2005-10-11  121  		}
1047abc159b4eb4 Steve French    2005-10-11  122  	}
1047abc159b4eb4 Steve French    2005-10-11  123  #endif
28b546c67ad5b05 Pavel Shilovsky 2022-08-27  124  
28b546c67ad5b05 Pavel Shilovsky 2022-08-27  125  	mempool_free(midEntry, cifs_mid_poolp);
28b546c67ad5b05 Pavel Shilovsky 2022-08-27  126  }
28b546c67ad5b05 Pavel Shilovsky 2022-08-27  127  

:::::: The code at line 108 was first introduced by commit
:::::: 468d677954c0d94fec59275d91222257fe8b4416 smb3: display stats counters for number of slow commands

:::::: TO: Steve French <stfrench@microsoft.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
