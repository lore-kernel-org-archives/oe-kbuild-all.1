Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5237344C7E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 15:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Srj4WYfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702825345; x=1734361345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iaygATrLxVqnl7DBpyC3FxOvDMQi1j/j01uEAErMcGg=;
  b=Srj4WYfJNTLVDFSFqeKQGBcYYzkEt7RwKGmoL8v1giPb2n41w7sB/64f
   YUDY3P81E0BeJMgpMzfpPXeZNQfdyhc1DDXkFOtb/49pdA2ykc8E0E3HH
   wyN6/mG2lph4JzlwMzrsKxlQl1OvSBCypPIP5oBgxc6MK3DqCdFa/f/tO
   Pf7haEzh8e/pDptfnC9jIQ5EHvyVLoVKymlf8jvku0Vf+mOZd0kR58xqn
   pZt+DXyG5zwOFmsnuZmhghAkHcIccloCgiBQ7YgsLDJkeyRO+HR6v/wST
   PKEHwkJBhOOG16jjliERlFCqLWwcM+SzZH1/OFsfUMd6HH42Md7ikDlQy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="426552345"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="426552345"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 07:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="845673304"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="845673304"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2023 07:02:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEseo-00038W-0s;
	Sun, 17 Dec 2023 15:02:18 +0000
Date: Sun, 17 Dec 2023 23:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 22/50] ipc/util.h:188:8: warning:
 assignment makes pointer from integer without a cast
Message-ID: <202312172240.YQWpsBsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: e7caeebe946875edba9000d1168cac3b0d9d8d21 [22/50] pid: Split out pid_types.h
config: i386-defconfig (https://download.01.org/0day-ci/archive/20231217/202312172240.YQWpsBsU-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312172240.YQWpsBsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312172240.YQWpsBsU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ipc/ipc_sysctl.c:17:0:
   ipc/util.h: In function 'ipc_update_pid':
   ipc/util.h:188:10: error: implicit declaration of function 'get_pid'; did you mean 'set_p4d'? [-Werror=implicit-function-declaration]
      *pos = get_pid(pid);
             ^~~~~~~
             set_p4d
>> ipc/util.h:188:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      *pos = get_pid(pid);
           ^
   ipc/util.h:189:3: error: implicit declaration of function 'put_pid'; did you mean 'pfn_pud'? [-Werror=implicit-function-declaration]
      put_pid(old);
      ^~~~~~~
      pfn_pud
   cc1: some warnings being treated as errors


vim +188 ipc/util.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  176  
^1da177e4c3f41 Linus Torvalds    2005-04-16  177  void kernel_to_ipc64_perm(struct kern_ipc_perm *in, struct ipc64_perm *out);
^1da177e4c3f41 Linus Torvalds    2005-04-16  178  void ipc64_perm_to_ipc_perm(struct ipc64_perm *in, struct ipc_perm *out);
1efdb69b0bb41d Eric W. Biederman 2012-02-07  179  int ipc_update_perm(struct ipc64_perm *in, struct kern_ipc_perm *out);
4241c1a3040785 Manfred Spraul    2018-08-21  180  struct kern_ipc_perm *ipcctl_obtain_check(struct ipc_namespace *ns,
444d0f621b6471 Davidlohr Bueso   2013-04-30  181  					     struct ipc_ids *ids, int id, int cmd,
444d0f621b6471 Davidlohr Bueso   2013-04-30  182  					     struct ipc64_perm *perm, int extra_perm);
^1da177e4c3f41 Linus Torvalds    2005-04-16  183  
03f1fc09180b34 Eric W. Biederman 2018-03-23  184  static inline void ipc_update_pid(struct pid **pos, struct pid *pid)
03f1fc09180b34 Eric W. Biederman 2018-03-23  185  {
03f1fc09180b34 Eric W. Biederman 2018-03-23  186  	struct pid *old = *pos;
03f1fc09180b34 Eric W. Biederman 2018-03-23  187  	if (old != pid) {
03f1fc09180b34 Eric W. Biederman 2018-03-23 @188  		*pos = get_pid(pid);
03f1fc09180b34 Eric W. Biederman 2018-03-23  189  		put_pid(old);
03f1fc09180b34 Eric W. Biederman 2018-03-23  190  	}
03f1fc09180b34 Eric W. Biederman 2018-03-23  191  }
03f1fc09180b34 Eric W. Biederman 2018-03-23  192  

:::::: The code at line 188 was first introduced by commit
:::::: 03f1fc09180b345582889a344b012d069b3a6dbe ipc/util: Helpers for making the sysvipc operations pid namespace aware

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
