Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09880620
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 06:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681455023; x=1712991023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EIJ2cONUWGz14cS4gW7Km3A2DSxFJ7dGzfLi+9HjxCQ=;
  b=Cwv848JaPumM0YjLM7tUdb9NHvdErHUAS5mkVRe7bJGprIZsr4eX3NfI
   ySAW/856MpPXCcI1CZGCGJyYEsAZB7v/jyOphWG8NgqNJNDIxZYxYLTpX
   araYjd84WMHbwfCLMtKswnMUxO9BNFs+pfzo95/Msq2qUS21cpDoA7KMh
   ZUgnWE3c1eK0ISp3rHnxlHCiNrXijdEz78yrHOT7+mUeReWvLnq0FR1V3
   ABPnN9RHtAZxpMza3W9f0ZgoINZHqtmgANwr8iOI44OdL8eeLuWED1us0
   iB94k/i7w9NwPxLK+5wNM/dyaspM9Gl0JWdYdYfBr08aG8zjdVOtuhAEE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="344395571"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="344395571"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 23:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="683229363"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="683229363"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Apr 2023 23:50:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnDGF-000ZJP-2g;
	Fri, 14 Apr 2023 06:50:19 +0000
Date: Fri, 14 Apr 2023 14:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230413-module-alloc-opts 117/118]
 kernel/module/dups.c:108:6: warning: no previous prototype for
 'kmod_dup_request_exists_wait'
Message-ID: <202304141440.DYO4NAzp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230413-module-alloc-opts
head:   b40c1a39dfb04b688a41f60434d18da848d02cf3
commit: 1b8e410f70b73e3d7bee508036b1f79410c593f3 [117/118] module: add debugging auto-load duplicate module support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304141440.DYO4NAzp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=1b8e410f70b73e3d7bee508036b1f79410c593f3
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230413-module-alloc-opts
        git checkout 1b8e410f70b73e3d7bee508036b1f79410c593f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash kernel/module/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141440.DYO4NAzp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/dups.c:108:6: warning: no previous prototype for 'kmod_dup_request_exists_wait' [-Wmissing-prototypes]
     108 | bool kmod_dup_request_exists_wait(char *module_name, bool wait, int *dup_ret)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/module/dups.c:208:6: warning: no previous prototype for 'kmod_dup_request_announce' [-Wmissing-prototypes]
     208 | void kmod_dup_request_announce(char *module_name, int ret)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kmod_dup_request_exists_wait +108 kernel/module/dups.c

   107	
 > 108	bool kmod_dup_request_exists_wait(char *module_name, bool wait, int *dup_ret)
   109	{
   110		struct kmod_dup_req *kmod_req, *new_kmod_req;
   111		int ret;
   112	
   113		/*
   114		 * Pre-allocate the entry in case we have to use it later
   115		 * to avoid contention with the mutex.
   116		 */
   117		new_kmod_req = kzalloc(sizeof(*new_kmod_req), GFP_KERNEL);
   118		if (!new_kmod_req)
   119			return false;
   120	
   121		memcpy(new_kmod_req->name, module_name, strlen(module_name));
   122		INIT_WORK(&new_kmod_req->complete_work, kmod_dup_request_complete);
   123		INIT_DELAYED_WORK(&new_kmod_req->delete_work, kmod_dup_request_delete);
   124		init_completion(&new_kmod_req->first_req_done);
   125	
   126		mutex_lock(&kmod_dup_mutex);
   127	
   128		kmod_req = kmod_dup_request_lookup(module_name);
   129		if (!kmod_req) {
   130			/*
   131			 * If the first request that came through for a module
   132			 * was with request_module_nowait() we cannot wait for it
   133			 * and share its return value with other users which may
   134			 * have used request_module() and need a proper return value
   135			 * so just skip using them as an anchor.
   136			 *
   137			 * If a prior request to this one came through with
   138			 * request_module() though, then a request_module_nowait()
   139			 * would benefit from duplicate detection.
   140			 */
   141			if (!wait) {
   142				kfree(new_kmod_req);
   143				pr_warn("New request_module_nowait() for %s -- cannot track duplicates for this request\n", module_name);
   144				mutex_unlock(&kmod_dup_mutex);
   145				return false;
   146			}
   147	
   148			/*
   149			 * There was no duplicate, just add the request so we can
   150			 * keep tab on duplicates later.
   151			 */
   152			pr_info("New request_module() for %s\n", module_name);
   153			list_add_rcu(&new_kmod_req->list, &dup_kmod_reqs);
   154			mutex_unlock(&kmod_dup_mutex);
   155			return false;
   156		}
   157		mutex_unlock(&kmod_dup_mutex);
   158	
   159		/* We are dealing with a duplicate request now */
   160	
   161		kfree(new_kmod_req);
   162	
   163		/*
   164		 * To fix these try to use try_then_request_module() instead as that
   165		 * will check if the component you are looking for is present or not.
   166		 * You could also just queue a single request to load the module once,
   167		 * instead of having each and everything you need try to request for
   168		 * the module.
   169		 *
   170		 * Duplicate request_module() calls  can cause quite a bit of wasted
   171		 * vmalloc() space when racing with userspace.
   172		 */
   173		WARN(1, "module-autoload: duplicate request for module %s\n", module_name);
   174	
   175		if (!wait) {
   176			/*
   177			 * If request_module_nowait() was used then the user just
   178			 * wanted to issue the request and if another module request
   179			 * was already its way with the same name we don't care for
   180			 * the return value either. Let duplicate request_module_nowait()
   181			 * calls bail out right away.
   182			 */
   183			*dup_ret = 0;
   184			return true;
   185		}
   186	
   187		/*
   188		 * If a duplicate request_module() was used they *may* care for
   189		 * the return value, so we have no other option but to wait for
   190		 * the first caller to complete. If the first caller used
   191		 * the request_module_nowait() call, subsquent callers will
   192		 * deal with the comprmise of getting a successful call with this
   193		 * optimization enabled ...
   194		 */
   195		ret = wait_for_completion_state(&kmod_req->first_req_done,
   196						TASK_UNINTERRUPTIBLE | TASK_KILLABLE);
   197		if (ret) {
   198			*dup_ret = ret;
   199			return true;
   200		}
   201	
   202		/* Now the duplicate request has the same exact return value as the first request */
   203		*dup_ret = kmod_req->dup_ret;
   204	
   205		return true;
   206	}
   207	
 > 208	void kmod_dup_request_announce(char *module_name, int ret)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
