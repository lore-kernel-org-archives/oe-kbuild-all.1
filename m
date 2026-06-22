Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3892344D8C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782159386; cv=none; b=ZnL4S8OGKrTrT+9bwuDLxFBpvpIvbF7ogGeb02vfTa7kIdIMq+2fW85UHv3RGuXkV0s7g7+kN9qHZ9vleGdZGIHt6S+pZMn0OJOFZSgZlgRSqq9QrhMVzHgyXWmlujASa5KFJX/TYJf43V2cj1Nf6zVrxxowu0aoWRQJBG9t9Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782159386; c=relaxed/simple;
	bh=jRF1yDd7nfbJFFTCXMjG77ixmVMrpQppUHDt2ghFMfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PkjOhyLOwnFouOCHUaHgZw+Jt80DNmLF5rd0r7cEMh+4uIaXWbpcauWuugosWoWsQM9S+Euu9TJfnPwu/yTt6t0Dp3fgEYXFIZBvffqO9TzDX196XsIQCF2wewa1qujOjgCypHWlGXH7K2kNs6GxcjFpJ2ltbk3yrpH79zVizgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7b/uu8r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7b/uu8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782159385; x=1813695385;
  h=date:from:to:cc:subject:message-id;
  bh=jRF1yDd7nfbJFFTCXMjG77ixmVMrpQppUHDt2ghFMfY=;
  b=V7b/uu8r70kBFTFIP1Q83aWDBHBeVA2wUUGsf9GNyXnJG9DOqe9pcOQj
   QAuio4AxldTWOrzZzCES0tJytei83TZbY4TRh0pMi7SdVcq0okIYeKORp
   b12b6hAl8v3/LKCjnHVHvcJVz0fdNrdFdLbK/nmjfF4+IvtEeGvVNesBL
   X0XM+LhVkpuuo8cbKGkkwcv300pCZjmHCGsTPWeqi+Xs2Ta1cmolnFuk0
   Zt6t3S+jYrpkrBN9Lay+T7HZNoIga+9j1lc1RYwXX5o5FlbmI8yWyVRBq
   Pl5s1syZAIgDIG+EEHRFO//fyXPQJJ8ZKgvk1vtk7bXDBB6SM1zxUjNMg
   A==;
X-CSE-ConnectionGUID: qUUa/PZFT1eAw+KXG12Sig==
X-CSE-MsgGUID: 4PPGjJtpQ/6LSEyptCw+2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82938774"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82938774"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 13:16:22 -0700
X-CSE-ConnectionGUID: 7ahvh8b+TDaZWdy+zqLUHQ==
X-CSE-MsgGUID: be5pCmH3THa1XOOK2XB8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249361098"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2026 13:16:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbl46-000000001r7-19my;
	Mon, 22 Jun 2026 20:16:18 +0000
Date: Tue, 23 Jun 2026 04:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: drivers/soc/qcom/qcom-geni-se.c:1061:21: sparse: sparse:
 cast to restricted __le32
Message-ID: <202606230444.Jsb2MHsA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1dc18801be29bc54709aa355b8acd80e183b03cd
commit: d4bf06592ad68ac4353a81c73e8e662cf88aa2cc soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
date:   9 months ago
config: hexagon-randconfig-r122-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230444.Jsb2MHsA-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230444.Jsb2MHsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230444.Jsb2MHsA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/qcom-geni-se.c:1061:21: sparse: sparse: cast to restricted __le32
   drivers/soc/qcom/qcom-geni-se.c:1061:21: sparse: sparse: cast from restricted __le16

