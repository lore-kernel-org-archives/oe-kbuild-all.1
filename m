Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB644A32
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752082362; cv=none; b=D5RoQWpEUzm6+CZ5HVCAzcleSbFQldG9e9Fmc9ut4o736jQsv6XD8QpTk5IqTV6LJ4gAR5kR7Gx2oRz2wsAAWuKseVOzjYexS6C7UwsSNXQs3/mA0avLnBUlkjCt1JXhM/TxueoPXR6g3oy8omQsD4HpsEe+ZW0OrMRD0N+c1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752082362; c=relaxed/simple;
	bh=NN1IFEfqbHVaIIBOSuiEekAhsSkVDnjGaLL4oFROiBI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=A2POAfH0TzxwAVoDChsD1J9QPGwzpmqRAPUqYHNlH5zkIDZmpu7yx9iWwpa7ueqbaWR/W4sWlqEG7IuJuofAdD/ZOqIjYsBThYZhKKEid8S83eLGnNJpkouYm3Wl2WEMM5ceZK3/fEfpNl4AHtaMqWWRXnHtP0x1j9IX/N2q0u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=IsAYt6fB; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="IsAYt6fB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=C0YyRrPA0LSCy1D1WMft+iLCzNOLPi1zRrXF5BSTZ0k=;
  b=IsAYt6fBWXmT/Bw8IZgyiB3eETzXxcOiQAdQ8LPL66hiW5EfqsY3yrmX
   vvgHLrwEp1e58nnWzimZX9hgRNtv02B1Spjx7Gbz3nEM6y/lfUu09aFT1
   27i45QSoIReBqsaSeqmCFV6N9B2adY+UMHLB8h+R81VOfLAVufx+kAfBE
   o=;
X-CSE-ConnectionGUID: AUq0HylZRlW5dO3YcrkcNg==
X-CSE-MsgGUID: PiyeFeMkQBuQrglUwiPM+w==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.16,298,1744063200"; 
   d="scan'208";a="121068299"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 19:32:30 +0200
Date: Wed, 9 Jul 2025 19:32:29 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: cros-kernel-buildreports@googlegroups.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 6/6] drivers/dma-buf/dma-buf.c:185:29-39:
 ERROR: function new_task_dmabuf_record called on line 226 inside lock on
 line 223 but uses GFP_KERNEL (fwd)
Message-ID: <ccce552f-70c-f0dd-dbb-cd8335d350dc@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Thu, 10 Jul 2025 00:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android15-6.6 6/6] drivers/dma-buf/dma-buf.c:185:29-39:
     ERROR: function new_task_dmabuf_record called on line 226 inside lock on
    line 223 but uses GFP_KERNEL

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c8fdc081cfa165aaa5bd87979d33b419499574cf
commit: f44d593749dcbd4e1013121fa615ecca412d1cb3 [6/6] ANDROID: Track per-process dmabuf RSS
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-r053-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100047.7nSTFziq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507100047.7nSTFziq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-buf.c:185:29-39: ERROR: function new_task_dmabuf_record called on line 226 inside lock on line 223 but uses GFP_KERNEL

vim +185 drivers/dma-buf/dma-buf.c

