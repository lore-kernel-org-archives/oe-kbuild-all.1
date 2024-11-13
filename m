Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170A7DA7F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504202; cv=none; b=hvVUi8Anex9b4CFy+TWK5gH6QWsLsniYavi1ckvfiXFASTZHABccfHhNqJAfEUcRiRWlanRuUIy3Cb7le/UboSZOWUCvjJPAJkUqHdPKrNyR5/jLaq8bGjhryaPdC6kpP+HGxlq4ynTEM4gxnO8nAeCtY5n5Xujd4faCNoTEuPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504202; c=relaxed/simple;
	bh=Gg2SCIXCVRFKCYEQ+hWgamTJyRG5uQ/VH43udAER+Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fLMU3wQaIB03TuwbHIu9/Zbi/2qQVRID3VV5kNkqVPd3IRkUQQYRsrUQJ8l63gKRDfMwgx1QDBe+mTGjpyL3hYrAEr6AiUCliyUIk2ADrKu/GyMk3dLp1uCxBLRJ1kImFRhCK7UcrDtSeB+6Y4WWh9hiqCen3PBPpDIxbEwBxhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgyJl5jk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgyJl5jk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731504199; x=1763040199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gg2SCIXCVRFKCYEQ+hWgamTJyRG5uQ/VH43udAER+Ig=;
  b=jgyJl5jkwmSzDKvdkqP57MMjpyANzW0mM2Dzw3jOtfhBjvI7Ng5D+72b
   Vu1EF0B4BuHo6P5pE5ZQVm6eVyyf+cBW4jw1QXHjla8j7XDAYoWG2N55m
   Hyk1e8h/uTGJGzzeRdxLrp65zbh1yepZXe6lngS/UU+ZKDavs55RF5SQc
   h5J4LyDkAUZg0mIQf4DqcOUuuAgp57K7kxyuZToRP5Ea/bK3UQ70Lw7OW
   XyWhxsKVWekX1Vv5RWQWP5CtN9lhKavUY4OrH1avkBzXE6ZJqHXhzTMcz
   rupG4YMIub5cjzWkr1zypTGV+nK1fA/bX0n6+pf8f8MQXeSPfPjb6X/5l
   Q==;
X-CSE-ConnectionGUID: 1yhLL/GVTBisv+lQ9ml3HQ==
X-CSE-MsgGUID: lRNNnsxgSGqKKWgsHaGzKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31277701"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="31277701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 05:23:18 -0800
X-CSE-ConnectionGUID: P2gEA26fRAid8QMoX9gV9A==
X-CSE-MsgGUID: SqjD7/zuRZKcoFTH+nOSWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="92644570"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2024 05:23:16 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBDL0-0000Pn-1H;
	Wed, 13 Nov 2024 13:23:14 +0000
Date: Wed, 13 Nov 2024 21:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 drivers/char/svm.c:312:17-38: WARNING: atomic_dec_and_test variation before
 object free at line 335.
Message-ID: <202411132134.HfBsR3KA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: 4cdb60f56180d6ef7c10bd0e50ddda96ebc9f783 [1291/1291] svm: implement unpin pages to dec refcount
config: arm64-randconfig-r063-20241113 (https://download.01.org/0day-ci/archive/20241113/202411132134.HfBsR3KA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411132134.HfBsR3KA-lkp@intel.com/

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
