Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70413523A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734050202; cv=none; b=pUsAxvFuDjodRmsYxYB58s676L3f8Q8Xhvhw+A1mG3K93iUW0n4UyQjl67cDvNjOw9zj9hct/561ej1A9+sB7oGdKV+gVKMB+ubz59xN0Da9CXMbjXdO7VjMuFot0sGwQ3j2fbpj9PaGLCHz0203WBBXcSp8hiqKmoG4glFiJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734050202; c=relaxed/simple;
	bh=121FkGE2dGvY5MkJvSbHVVYA+SKBbF/1pQhfcY3pYvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dn4GDU95pXELNuwtjWFuIrw2SSI/9wDajTjTTxkXBki1CvpApdKypvGUHaffR21pyQGQIdsJ5f2HCrWPg9zIesgB4bfEvcerxX9eQeXJr0yk7S8yPIBsZoNwuHZEakMv5YyUaEucZim4+Jg6UeZfrKZkPfhvs8D3sOKMNwvfh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPuOtHMe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPuOtHMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734050200; x=1765586200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=121FkGE2dGvY5MkJvSbHVVYA+SKBbF/1pQhfcY3pYvU=;
  b=mPuOtHMe6wtW5y+lZWL9R+tYZkyGQRNRY6xWQ6/6JJ0fwJGnDijYfAla
   at9z6CVyaQkR34ASJaKdout0nwCAQmzQqJOUfMTeO06f/LXINl6360QE5
   x3CIVIA0xaFWTxBmDCtkrPJjLj+ZWKZObqZ9mZW4avP468rNE+4Nw4XoJ
   j9sH4Vapz5PhOR1SsI2pkgyiZf/uJS0J2BlDy5yG0H+fAjCLOPpWeAxAu
   e8sMv7zsM4EZ5FOl6mY8zPdNjXsi4s6lwFajuiejA6qi38SbfE5d1GBBn
   stnKpRdBKGNxmHcXt16o0LHpunmbtEc+5dO4iLhbwfJnQDmDeR8H8R78D
   A==;
X-CSE-ConnectionGUID: TJ/u2oygSV6QRRUa56o29A==
X-CSE-MsgGUID: z8HtH75ARmylVZsUmI2Q+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="59890657"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="59890657"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 16:36:38 -0800
X-CSE-ConnectionGUID: A6VXXuhdTA+Pi4gKm4fGHA==
X-CSE-MsgGUID: 6IG2vmF0QvO0JdNeScxsNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="96269065"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2024 16:35:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLteK-000BXz-39;
	Fri, 13 Dec 2024 00:35:20 +0000
Date: Fri, 13 Dec 2024 08:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] mm/share_pool.c:1215:12: warning:
 'spa_stat_show' defined but not used
Message-ID: <202412130822.tSyyPsoM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ff5378fff024fcb2552e6da22811cf933fe4a4c0
commit: d83dcc99d770b53e4839791fa2319c953fc6e42d [2579/2579] share_pool: Add proc interfaces to show sp info
config: arm64-randconfig-004-20241213 (https://download.01.org/0day-ci/archive/20241213/202412130822.tSyyPsoM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130822.tSyyPsoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130822.tSyyPsoM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c:877:6: warning: no previous prototype for 'sp_proc_stat_drop' [-Wmissing-prototypes]
     877 | void sp_proc_stat_drop(struct sp_proc_stat *stat)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:1108:6: warning: no previous prototype for 'spa_overview_show' [-Wmissing-prototypes]
    1108 | void spa_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:1190:6: warning: no previous prototype for 'spg_overview_show' [-Wmissing-prototypes]
    1190 | void spg_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:1322:12: warning: 'proc_overview_show' defined but not used [-Wunused-function]
    1322 | static int proc_overview_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:1279:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    1279 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
>> mm/share_pool.c:1215:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    1215 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   mm/share_pool.c:489:21: warning: 'spa_file' defined but not used [-Wunused-function]
     489 | static struct file *spa_file(struct sp_area *spa)
         |                     ^~~~~~~~
   mm/share_pool.c:484:22: warning: 'spa_size' defined but not used [-Wunused-function]
     484 | static unsigned long spa_size(struct sp_area *spa)
         |                      ^~~~~~~~
   mm/share_pool.c:408:13: warning: 'free_spg_stat' defined but not used [-Wunused-function]
     408 | static void free_spg_stat(int spg_id)
         |             ^~~~~~~~~~~~~
   mm/share_pool.c:385:12: warning: 'sp_init_spg_stat' defined but not used [-Wunused-function]
     385 | static int sp_init_spg_stat(struct sp_group *spg)
         |            ^~~~~~~~~~~~~~~~
   mm/share_pool.c:344:30: warning: 'sp_init_process_stat' defined but not used [-Wunused-function]
     344 | static struct spg_proc_stat *sp_init_process_stat(struct task_struct *tsk,
         |                              ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:266:13: warning: 'update_spg_proc_stat_k2u' defined but not used [-Wunused-function]
     266 | static void update_spg_proc_stat_k2u(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:252:13: warning: 'update_spg_proc_stat_alloc' defined but not used [-Wunused-function]
     252 | static void update_spg_proc_stat_alloc(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:222:13: warning: 'update_spg_stat_k2u' defined but not used [-Wunused-function]
     222 | static void update_spg_stat_k2u(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:200:13: warning: 'update_spg_stat_alloc' defined but not used [-Wunused-function]
     200 | static void update_spg_stat_alloc(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from mm/share_pool.c:27:
   mm/share_pool.c:104:19: warning: 'sp_group_id_ida' defined but not used [-Wunused-variable]
     104 | static DEFINE_IDA(sp_group_id_ida);
         |                   ^~~~~~~~~~~~~~~
   include/linux/idr.h:253:44: note: in definition of macro 'DEFINE_IDA'
     253 | #define DEFINE_IDA(name)        struct ida name = IDA_INIT(name)
         |                                            ^~~~
   mm/share_pool.c:98:19: warning: 'sp_group_idr' defined but not used [-Wunused-variable]
      98 | static DEFINE_IDR(sp_group_idr);
         |                   ^~~~~~~~~~~~
   include/linux/idr.h:56:44: note: in definition of macro 'DEFINE_IDR'
      56 | #define DEFINE_IDR(name)        struct idr name = IDR_INIT(name)
         |                                            ^~~~
   mm/share_pool.c:81:18: warning: 'mdc_default_group_id' defined but not used [-Wunused-const-variable=]
      81 | static const int mdc_default_group_id = 1;
         |                  ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/spa_stat_show +1215 mm/share_pool.c

  1214	
> 1215	static int spa_stat_show(struct seq_file *seq, void *offset)
  1216	{
  1217		spg_overview_show(seq);
  1218		spa_overview_show(seq);
  1219		/* print the file header */
  1220		seq_printf(seq, "%-10s %-16s %-16s %-10s %-7s %-5s %-8s %-8s\n",
  1221			   "Group ID", "va_start", "va_end", "Size(KB)", "Type", "Huge", "PID", "Ref");
  1222		rb_spa_stat_show(seq);
  1223		return 0;
  1224	}
  1225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
