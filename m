Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2100930E0F5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777968831; cv=none; b=VeO3ikH+L9u7m4520hh5gxUIIdspCtzG4wUn+mQsQvmvZe/RHTCf8p3b0FqLh2q4+UObp69NjOtw92po0qaGna6WehRz/rW1/fUBMwuqwnL7ZxLuoaIliRkOSW22x4Nv74hulsB451Ex25vhFBjHu7KMo5sBbzEnQgZbzYRzSQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777968831; c=relaxed/simple;
	bh=OWeFFwPCrs5wvo3sseQNdAvfzt3t/rdyTCc1i/SqpSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tLoOhyoz0va6DA+XZPKv2ZtQUssGPX5se/BhEJA3m1LA8nRvgVPkfpQxuNfJA6AV9WoYlGPhOJOOiX6RnT0rFwIJ9/gyQJrCIqRAsHPVgAUlgkpDs5X/vT2Yzz/OpYQIWSotAG0ox5j/I41GplR0ZhX5L4PXUiWObc54H0XjI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bB14HmuP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bB14HmuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777968830; x=1809504830;
  h=date:from:to:cc:subject:message-id;
  bh=OWeFFwPCrs5wvo3sseQNdAvfzt3t/rdyTCc1i/SqpSQ=;
  b=bB14HmuPQqz097sRmNjRVJI0dJFlWKBqMnIcMQhEk5enWyJ8neVfBCcs
   rpT9B0p8I5UxK3YbecqUxgBsNvZclac5MEgOFNsCaLj/Da16x4HbxP21H
   NMkZWwX133x2gPZLXQkRY96AlpIwx6JM8xmoTVrmGKeYXBAqy2tyYDqv4
   uaJpBvImrA+juzIYKf6J+nswpMRFCSQ3nNndBrVPqX4AQHim0jIatLw58
   8NcSNyMespRJG8D9X3T0p8ej2sRpSMYopZ+0PPKbFhaMDmjFh/PF6M7mR
   9f9Vt7KPtn0Nf+jeSqETan/H8No1OQLsLJjMHOADqpyAACUUWyjujYW+3
   w==;
X-CSE-ConnectionGUID: z5dKKaYzSFyGtmAqdFYHHA==
X-CSE-MsgGUID: NPWPyHtYTTe0CJM1aOuUlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78882500"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78882500"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:13:49 -0700
X-CSE-ConnectionGUID: J0Bsw74DQx6odZ3OmT7u+A==
X-CSE-MsgGUID: 7f0+dVjWSnKMkpAIbd4rEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="237522221"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2026 01:13:48 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKAuX-000000004NV-18WS;
	Tue, 05 May 2026 08:13:45 +0000
