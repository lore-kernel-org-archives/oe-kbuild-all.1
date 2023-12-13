Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850DA23758
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNjZnhKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702466586; x=1734002586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O5tHNQUbQwKNSPwv2esEqv/ssaZ/K/3vQWIt7JOkNtg=;
  b=cNjZnhKFWbdWueHkuslrfM1iKyTVMpJvVItAmszhEtsgGWaQ3gfgtbdF
   asm177KxFauJ5rnCUe24gip7gLgkGTgCNAlzpB6EPpzDiDgIGk0yZewQB
   WkPSWHUlZU2WXHxkXrF/U6dksuWRu2YgXx6RVBByDtFkwv1EvHk9b/hQy
   kvD3W3kXMwwiRj+JrXLico9K5SsRetVUU6s4GJ9raOwibqIckYJPX8j5B
   +5ZF3Pd0VJqzKkDAtr+/eqVs4BTWV7Tnb39eG6Akvc0rlSyRXkoQVPnR6
   SsnrpHhePkTOcrF0FM9Njp4wI7YX//Jwph89MFPbhumfOA1pIv+IkdUDq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="394701065"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="394701065"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 03:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="802850999"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="802850999"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Dec 2023 03:23:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDNKP-000KTh-1g;
	Wed, 13 Dec 2023 11:23:01 +0000
Date: Wed, 13 Dec 2023 19:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6771/7300] fs/afs/main.c:159:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202312131907.mnyTUNnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
commit: 83101146668283fa5109921fde006287e0f4e195 [6771/7300] afs: Provide a way to configure address priorities
config: nios2-randconfig-r112-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131907.mnyTUNnO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312131907.mnyTUNnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131907.mnyTUNnO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/afs/main.c:159:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   fs/afs/main.c:159:9: sparse:     expected struct callback_head *head
   fs/afs/main.c:159:9: sparse:     got struct callback_head [noderef] __rcu *
>> fs/afs/main.c:159:9: sparse: sparse: cast removes address space '__rcu' of expression

vim +159 fs/afs/main.c

   144	
   145	/*
   146	 * Clean up and destroy an AFS network namespace record.
   147	 */
   148	static void __net_exit afs_net_exit(struct net *net_ns)
   149	{
   150		struct afs_net *net = afs_net(net_ns);
   151	
   152		net->live = false;
   153		afs_fs_probe_cleanup(net);
   154		afs_cell_purge(net);
   155		afs_purge_servers(net);
   156		afs_close_socket(net);
   157		afs_proc_cleanup(net);
   158		afs_put_sysnames(net->sysnames);
 > 159		kfree_rcu(net->address_prefs, rcu);
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
