Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2B72673A3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732216; cv=none; b=RVAa6I5YvHKCWxkXm47Z+93VBDpzRRn8lbs3AU97jaxYbpwkoh4KH+CxSoKje2guKxycAH5ixEyDUifD7wEF+V2Qy2jFHtEbyL3nH9f1uNvIJLohKKdFHMm5UyXqGEpAyCC8amdihDd6U0DG9h1T+cIx2GuRrKW2k/uELFo7Vew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732216; c=relaxed/simple;
	bh=NHsBex9MvB4wRL2ETo/CVeIBx3vNs+03X30skTb4HaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EzJ5LpCUc9KVe/t3r1qc9Vkw2hgX1Ao3vGhCc7YRpk4svT6+0djHfNjTwRujWOOVdVBzkPoKyoLT6I8H3NHlKGOPUJKn++dDSO5IN0cJS3V/xTxILyaSv7pKGi22bl5vfOCI2a6JMDWUnhXkehWNWWnIP3E2Vmfjw/LiL4kQY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDdUYmRb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDdUYmRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747732214; x=1779268214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHsBex9MvB4wRL2ETo/CVeIBx3vNs+03X30skTb4HaI=;
  b=XDdUYmRbSQrzax2ZydHGZQWjSoXFNmR1OajqFP+P9JRl8sOyRelzk6UN
   lkqgComTvht1rR+ByDkNvkt2cfrqtbKHUNfl0k301zUIoczl5onnOSJRJ
   4+LY/4udVUK3R6fSZbkGbsL+fEdY0wYW+ksls52G1+exxuW7LGSPgAAdQ
   jQW9O8F+Zniif+vhwz/L2oUoE7IKCCsBpYBb9dKphxQR2EhaVlY1/5Jrx
   UlZtZuoWwx9RQgcbKw2T4xM6nNaEkvinoWDK3CRe6elgaQPk6+yOJ2p1I
   qUHUUy1UJCaS/lu5c/W+IYAOSyUkVRyiwdhyr+SCk7nA+DyTaXeUSvie3
   Q==;
X-CSE-ConnectionGUID: KnSc2b4KR+uIrj/eNBRxPg==
X-CSE-MsgGUID: NevyL6o3RZSMQh6NftWotA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="75056826"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="75056826"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 02:10:14 -0700
X-CSE-ConnectionGUID: pA+adyDYTXWiHW+J+fmKvQ==
X-CSE-MsgGUID: SebWjDRDSjO7PjSfBT7UcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140541707"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2025 02:10:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHIzC-000MMi-2U;
	Tue, 20 May 2025 09:10:10 +0000
Date: Tue, 20 May 2025 17:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2257/2257] mm/madvise.c:297:6: warning: no
 previous prototype for 'force_swapin_vma'
Message-ID: <202505201708.6dvo6U58-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   289de29f4f837038aa79e765e64ddc1d410fe5fd
commit: 92a0eb9bde6c03412b39f9f3d20968c091ea3b46 [2257/2257] memcg: introduce per-memcg swapin interface
config: loongarch-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201708.6dvo6U58-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201708.6dvo6U58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201708.6dvo6U58-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/madvise.c:297:6: warning: no previous prototype for 'force_swapin_vma' [-Wmissing-prototypes]
     297 | void force_swapin_vma(struct vm_area_struct *vma)
         |      ^~~~~~~~~~~~~~~~


vim +/force_swapin_vma +297 mm/madvise.c

   280	
   281	#ifdef CONFIG_MEMCG_SWAP_QOS
   282	void force_swapin_vma(struct vm_area_struct *vma)
   283	{
   284		struct file *file = vma->vm_file;
   285	
   286		if (!can_madv_lru_vma(vma))
   287			return;
   288	
   289		if (!file) {
   290			walk_page_vma(vma, &swapin_walk_ops, vma);
   291			lru_add_drain();
   292		} else if (shmem_mapping(file->f_mapping))
   293			shmem_swapin_range(vma, vma->vm_start,
   294				vma->vm_end, file->f_mapping);
   295	}
   296	#else
 > 297	void force_swapin_vma(struct vm_area_struct *vma)
   298	{
   299	}
   300	#endif
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
