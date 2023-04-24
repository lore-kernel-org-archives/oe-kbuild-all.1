Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3F77C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 01:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682299540; x=1713835540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3axgw2J1gHxl/15L+2cm8QuTXaNuO7PuPiJN8JICu/c=;
  b=iJD9x4Sdi5s6HKKvfDELhNoNZC+y2+UeAfyucotQqA8l/2OX6TqGghl4
   b3pbzMpjoXC+yh6UGYzKCBG07Yg4D/9MppzUUptM+7MGS0778Vni8PW9c
   94L5NWnrxvr9K8QONwssEBIeXoTpDxVTI/3RNzYZeKxbrZ3CGBz5P9lGy
   8FC0fMKSdxE/6X7OGfDf6bga9Fht5YIl0QpT4lhEFV0uMn05FvOuoYnWQ
   O+S/xvXbeKbW9AgsK9LgCsreoYpR2eHPJ13MiX1Nxw+q0eKgVU/WKB7af
   2DN9mniLqsRnGPhHULdTdvT1GrCreO4j8sNiv25PTsvXDNDHDqIbPuhcT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="348244515"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="348244515"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 18:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="817072784"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="817072784"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Apr 2023 18:25:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqkxU-000iCK-32;
	Mon, 24 Apr 2023 01:25:36 +0000
Date: Mon, 24 Apr 2023 09:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lino Sanfilippo <l.sanfilippo@kunbus.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tis-irq 70/75] vmlinux.o: warning: objtool:
 tpm_tis+0x50: data relocation to !ENDBR: tpm_tis_request_locality+0x0
