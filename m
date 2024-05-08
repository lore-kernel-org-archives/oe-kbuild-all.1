Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEC0535D5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715158700; cv=none; b=fd+ZhUID83tJoKJwWdLIuHWq9Zwqtv+e+RP+9RaH/JXiddcy37sh3VyXvStulP/HlpaFbth2k1y/fcA2aVtcvEpYysuxq+snnHDaBAG/KaJ6sTM1am9aHKx4nrfzdM536GZ9XsNRhovUAa/CYQih7ZwgUWBCSVRB+JD+9KoRpcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715158700; c=relaxed/simple;
	bh=1KzELSzrAkMg1EeAtSxDr1jxjnvN/lOFk+FAIeGM548=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vl5KdhzQ5KQy/oB1udo+Zk++7lFgFV0MYRPXkGCKOg/4do6j+rK9tUqLk8DkkyMxPOv2T91jNyvgYyMDQhdrXPbz9588cWtqPrxYMyDB1RTMwy+UZc86DF65CgL90NNJHAq7HSCA/2NXYOl6NEzYK7QMF2E1JoBusV1dRv1vqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGczsDkG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGczsDkG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715158699; x=1746694699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1KzELSzrAkMg1EeAtSxDr1jxjnvN/lOFk+FAIeGM548=;
  b=bGczsDkGBpsQbMEs+cOQg6ZiVy1VGWEyY05LUnCX4Bdq17Kb8SwLlvbX
   rrXNjLwJRHzgk4cSPuhS+Bo/euzsSf0k/zQTnz8hdaRCDMqj+7IUufKav
   cHbP81lXsZAUT0BbQSVIKvvuZkyXg9la2RjHJf7RVNgblpkrnoD0jdcsq
   hsOoIa0YBDYbtcrh2ufhaTjjXIkqm990rWByXzzfS66fdP/25ImqlAmgO
   j64156ibuPyhkFQVrhsthptx7Ca0T9BySzLrPie7QJA5v5A3hAsQZDWGY
   ynHloE0sMAcbDuF21KVGOnfuotcvgquywT61SIzdma0j6FyD24y289WX+
   Q==;
X-CSE-ConnectionGUID: 1cH9TUsPQymY28X/3x7D1g==
X-CSE-MsgGUID: RizSfSuQQX6FHyzS2sE+Qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10857267"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="10857267"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 01:58:19 -0700
X-CSE-ConnectionGUID: SlvoB1LkR+6CWWQcGhhQmg==
X-CSE-MsgGUID: CjTeo4czQculf0q075jH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="29347248"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2024 01:58:16 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4d7t-0003BG-05;
	Wed, 08 May 2024 08:58:13 +0000
Date: Wed, 8 May 2024 16:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6548/6577]
 drivers/crypto/ccp/hygon/csv-dev.c:141:29: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202405081647.fZcWhmJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ffca8a908fafd64ef6729c1f9953adc81cd5ffe1
commit: a90e977db157287a8a9766dc190bac769b7bc8d6 [6548/6577] crypto: ccp: Implement CSV_DOWNLOAD_FIRMWARE ioctl command
config: x86_64-randconfig-123-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081647.fZcWhmJf-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081647.fZcWhmJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081647.fZcWhmJf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/hygon/csv-dev.c:141:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/crypto/ccp/hygon/csv-dev.c:141:29: sparse:     expected void const [noderef] __user *from
   drivers/crypto/ccp/hygon/csv-dev.c:141:29: sparse:     got void *
   drivers/crypto/ccp/hygon/csv-dev.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +141 drivers/crypto/ccp/hygon/csv-dev.c

    93	
    94	static int csv_ioctl_do_download_firmware(struct sev_issue_cmd *argp)
    95	{
    96		struct sev_data_download_firmware *data = NULL;
    97		struct csv_user_data_download_firmware input;
    98		int ret, order;
    99		struct page *p;
   100		u64 data_size;
   101	
   102		/* Only support DOWNLOAD_FIRMWARE if build greater or equal 1667 */
   103		if (!csv_version_greater_or_equal(1667)) {
   104			pr_err("DOWNLOAD_FIRMWARE not supported\n");
   105			return -EIO;
   106		}
   107	
   108		if (copy_from_user(&input, (void __user *)argp->data, sizeof(input)))
   109			return -EFAULT;
   110	
   111		if (!input.address) {
   112			argp->error = SEV_RET_INVALID_ADDRESS;
   113			return -EINVAL;
   114		}
   115	
   116		if (!input.length || input.length > CSV_FW_MAX_SIZE) {
   117			argp->error = SEV_RET_INVALID_LEN;
   118			return -EINVAL;
   119		}
   120	
   121		/*
   122		 * CSV FW expects the physical address given to it to be 32
   123		 * byte aligned. Memory allocated has structure placed at the
   124		 * beginning followed by the firmware being passed to the CSV
   125		 * FW. Allocate enough memory for data structure + alignment
   126		 * padding + CSV FW.
   127		 */
   128		data_size = ALIGN(sizeof(struct sev_data_download_firmware), 32);
   129	
   130		order = get_order(input.length + data_size);
   131		p = alloc_pages(GFP_KERNEL, order);
   132		if (!p)
   133			return -ENOMEM;
   134	
   135		/*
   136		 * Copy firmware data to a kernel allocated contiguous
   137		 * memory region.
   138		 */
   139		data = page_address(p);
   140		if (copy_from_user((void *)(page_address(p) + data_size),
 > 141				   (void *)input.address, input.length)) {
   142			ret = -EFAULT;
   143			goto err_free_page;
   144		}
   145	
   146		data->address = __psp_pa(page_address(p) + data_size);
   147		data->len = input.length;
   148	
   149		ret = hygon_psp_hooks.__sev_do_cmd_locked(SEV_CMD_DOWNLOAD_FIRMWARE,
   150							  data, &argp->error);
   151		if (ret)
   152			pr_err("Failed to update CSV firmware: %#x\n", argp->error);
   153		else
   154			pr_info("CSV firmware update successful\n");
   155	
   156	err_free_page:
   157		__free_pages(p, order);
   158	
   159		return ret;
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
