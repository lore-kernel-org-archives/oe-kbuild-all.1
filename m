Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA252641CA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 20:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739307487; cv=none; b=Nh206fVbLaFICyuCiveuZ4UfWpGrcMs+Wle9pcZbStk9Cj3M/FxHY21vGq27Xkfmz3W4vGuzGidyBNSxslD7YcG1+YOZDJh5uKO5LrFdqUf+6hrLSkhSudxdhiodDtnI9wZLnyU3LTnlW7K64BS7HRENJ14az76j7XPSoZ0jSbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739307487; c=relaxed/simple;
	bh=64T7V6qkMdZoNlA/cGRpMMotEd709Z0lcRq7CXtyiRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRyQqiz25+WQkO9ZFkEhYYkJEBMqUZMY+s8XlAGHhDnWITUrmq1UuUOcIBeLmFIw6pub1OfJMDrZkHBv4OKrtAMcaaEDAtoXgJAKEYYnMyZTLt3mzoGU9dxJfCAGdLJI4agZfdJSM+RP9zmvjrw957/Qoen9PAK4ubXebeW7SYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzJLP0cM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzJLP0cM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739307486; x=1770843486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=64T7V6qkMdZoNlA/cGRpMMotEd709Z0lcRq7CXtyiRs=;
  b=fzJLP0cMwAlmJKxuv66m65NgxwCHznRLn3EAGUeE9EJfbjtwZg2HYHFu
   mY/7Ewi+e9Oi8TIvr0Z57Ifmx84jav8Owgx7DicLYNwjSjG0gkpaqrtfi
   L2tcLTAV06c0HFJgUFSjcGrXYI1LQup1hz4ercwiluqAJoK6isStbCc48
   Rq/7emuowUNF7RnbMQpRfI4EpFuFatanKMCZ7YgnTiqh01YTSoJdVM5AL
   XEEFQz1AknNDLs8New9D9nEtv8bmPdGmfG4BKo9yrYPAeYQ+VziyxewUO
   OrZrza99sjSP0tdi1g6sBjjb0v8+2xSf1qcgokWpRLyW1oedp1qNN5MwJ
   g==;
X-CSE-ConnectionGUID: eIu/ylWuSO+y1TOZyXZRZg==
X-CSE-MsgGUID: TnYIABvISOyFekxoUBXbRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50582031"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="50582031"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 12:58:05 -0800
X-CSE-ConnectionGUID: zpyNzrhoQwqjAnk4qIeCNQ==
X-CSE-MsgGUID: iSR5GABeRRuuBsBJbCFRUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113512537"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Feb 2025 12:58:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thxKT-0014hf-2B;
	Tue, 11 Feb 2025 20:58:01 +0000
Date: Wed, 12 Feb 2025 04:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 11/11]
 drivers/remoteproc/qcom_q6v5_mss.c:1008:21: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202502120413.i0lMA2Zd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   39762b7a60e9a0f1e5cd736d30163ca936a1ede2
commit: 2b5e61da68e880ab77c423b007a4df2f7deac8ab [11/11] remoteproc: qcom_q6v5_mss: map/unmap mpss segments before/after use
config: arm-randconfig-r131-20250211 (https://download.01.org/0day-ci/archive/20250212/202502120413.i0lMA2Zd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250212/202502120413.i0lMA2Zd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120413.i0lMA2Zd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/qcom_q6v5_mss.c:1008:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1008:21: sparse:     expected void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1008:21: sparse:     got void [noderef] __iomem *
>> drivers/remoteproc/qcom_q6v5_mss.c:1023:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *iomem_cookie @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1023:41: sparse:     expected void volatile [noderef] __iomem *iomem_cookie
   drivers/remoteproc/qcom_q6v5_mss.c:1023:41: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1034:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *iomem_cookie @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1034:41: sparse:     expected void volatile [noderef] __iomem *iomem_cookie
   drivers/remoteproc/qcom_q6v5_mss.c:1034:41: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1047:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *iomem_cookie @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1047:25: sparse:     expected void volatile [noderef] __iomem *iomem_cookie
   drivers/remoteproc/qcom_q6v5_mss.c:1047:25: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1103:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1103:21: sparse:     expected void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1103:21: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/qcom_q6v5_mss.c:1107:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *iomem_cookie @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1107:25: sparse:     expected void volatile [noderef] __iomem *iomem_cookie
   drivers/remoteproc/qcom_q6v5_mss.c:1107:25: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1393:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mba_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1393:27: sparse:     expected void *mba_region
   drivers/remoteproc/qcom_q6v5_mss.c:1393:27: sparse:     got void [noderef] __iomem *

vim +1008 drivers/remoteproc/qcom_q6v5_mss.c

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
> 1008			ptr = ioremap_wc(qproc->mpss_phys + offset, phdr->p_memsz);
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
