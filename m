Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD386381A4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725695335; cv=none; b=EpkQ/mX74CO9ADN3RY33BUTFKGVtA95T7K499kKni4GkRK0GOrLY7LWV/0dSZsvREvcv07NbR8+ggrYk1u5U0Esghxm+BupGUeasKUuFte3mczQBTe2wrVQyBgikIEjUriq3etUyVXIIXgaxDJIO+gDBShVTGle+WoaeOR/fPI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725695335; c=relaxed/simple;
	bh=NgM5jnCzKIwduw7EVg85xLi0ETFixG0R1Q/sb6PDUSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QxL+mwsZTAsB//IMRenEab28hMOG3izx9NN6uU5BcmDOiUUH/U6fXEyECUh1uN1c4+Z3uHdUwgrUZlazURb1/ib4S774JW7n09Drkb8o5hr6M357cwqOzCFg9h1uMPPjFAcO94xCv5S6uhs5Vm/WW/tkU5Gm3GASk9eYz8z/Mr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGgqBqV6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGgqBqV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725695334; x=1757231334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NgM5jnCzKIwduw7EVg85xLi0ETFixG0R1Q/sb6PDUSk=;
  b=JGgqBqV6urj0FkzzdwkkUaofsJbqSmk2CZ+MVbYxRFVL7gEvF1ymSqGA
   l7sMdHqMO1JHA2SFzbjFOm9cLi4STGlIJv6ma3Z/PurTiC7YDdiaL8EPa
   xuzSk2Wlf3oYcR6koaZILqieh8uUHQe23q01+/GgzJ3CcOmxFesTLckmD
   sOEZ3bUG5/9H690GczLYSxR4MO1y1wdsmQixtd9/OxEEM09jNf6KdyVWs
   9OVjSeHxqCmFKzTxw/qZMJgmsZwpU/yPyz4eO4iNehemO5dngoYPqEeRc
   stAs+q9WgQ3oT333CnjhHtHfPw8o1LeNCqnyZanobgiKkDTh9Xu1LyZFz
   g==;
X-CSE-ConnectionGUID: BK+NKffFR/SGFoY+MEiewQ==
X-CSE-MsgGUID: QvGoqeRYSdKVfzwouPjUgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35597741"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35597741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 00:48:54 -0700
X-CSE-ConnectionGUID: 2C1yjIKqTLqP4r2Bpc2Zqw==
X-CSE-MsgGUID: SOZ1AOkhQzSM25Q1LXZLug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70572984"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2024 00:48:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smqBe-000CIZ-0q;
	Sat, 07 Sep 2024 07:48:50 +0000
Date: Sat, 7 Sep 2024 15:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.10.y 37/56] drivers/char/aml-gpiomem.c:129:29:
 error: implicit declaration of function 'phys_mem_access_prot'; did you mean
 'phys_mem_access_prot_allowed'?
Message-ID: <202409071543.gReRuTLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.10.y
head:   d464381853b77cfca0cc9bdd19b3edf4bac8f0c0
commit: 5c70fa7bdce06ef372ba87e68f1c1b8bb2174d76 [37/56] ODROID-N2/C4: char: Add /dev/gpiomem device
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240907/202409071543.gReRuTLg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071543.gReRuTLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071543.gReRuTLg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/aml-gpiomem.c: In function 'aml_gpiomem_mmap':
>> drivers/char/aml-gpiomem.c:129:29: error: implicit declaration of function 'phys_mem_access_prot'; did you mean 'phys_mem_access_prot_allowed'? [-Werror=implicit-function-declaration]
     129 |         vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
         |                             ^~~~~~~~~~~~~~~~~~~~
         |                             phys_mem_access_prot_allowed
>> drivers/char/aml-gpiomem.c:129:29: error: incompatible types when assigning to type 'pgprot_t' from type 'int'
   cc1: some warnings being treated as errors


vim +129 drivers/char/aml-gpiomem.c

   112	
   113	static int aml_gpiomem_mmap(struct file *file, struct vm_area_struct *vma)
   114	{
   115		int gpio_area = 0;
   116		unsigned long start = vma->vm_pgoff << PAGE_SHIFT;
   117		unsigned long end   = start + vma->vm_end - vma->vm_start;
   118	
   119		while (gpio_area < inst->gpio_area_count) {
   120			if ((inst->gpio_regs_phys[gpio_area].start >= start) &&
   121			    (inst->gpio_regs_phys[gpio_area].end   <= end))
   122				goto found;
   123			gpio_area++;
   124		}
   125	
   126		return -EACCES;
   127	
   128	found:
 > 129		vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
   130				vma->vm_end - vma->vm_start,
   131				vma->vm_page_prot);
   132	
   133		vma->vm_ops = &aml_gpiomem_vm_ops;
   134	
   135		if (remap_pfn_range(vma, vma->vm_start,
   136					vma->vm_pgoff,
   137					vma->vm_end - vma->vm_start,
   138					vma->vm_page_prot)) {
   139			return -EAGAIN;
   140		}
   141	
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
