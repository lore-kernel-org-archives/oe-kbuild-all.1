Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98B88F55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 05:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710394404; cv=none; b=uKUQbIMZnT7U6ANtsZTdeMf5QgpuIkn2G9clZg67zdamcikvfGNfe9qgzAYm62vFMLiOlgsD7/kWCR68a+PQBDQhdOIs/lQhzZrKP+3XMp18pP1XFF+ljX+ztPi3l/RCzUnonk8z8xXGgdx+ztPUmK6pPrD1Q/kUS0JPEI7TVFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710394404; c=relaxed/simple;
	bh=6zREdZ+rR7ABfP8Cj1NgaIa4ypDWMCtVxFfmh7BVqa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLFVk+ecwmuowyGmQiprhzu30Hbs4fF0/Jen3+PXsiIZM7RPd/i+PejxNn18TqXuv3ywu88B77RUsS6aHOIcFM1EuSMEzrB9grgnfKkVmJUltv2IgNUckjb9oCF3NLKHeKdNjWVBGYSgl5ctUAAONaXluTZTjbjOcCUgFzfEo2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6bGMxRX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6bGMxRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710394402; x=1741930402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6zREdZ+rR7ABfP8Cj1NgaIa4ypDWMCtVxFfmh7BVqa0=;
  b=k6bGMxRXEvyWaE2yWbgmWnUAYYi2rHbIRl8K1pyMwL4MTS0dci1u60ht
   1TT29s61ZlPCxWJ1wYnhjbg9DsdxtygoPqHZ941iXE7GJ3ZVMA2vsm0sb
   BQvkNfhAREGkY/s7fAWWwj/SZ/lPctcXgK2tKf0aq1csLwQmjYWbxgX7e
   TK1YUv0W9IwzoX69QCCXE1/zz9CKXYWFrUCTHEG/CsKifR7ov9XUVjFYe
   9y6qQud+pU1gLbM9FiImDzG4TRY7L46I0lrfeNktuKfykLyr08jVzCH+D
   5dRw9KHuI3+7pcYh8TgcUCsxlgnEOgXKCGv1pHqxc9ySyWhicIP8JU9wZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16645541"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16645541"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 22:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="12057142"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Mar 2024 22:33:19 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkdiO-000D97-1A;
	Thu, 14 Mar 2024 05:33:16 +0000
Date: Thu, 14 Mar 2024 13:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26960/27507] mm/damon/vaddr.c:724:4:
 error: implicit declaration of function 'kfree'
