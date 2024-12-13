Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBCC4A33
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 02:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734056285; cv=none; b=Yq1guLfbwi+HOlCz+IcoRi3cWdT4/McbaqTtEkAj9bQI8i7oOIFlWbStLFjcxf3Nsoyw5TgFJtfGcbaHjsf4lLvvdRCXAM4Kc22xwpT3Xbp38DIRchIHCa1u+VaIzbm12q4LtmLSq0EcC/lFkZu1t2gmkuH4xCxv++2MC0lr/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734056285; c=relaxed/simple;
	bh=bns6Gb0FQ5T3P2dv6hIHBFYbZa9PkXiTo9a+AZ7/czg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=olXJiDtrWmVJtjIH+oKKut6UootPtUcwM9DWJpjfRB+s7bwVqe0jFtCKR2cH/dIwr3S+Qh37g3IrWnGQ4A4J6h2tVbPTgpNIa1SULFop2pVTZQyxLZyIAGsgBzvSz/yzQ06DVa6rn5SiOFA2vN66R1zIli8xQp+N/9hQ9FY5BBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfRSns58; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfRSns58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734056284; x=1765592284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bns6Gb0FQ5T3P2dv6hIHBFYbZa9PkXiTo9a+AZ7/czg=;
  b=OfRSns589u3IGBn7d7rbQLF11AL7dcySxcqyHfcyj6sFfuugWtFMGEKB
   9kUI7ceu5sfYi830DjIesyB9Nn8KlzTweexw8MpWXpaodUXyFinsdMO+u
   7bGKH0/8VYj9NbJ65Q9FpECdbd5GUOsv3+yQyzkdu7aGXefdud1Zg1IjQ
   sceIsSRDB2gxzHCqQ0NiDV0QUoi47zj33Fieq+pBkDTMjYJ8xW77OX97r
   zvUe6rOGML1X8vldp9eiCf7bh6KhgRXawe4eOxCZFibDBxrwHm7fCP6g5
   kJbB3r2onx06y8wIYsGR0ZxM5MeuEXqPLoWqinDX0mXinndwkcYkoaURm
   Q==;
X-CSE-ConnectionGUID: dFKdKq+ISX2LYoXa172FAw==
X-CSE-MsgGUID: FSB6Tl/+TFaSmSr8Gr9gTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="52027059"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="52027059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 18:18:03 -0800
X-CSE-ConnectionGUID: ixIg05cyS4GJ6NNXqXr3zA==
X-CSE-MsgGUID: 66kLVWajQB21bZ0/ExwAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96846890"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Dec 2024 18:18:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLvFf-000Bc5-0i;
	Fri, 13 Dec 2024 02:17:59 +0000
Date: Fri, 13 Dec 2024 10:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] mm/share_pool.c:738:21: error:
 implicit declaration of function 'huge_ptep_get'
