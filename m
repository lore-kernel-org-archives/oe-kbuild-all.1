Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B2257424
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 07:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750489; cv=none; b=ZiNlq9p3XjvKB5bjQ7VGKEpqkitjEqWHJjf3WnewlLWnJzzXhgRIq0Al0oaabJkoM2ejY6AZK10Znm9I4uuHylM6ztt0ypQkPMP9M9kQ4cM0+gB+Favykd7Q868p0LLFLkohpWXVa+GeaqOZeStTHn3+J84S3QP90LCKuaOVYCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750489; c=relaxed/simple;
	bh=8Fc5/rdnrGAzjgb3F1LAlT6pEAWWEUEQ5lFBLL0/YE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hlSyhtAqjRkR+IasByPvhVqNcXvYo0W400Bcknh6nfKicQxBF+USPjKZOmyh+UjWyRKv0YjIHGNwnj6TDMcLZBkKmp9YDvsOnWxGs84gc7KtbCZsQjpG2aOIoa1jInW4iBRfOzlIK1Mf+tt8J34vXAvvbyRfjAp7ayE1lOMXKNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmXunWZx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmXunWZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750750488; x=1782286488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Fc5/rdnrGAzjgb3F1LAlT6pEAWWEUEQ5lFBLL0/YE0=;
  b=nmXunWZxeG2iX3zAJ1kPAJpBmDQaG/1enG2j7tX/ohokjnKij1BbZ5TK
   yQzD48F0m1CrRwRLyE0gFpQEE2VFNyP/kPLsknec861jAH0g41GPHz+BI
   LYFXpj+1lcwPRFj+GIW6Q+Wp4v3YYLosbp9pHAYZGaatTMwPwRQSwJdxy
   ZaRV+bXoGfkoNq+s+Fr/AC8PF4TnZ04jUe5OK5iiQRJILIhWotJLH6GA6
   EsEwA9w4DJPUQihSla5OWHYmp9ftA5as8kOczfRlg1VnmCuce2y+VKAJO
   WYMRaTgGeIvBSZUxU0wMJHKMoFfKtBSda4YupmssL+GC8bxicXTjtpP4s
   g==;
X-CSE-ConnectionGUID: 5f3fAGkyQh2WRSfTbCefgQ==
X-CSE-MsgGUID: ABtnN2iWT+WKGblvrHJdCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53068348"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53068348"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:34:47 -0700
X-CSE-ConnectionGUID: 3zSUEjtMR5eqjPMtZaxYrg==
X-CSE-MsgGUID: Eb2vq5oLR7uf2tm4eqJbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152541340"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2025 00:34:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTyB1-000Rs8-1H;
	Tue, 24 Jun 2025 07:34:43 +0000
Date: Tue, 24 Jun 2025 15:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] kernel/trace/trace.c:6334:43:
 sparse: sparse: incompatible types in comparison expression (different type
 sizes):
Message-ID: <202506241529.YiPE1abD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   14b655c6b6487670ee48bc9b760aefb4412b0f78
commit: f4b0174e9f18aaba59ee6ffdaf8827a7f94eb606 [1/1] tracing: Fix oob write in trace_seq_to_buffer()
config: arm-randconfig-r123-20250622 (https://download.01.org/0day-ci/archive/20250624/202506241529.YiPE1abD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250624/202506241529.YiPE1abD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241529.YiPE1abD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace.c:2881:20: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] <asn:3> *__p @@     got int * @@
   kernel/trace/trace.c:2881:20: sparse:     expected int [noderef] <asn:3> *__p
   kernel/trace/trace.c:2881:20: sparse:     got int *
   kernel/trace/trace.c:2881:20: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] <asn:3> *__p @@     got int * @@
   kernel/trace/trace.c:2881:20: sparse:     expected int [noderef] <asn:3> *__p
   kernel/trace/trace.c:2881:20: sparse:     got int *
   kernel/trace/trace.c:2881:20: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] <asn:3> *__p @@     got int * @@
   kernel/trace/trace.c:2881:20: sparse:     expected int [noderef] <asn:3> *__p
   kernel/trace/trace.c:2881:20: sparse:     got int *
   kernel/trace/trace.c:2881:20: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] <asn:3> *__p @@     got int * @@
   kernel/trace/trace.c:2881:20: sparse:     expected int [noderef] <asn:3> *__p
   kernel/trace/trace.c:2881:20: sparse:     got int *
   kernel/trace/trace.c:925:6: sparse: sparse: symbol 'tracing_snapshot_instance_cond' was not declared. Should it be static?
   kernel/trace/trace.c:2548:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] <asn:3> *__p @@     got int * @@
   kernel/trace/trace.c:2548:23: sparse:     expected int [noderef] <asn:3> *__p
   kernel/trace/trace.c:2548:23: sparse:     got int *
   kernel/trace/trace.c:2548:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] <asn:3> *__p @@     got int * @@
   kernel/trace/trace.c:2548:23: sparse:     expected int [noderef] <asn:3> *__p
   kernel/trace/trace.c:2548:23: sparse:     got int *
   kernel/trace/trace.c:2548:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] <asn:3> *__p @@     got int * @@
   kernel/trace/trace.c:2548:23: sparse:     expected int [noderef] <asn:3> *__p
   kernel/trace/trace.c:2548:23: sparse:     got int *
   kernel/trace/trace.c:2548:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] <asn:3> *__p @@     got int * @@
   kernel/trace/trace.c:2548:23: sparse:     expected int [noderef] <asn:3> *__p
   kernel/trace/trace.c:2548:23: sparse:     got int *
   kernel/trace/trace.c:2787:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] <asn:4> ** @@
   kernel/trace/trace.c:2787:28: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:2787:28: sparse:     got struct trace_export [noderef] <asn:4> **
   kernel/trace/trace.c:2801:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] <asn:4> ** @@
   kernel/trace/trace.c:2801:33: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:2801:33: sparse:     got struct trace_export [noderef] <asn:4> **
