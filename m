Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585E419EECF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724949094; cv=none; b=uiZ+kkgFoT7TE+kCRVN6md/tMQ9l3KMlTvt+JpiY1aJSm20Jj+3jOrRLMkitShl3udYQB977oBEmOsIJTZjH39aR3WNrcKAweO+yRrTckTTOwruGPAQlx5C9NbcmOSI4e94kvgrMH1NRJEkE7UqjaA86bVOvv2Zco1nVDkYxn64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724949094; c=relaxed/simple;
	bh=GEs5tljAS1UHS5279kLBzm66dYn01BqQKjJf1uIw/oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/ZVO8jJG64eP1PO/zxE66hc45ZtlvQ0ZSWhDilC+eMJyDOg1TLe6T9whcURe4vukcGL2+U2xHfR1VV25iXFVXKyo4rqjItoVPh6xxWZTURWEKMLl6jdTl5B71qF/AT4VBEaslJOiBA5boRcQxSGCOyJLGHH4agPhScLGW23uUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbE/+eCs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbE/+eCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724949093; x=1756485093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GEs5tljAS1UHS5279kLBzm66dYn01BqQKjJf1uIw/oc=;
  b=YbE/+eCsAuOrRJwm52slRL6AsBgiJwbSrXSMvAJsINkzsWqMUVRxCcJG
   oj9mL9zjK06wLK+I29JtwZftLjUc8nIIGaqByHh/H3vj2Tu0p+CSkcKcU
   6wMFD1gtw8pPHpPpLhBDfEKg0loZ4whm25MB01lLmFyQHJhm+ydw1xhUi
   QuBVL9ws0B110xfgupGL7EIQZy4chniggURBde40ikvmPvJX90YC7fsm+
   is+KCkkAI+mWrl028abU1/3Ak+eFCimYatMgl0yEKaixJ6EtxQZ4aVjkk
   CRM+PB92ol7YB8ZgRwYRj81xbV2/1havcRQKVEhlCpD1Tn//R0g4Gwk/O
   Q==;
X-CSE-ConnectionGUID: GFGN17QcT7SpGCFw6KNU7w==
X-CSE-MsgGUID: i3tOXc8AQMCn3qsCo3uftw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27436163"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="27436163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 09:31:32 -0700
X-CSE-ConnectionGUID: ZueLJWmPQ5aQLKvOSQVFYw==
X-CSE-MsgGUID: biF8Qwa5STGivvM9bJenGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="101149035"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Aug 2024 09:31:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sji3U-0000UR-0M;
	Thu, 29 Aug 2024 16:31:28 +0000
Date: Fri, 30 Aug 2024 00:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kaixiong Yu <yukaixiong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Joel Granados <j.granados@samsung.com>,
	Kees Cook <kees@kernel.org>
Subject: [joel-granados:jag/vm_table_move 8/15] mm/nommu.c:410:1: error:
 expected ',' or ';' before 'void'
Message-ID: <202408300045.f8Ib9ljS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/vm_table_move
head:   78da303f82e590bc887df890dd3ddeb712712fc9
commit: 5aa2c9cd13716ef1922c9a7efe629d8da93b14e4 [8/15] mm: nommu: move sysctl to its own file
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240830/202408300045.f8Ib9ljS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408300045.f8Ib9ljS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408300045.f8Ib9ljS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/internal.h:22,
                    from mm/nommu.c:43:
   mm/vma.h: In function 'init_vma_munmap':
   mm/vma.h:183:28: error: 'FIRST_USER_ADDRESS' undeclared (first use in this function)
     183 |         vms->unmap_start = FIRST_USER_ADDRESS;
         |                            ^~~~~~~~~~~~~~~~~~
   mm/vma.h:183:28: note: each undeclared identifier is reported only once for each function it appears in
   mm/vma.h:184:26: error: 'USER_PGTABLES_CEILING' undeclared (first use in this function)
     184 |         vms->unmap_end = USER_PGTABLES_CEILING;
         |                          ^~~~~~~~~~~~~~~~~~~~~
   mm/nommu.c: At top level:
>> mm/nommu.c:410:1: error: expected ',' or ';' before 'void'
     410 | void __init mmap_init(void)
         | ^~~~
>> mm/nommu.c:396:25: warning: 'nommu_table' defined but not used [-Wunused-variable]
     396 | static struct ctl_table nommu_table[] = {
         |                         ^~~~~~~~~~~


vim +410 mm/nommu.c

5aa2c9cd13716e Kaixiong Yu      2024-08-26  395  
5aa2c9cd13716e Kaixiong Yu      2024-08-26 @396  static struct ctl_table nommu_table[] = {
5aa2c9cd13716e Kaixiong Yu      2024-08-26  397  	{
5aa2c9cd13716e Kaixiong Yu      2024-08-26  398  		.procname	= "nr_trim_pages",
5aa2c9cd13716e Kaixiong Yu      2024-08-26  399  		.data		= &sysctl_nr_trim_pages,
5aa2c9cd13716e Kaixiong Yu      2024-08-26  400  		.maxlen		= sizeof(sysctl_nr_trim_pages),
5aa2c9cd13716e Kaixiong Yu      2024-08-26  401  		.mode		= 0644,
5aa2c9cd13716e Kaixiong Yu      2024-08-26  402  		.proc_handler	= proc_dointvec_minmax,
5aa2c9cd13716e Kaixiong Yu      2024-08-26  403  		.extra1		= SYSCTL_ZERO,
5aa2c9cd13716e Kaixiong Yu      2024-08-26  404  	},
5aa2c9cd13716e Kaixiong Yu      2024-08-26  405  }
5aa2c9cd13716e Kaixiong Yu      2024-08-26  406  
8feae13110d60c David Howells    2009-01-08  407  /*
3edf41d8458770 seokhoon.yoon    2017-02-24  408   * initialise the percpu counter for VM and region record slabs
8feae13110d60c David Howells    2009-01-08  409   */
8feae13110d60c David Howells    2009-01-08 @410  void __init mmap_init(void)
^1da177e4c3f41 Linus Torvalds   2005-04-16  411  {
00a62ce91e5541 KOSAKI Motohiro  2009-04-30  412  	int ret;
00a62ce91e5541 KOSAKI Motohiro  2009-04-30  413  
908c7f1949cb7c Tejun Heo        2014-09-08  414  	ret = percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
00a62ce91e5541 KOSAKI Motohiro  2009-04-30  415  	VM_BUG_ON(ret);
5d097056c9a017 Vladimir Davydov 2016-01-14  416  	vm_region_jar = KMEM_CACHE(vm_region, SLAB_PANIC|SLAB_ACCOUNT);
5aa2c9cd13716e Kaixiong Yu      2024-08-26  417  	register_syscall_init("vm", nommu_table);
^1da177e4c3f41 Linus Torvalds   2005-04-16  418  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  419  

:::::: The code at line 410 was first introduced by commit
:::::: 8feae13110d60cc6287afabc2887366b0eb226c2 NOMMU: Make VMAs per MM as for MMU-mode linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
