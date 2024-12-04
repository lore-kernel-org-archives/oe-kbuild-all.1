Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33421383
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 05:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733290267; cv=none; b=rsik+m8blwEHzqMx91iOka2hlCFZKF1SoTnF4eCmFU/7jlkB3+hu2OqSHCkrNbAiSO12xUiX1Z/R84NbaXrzoD08GnPK88PRPRancEk9LeaS+xD4OxN7strpkoH+ntSIbrXQiVvtQxs/+UbBDLELGNYXwbB4UGnIHYJmQjy4b70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733290267; c=relaxed/simple;
	bh=h60bToUHnYymi6ctZjJ/pTm76JkrEEFpo0uCr5CMSYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JiwFqtCog9mQUpn7vgog53XIYWRzfC44JE6o1zLvBupCKeu/z31wfc0/Zz4DR3RXNE5UAJolY/HakYv0/pF3C+MyMwpohRU0fTkOV9rUDAnWcL7gXtFhDpGgjVEo3zI0/GH8R4oBljJ0KVxlRybBO2g8unnO0J8iWcC6pLqNmek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PV3Xn2M3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PV3Xn2M3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733290262; x=1764826262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h60bToUHnYymi6ctZjJ/pTm76JkrEEFpo0uCr5CMSYY=;
  b=PV3Xn2M3Gc+XiOtW/bxAG9wf1g1+6EjsG1t1kWPvifOhM/hWksCKprsQ
   udCnwTr2QC/X71ZdzvfqgIPALpMpkvQB/+XV9g7U+/uPy+u1aSV72BN2U
   UDVJhFEsoWWtGG5iWeZAVW2OUP6cluCcMpa/FrT8KL8z4P9e5fT2D/gdc
   lkWsNF+X0/pMEEvnAPp05ieDk4mEiLEVv5xj+uNFB3vIaELIjFviXuOan
   I0UeEPVbSE5D3FWA3M7e8MUs15f52dGRlvVugRBvGKS/GSxQMH+noV7+i
   zArQI9meAc4qFqjqe3KpyxbDKNSRvnHmM8TO8cOl2LvgnWD5EkeMCYTvl
   g==;
X-CSE-ConnectionGUID: XMyP7eByRXSI+OgCnt4a0g==
X-CSE-MsgGUID: 0VNAgFd5QgK2wbo0b45DfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33287165"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="33287165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 21:31:01 -0800
X-CSE-ConnectionGUID: VuQE+oTBT6WwoXIZEHrUqg==
X-CSE-MsgGUID: KeMgoTYkSPiWK4EiK0KdTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="124486075"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Dec 2024 21:31:00 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIhyT-0002cx-3A;
	Wed, 04 Dec 2024 05:30:57 +0000
Date: Wed, 4 Dec 2024 13:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Rome <linux@jordanrome.com>
Cc: oe-kbuild-all@lists.linux.dev, Serge Hallyn <sergeh@kernel.org>,
	Paul Moore <paul@paul-moore.com>
Subject: [linux-next:master 915/1720] security/commoncap.c:65: warning:
 Function parameter or struct member 'cred' not described in
 'cap_capable_helper'
Message-ID: <202412041356.WuH3QSxj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c245a7a79602ccbee780c004c1e4abcda66aec32
commit: 937b8c767335e08b6a01723a2a825610c8a7350b [915/1720] security: add trace event for cap_capable
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20241204/202412041356.WuH3QSxj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041356.WuH3QSxj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041356.WuH3QSxj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/commoncap.c:65: warning: Function parameter or struct member 'cred' not described in 'cap_capable_helper'
>> security/commoncap.c:65: warning: Function parameter or struct member 'target_ns' not described in 'cap_capable_helper'
>> security/commoncap.c:65: warning: Function parameter or struct member 'cred_ns' not described in 'cap_capable_helper'
>> security/commoncap.c:65: warning: Function parameter or struct member 'cap' not described in 'cap_capable_helper'


vim +65 security/commoncap.c