>> kernel/trace/trace.c:6334:43: sparse: sparse: incompatible types in comparison expression (different type sizes):
   kernel/trace/trace.c:6334:43: sparse:    unsigned int *
   kernel/trace/trace.c:6334:43: sparse:    unsigned long *
   kernel/trace/trace.c:2024:15: sparse: sparse: memset with byte count of 131088
   kernel/trace/trace.c:2034:15: sparse: sparse: memset with byte count of 131076
   kernel/trace/trace.c:2548:23: sparse: sparse: dereference of noderef expression
   kernel/trace/trace.c:2548:23: sparse: sparse: dereference of noderef expression
   kernel/trace/trace.c:2548:23: sparse: sparse: dereference of noderef expression
   kernel/trace/trace.c:2548:23: sparse: sparse: dereference of noderef expression
   kernel/trace/trace.c:2548:23: sparse: sparse: dereference of noderef expression
   kernel/trace/trace.c:2548:23: sparse: sparse: dereference of noderef expression
   kernel/trace/trace.c:2548:23: sparse: sparse: dereference of noderef expression
   kernel/trace/trace.c:2548:23: sparse: sparse: dereference of noderef expression
   kernel/trace/trace.c: note: in included file:
   kernel/trace/trace.h:1440:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] <asn:4> *filter @@
   kernel/trace/trace.h:1440:37: sparse:     expected struct event_filter *filter
   kernel/trace/trace.h:1440:37: sparse:     got struct event_filter [noderef] <asn:4> *filter
   kernel/trace/trace.c:2739:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:2739:9: sparse:    struct trace_export [noderef] <asn:4> *
   kernel/trace/trace.c:2739:9: sparse:    struct trace_export *
   kernel/trace/trace.c:2754:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:2754:9: sparse:    struct trace_export [noderef] <asn:4> *
   kernel/trace/trace.c:2754:9: sparse:    struct trace_export *

vim +6334 kernel/trace/trace.c

  6277	
  6278	static ssize_t tracing_splice_read_pipe(struct file *filp,
  6279						loff_t *ppos,
  6280						struct pipe_inode_info *pipe,
  6281						size_t len,
  6282						unsigned int flags)
  6283	{
  6284		struct page *pages_def[PIPE_DEF_BUFFERS];
  6285		struct partial_page partial_def[PIPE_DEF_BUFFERS];
  6286		struct trace_iterator *iter = filp->private_data;
  6287		struct splice_pipe_desc spd = {
  6288			.pages		= pages_def,
  6289			.partial	= partial_def,
  6290			.nr_pages	= 0, /* This gets updated below. */
  6291			.nr_pages_max	= PIPE_DEF_BUFFERS,
  6292			.ops		= &tracing_pipe_buf_ops,
  6293			.spd_release	= tracing_spd_release_pipe,
  6294		};
  6295		ssize_t ret;
  6296		size_t rem;
  6297		unsigned int i;
  6298	
  6299		if (splice_grow_spd(pipe, &spd))
  6300			return -ENOMEM;
  6301	
  6302		mutex_lock(&iter->mutex);
  6303	
  6304		if (iter->trace->splice_read) {
  6305			ret = iter->trace->splice_read(iter, filp,
  6306						       ppos, pipe, len, flags);
  6307			if (ret)
  6308				goto out_err;
  6309		}
  6310	
  6311		ret = tracing_wait_pipe(filp);
  6312		if (ret <= 0)
  6313			goto out_err;
  6314	
  6315		if (!iter->ent && !trace_find_next_entry_inc(iter)) {
  6316			ret = -EFAULT;
  6317			goto out_err;
  6318		}
  6319	
  6320		trace_event_read_lock();
  6321		trace_access_lock(iter->cpu_file);
  6322	
  6323		/* Fill as many pages as possible. */
  6324		for (i = 0, rem = len; i < spd.nr_pages_max && rem; i++) {
  6325			spd.pages[i] = alloc_page(GFP_KERNEL);
  6326			if (!spd.pages[i])
  6327				break;
  6328	
  6329			rem = tracing_fill_pipe_page(rem, iter);
  6330	
  6331			/* Copy the data into the page, so we can start over. */
  6332			ret = trace_seq_to_buffer(&iter->seq,
  6333						  page_address(spd.pages[i]),
> 6334						  min((size_t)trace_seq_used(&iter->seq),
  6335							  PAGE_SIZE));
  6336			if (ret < 0) {
  6337				__free_page(spd.pages[i]);
  6338				break;
  6339			}
  6340			spd.partial[i].offset = 0;
  6341			spd.partial[i].len = ret;
  6342	
  6343			trace_seq_init(&iter->seq);
  6344		}
  6345	
  6346		trace_access_unlock(iter->cpu_file);
  6347		trace_event_read_unlock();
  6348		mutex_unlock(&iter->mutex);
  6349	
  6350		spd.nr_pages = i;
  6351	
  6352		if (i)
  6353			ret = splice_to_pipe(pipe, &spd);
  6354		else
  6355			ret = 0;
  6356	out:
  6357		splice_shrink_spd(&spd);
  6358		return ret;
  6359	
  6360	out_err:
  6361		mutex_unlock(&iter->mutex);
  6362		goto out;
  6363	}
  6364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