Date: Tue, 05 May 2026 16:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/machine_kexec.c:84:51: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202605051639.aEPioXdD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: d162feec6b6e7ed97986118450812fdd7e9ba202 LoongArch: Add preparatory infrastructure for kexec_file
date:   7 months ago
config: loongarch-randconfig-r122-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051639.aEPioXdD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051639.aEPioXdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d162feec6b6e ("LoongArch: Add preparatory infrastructure for kexec_file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051639.aEPioXdD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/machine_kexec.c:84:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char const * @@     got char [noderef] __user * @@
   arch/loongarch/kernel/machine_kexec.c:84:51: sparse:     expected char const *
   arch/loongarch/kernel/machine_kexec.c:84:51: sparse:     got char [noderef] __user *

vim +84 arch/loongarch/kernel/machine_kexec.c

4a03b2ac06a5bca Youling Tang 2022-10-12   61  
4a03b2ac06a5bca Youling Tang 2022-10-12   62  int machine_kexec_prepare(struct kimage *kimage)
4a03b2ac06a5bca Youling Tang 2022-10-12   63  {
4a03b2ac06a5bca Youling Tang 2022-10-12   64  	int i;
4a03b2ac06a5bca Youling Tang 2022-10-12   65  	char *bootloader = "kexec";
4a03b2ac06a5bca Youling Tang 2022-10-12   66  	void *cmdline_ptr = (void *)KEXEC_CMDLINE_ADDR;
4a03b2ac06a5bca Youling Tang 2022-10-12   67  
4a03b2ac06a5bca Youling Tang 2022-10-12   68  	kexec_image_info(kimage);
4a03b2ac06a5bca Youling Tang 2022-10-12   69  
4a03b2ac06a5bca Youling Tang 2022-10-12   70  	kimage->arch.efi_boot = fw_arg0;
4a03b2ac06a5bca Youling Tang 2022-10-12   71  	kimage->arch.systable_ptr = fw_arg2;
4a03b2ac06a5bca Youling Tang 2022-10-12   72  
d162feec6b6e7ed Youling Tang 2025-10-02   73  	if (kimage->file_mode == 1) {
d162feec6b6e7ed Youling Tang 2025-10-02   74  		/*
d162feec6b6e7ed Youling Tang 2025-10-02   75  		 * kimage->cmdline_buf will be released in kexec_file_load, so copy
d162feec6b6e7ed Youling Tang 2025-10-02   76  		 * to the KEXEC_CMDLINE_ADDR safe area.
d162feec6b6e7ed Youling Tang 2025-10-02   77  		 */
d162feec6b6e7ed Youling Tang 2025-10-02   78  		memcpy((void *)KEXEC_CMDLINE_ADDR, (void *)kimage->arch.cmdline_ptr,
d162feec6b6e7ed Youling Tang 2025-10-02   79  					strlen((char *)kimage->arch.cmdline_ptr) + 1);
d162feec6b6e7ed Youling Tang 2025-10-02   80  		kimage->arch.cmdline_ptr = (unsigned long)KEXEC_CMDLINE_ADDR;
d162feec6b6e7ed Youling Tang 2025-10-02   81  	} else {
4a03b2ac06a5bca Youling Tang 2022-10-12   82  		/* Find the command line */
4a03b2ac06a5bca Youling Tang 2022-10-12   83  		for (i = 0; i < kimage->nr_segments; i++) {
4a03b2ac06a5bca Youling Tang 2022-10-12  @84  			if (!strncmp(bootloader, (char __user *)kimage->segment[i].buf, strlen(bootloader))) {
4a03b2ac06a5bca Youling Tang 2022-10-12   85  				if (!copy_from_user(cmdline_ptr, kimage->segment[i].buf, COMMAND_LINE_SIZE))
4a03b2ac06a5bca Youling Tang 2022-10-12   86  					kimage->arch.cmdline_ptr = (unsigned long)cmdline_ptr;
4a03b2ac06a5bca Youling Tang 2022-10-12   87  				break;
4a03b2ac06a5bca Youling Tang 2022-10-12   88  			}
4a03b2ac06a5bca Youling Tang 2022-10-12   89  		}
4a03b2ac06a5bca Youling Tang 2022-10-12   90  
4a03b2ac06a5bca Youling Tang 2022-10-12   91  		if (!kimage->arch.cmdline_ptr) {
4a03b2ac06a5bca Youling Tang 2022-10-12   92  			pr_err("Command line not included in the provided image\n");
4a03b2ac06a5bca Youling Tang 2022-10-12   93  			return -EINVAL;
4a03b2ac06a5bca Youling Tang 2022-10-12   94  		}
d162feec6b6e7ed Youling Tang 2025-10-02   95  	}
4a03b2ac06a5bca Youling Tang 2022-10-12   96  
4e62d1d86585e1b Youling Tang 2022-10-12   97  	/* kexec/kdump need a safe page to save reboot_code_buffer */
4a03b2ac06a5bca Youling Tang 2022-10-12   98  	kimage->control_code_page = virt_to_page((void *)KEXEC_CONTROL_CODE);
4a03b2ac06a5bca Youling Tang 2022-10-12   99  
4a03b2ac06a5bca Youling Tang 2022-10-12  100  	reboot_code_buffer = (unsigned long)page_address(kimage->control_code_page);
4a03b2ac06a5bca Youling Tang 2022-10-12  101  	memcpy((void *)reboot_code_buffer, relocate_new_kernel, relocate_new_kernel_size);
4a03b2ac06a5bca Youling Tang 2022-10-12  102  

:::::: The code at line 84 was first introduced by commit
:::::: 4a03b2ac06a5bcae29371866d9d11f5bfd4c9188 LoongArch: Add kexec support

:::::: TO: Youling Tang <tangyouling@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
