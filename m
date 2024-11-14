Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983201EB9FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 08:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574753; cv=none; b=RTb+s659LDr5BpY7IzVsPvpsQ0+e2YJ3bAPQ+8NV1D31f6FWeKeY0z3EK4XhXiBHCpDiAMFy4SQlfYsXr34sCeIF4qExgIeJH26IANG04hypUsLzml5m9tWkZ2QXaYNdzWCHRJQQL6EAa5CmqcxRUMjP8uJF/qI1PscKGktMxPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574753; c=relaxed/simple;
	bh=zmgGVKMZfes4VpUJdfgriBnLEaWUoRqsAbZOw2dqEJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XX5gguzfnKonaBFpkxE/Qhc9YPdJwHcr2YLf6yasqa8We1C0vV4ifuhQOaNDHpuBYQze7dl8i+Yd5Lv+EhRIV67AX2gnyVxSthJhabT9WFeV74c5rpSGDxUR99wV6j/V6dP/y1Yv3M4mQefIsV2zoZXmxslTXMjtxSXBz5D8hCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ba0orxTI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ba0orxTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731574752; x=1763110752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmgGVKMZfes4VpUJdfgriBnLEaWUoRqsAbZOw2dqEJw=;
  b=Ba0orxTIyIcHnzw6CBbKUiOjxLf4GZkrRIn6mspBPNntIfNXHxhoYODo
   znGeKtLNIw2hm7jAuxpPgJAuZD0zE+qzbHoSjkj2ZuDxjcugVheW4i49o
   DCymYGgDKTLbeWt6i9ve1gnU/WKgm82pUQIzAc0dXjDaZYiU1FPms6EN+
   meSaSd2fb9ktpHoiL96uHwOzwzIDt9FhI+qRgCJV+EVgm3S7meFVD7khL
   ghu33ouJPkx8giu2BG95BBKDiURzQ9OWBWoq0gYp1sj9nf8Eb3ADNksOJ
   CIOggbVqU5tetYpSJKRXs7JxTG3pXoSzLvpE3GimHE4zjSJnHMoEtdLD1
   w==;
X-CSE-ConnectionGUID: GAJHyp/sTRS0auwTpe+z7g==
X-CSE-MsgGUID: JeFnRoiLR2eralFHZUNdkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31476442"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31476442"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 00:59:11 -0800
X-CSE-ConnectionGUID: kFCCIwonQreffHEfd80mmw==
X-CSE-MsgGUID: VkmR7VRtSBqR7YLqKym8Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="118952856"
Received: from lkp-server01.sh.intel.com (HELO 8eed2ac03994) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Nov 2024 00:59:10 -0800
Received: from kbuild by 8eed2ac03994 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBVgx-00008b-1w;
	Thu, 14 Nov 2024 08:59:07 +0000
Date: Thu, 14 Nov 2024 16:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 drivers/char/svm.c:312:17-38: WARNING: atomic_dec_and_test variation before
 object free at line 335.
Message-ID: <202411141631.Gm0CdUvq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d5c3ef07e625af7ba8aded2f507f092bceab3cbc
commit: 4cdb60f56180d6ef7c10bd0e50ddda96ebc9f783 [1291/1291] svm: implement unpin pages to dec refcount
config: arm64-randconfig-r063-20241113 (https://download.01.org/0day-ci/archive/20241114/202411141631.Gm0CdUvq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411141631.Gm0CdUvq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/char/svm.c:312:17-38: WARNING: atomic_dec_and_test variation before object free at line 335.

vim +312 drivers/char/svm.c

   304	
   305	static void svm_remove_sdma(struct svm_process *process,
   306				    struct svm_sdma *sdma, bool try_rm)
   307	{
   308		int null_count = 0;
   309	
   310		mutex_lock(&process->mutex);
   311	
 > 312		if (try_rm && (!atomic64_dec_and_test(&sdma->ref))) {
   313			mutex_unlock(&process->mutex);
   314			return;
   315		}
   316	
   317		rb_erase(&sdma->node, &process->sdma_list);
   318		RB_CLEAR_NODE(&sdma->node);
   319		mutex_unlock(&process->mutex);
   320	
   321		while (sdma->nr_pages--) {
   322			if (sdma->pages[sdma->nr_pages] == NULL) {
   323				pr_err("null pointer, nr_pages:%d.\n", sdma->nr_pages);
   324				null_count++;
   325				continue;
   326			}
   327	
   328			put_page(sdma->pages[sdma->nr_pages]);
   329		}
   330	
   331		if (null_count)
   332			dump_stack();
   333	
   334		kfree(sdma->pages);
 > 335		kfree(sdma);
   336	}
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
