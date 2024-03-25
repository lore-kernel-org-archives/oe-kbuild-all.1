Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E21153815
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 06:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711347388; cv=none; b=X9qwC19P18ZbdPTgCPqIC55xWQFSkZYWRGF3VNJHnENj8TzZyHKAsnSDAk0t+FisAfhsHCwGhDRLomw3lJUzz5R/7nO+PvyR8ZvnDX2pmIvX6MN6wr7OMORLxWWmHGF872pYwRP5zM7Vtz6JJGQDd+0LMeb0wVLytfZWlkPvtXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711347388; c=relaxed/simple;
	bh=KbSrVHDZmIBvnqGLP5zKr1st0n3NPNIEO5CdMGD2JRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=itk7P5OaEJKz/q5b6hTiVzvYwkh86xashp02YNu7ULL1v/aFNdFAJcc7DkU4cg2OxDuGxCh2fKnpVKjNperEMBtrVyQhd4ZJI25tgN2D2B9XAGDRjO9jy8U8t70gaIO/Y+Lxex3/QehzOMqhdIdy8f+6hegRu51uJ2LPsGoKBFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QO1CPdn1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QO1CPdn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711347387; x=1742883387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KbSrVHDZmIBvnqGLP5zKr1st0n3NPNIEO5CdMGD2JRM=;
  b=QO1CPdn1A7AOWRUrdofGSxwdMTG3S+pUSRCxPwLGbDI3y2+TpRpHOiQh
   WB0HMQKLczXORkPupjbBXj2KlOFMolSPEcm/vsEjERSXVxyf9jAehRVOs
   /leaIGNnbqsSxpUxOXL4EfN/UVys9ji3GdoCZXgKp4gwz8+TBMStxEm6d
   ab3LJvXks7fxM3mvrfM2AHfYqfgBDxUw54u8LgZo2UOEkHliZO9YngjHO
   78EOwY/2KcVPUngYNCw209Jo4Enf9nwlH6tRTgXFedgTobFeWzfZOlaNH
   /GXptNRt6ohuLgbkrYulgwWqm0InudziJZFwYrmHDVK31DX0vPbbdeuQy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="28807281"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="28807281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="46509651"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Mar 2024 23:16:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rodd8-000MHc-1m;
	Mon, 25 Mar 2024 06:16:22 +0000
Date: Mon, 25 Mar 2024 14:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3892/6859]
 arch/loongarch/kernel/machine_kexec.c:97:12-25: WARNING: casting value
 returned by memory allocation function to (unsigned long *) is useless.
Message-ID: <202403251417.bkjC4PDS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1bf66e081b92a539d54b723c424bb38130f10c11
commit: 3706d0fb92bc3da98bec285ff17ac82405c2d26e [3892/6859] LoongArch: kexec: Add compatibility with old interfaces
config: loongarch-randconfig-r063-20240325 (https://download.01.org/0day-ci/archive/20240325/202403251417.bkjC4PDS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403251417.bkjC4PDS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/machine_kexec.c:97:12-25: WARNING: casting value returned by memory allocation function to (unsigned long *) is useless.

vim +97 arch/loongarch/kernel/machine_kexec.c

    64	
    65	int machine_kexec_prepare(struct kimage *kimage)
    66	{
    67		int i;
    68		char *bootloader = "kexec";
    69		void *cmdline_ptr = (void *)KEXEC_CMDLINE_ADDR;
    70	
    71		kexec_image_info(kimage);
    72	
    73		kimage->arch.efi_boot = fw_arg0;
    74		kimage->arch.systable_ptr = fw_arg2;
    75	
    76		if (!fw_arg2)
    77			pr_err("Small fdt mode is not supported!\n");
    78	
    79		/* Find the command line */
    80		for (i = 0; i < kimage->nr_segments; i++) {
    81			if (!strncmp(bootloader, (char __user *)kimage->segment[i].buf, strlen(bootloader))) {
    82				if (fw_arg0 < 2) {
    83					/* New firmware */
    84					if (!copy_from_user(cmdline_ptr, kimage->segment[i].buf, COMMAND_LINE_SIZE))
    85						kimage->arch.cmdline_ptr = (unsigned long)cmdline_ptr;
    86				} else {
    87					/* Old firmware */
    88					int argc = 0;
    89					long offt;
    90					char *ptr, *str;
    91					unsigned long *argv;
    92	
    93					/*
    94					 * convert command line string to array
    95					 * of parameters (as bootloader does).
    96					 */
  > 97					argv = (unsigned long *)kmalloc(KEXEC_CMDLINE_SIZE, GFP_KERNEL);
    98					argv[argc++] = (unsigned long)(KEXEC_CMDLINE_ADDR + KEXEC_CMDLINE_SIZE/2);
    99					str = (char *)argv + KEXEC_CMDLINE_SIZE/2;
   100	
   101					if (copy_from_user(str, kimage->segment[i].buf, KEXEC_CMDLINE_SIZE/2))
   102						return -EINVAL;
   103	
   104					ptr = strchr(str, ' ');
   105	
   106					while (ptr && (argc < MAX_ARGS)) {
   107						*ptr = '\0';
   108						if (ptr[1] != ' ') {
   109							offt = (long)(ptr - str + 1);
   110							argv[argc++] = (unsigned long)argv + KEXEC_CMDLINE_SIZE/2 + offt;
   111						}
   112						ptr = strchr(ptr + 1, ' ');
   113					}
   114	
   115					kimage->arch.efi_boot = argc;
   116					kimage->arch.cmdline_ptr = (unsigned long)argv;
   117					break;
   118				}
   119				break;
   120			}
   121		}
   122	
   123		if (!kimage->arch.cmdline_ptr) {
   124			pr_err("Command line not included in the provided image\n");
   125			return -EINVAL;
   126		}
   127	
   128		/* kexec/kdump need a safe page to save reboot_code_buffer */
   129		kimage->control_code_page = virt_to_page((void *)KEXEC_CONTROL_CODE);
   130	
   131		reboot_code_buffer = (unsigned long)page_address(kimage->control_code_page);
   132		memcpy((void *)reboot_code_buffer, relocate_new_kernel, relocate_new_kernel_size);
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
