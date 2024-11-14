Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454151420A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731598391; cv=none; b=mBC7kCbB/ofhB3A9b4fUVygyBnv4qL8fSm5S1RvkWuZ61VerfvIXHRsXT5MowuaUWz5nj3G3Thv2jmT89EwfeUIkSdUlzhb4cISDj0MzLJBbN+HOnciq85QLgH8EqyOEol0ouTHWWalpWn5zdPnr/6/zeOJvZprUmjX0eHhrzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731598391; c=relaxed/simple;
	bh=G1eteGWhGs7qoxZjHc9W4xxDiaORnwo5ELPzngEFEr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DV4AqLDG+pTrgML95NDJWCRmzIzid1RQTKZmkeb4jtuSb9H4s2vT+KjEEm3S7l1HZZzDy8Bq7xGKjJEWaJ+L3zOP2ode+UOBIRZl/KVXTVrxAzjmdWtx7kjKaM8u9BNZvUqDrNg+0biE9LWxPiR3EnGKdXzfvNW/KSfR+jEA+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnP6kqYZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnP6kqYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731598388; x=1763134388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G1eteGWhGs7qoxZjHc9W4xxDiaORnwo5ELPzngEFEr4=;
  b=MnP6kqYZrYEWQ98ueGO95KO09kXkS/AjKibtZ9hg/4cjaYG7ElsZtwbY
   POLtJAjyRA6v1pgnfEruoTusAg8b6fTYjhRx324yhvDZ8Q/oEVYlRLVKp
   3p9hpKwpSg8DWhlpa0MBpLqcr7gsHhjfwCAeHFMZYP/mwpR+bVV4fqIYO
   IP6h2m+VqpRuuilhFH2zXY41lOO9LikdZXzWK2uObozSgXe8+RyqDvcLc
   cpGnQ9j3ISPep/knTu78smRFXcLxs1K+03k1bSna2iiM0+QRGOzfmmS/h
   dy6ntFOkDTgaIlccsq30/pXEbS/hsLxmKeZf1bvsircTnPOupbL2c+FSm
   w==;
X-CSE-ConnectionGUID: c7idcJvWS2mRL90YXxcwsA==
X-CSE-MsgGUID: fVOZ/EPERmeQck8hb8f2VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31654364"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="31654364"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 07:33:07 -0800
X-CSE-ConnectionGUID: pScZmwRlTAiUam4YSCydkg==
X-CSE-MsgGUID: IRINVIaLRqOXH5j9JcJpuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="88245293"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2024 07:33:07 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBbqB-00007Z-2g;
	Thu, 14 Nov 2024 15:33:03 +0000
Date: Thu, 14 Nov 2024 23:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 drivers/char/svm.c:312:17-38: WARNING: atomic_dec_and_test variation before
 object free at line 335.
Message-ID: <202411142318.PmiGB1Ht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5769bea33a24c5a60de09ceaeb12f349d1161f3b
commit: 4cdb60f56180d6ef7c10bd0e50ddda96ebc9f783 [1291/1291] svm: implement unpin pages to dec refcount
config: arm64-randconfig-r063-20241113 (https://download.01.org/0day-ci/archive/20241114/202411142318.PmiGB1Ht-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411142318.PmiGB1Ht-lkp@intel.com/

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
