Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C6F7F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 07:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681456882; x=1712992882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LjCNsqubrHH9XLw2fFZaVfhq8Vpy4LPYCYoY6BVBSQc=;
  b=dHh/pUIhcfp3MhVH/UNW4rGYmugTJPacav6bru9EkMhA0mkmlcRkluVU
   AT7os5v69fHw+nFIoH90exKxS/BoQJQIwOTSnLPb4O+xaALX42YO4QGX1
   x/C0I038ToGBDK7rVofBgtOLkB2lsETQzxjKc3u6S823ce65HU1bbEiPR
   J/jIj4ADt7lPNKI4JnIuJySp1CveF0Rk5I+UvIByIHQ6LdIOezq6ET9OE
   MAumbrJ3ehNU8GBh7UaNn35LwHJVNzqDtv3R+GUzNZBlEVU09xlE3UEKJ
   OtCXVWKF8YScsiOUFCjbi4hVyd8apEY5QfXkoSV05tpK/oXdVjwffjUGF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="346233502"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="346233502"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 00:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="667077200"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="667077200"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Apr 2023 00:21:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnDkG-000ZKN-1y;
	Fri, 14 Apr 2023 07:21:20 +0000
Date: Fri, 14 Apr 2023 15:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230413-module-alloc-opts 118/118]
 fs/kernel_read_file.c:278:6: warning: no previous prototype for
 'kread_dup_request_announce'
Message-ID: <202304141516.kdRQkvK7-lkp@intel.com>
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
commit: b40c1a39dfb04b688a41f60434d18da848d02cf3 [118/118] kread: avoid duplicates
config: i386-randconfig-a011-20230410 (https://download.01.org/0day-ci/archive/20230414/202304141516.kdRQkvK7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=b40c1a39dfb04b688a41f60434d18da848d02cf3
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230413-module-alloc-opts
        git checkout b40c1a39dfb04b688a41f60434d18da848d02cf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141516.kdRQkvK7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernel_read_file.c:278:6: warning: no previous prototype for 'kread_dup_request_announce' [-Wmissing-prototypes]
     278 | void kread_dup_request_announce(char *name, int ret)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kread_dup_request_announce +278 fs/kernel_read_file.c

   277	
 > 278	void kread_dup_request_announce(char *name, int ret)
   279	{
   280		struct kread_dup_req *kread_req;
   281	
   282		mutex_lock(&kread_dup_mutex);
   283	
   284		kread_req = kread_dup_request_lookup(name);
   285		if (!kread_req)
   286			goto out;
   287	
   288		kread_req->dup_ret = ret;
   289	
   290		/*
   291		 * If we complete() here we may allow duplicate threads
   292		 * to continue before the first one that submitted the
   293		 * request. We're in no rush but avoid boot delays caused
   294		 * by these threads waiting too long.
   295		 */
   296		queue_work(system_wq, &kread_req->complete_work);
   297	
   298	out:
   299		mutex_unlock(&kread_dup_mutex);
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
