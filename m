Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A041210A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 06:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692684786; x=1724220786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7DM9OQDVH5Vt1P73mX3bpzy+rF4IqLiDOPLnWHcZNc4=;
  b=M67o/mED9BBom3L7U9X0GjBDe31f6y868SxPYv27RII4GjDKMksyRtB3
   7vJKdJ//JEby9DEIO2Z5tm9GhA7nS+/UiWYEUZpbVVBzV47x9JZLqQxVc
   5AwXhe+7zUujCmHnXil+p1Egjd1G4Tu720L2ZL8T9ZeUg6Lgu6JGC2w15
   V078bbCSYLtUmeCOz/KRZQXZVgaREWbslI5llD7BPavZnYau0ZWgtyH2v
   7IGcmIexQjaACaCnrmt5Hy3m6gZhIcZnzilfTmiHm87NBW630AX0b4rbL
   fq/EOZf3qbIYcImaDm9pH2/0PKoh6psSAiXcHx9bvC4aDvZOWws3DwaXF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="363955188"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="363955188"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 23:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="879807475"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 23:13:08 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYKd0-0001Qc-3C;
	Tue, 22 Aug 2023 06:12:46 +0000
Date: Tue, 22 Aug 2023 14:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <keescook@chromium.org>,
	David Windsor <dave@nullcore.net>,
	Hans Liljestrand <ishkamiel@gmail.com>
Subject: [kees:devel/hardening/refcount_t 21/21] kernel/cred.c:164:9: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202308221440.bOuT6uCB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Elena,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/hardening/refcount_t
head:   427c37e5ec0719f641e7a05c1aa5bedc4f7259ae
commit: 427c37e5ec0719f641e7a05c1aa5bedc4f7259ae [21/21] creds: Convert cred.usage to refcount_t
config: mips-randconfig-r121-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221440.bOuT6uCB-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221440.bOuT6uCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221440.bOuT6uCB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/cred.c:147:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:147:9: sparse:    struct cred *
   kernel/cred.c:147:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:147:9: sparse: sparse: cast from unknown type
   kernel/cred.c:148:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:148:9: sparse:    struct cred *
   kernel/cred.c:148:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:148:9: sparse: sparse: cast from unknown type
>> kernel/cred.c:164:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct const [noderef] __rcu * @@
   kernel/cred.c:164:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:168:17: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/cred.c:174:17: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/cred.c:266:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:355:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:355:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *real_cred @@     got struct cred const * @@
   kernel/cred.c:356:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:357:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *_cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:358:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct const [noderef] __rcu * @@
   kernel/cred.c:358:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:397:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *real_cred @@     got struct cred const * @@
   kernel/cred.c:450:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *real_cred @@
   kernel/cred.c:456:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:456:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:456:9: sparse:    struct cred const *
   kernel/cred.c:456:9: sparse: sparse: cast from unknown type
   kernel/cred.c:556:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:597:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *override @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:351:19: sparse: sparse: dereference of noderef expression

vim +164 kernel/cred.c

f1752eec6145c9 David Howells   2008-11-14  156  
e0e817392b9acf David Howells   2009-09-02  157  /*
e0e817392b9acf David Howells   2009-09-02  158   * Clean up a task's credentials when it exits
e0e817392b9acf David Howells   2009-09-02  159   */
e0e817392b9acf David Howells   2009-09-02  160  void exit_creds(struct task_struct *tsk)
e0e817392b9acf David Howells   2009-09-02  161  {
e0e817392b9acf David Howells   2009-09-02  162  	struct cred *cred;
e0e817392b9acf David Howells   2009-09-02  163  
e0e817392b9acf David Howells   2009-09-02 @164  	kdebug("exit_creds(%u,%p,%p,{%d,%d})", tsk->pid, tsk->real_cred, tsk->cred,
427c37e5ec0719 Elena Reshetova 2019-03-06  165  	       refcount_read(&tsk->cred->usage),
e0e817392b9acf David Howells   2009-09-02  166  	       read_cred_subscribers(tsk->cred));
e0e817392b9acf David Howells   2009-09-02  167  
e0e817392b9acf David Howells   2009-09-02  168  	cred = (struct cred *) tsk->real_cred;
e0e817392b9acf David Howells   2009-09-02  169  	tsk->real_cred = NULL;
e0e817392b9acf David Howells   2009-09-02  170  	validate_creds(cred);
e0e817392b9acf David Howells   2009-09-02  171  	alter_cred_subscribers(cred, -1);
e0e817392b9acf David Howells   2009-09-02  172  	put_cred(cred);
e0e817392b9acf David Howells   2009-09-02  173  
e0e817392b9acf David Howells   2009-09-02  174  	cred = (struct cred *) tsk->cred;
e0e817392b9acf David Howells   2009-09-02  175  	tsk->cred = NULL;
e0e817392b9acf David Howells   2009-09-02  176  	validate_creds(cred);
e0e817392b9acf David Howells   2009-09-02  177  	alter_cred_subscribers(cred, -1);
e0e817392b9acf David Howells   2009-09-02  178  	put_cred(cred);
7743c48e54ee9b David Howells   2019-06-19  179  

:::::: The code at line 164 was first introduced by commit
:::::: e0e817392b9acf2c98d3be80c233dddb1b52003d CRED: Add some configurable debugging [try #6]

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
