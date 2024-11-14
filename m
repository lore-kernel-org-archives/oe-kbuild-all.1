Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A951F9A82
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731587090; cv=none; b=UFaG1Jt9vl/hzC352XKahyG6IkpoHp2HCgg1n50Br2ZbbAjO8ZeWUc0ODEtCBvmHRdKF4JZi4//M6aZxwHN/EHwU+K/6Gxksm2drkS0xusxJRmaltoEjxQMtbXNwhcLeV/typMIF5nfXm7MwuiMp5ZrIlT1jUla1q7iQJwl/bGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731587090; c=relaxed/simple;
	bh=zWC78Ez4wygcebjhBfVEo1TDFz1zpsBRu4r+sFhAOBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPZCpEMIwLHv5y2PBTHqyG23IwtL2zUi81daP5YblEoigeo7PI6zzhNTpEBqK/6Ji5y4pxGxKLEPjw65i6ytwHK52WJudYXLPC9uy2grqXAMNMWI+WZ136HIRgUc6Nv2dn5QdsBpPsYLcSyslNAJ4hB1UsYCp4pd7sYILCv4XqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ds3fxU7/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds3fxU7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731587088; x=1763123088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWC78Ez4wygcebjhBfVEo1TDFz1zpsBRu4r+sFhAOBc=;
  b=ds3fxU7/YB6cVZvbh9b4+PoezfPl3TisBVfeN9ewhcnhRs4a93DjiIDW
   0TWszTedegv5lXSre7RK9uKkVoPT+3jV6tnPHZcBS7dgyref6qmfNlLQm
   y390dG66OKeJ3pmbLWpI7TAquj2RZaUzBmTzPBg2kzg9a5JeBi6cxMHqT
   FGTDUWImfzsBgrtGHB9cocz0cfLhTNV8iZY5pb3EdEgUYWKOLL6GCMaZU
   6Now7brb7UOgLeXo4PDpGyKVgCrv9XQBcC3qK2gTQX74xBz3lAxi44Nv+
   bR3KBgyC0qqX7TyiXHlGM7bejPGOUciB99WRvITw/MysceB42fQnD98vO
   w==;
X-CSE-ConnectionGUID: 7wSkG14FROmGB8NF3hXZlw==
X-CSE-MsgGUID: IJSgXp39SBGyd9TaOC8/kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42147737"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="42147737"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 04:24:48 -0800
X-CSE-ConnectionGUID: J5QD9cazSuylo95UBrzi7A==
X-CSE-MsgGUID: Yln38l1LQcaPsTxuY+EN9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="92642226"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Nov 2024 04:24:47 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBYtw-000027-22;
	Thu, 14 Nov 2024 12:24:44 +0000
Date: Thu, 14 Nov 2024 20:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 drivers/char/svm.c:312:17-38: WARNING: atomic_dec_and_test variation before
 object free at line 335.
Message-ID: <202411142057.pcqq5uGT-lkp@intel.com>
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
config: arm64-randconfig-r063-20241113 (https://download.01.org/0day-ci/archive/20241114/202411142057.pcqq5uGT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411142057.pcqq5uGT-lkp@intel.com/

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
