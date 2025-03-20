Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857DD223304
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480212; cv=none; b=jHs3oPDXyYcTHiRzXf/RkTBjaD/iVxBR4uez8KiEJyNNcHbznSxQiSJBxcZNhGpaEqVr+2ksaYHzXjEdSdqzOreh7VzB5/WyjqI1KlJ8Dh2SEX9FLyr5IhXHTg3KkB/IcVC16PM6PsDyQ3hxLQQ+V/2SaTppWhINFjLXt+0l6aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480212; c=relaxed/simple;
	bh=c+msm440IrcPReaa2E0gSk07zWOsPtbcidaRPK2HnV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H2dNycgg4iehw6aBL19tZyUPjUOaU0JQdcA/Bjmv4J36jzIgG4UpizlJDnD7NM7vlOqWjatAibakqEr1zuYQVxPsP2awOhC9Xl0VyGBqeOMwwzrIUWTaSMNpM0I5+PHBtwzk6WE1V2ffM76i4l/VTnLXGik6pI7qT5NXsmT0gP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ok9K6LS/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ok9K6LS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742480210; x=1774016210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+msm440IrcPReaa2E0gSk07zWOsPtbcidaRPK2HnV8=;
  b=Ok9K6LS/Tj5vyyfDUGCheogjoKLQqUzE/IwKL36qz7eUxzluRcA0Mi/w
   14uACF/xR2eojzOkeAVTDdxoua5tGODro7uDBkn2ci21cEXIMYG1XUAnv
   y7gPI3Fvc6eYgCl5gY6OJcZYClIRS4FkVLuleoSJlUym4EIAFfWrxiSLF
   gD3GhTMnCGuCQ0zBvAr2c2ZIAmyMQkylMo9DDaAwlkEgm8oh0shcuK04K
   /kN4vxLBqPAI3a4tq0XohJ6XsifLuVqLnxqQic4128ix2otjEElP8xey4
   b7ud1/+VT42jQNnpRw4YYwafgNvU77VbH8oXfg8LlcUZMXSYnlpCXi879
   A==;
X-CSE-ConnectionGUID: xWaRjfUsTKu01WGSZVfVyQ==
X-CSE-MsgGUID: al5U0qd5Tf+kK7XjT/rF9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43827847"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="43827847"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 07:16:50 -0700
X-CSE-ConnectionGUID: REgbw6zkRDeFemzpAnl4dQ==
X-CSE-MsgGUID: N1Y8iKsHS3qDTOyCZOYLlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="123069601"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Mar 2025 07:16:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvGhS-0000UV-2E;
	Thu, 20 Mar 2025 14:16:46 +0000
Date: Thu, 20 Mar 2025 22:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1]
 drivers/remoteproc/qcom_q6v5_mss.c:1023:41: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202503202241.UKjLw5JU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   7e39477098b50156535c8f910fee50d6dac2a793
