Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F376FBF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783171170; cv=none; b=iSbHLFNQsrt8CDj70d4m+f+C+/dIPFDaL2JqqHO5FNdwZZ1iOXfN/0qYXeN6PafCCkru6huz3kky5S7494qZn+/zk2lLftKuL4xprfjouhb2sctiFHOwWD8Cs46/q8EFfVCY/eT9fX9Npr82ar/KxSjykz81z8mVsdbpQatj0Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783171170; c=relaxed/simple;
	bh=XDsCH0kXCOo8e422uelNd/e7hHnYJVFLq0S58hdcKlE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sEEHzo26gfIAC4BJR8sdTWmlLM/KCq+aFgizklCqBD95OfA1Ug7qfelyKtkYZGmLJZEjHuuATTDHiP9xbwO1wo6wn67n/2u22FotXqgdHhvZZNMud7HdRMHz/BxpC3YUV+c3EGouchyazw22PeK0n1bBY3s4xrGODcRszPSvWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hd//JERe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hd//JERe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783171168; x=1814707168;
  h=date:from:to:cc:subject:message-id;
  bh=XDsCH0kXCOo8e422uelNd/e7hHnYJVFLq0S58hdcKlE=;
  b=Hd//JERehAPyxRbb4ghOheCh9bEVbJB4HSvzzjayPqfCuFKionrjx7eC
   0OtuQyQFy/u3PzMDSKzpWgrKOMdsRDseP8qa/UB6WiyRG6A2JP1ZWqNSQ
   9a3Dovrk49HJxj+utClTBd8bjmTaAs9tpVJANeKYm61BoUNvH3CtaHIYR
   XK02/t1buLfPA9L9uQvUKDzySKXQkkdADMNg87M0r+TfmnuMITZCNi9vE
   si3rGqn54WXYQcXF/Ucjr3B0NKjUocqGCw6MffV+Kue3CiRi4vLRSmK4D
   07wbgDoP913G30M80E4U5+6Xzbk6bTiAXwU2QQHjiU14yPpCFXtjz4yB5
   w==;
X-CSE-ConnectionGUID: 3TAQ/VmuSBqKteVYC19bzQ==
X-CSE-MsgGUID: 5or8ZWI9QCqJfphoAvHhzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="101426904"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="101426904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 06:19:27 -0700
X-CSE-ConnectionGUID: q+9gsq3aQXaFHtXQEh1aNg==
X-CSE-MsgGUID: LWZCaBjCSy6zRGUirEkdBg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jul 2026 06:19:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg0HD-00000000D4p-2VWF;
	Sat, 04 Jul 2026 13:19:23 +0000
Date: Sat, 04 Jul 2026 21:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1] fs/binfmt_misc.c:95:
 warning: Excess function parameter 'misc' description in
 'search_binfmt_handler'
