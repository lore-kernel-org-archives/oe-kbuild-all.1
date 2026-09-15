Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2473B6352
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476765; cv=none; b=PRr9WEPbs2KG9GJQw8AbVg76/uNHwtlyutHyEEetuTGgrVKrZlvvYdtqjeKNjNDwM91wdwGpqibz5GPOw8J8QEfHF1rlN4j2UP6ZFPix2/nsUZvdbMw16PJ1pCkgcog28BXrM8sKgDlHb4eclOPB/IwhzsX4+YWC7mCHE+CXQEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476765; c=relaxed/simple;
	bh=Ido9S59InPS9RwZs77QpPGp09ySwQ7pdc6I8VDxFzL4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EMZ64P/X47QzcN9PWt6vTufCnSyDgoi/zQ5Ih3xO7YP9ft/3KLK0aRJGCk41QOnPjv6JqfLof7X0KGMDi557NLAbhVO9AsrT5hqKnn4UauvqaUWRnzc5pjvECb4Lss168XHPgihCZrJX3vSIdqP3q10/5kPqc2/fSYaFQL9+cwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7qgXGtx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7qgXGtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789476763; x=1821012763;
  h=date:from:to:cc:subject:message-id;
  bh=Ido9S59InPS9RwZs77QpPGp09ySwQ7pdc6I8VDxFzL4=;
  b=S7qgXGtxw64h6JnQ8Wf2lVNKh82d7k/xkxMoDyNc6c63+xYOVYnY/6MS
   0FN55lqL8CSa/XfggPrZ6Pvrf2c8NCgpQWZeCuwyz7gfRpLGpofapTr3L
   0YV7rEwqkEhjXqJDU9/0GSv5HCML7ipIZGDwmDB6Y83OLUMEbQYI+mtiT
   V9N4cYiNpHOND64vD9pcmafq9iDIm0t9nlxRw+eqFB+aCLsJ3W4RFWEg4
   heXnVtvxWekFggQgsuPkOj78uIZcvlyhUgAmj9TamdbTe+I5DXZSP7L4D
   onEhrjUKx4Ij0kNm6qTLy9Z7hLCEmg1p/1ydmxAtVE+smtdgJVplS+xAS
   A==;
X-CSE-ConnectionGUID: VWwadWMNQ6WDybWSlPFuCg==
X-CSE-MsgGUID: CznQjJUNSoS3wh422wJp3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107350128"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107350128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 05:52:42 -0700
X-CSE-ConnectionGUID: uuQ51OevT1qEugxfMo0gYw==
X-CSE-MsgGUID: bykCNYcSRK6SW/URoRezuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="302884972"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Sep 2026 05:52:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6SeM-000000004Wr-3A2S;
	Tue, 15 Sep 2026 12:52:38 +0000
Date: Tue, 15 Sep 2026 20:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 4429/6545] fs/kernfs/dir.c:751:31:
 sparse: sparse: cast to non-scalar
Message-ID: <202609152007.ZrNbQ8XS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
commit: 81bdc85b4c086502f4446a58eb5d25f29bb5e9f7 [4429/6545] kernfs: fix up the unlocked attribute reads on the creation paths
config: alpha-randconfig-r121-20260915 (https://download.01.org/0day-ci/archive/20260915/202609152007.ZrNbQ8XS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609152007.ZrNbQ8XS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609152007.ZrNbQ8XS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/kernfs/dir.c:751:31: sparse: sparse: cast to non-scalar
>> fs/kernfs/dir.c:751:31: sparse: sparse: cast from non-scalar

vim +751 fs/kernfs/dir.c

   731	
   732	struct kernfs_node *kernfs_new_node(struct kernfs_node *parent,
   733					    const char *name, umode_t mode,
   734					    kuid_t uid, kgid_t gid,
   735					    unsigned flags)
   736	{
   737		struct kernfs_node *kn;
   738	
   739		/*
   740		 * The mode and the gid below are read unlocked on purpose: they feed
   741		 * a node that does not exist yet, so nothing orders a racing chmod or
   742		 * chown against this creation.
   743		 */
   744		if (READ_ONCE(parent->mode) & S_ISGID) {
   745			/* this code block imitates inode_init_owner() for
   746			 * kernfs
   747			 */
   748			struct kernfs_iattrs *attrs = READ_ONCE(parent->iattr);
   749	
   750			if (attrs)
 > 751				gid = READ_ONCE(attrs->ia_gid);
   752	
   753			if (flags & KERNFS_DIR)
   754				mode |= S_ISGID;
   755		}
   756	
   757		kn = __kernfs_new_node(kernfs_root(parent), parent,
   758				       name, mode, uid, gid, flags);
   759		return kn;
   760	}
   761	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