vim +1061 drivers/soc/qcom/qcom-geni-se.c

   990	
   991	/**
   992	 * geni_find_protocol_fw() - Locate and validate SE firmware for a protocol.
   993	 * @dev: Pointer to the device structure.
   994	 * @fw: Pointer to the firmware image.
   995	 * @protocol: Expected serial engine protocol type.
   996	 *
   997	 * Identifies the appropriate firmware image or configuration required for a
   998	 * specific communication protocol instance running on a  Qualcomm GENI
   999	 * controller.
  1000	 *
  1001	 * Return: pointer to a valid 'struct se_fw_hdr' if found, or NULL otherwise.
  1002	 */
  1003	static struct se_fw_hdr *geni_find_protocol_fw(struct device *dev, const struct firmware *fw,
  1004						       enum geni_se_protocol_type protocol)
  1005	{
  1006		const struct elf32_hdr *ehdr;
  1007		const struct elf32_phdr *phdrs;
  1008		const struct elf32_phdr	*phdr;
  1009		struct se_fw_hdr *sefw;
  1010		u32 fw_end, cfg_idx_end, cfg_val_end;
  1011		u16 fw_size;
  1012		int i;
  1013	
  1014		if (!fw || fw->size < sizeof(struct elf32_hdr))
  1015			return NULL;
  1016	
  1017		ehdr = (const struct elf32_hdr *)fw->data;
  1018		phdrs = (const struct elf32_phdr *)(fw->data + ehdr->e_phoff);
  1019	
  1020		/*
  1021		 * The firmware is expected to have at least two program headers (segments).
  1022		 * One for metadata and the other for the actual protocol-specific firmware.
  1023		 */
  1024		if (ehdr->e_phnum < 2) {
  1025			dev_err(dev, "Invalid firmware: less than 2 program headers\n");
  1026			return NULL;
  1027		}
  1028	
  1029		for (i = 0; i < ehdr->e_phnum; i++) {
  1030			phdr = &phdrs[i];
  1031	
  1032			if (fw->size < phdr->p_offset + phdr->p_filesz) {
  1033				dev_err(dev, "Firmware size (%zu) < expected offset (%u) + size (%u)\n",
  1034					fw->size, phdr->p_offset, phdr->p_filesz);
  1035				return NULL;
  1036			}
  1037	
  1038			if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
  1039				continue;
  1040	
  1041			if (MI_PBT_PAGE_MODE_VALUE(phdr->p_flags) != MI_PBT_NON_PAGED_SEGMENT ||
  1042			    MI_PBT_SEGMENT_TYPE_VALUE(phdr->p_flags) == MI_PBT_HASH_SEGMENT ||
  1043			    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) == MI_PBT_NOTUSED_SEGMENT ||
  1044			    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) == MI_PBT_SHARED_SEGMENT)
  1045				continue;
  1046	
  1047			if (phdr->p_filesz < sizeof(struct se_fw_hdr))
  1048				continue;
  1049	
  1050			sefw = (struct se_fw_hdr *)(fw->data + phdr->p_offset);
  1051			fw_size = le16_to_cpu(sefw->fw_size_in_items);
  1052			fw_end = le16_to_cpu(sefw->fw_offset) + fw_size * sizeof(u32);
  1053			cfg_idx_end = le16_to_cpu(sefw->cfg_idx_offset) +
  1054				      le16_to_cpu(sefw->cfg_size_in_items) * sizeof(u8);
  1055			cfg_val_end = le16_to_cpu(sefw->cfg_val_offset) +
  1056				      le16_to_cpu(sefw->cfg_size_in_items) * sizeof(u32);
  1057	
  1058			if (le32_to_cpu(sefw->magic) != SE_MAGIC_NUM || le32_to_cpu(sefw->version) != 1)
  1059				continue;
  1060	
> 1061			if (le32_to_cpu(sefw->serial_protocol) != protocol)
  1062				continue;
  1063	
  1064			if (fw_size % 2 != 0) {
  1065				fw_size++;
  1066				sefw->fw_size_in_items = cpu_to_le16(fw_size);
  1067			}
  1068	
  1069			if (fw_size >= MAX_GENI_CFG_RAMn_CNT) {
  1070				dev_err(dev,
  1071					"Firmware size (%u) exceeds max allowed RAMn count (%u)\n",
  1072					fw_size, MAX_GENI_CFG_RAMn_CNT);
  1073				continue;
  1074			}
  1075	
  1076			if (fw_end > phdr->p_filesz || cfg_idx_end > phdr->p_filesz ||
  1077			    cfg_val_end > phdr->p_filesz) {
  1078				dev_err(dev, "Truncated or corrupt SE FW segment found at index %d\n", i);
  1079				continue;
  1080			}
  1081	
  1082			return sefw;
  1083		}
  1084	
  1085		dev_err(dev, "Failed to get %s protocol firmware\n", protocol_name[protocol]);
  1086		return NULL;
  1087	}
  1088	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