Message-ID: <202607042129.NAOdwIqj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   a00af2707c1d0a67daa8f91db74300f65d84db3b
commit: a43edc7abc4fd96c05ef1b8b2c164fa040b4cc6d [0/1] binfmt_misc: cleanup on filesystem umount
config: i386-randconfig-012-20260702 (https://download.01.org/0day-ci/archive/20260704/202607042129.NAOdwIqj-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607042129.NAOdwIqj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607042129.NAOdwIqj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/binfmt_misc.c:95: warning: Excess function parameter 'misc' description in 'search_binfmt_handler'
>> fs/binfmt_misc.c:144: warning: Excess function parameter 'misc' description in 'get_binfmt_handler'
>> fs/binfmt_misc.c:680: warning: Excess function parameter 'misc' description in 'remove_binfmt_handler'


vim +95 fs/binfmt_misc.c

bbaecc088245e84 Mike Frysinger    2014-10-13   83  
a43edc7abc4fd96 Christian Brauner 2021-10-28   84  /**
a43edc7abc4fd96 Christian Brauner 2021-10-28   85   * search_binfmt_handler - search for a binary handler for @bprm
a43edc7abc4fd96 Christian Brauner 2021-10-28   86   * @misc: handle to binfmt_misc instance
a43edc7abc4fd96 Christian Brauner 2021-10-28   87   * @bprm: binary for which we are looking for a handler
a43edc7abc4fd96 Christian Brauner 2021-10-28   88   *
a43edc7abc4fd96 Christian Brauner 2021-10-28   89   * Search for a binary type handler for @bprm in the list of registered binary
a43edc7abc4fd96 Christian Brauner 2021-10-28   90   * type handlers.
a43edc7abc4fd96 Christian Brauner 2021-10-28   91   *
a43edc7abc4fd96 Christian Brauner 2021-10-28   92   * Return: binary type list entry on success, NULL on failure
^1da177e4c3f415 Linus Torvalds    2005-04-16   93   */
a43edc7abc4fd96 Christian Brauner 2021-10-28   94  static Node *search_binfmt_handler(struct linux_binprm *bprm)
^1da177e4c3f415 Linus Torvalds    2005-04-16  @95  {
^1da177e4c3f415 Linus Torvalds    2005-04-16   96  	char *p = strrchr(bprm->interp, '.');
a43edc7abc4fd96 Christian Brauner 2021-10-28   97  	Node *e;
^1da177e4c3f415 Linus Torvalds    2005-04-16   98  
6b899c4e9a049df Mike Frysinger    2014-12-10   99  	/* Walk all the registered handlers. */
a43edc7abc4fd96 Christian Brauner 2021-10-28  100  	list_for_each_entry(e, &entries, list) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  101  		char *s;
^1da177e4c3f415 Linus Torvalds    2005-04-16  102  		int j;
^1da177e4c3f415 Linus Torvalds    2005-04-16  103  
6b899c4e9a049df Mike Frysinger    2014-12-10  104  		/* Make sure this one is currently enabled. */
^1da177e4c3f415 Linus Torvalds    2005-04-16  105  		if (!test_bit(Enabled, &e->flags))
^1da177e4c3f415 Linus Torvalds    2005-04-16  106  			continue;
^1da177e4c3f415 Linus Torvalds    2005-04-16  107  
6b899c4e9a049df Mike Frysinger    2014-12-10  108  		/* Do matching based on extension if applicable. */
^1da177e4c3f415 Linus Torvalds    2005-04-16  109  		if (!test_bit(Magic, &e->flags)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  110  			if (p && !strcmp(e->magic, p + 1))
^1da177e4c3f415 Linus Torvalds    2005-04-16  111  				return e;
^1da177e4c3f415 Linus Torvalds    2005-04-16  112  			continue;
^1da177e4c3f415 Linus Torvalds    2005-04-16  113  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  114  
6b899c4e9a049df Mike Frysinger    2014-12-10  115  		/* Do matching based on magic & mask. */
^1da177e4c3f415 Linus Torvalds    2005-04-16  116  		s = bprm->buf + e->offset;
^1da177e4c3f415 Linus Torvalds    2005-04-16  117  		if (e->mask) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  118  			for (j = 0; j < e->size; j++)
^1da177e4c3f415 Linus Torvalds    2005-04-16  119  				if ((*s++ ^ e->magic[j]) & e->mask[j])
^1da177e4c3f415 Linus Torvalds    2005-04-16  120  					break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  121  		} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  122  			for (j = 0; j < e->size; j++)
^1da177e4c3f415 Linus Torvalds    2005-04-16  123  				if ((*s++ ^ e->magic[j]))
^1da177e4c3f415 Linus Torvalds    2005-04-16  124  					break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  125  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  126  		if (j == e->size)
^1da177e4c3f415 Linus Torvalds    2005-04-16  127  			return e;
^1da177e4c3f415 Linus Torvalds    2005-04-16  128  	}
a43edc7abc4fd96 Christian Brauner 2021-10-28  129  
^1da177e4c3f415 Linus Torvalds    2005-04-16  130  	return NULL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  131  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  132  
a43edc7abc4fd96 Christian Brauner 2021-10-28  133  /**
a43edc7abc4fd96 Christian Brauner 2021-10-28  134   * get_binfmt_handler - try to find a binary type handler
a43edc7abc4fd96 Christian Brauner 2021-10-28  135   * @misc: handle to binfmt_misc instance
a43edc7abc4fd96 Christian Brauner 2021-10-28  136   * @bprm: binary for which we are looking for a handler
a43edc7abc4fd96 Christian Brauner 2021-10-28  137   *
a43edc7abc4fd96 Christian Brauner 2021-10-28  138   * Try to find a binfmt handler for the binary type. If one is found take a
a43edc7abc4fd96 Christian Brauner 2021-10-28  139   * reference to protect against removal via bm_{entry,status}_write().
a43edc7abc4fd96 Christian Brauner 2021-10-28  140   *
a43edc7abc4fd96 Christian Brauner 2021-10-28  141   * Return: binary type list entry on success, NULL on failure
a43edc7abc4fd96 Christian Brauner 2021-10-28  142   */
a43edc7abc4fd96 Christian Brauner 2021-10-28  143  static Node *get_binfmt_handler(struct linux_binprm *bprm)
a43edc7abc4fd96 Christian Brauner 2021-10-28 @144  {
a43edc7abc4fd96 Christian Brauner 2021-10-28  145  	Node *e;
a43edc7abc4fd96 Christian Brauner 2021-10-28  146  
a43edc7abc4fd96 Christian Brauner 2021-10-28  147  	read_lock(&entries_lock);
a43edc7abc4fd96 Christian Brauner 2021-10-28  148  	e = search_binfmt_handler(bprm);
a43edc7abc4fd96 Christian Brauner 2021-10-28  149  	if (e)
a43edc7abc4fd96 Christian Brauner 2021-10-28  150  		refcount_inc(&e->users);
a43edc7abc4fd96 Christian Brauner 2021-10-28  151  	read_unlock(&entries_lock);
a43edc7abc4fd96 Christian Brauner 2021-10-28  152  	return e;
a43edc7abc4fd96 Christian Brauner 2021-10-28  153  }
a43edc7abc4fd96 Christian Brauner 2021-10-28  154  

:::::: The code at line 95 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