commit: 2b5e61da68e880ab77c423b007a4df2f7deac8ab [1/1] remoteproc: qcom_q6v5_mss: map/unmap mpss segments before/after use
config: arm64-randconfig-r123-20250319 (https://download.01.org/0day-ci/archive/20250320/202503202241.UKjLw5JU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250320/202503202241.UKjLw5JU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503202241.UKjLw5JU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/qcom_q6v5_mss.c:1008:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1008:21: sparse:     expected void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1008:21: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/qcom_q6v5_mss.c:1023:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1023:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/qcom_q6v5_mss.c:1023:41: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1034:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1034:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/qcom_q6v5_mss.c:1034:41: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1047:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1047:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/qcom_q6v5_mss.c:1047:25: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1103:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1103:21: sparse:     expected void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1103:21: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/qcom_q6v5_mss.c:1107:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1107:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/qcom_q6v5_mss.c:1107:25: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1393:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mba_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1393:27: sparse:     expected void *mba_region
   drivers/remoteproc/qcom_q6v5_mss.c:1393:27: sparse:     got void [noderef] __iomem *

vim +1023 drivers/remoteproc/qcom_q6v5_mss.c

   923	
   924	static int q6v5_mpss_load(struct q6v5 *qproc)
   925	{
   926		const struct elf32_phdr *phdrs;
   927		const struct elf32_phdr *phdr;
   928		const struct firmware *seg_fw;
   929		const struct firmware *fw;
   930		struct elf32_hdr *ehdr;
   931		phys_addr_t mpss_reloc;
   932		phys_addr_t boot_addr;
   933		phys_addr_t min_addr = PHYS_ADDR_MAX;
   934		phys_addr_t max_addr = 0;
   935		bool relocate = false;
   936		char *fw_name;
   937		size_t fw_name_len;
   938		ssize_t offset;
   939		size_t size = 0;
   940		void *ptr;
   941		int ret;
   942		int i;
   943	
   944		fw_name_len = strlen(qproc->hexagon_mdt_image);
   945		if (fw_name_len <= 4)
   946			return -EINVAL;
   947	
   948		fw_name = kstrdup(qproc->hexagon_mdt_image, GFP_KERNEL);
   949		if (!fw_name)
   950			return -ENOMEM;
   951	
   952		ret = request_firmware(&fw, fw_name, qproc->dev);
   953		if (ret < 0) {
   954			dev_err(qproc->dev, "unable to load %s\n", fw_name);
   955			goto out;
   956		}
   957	
   958		/* Initialize the RMB validator */
   959		writel(0, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
   960	
   961		ret = q6v5_mpss_init_image(qproc, fw);
   962		if (ret)
   963			goto release_firmware;
   964	
   965		ehdr = (struct elf32_hdr *)fw->data;
   966		phdrs = (struct elf32_phdr *)(ehdr + 1);
   967	
   968		for (i = 0; i < ehdr->e_phnum; i++) {
   969			phdr = &phdrs[i];
   970	
   971			if (!q6v5_phdr_valid(phdr))
   972				continue;
   973	
   974			if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
   975				relocate = true;
   976	
   977			if (phdr->p_paddr < min_addr)
   978				min_addr = phdr->p_paddr;
   979	
   980			if (phdr->p_paddr + phdr->p_memsz > max_addr)
   981				max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
   982		}
   983	
   984		/**
   985		 * In case of a modem subsystem restart on secure devices, the modem
   986		 * memory can be reclaimed only after MBA is loaded. For modem cold
   987		 * boot this will be a nop
   988		 */
   989		q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
   990					qproc->mpss_phys, qproc->mpss_size);
   991	
   992		mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
   993		qproc->mpss_reloc = mpss_reloc;
   994		/* Load firmware segments */
   995		for (i = 0; i < ehdr->e_phnum; i++) {
   996			phdr = &phdrs[i];
   997	
   998			if (!q6v5_phdr_valid(phdr))
   999				continue;
  1000	
  1001			offset = phdr->p_paddr - mpss_reloc;
  1002			if (offset < 0 || offset + phdr->p_memsz > qproc->mpss_size) {
  1003				dev_err(qproc->dev, "segment outside memory range\n");
  1004				ret = -EINVAL;
  1005				goto release_firmware;
  1006			}
  1007	
  1008			ptr = ioremap_wc(qproc->mpss_phys + offset, phdr->p_memsz);
  1009			if (!ptr) {
  1010				dev_err(qproc->dev,
  1011					"unable to map memory region: %pa+%zx-%x\n",
  1012					&qproc->mpss_phys, offset, phdr->p_memsz);
  1013				goto release_firmware;
  1014			}
  1015	
  1016			if (phdr->p_filesz && phdr->p_offset < fw->size) {
  1017				/* Firmware is large enough to be non-split */
  1018				if (phdr->p_offset + phdr->p_filesz > fw->size) {
  1019					dev_err(qproc->dev,
  1020						"failed to load segment %d from truncated file %s\n",
  1021						i, fw_name);
  1022					ret = -EINVAL;
> 1023					iounmap(ptr);
  1024					goto release_firmware;
  1025				}
  1026	
  1027				memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
  1028			} else if (phdr->p_filesz) {
  1029				/* Replace "xxx.xxx" with "xxx.bxx" */
  1030				sprintf(fw_name + fw_name_len - 3, "b%02d", i);
  1031				ret = request_firmware(&seg_fw, fw_name, qproc->dev);
  1032				if (ret) {
  1033					dev_err(qproc->dev, "failed to load %s\n", fw_name);
  1034					iounmap(ptr);
  1035					goto release_firmware;
  1036				}
  1037	
  1038				memcpy(ptr, seg_fw->data, seg_fw->size);
  1039	
  1040				release_firmware(seg_fw);
  1041			}
  1042	
  1043			if (phdr->p_memsz > phdr->p_filesz) {
  1044				memset(ptr + phdr->p_filesz, 0,
  1045				       phdr->p_memsz - phdr->p_filesz);
  1046			}
  1047			iounmap(ptr);
  1048			size += phdr->p_memsz;
  1049		}
  1050	
  1051		/* Transfer ownership of modem ddr region to q6 */
  1052		ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true,
  1053					      qproc->mpss_phys, qproc->mpss_size);
  1054		if (ret) {
  1055			dev_err(qproc->dev,
  1056				"assigning Q6 access to mpss memory failed: %d\n", ret);
  1057			ret = -EAGAIN;
  1058			goto release_firmware;
  1059		}
  1060	
  1061		boot_addr = relocate ? qproc->mpss_phys : min_addr;
  1062		writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
  1063		writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
  1064		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
  1065	
  1066		ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
  1067		if (ret == -ETIMEDOUT)
  1068			dev_err(qproc->dev, "MPSS authentication timed out\n");
  1069		else if (ret < 0)
  1070			dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
  1071	
  1072	release_firmware:
  1073		release_firmware(fw);
  1074	out:
  1075		kfree(fw_name);
  1076	
  1077		return ret < 0 ? ret : 0;
  1078	}
  1079	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
