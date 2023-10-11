Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF10DD2E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 05:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzEVRbPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697001550; x=1728537550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hzdCo8sHX9qUf50RkI8BlyG5RkgpZ0esSUnJCxZOo8M=;
  b=NzEVRbPbeupcPnTJxZXQWvBlfjiCGLr8rwK1VliETdz5FUKUO2rr0uUg
   JwnM7I8pw/mHw4FQQvEKUq1NsdBpBHhJ/OM68w1pohp10c7BeLUeo7WAG
   tbCsKW6VeojtZYDRJcD1gFNliUR8WR2sq5YBztTjnvnBJFJw5QR0IObKU
   WfmJKz+oXklZki86ohxOp1k4uapBq9zlAb0+zhjJ0+j1Ukgq/PMBTs0JI
   SqD3VGcSAG3Bp8NiyMDyUJbSh4OBJ39hG8jwwQXnFOxfHgeniG3YxXgd1
   ySgJdNoJMpCKqJl9aMCKG6rzcoWxpgAtWwm/sj+jTdVpe1BSpIoa4vOdd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="451073675"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="451073675"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1000968416"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="1000968416"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2023 22:19:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqRcG-0001lp-1X;
	Wed, 11 Oct 2023 05:18:50 +0000
Date: Wed, 11 Oct 2023 13:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <keescook@chromium.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [kees:for-next/execve 10/10] fs/binfmt_misc.c:91: warning: Function
 parameter or member 'misc' not described in 'search_binfmt_handler'
Message-ID: <202310111341.87eYXHRy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
head:   6f88724a1901ebcc039851aa2e001d11e33e841e
commit: 6f88724a1901ebcc039851aa2e001d11e33e841e [10/10] binfmt_misc: enable sandboxed mounts
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231011/202310111341.87eYXHRy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111341.87eYXHRy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310111341.87eYXHRy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/binfmt_misc.c:91: warning: Function parameter or member 'misc' not described in 'search_binfmt_handler'
>> fs/binfmt_misc.c:140: warning: Function parameter or member 'misc' not described in 'get_binfmt_handler'
>> fs/binfmt_misc.c:725: warning: Function parameter or member 'misc' not described in 'remove_binfmt_handler'


vim +91 fs/binfmt_misc.c