Message-ID: <202304240933.EdF6cE5e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tis-irq
head:   6cea73a6f10e7c9d07f77bb894d6aa4a29ed7bd8
commit: c211567f78eb2c1f823cbf843460c4231c7c9632 [70/75] tpm, tpm: Implement usage counter for locality
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230424/202304240933.EdF6cE5e-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=c211567f78eb2c1f823cbf843460c4231c7c9632
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tis-irq
        git checkout c211567f78eb2c1f823cbf843460c4231c7c9632
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240933.EdF6cE5e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: zero_fops+0x28: data relocation to !ENDBR: write_iter_null+0x0
   vmlinux.o: warning: objtool: zero_fops+0x60: data relocation to !ENDBR: mmap_zero+0x0
   vmlinux.o: warning: objtool: zero_fops+0xa8: data relocation to !ENDBR: get_unmapped_area_zero+0x0
   vmlinux.o: warning: objtool: port_fops+0x8: data relocation to !ENDBR: memory_lseek+0x0
   vmlinux.o: warning: objtool: port_fops+0x10: data relocation to !ENDBR: read_port+0x0
   vmlinux.o: warning: objtool: port_fops+0x18: data relocation to !ENDBR: write_port+0x0
   vmlinux.o: warning: objtool: port_fops+0x70: data relocation to !ENDBR: open_port+0x0
   vmlinux.o: warning: objtool: null_fops+0x8: data relocation to !ENDBR: null_lseek+0x0
   vmlinux.o: warning: objtool: null_fops+0x10: data relocation to !ENDBR: read_null+0x0
   vmlinux.o: warning: objtool: null_fops+0x18: data relocation to !ENDBR: write_null+0x0
   vmlinux.o: warning: objtool: null_fops+0x20: data relocation to !ENDBR: read_iter_null+0x0
   vmlinux.o: warning: objtool: null_fops+0x28: data relocation to !ENDBR: write_iter_null+0x0
   vmlinux.o: warning: objtool: null_fops+0xc0: data relocation to !ENDBR: splice_write_null+0x0
   vmlinux.o: warning: objtool: null_fops+0x100: data relocation to !ENDBR: uring_cmd_null+0x0
   vmlinux.o: warning: objtool: mem_fops+0x8: data relocation to !ENDBR: memory_lseek+0x0
   vmlinux.o: warning: objtool: mem_fops+0x10: data relocation to !ENDBR: read_mem+0x0
   vmlinux.o: warning: objtool: mem_fops+0x18: data relocation to !ENDBR: write_mem+0x0
   vmlinux.o: warning: objtool: mem_fops+0x60: data relocation to !ENDBR: mmap_mem+0x0
   vmlinux.o: warning: objtool: mem_fops+0x70: data relocation to !ENDBR: open_port+0x0
   vmlinux.o: warning: objtool: mmap_mem_ops+0x58: data relocation to !ENDBR: generic_access_phys+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x8: data relocation to !ENDBR: noop_llseek+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x20: data relocation to !ENDBR: urandom_read_iter+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x28: data relocation to !ENDBR: random_write_iter+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x50: data relocation to !ENDBR: random_ioctl+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x58: data relocation to !ENDBR: compat_ptr_ioctl+0x0
   vmlinux.o: warning: objtool: urandom_fops+0x90: data relocation to !ENDBR: random_fasync+0x0
   vmlinux.o: warning: objtool: urandom_fops+0xc0: data relocation to !ENDBR: iter_file_splice_write+0x0
   vmlinux.o: warning: objtool: urandom_fops+0xc8: data relocation to !ENDBR: generic_file_splice_read+0x0
   vmlinux.o: warning: objtool: random_fops+0x8: data relocation to !ENDBR: noop_llseek+0x0
   vmlinux.o: warning: objtool: random_fops+0x20: data relocation to !ENDBR: random_read_iter+0x0
   vmlinux.o: warning: objtool: random_fops+0x28: data relocation to !ENDBR: random_write_iter+0x0
   vmlinux.o: warning: objtool: random_fops+0x48: data relocation to !ENDBR: random_poll+0x0
   vmlinux.o: warning: objtool: random_fops+0x50: data relocation to !ENDBR: random_ioctl+0x0
   vmlinux.o: warning: objtool: random_fops+0x58: data relocation to !ENDBR: compat_ptr_ioctl+0x0
   vmlinux.o: warning: objtool: random_fops+0x90: data relocation to !ENDBR: random_fasync+0x0
   vmlinux.o: warning: objtool: random_fops+0xc0: data relocation to !ENDBR: iter_file_splice_write+0x0
   vmlinux.o: warning: objtool: random_fops+0xc8: data relocation to !ENDBR: generic_file_splice_read+0x0
   vmlinux.o: warning: objtool: misc_fops+0x8: data relocation to !ENDBR: noop_llseek+0x0
   vmlinux.o: warning: objtool: misc_fops+0x70: data relocation to !ENDBR: misc_open+0x0
   vmlinux.o: warning: objtool: misc_seq_ops+0x0: data relocation to !ENDBR: misc_seq_start+0x0
   vmlinux.o: warning: objtool: misc_seq_ops+0x8: data relocation to !ENDBR: misc_seq_stop+0x0
   vmlinux.o: warning: objtool: misc_seq_ops+0x10: data relocation to !ENDBR: misc_seq_next+0x0
   vmlinux.o: warning: objtool: misc_seq_ops+0x18: data relocation to !ENDBR: misc_seq_show+0x0
   vmlinux.o: warning: objtool: hpet_fops+0x10: data relocation to !ENDBR: hpet_read+0x0
   vmlinux.o: warning: objtool: hpet_fops+0x48: data relocation to !ENDBR: hpet_poll+0x0
   vmlinux.o: warning: objtool: hpet_fops+0x50: data relocation to !ENDBR: hpet_ioctl+0x0
   vmlinux.o: warning: objtool: hpet_fops+0x58: data relocation to !ENDBR: hpet_compat_ioctl+0x0
   vmlinux.o: warning: objtool: hpet_fops+0x60: data relocation to !ENDBR: hpet_mmap+0x0
   vmlinux.o: warning: objtool: hpet_fops+0x70: data relocation to !ENDBR: hpet_open+0x0
   vmlinux.o: warning: objtool: hpet_fops+0x80: data relocation to !ENDBR: hpet_release+0x0
   vmlinux.o: warning: objtool: hpet_fops+0x90: data relocation to !ENDBR: hpet_fasync+0x0
   vmlinux.o: warning: objtool: nvram_misc_fops+0x8: data relocation to !ENDBR: nvram_misc_llseek+0x0
   vmlinux.o: warning: objtool: nvram_misc_fops+0x10: data relocation to !ENDBR: nvram_misc_read+0x0
   vmlinux.o: warning: objtool: nvram_misc_fops+0x18: data relocation to !ENDBR: nvram_misc_write+0x0
   vmlinux.o: warning: objtool: nvram_misc_fops+0x50: data relocation to !ENDBR: nvram_misc_ioctl+0x0
   vmlinux.o: warning: objtool: nvram_misc_fops+0x70: data relocation to !ENDBR: nvram_misc_open+0x0
   vmlinux.o: warning: objtool: nvram_misc_fops+0x80: data relocation to !ENDBR: nvram_misc_release+0x0
   vmlinux.o: warning: objtool: arch_nvram_ops+0x0: data relocation to !ENDBR: pc_nvram_get_size+0x0
   vmlinux.o: warning: objtool: arch_nvram_ops+0x8: data relocation to !ENDBR: pc_nvram_read_byte+0x0
   vmlinux.o: warning: objtool: arch_nvram_ops+0x10: data relocation to !ENDBR: pc_nvram_write_byte+0x0
   vmlinux.o: warning: objtool: arch_nvram_ops+0x18: data relocation to !ENDBR: pc_nvram_read+0x0
   vmlinux.o: warning: objtool: arch_nvram_ops+0x20: data relocation to !ENDBR: pc_nvram_write+0x0
   vmlinux.o: warning: objtool: arch_nvram_ops+0x28: data relocation to !ENDBR: pc_nvram_initialize+0x0
   vmlinux.o: warning: objtool: arch_nvram_ops+0x30: data relocation to !ENDBR: pc_nvram_set_checksum+0x0
   vmlinux.o: warning: objtool: rng_chrdev_ops+0x8: data relocation to !ENDBR: noop_llseek+0x0
   vmlinux.o: warning: objtool: rng_chrdev_ops+0x10: data relocation to !ENDBR: rng_dev_read+0x0
   vmlinux.o: warning: objtool: rng_chrdev_ops+0x70: data relocation to !ENDBR: rng_dev_open+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x10: data relocation to !ENDBR: tpm_common_read+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x18: data relocation to !ENDBR: tpm_common_write+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x48: data relocation to !ENDBR: tpm_common_poll+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x70: data relocation to !ENDBR: tpm_open+0x0
   vmlinux.o: warning: objtool: tpm_fops+0x80: data relocation to !ENDBR: tpm_release+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x10: data relocation to !ENDBR: tpm_common_read+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x18: data relocation to !ENDBR: tpm_common_write+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x48: data relocation to !ENDBR: tpm_common_poll+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x70: data relocation to !ENDBR: tpmrm_open+0x0
   vmlinux.o: warning: objtool: tpmrm_fops+0x80: data relocation to !ENDBR: tpmrm_release+0x0
   vmlinux.o: warning: objtool: tpm_bios_measurements_ops+0x8: data relocation to !ENDBR: seq_lseek+0x0
   vmlinux.o: warning: objtool: tpm_bios_measurements_ops+0x10: data relocation to !ENDBR: seq_read+0x0
   vmlinux.o: warning: objtool: tpm_bios_measurements_ops+0x70: data relocation to !ENDBR: tpm_bios_measurements_open+0x0
   vmlinux.o: warning: objtool: tpm_bios_measurements_ops+0x80: data relocation to !ENDBR: tpm_bios_measurements_release+0x0
   vmlinux.o: warning: objtool: tpm1_binary_b_measurements_seqops+0x0: data relocation to !ENDBR: tpm1_bios_measurements_start+0x0
   vmlinux.o: warning: objtool: tpm1_binary_b_measurements_seqops+0x8: data relocation to !ENDBR: tpm1_bios_measurements_stop+0x0
   vmlinux.o: warning: objtool: tpm1_binary_b_measurements_seqops+0x10: data relocation to !ENDBR: tpm1_bios_measurements_next+0x0
   vmlinux.o: warning: objtool: tpm1_binary_b_measurements_seqops+0x18: data relocation to !ENDBR: tpm1_binary_bios_measurements_show+0x0
   vmlinux.o: warning: objtool: tpm1_ascii_b_measurements_seqops+0x0: data relocation to !ENDBR: tpm1_bios_measurements_start+0x0
   vmlinux.o: warning: objtool: tpm1_ascii_b_measurements_seqops+0x8: data relocation to !ENDBR: tpm1_bios_measurements_stop+0x0
   vmlinux.o: warning: objtool: tpm1_ascii_b_measurements_seqops+0x10: data relocation to !ENDBR: tpm1_bios_measurements_next+0x0
   vmlinux.o: warning: objtool: tpm1_ascii_b_measurements_seqops+0x18: data relocation to !ENDBR: tpm1_ascii_bios_measurements_show+0x0
   vmlinux.o: warning: objtool: tpm2_binary_b_measurements_seqops+0x0: data relocation to !ENDBR: tpm2_bios_measurements_start+0x0
   vmlinux.o: warning: objtool: tpm2_binary_b_measurements_seqops+0x8: data relocation to !ENDBR: tpm2_bios_measurements_stop+0x0
   vmlinux.o: warning: objtool: tpm2_binary_b_measurements_seqops+0x10: data relocation to !ENDBR: tpm2_bios_measurements_next+0x0
   vmlinux.o: warning: objtool: tpm2_binary_b_measurements_seqops+0x18: data relocation to !ENDBR: tpm2_binary_bios_measurements_show+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x8: data relocation to !ENDBR: tpm_tis_req_canceled+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x10: data relocation to !ENDBR: tpm_tis_recv+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x18: data relocation to !ENDBR: tpm_tis_send+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x20: data relocation to !ENDBR: tpm_tis_ready+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x28: data relocation to !ENDBR: tpm_tis_status+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x30: data relocation to !ENDBR: tpm_tis_update_timeouts+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x38: data relocation to !ENDBR: tpm_tis_update_durations+0x0