b5f22a59c035665 Serge Hallyn      2009-04-02   54  
1d045980e1eff48 David Howells     2008-11-14   55  /**
937b8c767335e08 Jordan Rome       2024-11-28   56   * cap_capable_helper - Determine whether a task has a particular effective
937b8c767335e08 Jordan Rome       2024-11-28   57   * capability.
1d045980e1eff48 David Howells     2008-11-14   58   *
937b8c767335e08 Jordan Rome       2024-11-28   59   * See cap_capable for more details.
a6dbb1ef2fc8d73 Andrew G. Morgan  2008-01-21   60   */
937b8c767335e08 Jordan Rome       2024-11-28   61  static inline int cap_capable_helper(const struct cred *cred,
937b8c767335e08 Jordan Rome       2024-11-28   62  				     struct user_namespace *target_ns,
937b8c767335e08 Jordan Rome       2024-11-28   63  				     const struct user_namespace *cred_ns,
937b8c767335e08 Jordan Rome       2024-11-28   64  				     int cap)
^1da177e4c3f415 Linus Torvalds    2005-04-16  @65  {
937b8c767335e08 Jordan Rome       2024-11-28   66  	struct user_namespace *ns = target_ns;
3486740a4f32a6a Serge E. Hallyn   2011-03-23   67  
520d9eabce18edf Eric W. Biederman 2012-12-13   68  	/* See if cred has the capability in the target user namespace
520d9eabce18edf Eric W. Biederman 2012-12-13   69  	 * by examining the target user namespace and all of the target
520d9eabce18edf Eric W. Biederman 2012-12-13   70  	 * user namespace's parents.
520d9eabce18edf Eric W. Biederman 2012-12-13   71  	 */
520d9eabce18edf Eric W. Biederman 2012-12-13   72  	for (;;) {
3486740a4f32a6a Serge E. Hallyn   2011-03-23   73  		/* Do we have the necessary capabilities? */
937b8c767335e08 Jordan Rome       2024-11-28   74  		if (likely(ns == cred_ns))
3699c53c485bf01 David Howells     2009-01-06   75  			return cap_raised(cred->cap_effective, cap) ? 0 : -EPERM;
3486740a4f32a6a Serge E. Hallyn   2011-03-23   76  
64db4c7f4c1dde2 Kirill Tkhai      2017-05-02   77  		/*
64db4c7f4c1dde2 Kirill Tkhai      2017-05-02   78  		 * If we're already at a lower level than we're looking for,
64db4c7f4c1dde2 Kirill Tkhai      2017-05-02   79  		 * we're done searching.
64db4c7f4c1dde2 Kirill Tkhai      2017-05-02   80  		 */
937b8c767335e08 Jordan Rome       2024-11-28   81  		if (ns->level <= cred_ns->level)
3486740a4f32a6a Serge E. Hallyn   2011-03-23   82  			return -EPERM;
3486740a4f32a6a Serge E. Hallyn   2011-03-23   83  
520d9eabce18edf Eric W. Biederman 2012-12-13   84  		/* 
520d9eabce18edf Eric W. Biederman 2012-12-13   85  		 * The owner of the user namespace in the parent of the
520d9eabce18edf Eric W. Biederman 2012-12-13   86  		 * user namespace has all caps.
520d9eabce18edf Eric W. Biederman 2012-12-13   87  		 */
937b8c767335e08 Jordan Rome       2024-11-28   88  		if ((ns->parent == cred_ns) && uid_eq(ns->owner, cred->euid))
520d9eabce18edf Eric W. Biederman 2012-12-13   89  			return 0;
520d9eabce18edf Eric W. Biederman 2012-12-13   90  
3486740a4f32a6a Serge E. Hallyn   2011-03-23   91  		/*
3486740a4f32a6a Serge E. Hallyn   2011-03-23   92  		 * If you have a capability in a parent user ns, then you have
3486740a4f32a6a Serge E. Hallyn   2011-03-23   93  		 * it over all children user namespaces as well.
3486740a4f32a6a Serge E. Hallyn   2011-03-23   94  		 */
520d9eabce18edf Eric W. Biederman 2012-12-13   95  		ns = ns->parent;
3486740a4f32a6a Serge E. Hallyn   2011-03-23   96  	}
3486740a4f32a6a Serge E. Hallyn   2011-03-23   97  
3486740a4f32a6a Serge E. Hallyn   2011-03-23   98  	/* We never get here */
^1da177e4c3f415 Linus Torvalds    2005-04-16   99  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  100  

:::::: The code at line 65 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
