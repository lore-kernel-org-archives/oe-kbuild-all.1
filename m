Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB617BD2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 03:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706672913; cv=none; b=W5b2jh4JINk4PVv1YI2/G8QT6az4fWhUX6EuGevRs6pu0WFrqIwflBA7y6cviUrRrbF2dRuOTtSgHCehVrdkCkdNrNwKBLLdzaQfyCOkmXHYdt8yldBGcVgucRQO4s5HNykfyFI1cH6kp7LKMay/nJamjz2hCpVdUlpV0Nbzxmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706672913; c=relaxed/simple;
	bh=rkQhuc+0ypQV3yq7HbzBg1QaHZamxNqAVrnK2pYHaWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C5Dq9dJSZhyCz9N80xgU9fee9AC1YE+LQmIlSWPOYqs2HIKP7+E5BUSjjERSHoFpJKdJrmCxri6q7LkJfnS0fzekRLqy+7RdtYbSigLeFFXbG/0HG1BeT0em22O/OfrCbYaYq96M9jeSgAGK+ZJWbGusOYoLij76pizn98nhvfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VeUKnQz5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VeUKnQz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706672911; x=1738208911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rkQhuc+0ypQV3yq7HbzBg1QaHZamxNqAVrnK2pYHaWc=;
  b=VeUKnQz5LahUWEBbP6MyY+dPTccMhXAK0z29pfjJlcTEWteiNtfgS6B9
   Vi8cdbOdASV/sM41MbKSY1tnX5G1tTmDjrg2hon6z1Gy+yZ/vOw87fq78
   iBDKNf2wdMKdxDamNmgWbd92E9S5sdFuM34CE0sfnwHwLKJ+OXHppRalQ
   RZZNNA7/HoS44v1xaVOcqGwLEticPbAX1/4g1aM5JaXz+LeEjFqCfED7L
   Q3zOFW4exT+2/P7/kktHN+LYBGr/bWT+UiMvUaeN85VoN+hyK3kGD5GuO
   sQVAKKDjq2QVMQ0cE7jwFB5VovcEJAbzTBHSUneVkA/YUXbrgw94/5d4a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10228511"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10228511"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 19:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="737967161"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="737967161"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Jan 2024 19:48:28 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV1Zx-00016y-1A;
	Wed, 31 Jan 2024 03:48:13 +0000
Date: Wed, 31 Jan 2024 11:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 42/51] drivers/char/aml-gpiomem.c:128:20:
 error: incompatible types when assigning to type 'pgprot_t {aka struct
 <anonymous>}' from type 'int'
Message-ID: <202401311106.nlgY1Xe3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   613a1058dbc7451b001352f0199a9e3645f971bc
commit: 5fa32be6d7ce558be554b60a740b8906fcc0e648 [42/51] ODROID-N2/C4: char: Add /dev/gpiomem device
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240131/202401311106.nlgY1Xe3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311106.nlgY1Xe3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311106.nlgY1Xe3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/aml-gpiomem.c: In function 'aml_gpiomem_mmap':
   drivers/char/aml-gpiomem.c:128:22: error: implicit declaration of function 'phys_mem_access_prot'; did you mean 'phys_mem_access_prot_allowed'? [-Werror=implicit-function-declaration]
     vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                         ^~~~~~~~~~~~~~~~~~~~
                         phys_mem_access_prot_allowed
>> drivers/char/aml-gpiomem.c:128:20: error: incompatible types when assigning to type 'pgprot_t {aka struct <anonymous>}' from type 'int'
     vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
                       ^
   cc1: some warnings being treated as errors


vim +128 drivers/char/aml-gpiomem.c

   111	
   112	static int aml_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   113	{
   114		int gpio_area = 0;
   115		unsigned long start = vma->vm_pgoff << PAGE_SHIFT;
   116		unsigned long end   = start + vma->vm_end - vma->vm_start;
   117	
   118		while (gpio_area < inst->gpio_area_count) {
   119			if ((inst->gpio_regs_phys[gpio_area].start >= start) &&
   120			    (inst->gpio_regs_phys[gpio_area].end   <= end))
   121				goto found;
   122			gpio_area++;
   123		}
   124	
   125		return -EACCES;
   126	
   127	found:
 > 128		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   129				vma->vm_end - vma->vm_start,
   130				vma->vm_page_prot);
   131	
   132		vma->vm_ops = &aml_gpiomem_vm_ops;
   133	
   134		if (remap_pfn_range(vma, vma->vm_start,
   135					vma->vm_pgoff,
   136					vma->vm_end - vma->vm_start,
   137					vma->vm_page_prot)) {
   138			return -EAGAIN;
   139		}
   140	
   141		return 0;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
