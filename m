Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85BD14AB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 11:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711451580; cv=none; b=mn3/HIqrXHDBnKrpc7ZRqxOUa+EK8dzFgQ1IbosfzXtNoB7UeSOZKrMcTwzqgHUQ+OWwkHhQ9l2xW9cdEFLbckzTjYpWFrRPeQwubyT9tnpYHvTew1lt/JuVmgMrIhztmP6lsC6EeEONYP7ZJWHZFViJ/mP1CCwkAA2VKIbhQHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711451580; c=relaxed/simple;
	bh=Ea3G906jG82abQTVAXlUpf2yEsIKlqveyQ5D7pbhHN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCXez+E4Rna5QQ2XLp/MaFwfF7++vLwekIgVJcjN8dxSRwp3vwFpzGQJ0Pjg3fP+/v0JrnVSt/9nCQfif4+Z6EUQXpOPjcY19Ee1PwPzf7pn6cRxCR0tHq0733gbC081hVd5j93mztgnwB89ZmCl3MnF5+PUiuyQHwSTBo8AOXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrI+lnG4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrI+lnG4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711451578; x=1742987578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ea3G906jG82abQTVAXlUpf2yEsIKlqveyQ5D7pbhHN8=;
  b=jrI+lnG4UZT865N+CiCsrRVPQ4MmLSd32KiLPnuk/Fou5l8Y+9N3tRAa
   eqwivf6UKU1OGt3njqOT0zGxxoYJ5kr+DCsPV/zcR68gevtKvwyKedZJT
   +Uzcxg9JSEJsh40SwXMvvV7cT4X6Vu9G1lrJ9oxxMzNh5GJSQQj3yDtWP
   URQQUsXtgcWc9MdhmFVM1C2m1hyEJfC78QOzCxOfKbtV0t3mN3Bihnzcy
   DQpfpM+oLZKlqKy93CSRWrqWs36bPbGY5ErMSjwPKqTJ8psw8XH6CLq4r
   kgMdJobEsPRWCmqCKcWBYmXqUPO0S9vp7HxeaUvYaIIdzdIelEdTr3NHH
   w==;
X-CSE-ConnectionGUID: Yliy9PLhR9iREYYMxFiMdg==
X-CSE-MsgGUID: +czkwWlQQyOBC6RtPYxb5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="23982824"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="23982824"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 04:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="53403743"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Mar 2024 04:12:56 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp4jd-000NK6-23;
	Tue, 26 Mar 2024 11:12:53 +0000
Date: Tue, 26 Mar 2024 19:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:ddt-43 9/40] fs/smb/client/dfs_cache.c:239:9: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202403261922.cEj8CHsP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git ddt-43
head:   d4987a1b1c82c472ec96062343af3ad72aaab3fd
commit: f51dae97cfef30ec06b75fd1e16f8a09031b985c [9/40] dyndbg: move flags field to a new structure
config: arm64-randconfig-r121-20240326 (https://download.01.org/0day-ci/archive/20240326/202403261922.cEj8CHsP-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20240326/202403261922.cEj8CHsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261922.cEj8CHsP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/dfs_cache.c:239:9: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:239:9: sparse:   also defined here
>> fs/smb/client/dfs_cache.c:239:9: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:239:9: sparse:   also defined here
   fs/smb/client/dfs_cache.c:230:9: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:230:9: sparse:   also defined here
   fs/smb/client/dfs_cache.c:230:9: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:230:9: sparse:   also defined here
   fs/smb/client/dfs_cache.c:232:17: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:232:17: sparse:   also defined here
   fs/smb/client/dfs_cache.c:232:17: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:232:17: sparse:   also defined here
>> fs/smb/client/dfs_cache.c:239:9: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:239:9: sparse:   also defined here
>> fs/smb/client/dfs_cache.c:239:9: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:239:9: sparse:   also defined here
   fs/smb/client/dfs_cache.c:230:9: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:230:9: sparse:   also defined here
   fs/smb/client/dfs_cache.c:230:9: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:230:9: sparse:   also defined here
   fs/smb/client/dfs_cache.c:232:17: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:232:17: sparse:   also defined here
   fs/smb/client/dfs_cache.c:232:17: sparse: sparse: Initializer entry defined twice
   fs/smb/client/dfs_cache.c:232:17: sparse:   also defined here

vim +239 fs/smb/client/dfs_cache.c

54be1f6c1c3749 fs/cifs/dfs_cache.c       Paulo Alcantara        2018-11-14  236  
185352ae6171c8 fs/cifs/dfs_cache.c       Paulo Alcantara (SUSE  2019-12-04  237) static inline void dump_ce(const struct cache_entry *ce)
54be1f6c1c3749 fs/cifs/dfs_cache.c       Paulo Alcantara        2018-11-14  238  {
5ff2836ed3a5c2 fs/cifs/dfs_cache.c       Paulo Alcantara        2021-02-24 @239  	cifs_dbg(FYI, "cache entry: path=%s,type=%s,ttl=%d,etime=%ld,hdr_flags=0x%x,ref_flags=0x%x,interlink=%s,path_consumed=%d,expired=%s\n",
a0a3036b81f1f6 fs/cifs/dfs_cache.c       Joe Perches            2020-04-14  240  		 ce->path,
185352ae6171c8 fs/cifs/dfs_cache.c       Paulo Alcantara (SUSE  2019-12-04  241) 		 ce->srvtype == DFS_TYPE_ROOT ? "root" : "link", ce->ttl,
185352ae6171c8 fs/cifs/dfs_cache.c       Paulo Alcantara (SUSE  2019-12-04  242) 		 ce->etime.tv_nsec,
5ff2836ed3a5c2 fs/cifs/dfs_cache.c       Paulo Alcantara        2021-02-24  243  		 ce->hdr_flags, ce->ref_flags,
ce04127c5849af fs/smb/client/dfs_cache.c Paulo Alcantara        2023-08-17  244  		 DFS_INTERLINK(ce->hdr_flags) ? "yes" : "no",
185352ae6171c8 fs/cifs/dfs_cache.c       Paulo Alcantara (SUSE  2019-12-04  245) 		 ce->path_consumed,
54be1f6c1c3749 fs/cifs/dfs_cache.c       Paulo Alcantara        2018-11-14  246  		 cache_entry_expired(ce) ? "yes" : "no");
54be1f6c1c3749 fs/cifs/dfs_cache.c       Paulo Alcantara        2018-11-14  247  	dump_tgts(ce);
54be1f6c1c3749 fs/cifs/dfs_cache.c       Paulo Alcantara        2018-11-14  248  }
54be1f6c1c3749 fs/cifs/dfs_cache.c       Paulo Alcantara        2018-11-14  249  

:::::: The code at line 239 was first introduced by commit
:::::: 5ff2836ed3a5c24420a7235be25a462594cdc4ea cifs: introduce helper for finding referral server to improve DFS target resolution

:::::: TO: Paulo Alcantara <pc@cjr.nz>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