>> vmlinux.o: warning: objtool: tpm_tis+0x50: data relocation to !ENDBR: tpm_tis_request_locality+0x0
>> vmlinux.o: warning: objtool: tpm_tis+0x58: data relocation to !ENDBR: tpm_tis_relinquish_locality+0x0
   vmlinux.o: warning: objtool: tpm_tis+0x60: data relocation to !ENDBR: tpm_tis_clkrun_enable+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x10: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x18: data relocation to !ENDBR: tpm_tis_resume+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x20: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x28: data relocation to !ENDBR: tpm_tis_resume+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x30: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: tpm_tis_pm+0x38: data relocation to !ENDBR: tpm_tis_resume+0x0
   vmlinux.o: warning: objtool: tpm_tcg+0x0: data relocation to !ENDBR: tpm_tcg_read_bytes+0x0
   vmlinux.o: warning: objtool: tpm_tcg+0x8: data relocation to !ENDBR: tpm_tcg_write_bytes+0x0
   vmlinux.o: warning: objtool: tpm_tis_dmi_table+0x0: data relocation to !ENDBR: tpm_tis_disable_irq+0x0
   vmlinux.o: warning: objtool: crb_pm+0x10: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: crb_pm+0x18: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: crb_pm+0x20: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: crb_pm+0x28: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: crb_pm+0x30: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: crb_pm+0x38: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: tpm_crb+0x8: data relocation to !ENDBR: crb_req_canceled+0x0
   vmlinux.o: warning: objtool: tpm_crb+0x10: data relocation to !ENDBR: crb_recv+0x0
   vmlinux.o: warning: objtool: tpm_crb+0x18: data relocation to !ENDBR: crb_send+0x0
   vmlinux.o: warning: objtool: tpm_crb+0x20: data relocation to !ENDBR: crb_cancel+0x0
   vmlinux.o: warning: objtool: tpm_crb+0x28: data relocation to !ENDBR: crb_status+0x0
   vmlinux.o: warning: objtool: tpm_crb+0x40: data relocation to !ENDBR: crb_go_idle+0x0
   vmlinux.o: warning: objtool: tpm_crb+0x48: data relocation to !ENDBR: crb_cmd_ready+0x0
   vmlinux.o: warning: objtool: tpm_crb+0x50: data relocation to !ENDBR: crb_request_locality+0x0
   vmlinux.o: warning: objtool: tpm_crb+0x58: data relocation to !ENDBR: crb_relinquish_locality+0x0
   vmlinux.o: warning: objtool: __compound_literal.1+0x0: data relocation to !ENDBR: intel_iommu_attach_device+0x0
   vmlinux.o: warning: objtool: __compound_literal.1+0x18: data relocation to !ENDBR: intel_iommu_map_pages+0x0
   vmlinux.o: warning: objtool: __compound_literal.1+0x28: data relocation to !ENDBR: intel_iommu_unmap_pages+0x0
   vmlinux.o: warning: objtool: __compound_literal.1+0x30: data relocation to !ENDBR: intel_flush_iotlb_all+0x0
   vmlinux.o: warning: objtool: __compound_literal.1+0x38: data relocation to !ENDBR: intel_iommu_iotlb_sync_map+0x0
   vmlinux.o: warning: objtool: __compound_literal.1+0x40: data relocation to !ENDBR: intel_iommu_tlb_sync+0x0
   vmlinux.o: warning: objtool: __compound_literal.1+0x48: data relocation to !ENDBR: intel_iommu_iova_to_phys+0x0
   vmlinux.o: warning: objtool: __compound_literal.1+0x50: data relocation to !ENDBR: intel_iommu_enforce_cache_coherency+0x0
   vmlinux.o: warning: objtool: __compound_literal.1+0x68: data relocation to !ENDBR: intel_iommu_domain_free+0x0
   vmlinux.o: warning: objtool: __compound_literal.0+0x0: data relocation to !ENDBR: blocking_domain_attach_dev+0x0
   vmlinux.o: warning: objtool: __compound_literal.0+0x68: data relocation to !ENDBR: intel_iommu_domain_free+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x0: data relocation to !ENDBR: intel_iommu_capable+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x8: data relocation to !ENDBR: intel_iommu_domain_alloc+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x10: data relocation to !ENDBR: intel_iommu_probe_device+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x18: data relocation to !ENDBR: intel_iommu_release_device+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x20: data relocation to !ENDBR: intel_iommu_probe_finalize+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x30: data relocation to !ENDBR: intel_iommu_device_group+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x38: data relocation to !ENDBR: intel_iommu_get_resv_regions+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x48: data relocation to !ENDBR: intel_iommu_is_attach_deferred+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x50: data relocation to !ENDBR: intel_iommu_dev_enable_feat+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x58: data relocation to !ENDBR: intel_iommu_dev_disable_feat+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x60: data relocation to !ENDBR: intel_svm_page_response+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x68: data relocation to !ENDBR: device_def_domain_type+0x0
   vmlinux.o: warning: objtool: intel_iommu_ops+0x70: data relocation to !ENDBR: intel_iommu_remove_dev_pasid+0x0
   vmlinux.o: warning: objtool: intel_svm_domain_ops+0x8: data relocation to !ENDBR: intel_svm_set_dev_pasid+0x0
   vmlinux.o: warning: objtool: intel_svm_domain_ops+0x68: data relocation to !ENDBR: intel_svm_domain_free+0x0
   vmlinux.o: warning: objtool: intel_mmuops+0x0: data relocation to !ENDBR: intel_mm_release+0x0
   vmlinux.o: warning: objtool: intel_mmuops+0x38: data relocation to !ENDBR: intel_invalidate_range+0x0
   vmlinux.o: warning: objtool: virt_dmar_msi_parent_ops+0x10: data relocation to !ENDBR: msi_parent_init_dev_msi_info+0x0
   vmlinux.o: warning: objtool: dmar_msi_parent_ops+0x10: data relocation to !ENDBR: msi_parent_init_dev_msi_info+0x0
   vmlinux.o: warning: objtool: intel_ir_domain_ops+0x8: data relocation to !ENDBR: intel_irq_remapping_select+0x0
   vmlinux.o: warning: objtool: intel_ir_domain_ops+0x28: data relocation to !ENDBR: intel_irq_remapping_alloc+0x0
   vmlinux.o: warning: objtool: intel_ir_domain_ops+0x30: data relocation to !ENDBR: intel_irq_remapping_free+0x0
   vmlinux.o: warning: objtool: intel_ir_domain_ops+0x38: data relocation to !ENDBR: intel_irq_remapping_activate+0x0
   vmlinux.o: warning: objtool: intel_ir_domain_ops+0x40: data relocation to !ENDBR: intel_irq_remapping_deactivate+0x0
   vmlinux.o: warning: objtool: iommu_group_sysfs_ops+0x0: data relocation to !ENDBR: iommu_group_attr_show+0x0
   vmlinux.o: warning: objtool: iommu_group_sysfs_ops+0x8: data relocation to !ENDBR: iommu_group_attr_store+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x8: data relocation to !ENDBR: iommu_dma_alloc+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x10: data relocation to !ENDBR: iommu_dma_free+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x18: data relocation to !ENDBR: dma_common_alloc_pages+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x20: data relocation to !ENDBR: dma_common_free_pages+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x28: data relocation to !ENDBR: iommu_dma_alloc_noncontiguous+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x30: data relocation to !ENDBR: iommu_dma_free_noncontiguous+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x38: data relocation to !ENDBR: iommu_dma_mmap+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x40: data relocation to !ENDBR: iommu_dma_get_sgtable+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x48: data relocation to !ENDBR: iommu_dma_map_page+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x50: data relocation to !ENDBR: iommu_dma_unmap_page+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x58: data relocation to !ENDBR: iommu_dma_map_sg+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x60: data relocation to !ENDBR: iommu_dma_unmap_sg+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x68: data relocation to !ENDBR: iommu_dma_map_resource+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x70: data relocation to !ENDBR: iommu_dma_unmap_resource+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x78: data relocation to !ENDBR: iommu_dma_sync_single_for_cpu+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x80: data relocation to !ENDBR: iommu_dma_sync_single_for_device+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x88: data relocation to !ENDBR: iommu_dma_sync_sg_for_cpu+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0x90: data relocation to !ENDBR: iommu_dma_sync_sg_for_device+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0xb8: data relocation to !ENDBR: iommu_dma_opt_mapping_size+0x0
   vmlinux.o: warning: objtool: iommu_dma_ops+0xc0: data relocation to !ENDBR: iommu_dma_get_merge_boundary+0x0
   vmlinux.o: warning: objtool: hyperv_root_ir_domain_ops+0x8: data relocation to !ENDBR: hyperv_irq_remapping_select+0x0
   vmlinux.o: warning: objtool: hyperv_root_ir_domain_ops+0x28: data relocation to !ENDBR: hyperv_root_irq_remapping_alloc+0x0
   vmlinux.o: warning: objtool: hyperv_root_ir_domain_ops+0x30: data relocation to !ENDBR: hyperv_root_irq_remapping_free+0x0
   vmlinux.o: warning: objtool: hyperv_ir_domain_ops+0x8: data relocation to !ENDBR: hyperv_irq_remapping_select+0x0
   vmlinux.o: warning: objtool: hyperv_ir_domain_ops+0x28: data relocation to !ENDBR: hyperv_irq_remapping_alloc+0x0
   vmlinux.o: warning: objtool: hyperv_ir_domain_ops+0x30: data relocation to !ENDBR: hyperv_irq_remapping_free+0x0
   vmlinux.o: warning: objtool: mipi_dsi_device_type+0x20: data relocation to !ENDBR: mipi_dsi_dev_release+0x0
   vmlinux.o: warning: objtool: mipi_dsi_device_pm_ops+0x10: data relocation to !ENDBR: pm_generic_suspend+0x0
   vmlinux.o: warning: objtool: mipi_dsi_device_pm_ops+0x18: data relocation to !ENDBR: pm_generic_resume+0x0
   vmlinux.o: warning: objtool: mipi_dsi_device_pm_ops+0x20: data relocation to !ENDBR: pm_generic_freeze+0x0
   vmlinux.o: warning: objtool: mipi_dsi_device_pm_ops+0x28: data relocation to !ENDBR: pm_generic_thaw+0x0
   vmlinux.o: warning: objtool: mipi_dsi_device_pm_ops+0x30: data relocation to !ENDBR: pm_generic_poweroff+0x0
   vmlinux.o: warning: objtool: mipi_dsi_device_pm_ops+0x38: data relocation to !ENDBR: pm_generic_restore+0x0
   vmlinux.o: warning: objtool: mipi_dsi_device_pm_ops+0xa0: data relocation to !ENDBR: pm_generic_runtime_suspend+0x0
   vmlinux.o: warning: objtool: mipi_dsi_device_pm_ops+0xa8: data relocation to !ENDBR: pm_generic_runtime_resume+0x0
   vmlinux.o: warning: objtool: vga_switcheroo_debugfs_fops+0x8: data relocation to !ENDBR: seq_lseek+0x0
   vmlinux.o: warning: objtool: vga_switcheroo_debugfs_fops+0x10: data relocation to !ENDBR: seq_read+0x0
   vmlinux.o: warning: objtool: vga_switcheroo_debugfs_fops+0x18: data relocation to !ENDBR: vga_switcheroo_debugfs_write+0x0


objdump-func vmlinux.o tpm_tis:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
