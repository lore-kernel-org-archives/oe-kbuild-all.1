Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5792E1DE3B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 02:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768703379; cv=none; b=i4QJ7SoV/ewa7RMEwpOWOEXVVgadFjgPxrTH9bF88WUDFTnWLch8SasQo4sG+L4KmeJKMLOaPRpmlyTBb+DqaeazBPRRXjLnPyBrrQ4/YpUrTB9DS26OAj+pSVLIs8uiLzaZGCi7hvChcigYL6jlKaYKAM9KwC99wUAV6/5WqKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768703379; c=relaxed/simple;
	bh=pn8qGyzqYhLiJlgiNIJZWHe+k36/zJMkHhLcP4LaZy8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JoQnP3XKg/q1WOoN41YYhGJ/F3+1kwLnSAIvR3iTHlkdMBTGA55/F8s9edmUFFZZNN3qDtyJpRGEsm61KqiGnwX7QxjT5JZM/rTm5oKA4v759MSOFTj7pM9PtRtkPRkCz7hm6Lu2I3ssu8NQs7b8ROeIsWpuLQwIT6O/k3NTQq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBCtgZyr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBCtgZyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768703377; x=1800239377;
  h=date:from:to:cc:subject:message-id;
  bh=pn8qGyzqYhLiJlgiNIJZWHe+k36/zJMkHhLcP4LaZy8=;
  b=oBCtgZyrCULXH7W2FNWOvZ217Bkl9rw1tB9Mgk1tDj04jmNLVQq2wm5P
   T5owi0Nqq61fPVbT04suIPeuyHxW/AhZF8VK8ciwuogW0/rZLa+o3OgPN
   expjAj7OiaQRHw2Aod7juq1BK50HgQjtSX729TAaQd2WZl6KYae/iD2vK
   q60lsDoJKMZFlbHQOBuQbAxxHv+zVI7V30DLeszbvS0OkuHGux1wagJmP
   wUoXRMLNCTo2dy8YTj6cQ8a2/5fsk6Vxhsp7Op1iHawge5XFD0OqMeNQ4
   UOJbiKvKlnEzyZKvtLgtd6H2KJf6vXql/lb0kmehGMWha/UXC1UHLebKO
   w==;
X-CSE-ConnectionGUID: hReJwZLUSBuyfwyRgNqPYg==
X-CSE-MsgGUID: mlla23K0RQi73n9Hydtghg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73817656"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="73817656"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 18:29:37 -0800
X-CSE-ConnectionGUID: EM96no6rQQqAqaQt7p+ZRg==
X-CSE-MsgGUID: bVfVxHOpStiCABEnHsNkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="204798444"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jan 2026 18:29:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhIXk-00000000MYg-35wj;
	Sun, 18 Jan 2026 02:29:32 +0000
Date: Sun, 18 Jan 2026 10:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/machine_kexec.c:84:51: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202601181018.B6nOmCUL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Youling,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d12453c7e281d236f77b5c7d7cccbf9e5dfadfe5
commit: d162feec6b6e7ed97986118450812fdd7e9ba202 LoongArch: Add preparatory infrastructure for kexec_file
date:   4 months ago
config: loongarch-randconfig-r122-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181018.B6nOmCUL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181018.B6nOmCUL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181018.B6nOmCUL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/machine_kexec.c:84:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char const * @@     got char [noderef] __user * @@
   arch/loongarch/kernel/machine_kexec.c:84:51: sparse:     expected char const *
   arch/loongarch/kernel/machine_kexec.c:84:51: sparse:     got char [noderef] __user *

vim +84 arch/loongarch/kernel/machine_kexec.c