bbaecc088245e8 Mike Frysinger    2014-10-13   79  
16cc9f5f41ffb1 Christian Brauner 2021-10-28   80  /**
16cc9f5f41ffb1 Christian Brauner 2021-10-28   81   * search_binfmt_handler - search for a binary handler for @bprm
16cc9f5f41ffb1 Christian Brauner 2021-10-28   82   * @bprm: binary for which we are looking for a handler
16cc9f5f41ffb1 Christian Brauner 2021-10-28   83   *
16cc9f5f41ffb1 Christian Brauner 2021-10-28   84   * Search for a binary type handler for @bprm in the list of registered binary
16cc9f5f41ffb1 Christian Brauner 2021-10-28   85   * type handlers.
16cc9f5f41ffb1 Christian Brauner 2021-10-28   86   *
16cc9f5f41ffb1 Christian Brauner 2021-10-28   87   * Return: binary type list entry on success, NULL on failure
^1da177e4c3f41 Linus Torvalds    2005-04-16   88   */
6f88724a1901eb Christian Brauner 2021-10-28   89  static Node *search_binfmt_handler(struct binfmt_misc *misc,
6f88724a1901eb Christian Brauner 2021-10-28   90  				   struct linux_binprm *bprm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  @91  {
^1da177e4c3f41 Linus Torvalds    2005-04-16   92  	char *p = strrchr(bprm->interp, '.');
16cc9f5f41ffb1 Christian Brauner 2021-10-28   93  	Node *e;
^1da177e4c3f41 Linus Torvalds    2005-04-16   94  
6b899c4e9a049d Mike Frysinger    2014-12-10   95  	/* Walk all the registered handlers. */
6f88724a1901eb Christian Brauner 2021-10-28   96  	list_for_each_entry(e, &misc->entries, list) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   97  		char *s;
^1da177e4c3f41 Linus Torvalds    2005-04-16   98  		int j;
^1da177e4c3f41 Linus Torvalds    2005-04-16   99  
6b899c4e9a049d Mike Frysinger    2014-12-10  100  		/* Make sure this one is currently enabled. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  101  		if (!test_bit(Enabled, &e->flags))
^1da177e4c3f41 Linus Torvalds    2005-04-16  102  			continue;
^1da177e4c3f41 Linus Torvalds    2005-04-16  103  
6b899c4e9a049d Mike Frysinger    2014-12-10  104  		/* Do matching based on extension if applicable. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  105  		if (!test_bit(Magic, &e->flags)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  106  			if (p && !strcmp(e->magic, p + 1))
^1da177e4c3f41 Linus Torvalds    2005-04-16  107  				return e;
^1da177e4c3f41 Linus Torvalds    2005-04-16  108  			continue;
^1da177e4c3f41 Linus Torvalds    2005-04-16  109  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  110  
6b899c4e9a049d Mike Frysinger    2014-12-10  111  		/* Do matching based on magic & mask. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  112  		s = bprm->buf + e->offset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  113  		if (e->mask) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  114  			for (j = 0; j < e->size; j++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  115  				if ((*s++ ^ e->magic[j]) & e->mask[j])
^1da177e4c3f41 Linus Torvalds    2005-04-16  116  					break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  117  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  118  			for (j = 0; j < e->size; j++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  119  				if ((*s++ ^ e->magic[j]))
^1da177e4c3f41 Linus Torvalds    2005-04-16  120  					break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  121  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  122  		if (j == e->size)
^1da177e4c3f41 Linus Torvalds    2005-04-16  123  			return e;
^1da177e4c3f41 Linus Torvalds    2005-04-16  124  	}
16cc9f5f41ffb1 Christian Brauner 2021-10-28  125  
^1da177e4c3f41 Linus Torvalds    2005-04-16  126  	return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  127  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  128  
16cc9f5f41ffb1 Christian Brauner 2021-10-28  129  /**
16cc9f5f41ffb1 Christian Brauner 2021-10-28  130   * get_binfmt_handler - try to find a binary type handler
16cc9f5f41ffb1 Christian Brauner 2021-10-28  131   * @bprm: binary for which we are looking for a handler
16cc9f5f41ffb1 Christian Brauner 2021-10-28  132   *
16cc9f5f41ffb1 Christian Brauner 2021-10-28  133   * Try to find a binfmt handler for the binary type. If one is found take a
16cc9f5f41ffb1 Christian Brauner 2021-10-28  134   * reference to protect against removal via bm_{entry,status}_write().
16cc9f5f41ffb1 Christian Brauner 2021-10-28  135   *
16cc9f5f41ffb1 Christian Brauner 2021-10-28  136   * Return: binary type list entry on success, NULL on failure
16cc9f5f41ffb1 Christian Brauner 2021-10-28  137   */
6f88724a1901eb Christian Brauner 2021-10-28  138  static Node *get_binfmt_handler(struct binfmt_misc *misc,
6f88724a1901eb Christian Brauner 2021-10-28  139  				struct linux_binprm *bprm)
16cc9f5f41ffb1 Christian Brauner 2021-10-28 @140  {
16cc9f5f41ffb1 Christian Brauner 2021-10-28  141  	Node *e;
16cc9f5f41ffb1 Christian Brauner 2021-10-28  142  
6f88724a1901eb Christian Brauner 2021-10-28  143  	read_lock(&misc->entries_lock);
6f88724a1901eb Christian Brauner 2021-10-28  144  	e = search_binfmt_handler(misc, bprm);
16cc9f5f41ffb1 Christian Brauner 2021-10-28  145  	if (e)
16cc9f5f41ffb1 Christian Brauner 2021-10-28  146  		refcount_inc(&e->users);
6f88724a1901eb Christian Brauner 2021-10-28  147  	read_unlock(&misc->entries_lock);
16cc9f5f41ffb1 Christian Brauner 2021-10-28  148  	return e;
16cc9f5f41ffb1 Christian Brauner 2021-10-28  149  }
16cc9f5f41ffb1 Christian Brauner 2021-10-28  150  

:::::: The code at line 91 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