Message-ID: <202403141335.L28W4l3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 66163f1b6ff4ecaedbb0d4e165077aad5b669153 [26960/27507] mm/damon: dump the frequency distribution of vaddr space
config: x86_64-randconfig-006-20240313 (https://download.01.org/0day-ci/archive/20240314/202403141335.L28W4l3K-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141335.L28W4l3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141335.L28W4l3K-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/damon/vaddr.c:652:22: warning: no previous prototype for function 'get_damon_target' [-Wmissing-prototypes]
     652 | struct damon_target *get_damon_target(struct task_struct *task,
         |                      ^
   mm/damon/vaddr.c:652:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     652 | struct damon_target *get_damon_target(struct task_struct *task,
         | ^
         | static 
>> mm/damon/vaddr.c:686:5: warning: no previous prototype for function 'proc_damon_map' [-Wmissing-prototypes]
     686 | int proc_damon_map(struct seq_file *m, struct pid_namespace *ns,
         |     ^
   mm/damon/vaddr.c:686:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     686 | int proc_damon_map(struct seq_file *m, struct pid_namespace *ns,
         | ^
         | static 
>> mm/damon/vaddr.c:724:4: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
     724 |                         kfree(t->arr_mm_hint);
         |                         ^
>> mm/damon/vaddr.c:728:9: error: implicit declaration of function 'kmalloc_array' [-Werror,-Wimplicit-function-declaration]
     728 |                 arr = kmalloc_array(t->nr_regions, sizeof(struct damon_region_mm_hint), GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
         |                       ^
>> mm/damon/vaddr.c:728:7: error: incompatible integer to pointer conversion assigning to 'struct damon_region_mm_hint *' from 'int' [-Wint-conversion]
     728 |                 arr = kmalloc_array(t->nr_regions, sizeof(struct damon_region_mm_hint), GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/damon/vaddr.c:713:5: warning: no previous prototype for function 'damon_va_dump_freq_map' [-Wmissing-prototypes]
     713 | int damon_va_dump_freq_map(struct damon_ctx *ctx)
         |     ^
   mm/damon/vaddr.c:713:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     713 | int damon_va_dump_freq_map(struct damon_ctx *ctx)
         | ^
         | static 
   3 warnings and 3 errors generated.


vim +/kfree +724 mm/damon/vaddr.c

   651	
 > 652	struct damon_target *get_damon_target(struct task_struct *task,
   653							unsigned long *interval)
   654	{
   655		int i;
   656		struct damon_target *t;
   657	
   658		rcu_read_lock();
   659		for (i = 0; i < READ_ONCE(dbgfs_nr_ctxs); i++) {
   660			struct damon_ctx *ctx = rcu_dereference(dbgfs_ctxs[i]);
   661	
   662			if (!ctx || !ctx->kdamond)
   663				continue;
   664	
   665			damon_for_each_target(t, dbgfs_ctxs[i]) {
   666				struct task_struct *ts = damon_get_task_struct(t);
   667	
   668				if (!ts)
   669					continue;
   670	
   671				if (ts->mm == task->mm) {
   672					if (interval)
   673						*interval = ctx->aggr_interval;
   674					put_task_struct(ts);
   675					rcu_read_unlock();
   676					return t;
   677				}
   678				put_task_struct(ts);
   679			}
   680		}
   681		rcu_read_unlock();
   682	
   683		return NULL;
   684	}
   685	
 > 686	int proc_damon_map(struct seq_file *m, struct pid_namespace *ns,
   687				struct pid *pid, struct task_struct *task)
   688	{
   689		struct damon_target *t;
   690		struct damon_region_mm_hint *arr = NULL;
   691		unsigned int nr_freq_map;
   692		int i;
   693		unsigned long interval = 0;
   694		if (!task)
   695			return 0;
   696	
   697		t = get_damon_target(task, &interval);
   698		if (!t || !interval)
   699			return 0;
   700	
   701		down_read(&t->dump_freq_lock);
   702		nr_freq_map = t->nr_freq_map;
   703		arr = t->arr_mm_hint;
   704	
   705		for (i = 0; i < nr_freq_map; i++)
   706			seq_printf(m, "%lx-%lx: %u %lums\n", arr[i].start, arr[i].end, arr[i].nr_accesses, interval / 1000 * arr[i].age);
   707	
   708		up_read(&t->dump_freq_lock);
   709	
   710		return 0;
   711	}
   712	
 > 713	int damon_va_dump_freq_map(struct damon_ctx *ctx)
   714	{
   715		unsigned int i = 0;
   716		struct damon_target *t;
   717		struct damon_region *r;
   718		struct damon_region_mm_hint *arr = NULL;
   719		int ret = 0;
   720	
   721		damon_for_each_target(t, ctx) {
   722			down_write(&t->dump_freq_lock);
   723			if (t->arr_mm_hint) {
 > 724				kfree(t->arr_mm_hint);
   725				t->nr_freq_map = 0;
   726				t->arr_mm_hint = NULL;
   727			}
 > 728			arr = kmalloc_array(t->nr_regions, sizeof(struct damon_region_mm_hint), GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
   729			if (!arr) {
   730				up_write(&t->dump_freq_lock);
   731				return -ENOMEM;
   732			}
   733	
   734			damon_for_each_region(r, t) {
   735				arr[i].start = r->ar.start;
   736				arr[i].end = r->ar.end;
   737				arr[i].nr_accesses = r->nr_accesses;
   738				arr[i].age = r->age;
   739				i++;
   740			}
   741			// Add a memory barry?
   742			t->nr_freq_map = t->nr_regions;
   743			t->arr_mm_hint = arr;
   744			i = 0;
   745			arr = NULL;
   746			up_write(&t->dump_freq_lock);
   747		}
   748	
   749		return ret;
   750	}
   751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