Message-ID: <202412131028.JwkewMIN-lkp@intel.com>
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
commit: c18bb367938bb02621f45d904531832df1abed2a [2579/2579] share_pool: Implement sp_walk_page_range()
config: arm64-randconfig-004-20241213 (https://download.01.org/0day-ci/archive/20241213/202412131028.JwkewMIN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412131028.JwkewMIN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412131028.JwkewMIN-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_hugetlb_entry':
>> mm/share_pool.c:738:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
     738 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
>> mm/share_pool.c:738:21: error: invalid initializer
   mm/share_pool.c: At top level:
   mm/share_pool.c:1116:6: warning: no previous prototype for 'sp_proc_stat_drop' [-Wmissing-prototypes]
    1116 | void sp_proc_stat_drop(struct sp_proc_stat *stat)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:1347:6: warning: no previous prototype for 'spa_overview_show' [-Wmissing-prototypes]
    1347 | void spa_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:1429:6: warning: no previous prototype for 'spg_overview_show' [-Wmissing-prototypes]
    1429 | void spg_overview_show(struct seq_file *seq)
         |      ^~~~~~~~~~~~~~~~~
   mm/share_pool.c:1561:12: warning: 'proc_overview_show' defined but not used [-Wunused-function]
    1561 | static int proc_overview_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~
   mm/share_pool.c:1518:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    1518 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   mm/share_pool.c:1454:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    1454 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
   mm/share_pool.c:490:21: warning: 'spa_file' defined but not used [-Wunused-function]
     490 | static struct file *spa_file(struct sp_area *spa)
         |                     ^~~~~~~~
   mm/share_pool.c:485:22: warning: 'spa_size' defined but not used [-Wunused-function]
     485 | static unsigned long spa_size(struct sp_area *spa)
         |                      ^~~~~~~~
   mm/share_pool.c:409:13: warning: 'free_spg_stat' defined but not used [-Wunused-function]
     409 | static void free_spg_stat(int spg_id)
         |             ^~~~~~~~~~~~~
   mm/share_pool.c:386:12: warning: 'sp_init_spg_stat' defined but not used [-Wunused-function]
     386 | static int sp_init_spg_stat(struct sp_group *spg)
         |            ^~~~~~~~~~~~~~~~
   mm/share_pool.c:345:30: warning: 'sp_init_process_stat' defined but not used [-Wunused-function]
     345 | static struct spg_proc_stat *sp_init_process_stat(struct task_struct *tsk,
         |                              ^~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:267:13: warning: 'update_spg_proc_stat_k2u' defined but not used [-Wunused-function]
     267 | static void update_spg_proc_stat_k2u(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:253:13: warning: 'update_spg_proc_stat_alloc' defined but not used [-Wunused-function]
     253 | static void update_spg_proc_stat_alloc(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:223:13: warning: 'update_spg_stat_k2u' defined but not used [-Wunused-function]
     223 | static void update_spg_stat_k2u(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~
   mm/share_pool.c:201:13: warning: 'update_spg_stat_alloc' defined but not used [-Wunused-function]
     201 | static void update_spg_stat_alloc(unsigned long size, bool inc,
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from mm/share_pool.c:27:
   mm/share_pool.c:105:19: warning: 'sp_group_id_ida' defined but not used [-Wunused-variable]
     105 | static DEFINE_IDA(sp_group_id_ida);
         |                   ^~~~~~~~~~~~~~~
   include/linux/idr.h:253:44: note: in definition of macro 'DEFINE_IDA'
     253 | #define DEFINE_IDA(name)        struct ida name = IDA_INIT(name)
         |                                            ^~~~
   mm/share_pool.c:99:19: warning: 'sp_group_idr' defined but not used [-Wunused-variable]
      99 | static DEFINE_IDR(sp_group_idr);
         |                   ^~~~~~~~~~~~
   include/linux/idr.h:56:44: note: in definition of macro 'DEFINE_IDR'
      56 | #define DEFINE_IDR(name)        struct idr name = IDR_INIT(name)
         |                                            ^~~~
   mm/share_pool.c:82:18: warning: 'mdc_default_group_id' defined but not used [-Wunused-const-variable=]
      82 | static const int mdc_default_group_id = 1;
         |                  ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/huge_ptep_get +738 mm/share_pool.c

   733	
   734	static int sp_hugetlb_entry(pte_t *ptep, unsigned long hmask,
   735				    unsigned long addr, unsigned long next,
   736				    struct mm_walk *walk)
   737	{
 > 738		pte_t pte = huge_ptep_get(ptep);
   739		struct page *page = pte_page(pte);
   740		struct sp_walk_data *sp_walk_data;
   741	
   742		if (unlikely(!pte_present(pte))) {
   743			pr_debug("the page of addr %lx unexpectedly not in RAM\n", (unsigned long)addr);
   744			return -EFAULT;
   745		}
   746	
   747		sp_walk_data = walk->private;
   748		get_page(page);
   749		sp_walk_data->pages[sp_walk_data->page_count++] = page;
   750		return 0;
   751	}
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