f44d593749dcbd T.J. Mercier 2025-06-25  178
f44d593749dcbd T.J. Mercier 2025-06-25  179  static int new_task_dmabuf_record(struct task_struct *task, struct dma_buf *dmabuf)
f44d593749dcbd T.J. Mercier 2025-06-25  180  {
f44d593749dcbd T.J. Mercier 2025-06-25  181  	struct task_dma_buf_record *rec;
f44d593749dcbd T.J. Mercier 2025-06-25  182
f44d593749dcbd T.J. Mercier 2025-06-25  183  	lockdep_assert_held(&task->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier 2025-06-25  184
f44d593749dcbd T.J. Mercier 2025-06-25 @185  	rec = kmalloc(sizeof(*rec), GFP_KERNEL);
f44d593749dcbd T.J. Mercier 2025-06-25  186  	if (!rec)
f44d593749dcbd T.J. Mercier 2025-06-25  187  		return -ENOMEM;
f44d593749dcbd T.J. Mercier 2025-06-25  188
f44d593749dcbd T.J. Mercier 2025-06-25  189  	task->dmabuf_info->rss += dmabuf->size;
f44d593749dcbd T.J. Mercier 2025-06-25  190  	rec->dmabuf = dmabuf;
f44d593749dcbd T.J. Mercier 2025-06-25  191  	rec->refcnt = 1;
f44d593749dcbd T.J. Mercier 2025-06-25  192  	list_add(&rec->node, &task->dmabuf_info->dmabufs);
f44d593749dcbd T.J. Mercier 2025-06-25  193
f44d593749dcbd T.J. Mercier 2025-06-25  194  	return 0;
f44d593749dcbd T.J. Mercier 2025-06-25  195  }
f44d593749dcbd T.J. Mercier 2025-06-25  196
f44d593749dcbd T.J. Mercier 2025-06-25  197  /**
f44d593749dcbd T.J. Mercier 2025-06-25  198   * dma_buf_account_task - Account a dmabuf to a task
f44d593749dcbd T.J. Mercier 2025-06-25  199   * @dmabuf:	[in]	pointer to dma_buf
f44d593749dcbd T.J. Mercier 2025-06-25  200   * @task:	[in]	pointer to task_struct
f44d593749dcbd T.J. Mercier 2025-06-25  201   *
f44d593749dcbd T.J. Mercier 2025-06-25  202   * When a process obtains a dmabuf file descriptor, or maps a dmabuf, this
f44d593749dcbd T.J. Mercier 2025-06-25  203   * function attributes the provided @dmabuf to the @task. The first time @dmabuf
f44d593749dcbd T.J. Mercier 2025-06-25  204   * is attributed to @task, the buffer's size is added to the @task's dmabuf RSS.
f44d593749dcbd T.J. Mercier 2025-06-25  205   *
f44d593749dcbd T.J. Mercier 2025-06-25  206   * Return:
f44d593749dcbd T.J. Mercier 2025-06-25  207   * * 0 on success
f44d593749dcbd T.J. Mercier 2025-06-25  208   * * A negative error code upon error
f44d593749dcbd T.J. Mercier 2025-06-25  209   */
f44d593749dcbd T.J. Mercier 2025-06-25  210  int dma_buf_account_task(struct dma_buf *dmabuf, struct task_struct *task)
f44d593749dcbd T.J. Mercier 2025-06-25  211  {
f44d593749dcbd T.J. Mercier 2025-06-25  212  	struct task_dma_buf_record *rec;
f44d593749dcbd T.J. Mercier 2025-06-25  213  	int ret = 0;
f44d593749dcbd T.J. Mercier 2025-06-25  214
f44d593749dcbd T.J. Mercier 2025-06-25  215  	if (!dmabuf || !task)
f44d593749dcbd T.J. Mercier 2025-06-25  216  		return -EINVAL;
f44d593749dcbd T.J. Mercier 2025-06-25  217
f44d593749dcbd T.J. Mercier 2025-06-25  218  	if (!task->dmabuf_info) {
f44d593749dcbd T.J. Mercier 2025-06-25  219  	    pr_err("%s dmabuf accounting record was not allocated\n", __func__);
f44d593749dcbd T.J. Mercier 2025-06-25  220  	    return -ENOMEM;
f44d593749dcbd T.J. Mercier 2025-06-25  221  	}
f44d593749dcbd T.J. Mercier 2025-06-25  222
f44d593749dcbd T.J. Mercier 2025-06-25 @223  	spin_lock(&task->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier 2025-06-25  224  	rec = find_task_dmabuf_record(task, dmabuf);
f44d593749dcbd T.J. Mercier 2025-06-25  225  	if (!rec)
f44d593749dcbd T.J. Mercier 2025-06-25 @226  		ret = new_task_dmabuf_record(task, dmabuf);
f44d593749dcbd T.J. Mercier 2025-06-25  227  	else
f44d593749dcbd T.J. Mercier 2025-06-25  228  		++rec->refcnt;
f44d593749dcbd T.J. Mercier 2025-06-25  229  	spin_unlock(&task->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier 2025-06-25  230
f44d593749dcbd T.J. Mercier 2025-06-25  231  	return ret;
f44d593749dcbd T.J. Mercier 2025-06-25  232  }
f44d593749dcbd T.J. Mercier 2025-06-25  233

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