4a03b2ac06a5bc Youling Tang 2022-10-12   61  
4a03b2ac06a5bc Youling Tang 2022-10-12   62  int machine_kexec_prepare(struct kimage *kimage)
4a03b2ac06a5bc Youling Tang 2022-10-12   63  {
4a03b2ac06a5bc Youling Tang 2022-10-12   64  	int i;
4a03b2ac06a5bc Youling Tang 2022-10-12   65  	char *bootloader = "kexec";
4a03b2ac06a5bc Youling Tang 2022-10-12   66  	void *cmdline_ptr = (void *)KEXEC_CMDLINE_ADDR;
4a03b2ac06a5bc Youling Tang 2022-10-12   67  
4a03b2ac06a5bc Youling Tang 2022-10-12   68  	kexec_image_info(kimage);
4a03b2ac06a5bc Youling Tang 2022-10-12   69  
4a03b2ac06a5bc Youling Tang 2022-10-12   70  	kimage->arch.efi_boot = fw_arg0;
4a03b2ac06a5bc Youling Tang 2022-10-12   71  	kimage->arch.systable_ptr = fw_arg2;
4a03b2ac06a5bc Youling Tang 2022-10-12   72  
d162feec6b6e7e Youling Tang 2025-10-02   73  	if (kimage->file_mode == 1) {
d162feec6b6e7e Youling Tang 2025-10-02   74  		/*
d162feec6b6e7e Youling Tang 2025-10-02   75  		 * kimage->cmdline_buf will be released in kexec_file_load, so copy
d162feec6b6e7e Youling Tang 2025-10-02   76  		 * to the KEXEC_CMDLINE_ADDR safe area.
d162feec6b6e7e Youling Tang 2025-10-02   77  		 */
d162feec6b6e7e Youling Tang 2025-10-02   78  		memcpy((void *)KEXEC_CMDLINE_ADDR, (void *)kimage->arch.cmdline_ptr,
d162feec6b6e7e Youling Tang 2025-10-02   79  					strlen((char *)kimage->arch.cmdline_ptr) + 1);
d162feec6b6e7e Youling Tang 2025-10-02   80  		kimage->arch.cmdline_ptr = (unsigned long)KEXEC_CMDLINE_ADDR;
d162feec6b6e7e Youling Tang 2025-10-02   81  	} else {
4a03b2ac06a5bc Youling Tang 2022-10-12   82  		/* Find the command line */
4a03b2ac06a5bc Youling Tang 2022-10-12   83  		for (i = 0; i < kimage->nr_segments; i++) {
4a03b2ac06a5bc Youling Tang 2022-10-12  @84  			if (!strncmp(bootloader, (char __user *)kimage->segment[i].buf, strlen(bootloader))) {
4a03b2ac06a5bc Youling Tang 2022-10-12   85  				if (!copy_from_user(cmdline_ptr, kimage->segment[i].buf, COMMAND_LINE_SIZE))
4a03b2ac06a5bc Youling Tang 2022-10-12   86  					kimage->arch.cmdline_ptr = (unsigned long)cmdline_ptr;
4a03b2ac06a5bc Youling Tang 2022-10-12   87  				break;
4a03b2ac06a5bc Youling Tang 2022-10-12   88  			}
4a03b2ac06a5bc Youling Tang 2022-10-12   89  		}
4a03b2ac06a5bc Youling Tang 2022-10-12   90  
4a03b2ac06a5bc Youling Tang 2022-10-12   91  		if (!kimage->arch.cmdline_ptr) {
4a03b2ac06a5bc Youling Tang 2022-10-12   92  			pr_err("Command line not included in the provided image\n");
4a03b2ac06a5bc Youling Tang 2022-10-12   93  			return -EINVAL;
4a03b2ac06a5bc Youling Tang 2022-10-12   94  		}
d162feec6b6e7e Youling Tang 2025-10-02   95  	}
4a03b2ac06a5bc Youling Tang 2022-10-12   96  
4e62d1d86585e1 Youling Tang 2022-10-12   97  	/* kexec/kdump need a safe page to save reboot_code_buffer */
4a03b2ac06a5bc Youling Tang 2022-10-12   98  	kimage->control_code_page = virt_to_page((void *)KEXEC_CONTROL_CODE);
4a03b2ac06a5bc Youling Tang 2022-10-12   99  
4a03b2ac06a5bc Youling Tang 2022-10-12  100  	reboot_code_buffer = (unsigned long)page_address(kimage->control_code_page);
4a03b2ac06a5bc Youling Tang 2022-10-12  101  	memcpy((void *)reboot_code_buffer, relocate_new_kernel, relocate_new_kernel_size);
4a03b2ac06a5bc Youling Tang 2022-10-12  102  

:::::: The code at line 84 was first introduced by commit
:::::: 4a03b2ac06a5bcae29371866d9d11f5bfd4c9188 LoongArch: Add kexec support

:::::: TO: Youling Tang <tangyouling@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
