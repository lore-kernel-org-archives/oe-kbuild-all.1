Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9AE22A1E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 20:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747342401; cv=none; b=pfXqbOK2WsgEf/U4yJXPlaIjNm7tWY2NCGDQZsbHPD4RCWyGBwoDrXiOZE/Uxmux4VeSZ/51+/yU8qUgR3qAf8jITE1M21XiDbX/k9bIS3HhHG6N5opnplLorxoBV1H33nPst5lf9DpzaFPboM+SDWAL1fNK+L9W9sL8OiBhN2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747342401; c=relaxed/simple;
	bh=AppKH4vprqiA1ZrrlTM6YMPKoqZHPtGqhxtQFKuIhLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yo2YCtuZEaf2z+qP7JOMbutsWzdq7N9TP1VUi6RfgA8Yn0C8X3LnBNz5KL1P9evZ9eDoDCZkqRpyLNQ1snnlMgvQ2IboZdQRiz/Vg0SDAjoLiqXaSAWivDbRzlC5y+cZaH2tZkJ3X4xkWf8O+WOcsPQP0/w09k1/Az/6wCqbXW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbDgPkIp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbDgPkIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747342399; x=1778878399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AppKH4vprqiA1ZrrlTM6YMPKoqZHPtGqhxtQFKuIhLw=;
  b=IbDgPkIphZyU36jyqqHKtGs+8AT28o6K3M4gZE5P2kSVpTCf8moAO9Qu
   xCoBq3i/iOGKCU3SyER9LE/qJ8O6KlH+XT5sYOIMEwp/YvXYxXQepqgFw
   n4wZUb3xCXZji+oHZZWxbpU2JYG2a7yhzJeuzjgY6K2ekmsZTbowtFqEp
   FQh/+ZPheWSYWN/76pgjRE0JXCSInFTH4QRRyU+ZmBVLjkBYBIZ/NlxRa
   SA5AdmgYg2+OJcuXBoDqYqV0qrUdIeRbUY9N84C2FW9nob0zDECOrGlwL
   NNEu2ynarcfg8gQnH9bfmq19j/r4dCtbg/c6HdOV4k1msPp/dzm/mzh6D
   A==;
X-CSE-ConnectionGUID: IVuCxqWeTcyS7Yr6rsEBXw==
X-CSE-MsgGUID: xmSjKzXKTDaQUXlqx5fYfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53103545"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="53103545"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 13:53:17 -0700
X-CSE-ConnectionGUID: l58L0KzaQLmcb52nOYQrUQ==
X-CSE-MsgGUID: vqepRWYfTI6Bd6xPaZivsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="143603680"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa005.jf.intel.com with ESMTP; 15 May 2025 13:53:16 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFfZp-0000J5-0r;
	Thu, 15 May 2025 20:53:13 +0000
Date: Fri, 16 May 2025 04:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] arch/x86/kvm/svm/csv.c:1196: warning:
 Function parameter or member 'kvm' not described in
 'csv3_launch_encrypt_data_alt_1'
Message-ID: <202505160402.nOvBd3GB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   baf4f02470215e4f896899f495ff7ac7fbfda979
commit: ee5362bc5977e41a88aee1c46a6580295baa0285 [2229/2229] KVM: SVM: CSV: Support issue non-4K aligned CSV3_CMD_LAUNCH_ENCRYPT_DATA and more than once
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250516/202505160402.nOvBd3GB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160402.nOvBd3GB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160402.nOvBd3GB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/csv.c:1196: warning: Function parameter or member 'kvm' not described in 'csv3_launch_encrypt_data_alt_1'
>> arch/x86/kvm/svm/csv.c:1196: warning: Function parameter or member 'argp' not described in 'csv3_launch_encrypt_data_alt_1'
>> arch/x86/kvm/svm/csv.c:1319: warning: Function parameter or member 'kvm' not described in '__csv3_launch_encrypt_data'
>> arch/x86/kvm/svm/csv.c:1319: warning: Function parameter or member 'argp' not described in '__csv3_launch_encrypt_data'
>> arch/x86/kvm/svm/csv.c:1319: warning: Function parameter or member 'params' not described in '__csv3_launch_encrypt_data'
>> arch/x86/kvm/svm/csv.c:1319: warning: Function parameter or member 'src_buf' not described in '__csv3_launch_encrypt_data'
>> arch/x86/kvm/svm/csv.c:1319: warning: Function parameter or member 'start_pgoff' not described in '__csv3_launch_encrypt_data'
>> arch/x86/kvm/svm/csv.c:1319: warning: Function parameter or member 'end_pgoff' not described in '__csv3_launch_encrypt_data'
>> arch/x86/kvm/svm/csv.c:1436: warning: Function parameter or member 'kvm' not described in 'csv3_launch_encrypt_data_alt_2'
>> arch/x86/kvm/svm/csv.c:1436: warning: Function parameter or member 'argp' not described in 'csv3_launch_encrypt_data_alt_2'
   arch/x86/kvm/svm/csv.c:2305: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    *  Return negative error code on fail,
   arch/x86/kvm/svm/csv.c:2936: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * When userspace recognizes these extensions, it is suggested that the userspace
   arch/x86/kvm/svm/csv.c:2986: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return 0 means KVM accept the negotiation from userspace. Both the


vim +1196 arch/x86/kvm/svm/csv.c

e23a88d66dd209 Xin Jiang 2023-08-10  1189  
ee5362bc5977e4 hanliyang 2024-09-27  1190  /**
ee5362bc5977e4 hanliyang 2024-09-27  1191   * csv3_launch_encrypt_data_alt_1 - The legacy handler to encrypt CSV3
ee5362bc5977e4 hanliyang 2024-09-27  1192   * guest's memory before VMRUN.
ee5362bc5977e4 hanliyang 2024-09-27  1193   */
ee5362bc5977e4 hanliyang 2024-09-27  1194  static int csv3_launch_encrypt_data_alt_1(struct kvm *kvm,
ee5362bc5977e4 hanliyang 2024-09-27  1195  					  struct kvm_sev_cmd *argp)
e23a88d66dd209 Xin Jiang 2023-08-10 @1196  {
e23a88d66dd209 Xin Jiang 2023-08-10  1197  	struct kvm_csv_info *csv = &to_kvm_svm_csv(kvm)->csv_info;
e23a88d66dd209 Xin Jiang 2023-08-10  1198  	struct kvm_csv3_launch_encrypt_data params;
e23a88d66dd209 Xin Jiang 2023-08-10  1199  	struct csv3_data_launch_encrypt_data *encrypt_data = NULL;
e23a88d66dd209 Xin Jiang 2023-08-10  1200  	struct encrypt_data_block *blocks = NULL;
e23a88d66dd209 Xin Jiang 2023-08-10  1201  	u8 *data = NULL;
e23a88d66dd209 Xin Jiang 2023-08-10  1202  	u32 offset;
e23a88d66dd209 Xin Jiang 2023-08-10  1203  	u32 num_entries, num_entries_in_block;
e23a88d66dd209 Xin Jiang 2023-08-10  1204  	u32 num_blocks, num_blocks_max;
e23a88d66dd209 Xin Jiang 2023-08-10  1205  	u32 i, n;
e23a88d66dd209 Xin Jiang 2023-08-10  1206  	unsigned long pfn, pfn_sme_mask;
e23a88d66dd209 Xin Jiang 2023-08-10  1207  	int ret = 0;
e23a88d66dd209 Xin Jiang 2023-08-10  1208  
e23a88d66dd209 Xin Jiang 2023-08-10  1209  	if (copy_from_user(&params, (void __user *)(uintptr_t)argp->data,
e23a88d66dd209 Xin Jiang 2023-08-10  1210  			   sizeof(params))) {
e23a88d66dd209 Xin Jiang 2023-08-10  1211  		ret = -EFAULT;
e23a88d66dd209 Xin Jiang 2023-08-10  1212  		goto exit;
e23a88d66dd209 Xin Jiang 2023-08-10  1213  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1214  
e23a88d66dd209 Xin Jiang 2023-08-10  1215  	if ((params.len & ~PAGE_MASK) || !params.len || !params.uaddr) {
e23a88d66dd209 Xin Jiang 2023-08-10  1216  		ret = -EINVAL;
e23a88d66dd209 Xin Jiang 2023-08-10  1217  		goto exit;
e23a88d66dd209 Xin Jiang 2023-08-10  1218  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1219  
e57b75759a2c62 hanliyang 2024-09-26  1220  	/*
e57b75759a2c62 hanliyang 2024-09-26  1221  	 * If userspace request to invoke CSV3_CMD_SET_GUEST_PRIVATE_MEMORY
e57b75759a2c62 hanliyang 2024-09-26  1222  	 * explicitly, we should not calls to csv3_set_guest_private_memory()
e57b75759a2c62 hanliyang 2024-09-26  1223  	 * here.
e57b75759a2c62 hanliyang 2024-09-26  1224  	 */
e57b75759a2c62 hanliyang 2024-09-26  1225  	if (!(csv->inuse_ext & KVM_CAP_HYGON_COCO_EXT_CSV3_SET_PRIV_MEM)) {
e23a88d66dd209 Xin Jiang 2023-08-10  1226  		/* Allocate all the guest memory from CMA */
e57b75759a2c62 hanliyang 2024-09-26  1227  		ret = csv3_set_guest_private_memory(kvm, argp);
e23a88d66dd209 Xin Jiang 2023-08-10  1228  		if (ret)
e23a88d66dd209 Xin Jiang 2023-08-10  1229  			goto exit;
e57b75759a2c62 hanliyang 2024-09-26  1230  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1231  
e23a88d66dd209 Xin Jiang 2023-08-10  1232  	num_entries = params.len / PAGE_SIZE;
e23a88d66dd209 Xin Jiang 2023-08-10  1233  	num_entries_in_block = ARRAY_SIZE(blocks->entry);
e23a88d66dd209 Xin Jiang 2023-08-10  1234  	num_blocks = (num_entries + num_entries_in_block - 1) / num_entries_in_block;
e23a88d66dd209 Xin Jiang 2023-08-10  1235  	num_blocks_max = ARRAY_SIZE(encrypt_data->data_blocks);
e23a88d66dd209 Xin Jiang 2023-08-10  1236  
e23a88d66dd209 Xin Jiang 2023-08-10  1237  	if (num_blocks >= num_blocks_max) {
e23a88d66dd209 Xin Jiang 2023-08-10  1238  		ret = -EINVAL;
e23a88d66dd209 Xin Jiang 2023-08-10  1239  		goto exit;
e23a88d66dd209 Xin Jiang 2023-08-10  1240  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1241  
e23a88d66dd209 Xin Jiang 2023-08-10  1242  	data = vzalloc(params.len);
e23a88d66dd209 Xin Jiang 2023-08-10  1243  	if (!data) {
e23a88d66dd209 Xin Jiang 2023-08-10  1244  		ret = -ENOMEM;
e23a88d66dd209 Xin Jiang 2023-08-10  1245  		goto exit;
e23a88d66dd209 Xin Jiang 2023-08-10  1246  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1247  	if (copy_from_user(data, (void __user *)params.uaddr, params.len)) {
e23a88d66dd209 Xin Jiang 2023-08-10  1248  		ret = -EFAULT;
e23a88d66dd209 Xin Jiang 2023-08-10  1249  		goto data_free;
e23a88d66dd209 Xin Jiang 2023-08-10  1250  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1251  
e23a88d66dd209 Xin Jiang 2023-08-10  1252  	blocks = vzalloc(num_blocks * sizeof(*blocks));
e23a88d66dd209 Xin Jiang 2023-08-10  1253  	if (!blocks) {
e23a88d66dd209 Xin Jiang 2023-08-10  1254  		ret = -ENOMEM;
e23a88d66dd209 Xin Jiang 2023-08-10  1255  		goto data_free;
e23a88d66dd209 Xin Jiang 2023-08-10  1256  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1257  
e23a88d66dd209 Xin Jiang 2023-08-10  1258  	for (offset = 0, i = 0, n = 0; offset < params.len; offset += PAGE_SIZE) {
e23a88d66dd209 Xin Jiang 2023-08-10  1259  		pfn = vmalloc_to_pfn(offset + data);
e23a88d66dd209 Xin Jiang 2023-08-10  1260  		pfn_sme_mask = __sme_set(pfn << PAGE_SHIFT) >> PAGE_SHIFT;
e23a88d66dd209 Xin Jiang 2023-08-10  1261  		if (offset && ((blocks[n].entry[i].pfn + 1) == pfn_sme_mask))
e23a88d66dd209 Xin Jiang 2023-08-10  1262  			blocks[n].entry[i].npages += 1;
e23a88d66dd209 Xin Jiang 2023-08-10  1263  		else {
e23a88d66dd209 Xin Jiang 2023-08-10  1264  			if (offset) {
e23a88d66dd209 Xin Jiang 2023-08-10  1265  				i = (i + 1) % num_entries_in_block;
e23a88d66dd209 Xin Jiang 2023-08-10  1266  				n = (i == 0) ? (n + 1) : n;
e23a88d66dd209 Xin Jiang 2023-08-10  1267  			}
e23a88d66dd209 Xin Jiang 2023-08-10  1268  			blocks[n].entry[i].pfn = pfn_sme_mask;
e23a88d66dd209 Xin Jiang 2023-08-10  1269  			blocks[n].entry[i].npages = 1;
e23a88d66dd209 Xin Jiang 2023-08-10  1270  		}
e23a88d66dd209 Xin Jiang 2023-08-10  1271  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1272  
e23a88d66dd209 Xin Jiang 2023-08-10  1273  	encrypt_data = kzalloc(sizeof(*encrypt_data), GFP_KERNEL);
e23a88d66dd209 Xin Jiang 2023-08-10  1274  	if (!encrypt_data) {
e23a88d66dd209 Xin Jiang 2023-08-10  1275  		ret = -ENOMEM;
e23a88d66dd209 Xin Jiang 2023-08-10  1276  		goto block_free;
e23a88d66dd209 Xin Jiang 2023-08-10  1277  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1278  
e23a88d66dd209 Xin Jiang 2023-08-10  1279  	encrypt_data->handle = csv->sev->handle;
e23a88d66dd209 Xin Jiang 2023-08-10  1280  	encrypt_data->length = params.len;
e23a88d66dd209 Xin Jiang 2023-08-10  1281  	encrypt_data->gpa = params.gpa;
e23a88d66dd209 Xin Jiang 2023-08-10  1282  	for (i = 0; i <= n; i++) {
e23a88d66dd209 Xin Jiang 2023-08-10  1283  		encrypt_data->data_blocks[i] =
e23a88d66dd209 Xin Jiang 2023-08-10  1284  		__sme_set(vmalloc_to_pfn((void *)blocks + i * sizeof(*blocks)) << PAGE_SHIFT);
e23a88d66dd209 Xin Jiang 2023-08-10  1285  	}
e23a88d66dd209 Xin Jiang 2023-08-10  1286  
e23a88d66dd209 Xin Jiang 2023-08-10  1287  	clflush_cache_range(data, params.len);
e23a88d66dd209 Xin Jiang 2023-08-10  1288  	ret = hygon_kvm_hooks.sev_issue_cmd(kvm, CSV3_CMD_LAUNCH_ENCRYPT_DATA,
e23a88d66dd209 Xin Jiang 2023-08-10  1289  					    encrypt_data, &argp->error);
e23a88d66dd209 Xin Jiang 2023-08-10  1290  
e23a88d66dd209 Xin Jiang 2023-08-10  1291  	kfree(encrypt_data);
e23a88d66dd209 Xin Jiang 2023-08-10  1292  block_free:
e23a88d66dd209 Xin Jiang 2023-08-10  1293  	vfree(blocks);
e23a88d66dd209 Xin Jiang 2023-08-10  1294  data_free:
e23a88d66dd209 Xin Jiang 2023-08-10  1295  	vfree(data);
e23a88d66dd209 Xin Jiang 2023-08-10  1296  exit:
e23a88d66dd209 Xin Jiang 2023-08-10  1297  	return ret;
e23a88d66dd209 Xin Jiang 2023-08-10  1298  }
e23a88d66dd209 Xin Jiang 2023-08-10  1299  
ee5362bc5977e4 hanliyang 2024-09-27  1300  #define MAX_ENTRIES_PER_BLOCK							\
ee5362bc5977e4 hanliyang 2024-09-27  1301  	(sizeof(((struct encrypt_data_block *)0)->entry) /			\
ee5362bc5977e4 hanliyang 2024-09-27  1302  	 sizeof(((struct encrypt_data_block *)0)->entry[0]))
ee5362bc5977e4 hanliyang 2024-09-27  1303  #define MAX_BLOCKS_PER_CSV3_LUP_DATA						\
ee5362bc5977e4 hanliyang 2024-09-27  1304  	(sizeof(((struct csv3_data_launch_encrypt_data *)0)->data_blocks) /	\
ee5362bc5977e4 hanliyang 2024-09-27  1305  	 sizeof(((struct csv3_data_launch_encrypt_data *)0)->data_blocks[0]))
ee5362bc5977e4 hanliyang 2024-09-27  1306  #define MAX_ENTRIES_PER_CSV3_LUP_DATA						\
ee5362bc5977e4 hanliyang 2024-09-27  1307  	(MAX_BLOCKS_PER_CSV3_LUP_DATA * MAX_ENTRIES_PER_BLOCK)
ee5362bc5977e4 hanliyang 2024-09-27  1308  
ee5362bc5977e4 hanliyang 2024-09-27  1309  /**
ee5362bc5977e4 hanliyang 2024-09-27  1310   * __csv3_launch_encrypt_data - The helper for handler
ee5362bc5977e4 hanliyang 2024-09-27  1311   * csv3_launch_encrypt_data_alt_2.
ee5362bc5977e4 hanliyang 2024-09-27  1312   */
ee5362bc5977e4 hanliyang 2024-09-27  1313  static int __csv3_launch_encrypt_data(struct kvm *kvm,
ee5362bc5977e4 hanliyang 2024-09-27  1314  				      struct kvm_sev_cmd *argp,
ee5362bc5977e4 hanliyang 2024-09-27  1315  				      struct kvm_csv3_launch_encrypt_data *params,
ee5362bc5977e4 hanliyang 2024-09-27  1316  				      void *src_buf,
ee5362bc5977e4 hanliyang 2024-09-27  1317  				      unsigned int start_pgoff,
ee5362bc5977e4 hanliyang 2024-09-27  1318  				      unsigned int end_pgoff)
ee5362bc5977e4 hanliyang 2024-09-27 @1319  {
ee5362bc5977e4 hanliyang 2024-09-27  1320  	struct kvm_csv_info *csv = &to_kvm_svm_csv(kvm)->csv_info;
ee5362bc5977e4 hanliyang 2024-09-27  1321  	struct csv3_data_launch_encrypt_data *data = NULL;
ee5362bc5977e4 hanliyang 2024-09-27  1322  	struct encrypt_data_block *block = NULL;
ee5362bc5977e4 hanliyang 2024-09-27  1323  	struct page **pages = NULL;
ee5362bc5977e4 hanliyang 2024-09-27  1324  	unsigned long len, remain_len;
ee5362bc5977e4 hanliyang 2024-09-27  1325  	unsigned long pfn, pfn_sme_mask, last_pfn;
ee5362bc5977e4 hanliyang 2024-09-27  1326  	unsigned int pgoff = start_pgoff;
ee5362bc5977e4 hanliyang 2024-09-27  1327  	int i, j;
ee5362bc5977e4 hanliyang 2024-09-27  1328  	int ret = -ENOMEM;
ee5362bc5977e4 hanliyang 2024-09-27  1329  
ee5362bc5977e4 hanliyang 2024-09-27  1330  	/* Alloc command buffer for CSV3_CMD_LAUNCH_ENCRYPT_DATA command */
ee5362bc5977e4 hanliyang 2024-09-27  1331  	data = kzalloc(sizeof(*data), GFP_KERNEL_ACCOUNT);
ee5362bc5977e4 hanliyang 2024-09-27  1332  	if (!data)
ee5362bc5977e4 hanliyang 2024-09-27  1333  		return -ENOMEM;
ee5362bc5977e4 hanliyang 2024-09-27  1334  
ee5362bc5977e4 hanliyang 2024-09-27  1335  	/* Alloc pages for data_blocks[] in the command buffer */
ee5362bc5977e4 hanliyang 2024-09-27  1336  	len = ARRAY_SIZE(data->data_blocks) * sizeof(struct page *);
ee5362bc5977e4 hanliyang 2024-09-27  1337  	pages = kzalloc(len, GFP_KERNEL_ACCOUNT);
ee5362bc5977e4 hanliyang 2024-09-27  1338  	if (!pages)
ee5362bc5977e4 hanliyang 2024-09-27  1339  		goto e_free_data;
ee5362bc5977e4 hanliyang 2024-09-27  1340  
ee5362bc5977e4 hanliyang 2024-09-27  1341  	for (i = 0; i < ARRAY_SIZE(data->data_blocks); i++) {
ee5362bc5977e4 hanliyang 2024-09-27  1342  		pages[i] = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
ee5362bc5977e4 hanliyang 2024-09-27  1343  		if (!pages[i])
ee5362bc5977e4 hanliyang 2024-09-27  1344  			goto e_free_pages;
ee5362bc5977e4 hanliyang 2024-09-27  1345  	}
ee5362bc5977e4 hanliyang 2024-09-27  1346  
ee5362bc5977e4 hanliyang 2024-09-27  1347  	i = 0;
ee5362bc5977e4 hanliyang 2024-09-27  1348  	while (i < ARRAY_SIZE(data->data_blocks) && pgoff < end_pgoff) {
ee5362bc5977e4 hanliyang 2024-09-27  1349  		block = (struct encrypt_data_block *)page_to_virt(pages[i]);
ee5362bc5977e4 hanliyang 2024-09-27  1350  
ee5362bc5977e4 hanliyang 2024-09-27  1351  		j = 0;
ee5362bc5977e4 hanliyang 2024-09-27  1352  		last_pfn = 0;
ee5362bc5977e4 hanliyang 2024-09-27  1353  		while (j < ARRAY_SIZE(block->entry) && pgoff < end_pgoff) {
ee5362bc5977e4 hanliyang 2024-09-27  1354  			pfn = vmalloc_to_pfn(src_buf + (pgoff << PAGE_SHIFT));
ee5362bc5977e4 hanliyang 2024-09-27  1355  			pfn_sme_mask = __sme_set(pfn << PAGE_SHIFT) >> PAGE_SHIFT;
ee5362bc5977e4 hanliyang 2024-09-27  1356  
ee5362bc5977e4 hanliyang 2024-09-27  1357  			/*
ee5362bc5977e4 hanliyang 2024-09-27  1358  			 * One entry can record a number of contiguous physical
ee5362bc5977e4 hanliyang 2024-09-27  1359  			 * pages. If the current page is not adjacent to the
ee5362bc5977e4 hanliyang 2024-09-27  1360  			 * previous physical page, we should record the page to
ee5362bc5977e4 hanliyang 2024-09-27  1361  			 * the next entry. If entries of current block is used
ee5362bc5977e4 hanliyang 2024-09-27  1362  			 * up, we should try the next block.
ee5362bc5977e4 hanliyang 2024-09-27  1363  			 */
ee5362bc5977e4 hanliyang 2024-09-27  1364  			if (last_pfn && (last_pfn + 1 == pfn)) {
ee5362bc5977e4 hanliyang 2024-09-27  1365  				block->entry[j].npages++;
ee5362bc5977e4 hanliyang 2024-09-27  1366  			} else if (j < (ARRAY_SIZE(block->entry) - 1)) {
ee5362bc5977e4 hanliyang 2024-09-27  1367  				/* @last_pfn == 0 means fill in entry[0] */
ee5362bc5977e4 hanliyang 2024-09-27  1368  				if (likely(last_pfn != 0))
ee5362bc5977e4 hanliyang 2024-09-27  1369  					j++;
ee5362bc5977e4 hanliyang 2024-09-27  1370  				block->entry[j].pfn = pfn_sme_mask;
ee5362bc5977e4 hanliyang 2024-09-27  1371  				block->entry[j].npages = 1;
ee5362bc5977e4 hanliyang 2024-09-27  1372  			} else {
ee5362bc5977e4 hanliyang 2024-09-27  1373  				break;
ee5362bc5977e4 hanliyang 2024-09-27  1374  			}
ee5362bc5977e4 hanliyang 2024-09-27  1375  
ee5362bc5977e4 hanliyang 2024-09-27  1376  			/*
ee5362bc5977e4 hanliyang 2024-09-27  1377  			 * Succeed to record one page, increase the page offset.
ee5362bc5977e4 hanliyang 2024-09-27  1378  			 * We also record the pfn of current page so that we can
ee5362bc5977e4 hanliyang 2024-09-27  1379  			 * record the contiguous physical pages into one entry.
ee5362bc5977e4 hanliyang 2024-09-27  1380  			 */
ee5362bc5977e4 hanliyang 2024-09-27  1381  			last_pfn = pfn;
ee5362bc5977e4 hanliyang 2024-09-27  1382  			pgoff++;
ee5362bc5977e4 hanliyang 2024-09-27  1383  		}
ee5362bc5977e4 hanliyang 2024-09-27  1384  
ee5362bc5977e4 hanliyang 2024-09-27  1385  		i++;
ee5362bc5977e4 hanliyang 2024-09-27  1386  	}
ee5362bc5977e4 hanliyang 2024-09-27  1387  
ee5362bc5977e4 hanliyang 2024-09-27  1388  	if (pgoff < end_pgoff) {
ee5362bc5977e4 hanliyang 2024-09-27  1389  		pr_err("CSV3: Fail to fill in LAUNCH_ENCRYPT_DATA command!\n");
ee5362bc5977e4 hanliyang 2024-09-27  1390  		goto e_free_pages;
ee5362bc5977e4 hanliyang 2024-09-27  1391  	}
ee5362bc5977e4 hanliyang 2024-09-27  1392  
ee5362bc5977e4 hanliyang 2024-09-27  1393  	len = (end_pgoff - start_pgoff) << PAGE_SHIFT;
ee5362bc5977e4 hanliyang 2024-09-27  1394  	clflush_cache_range(src_buf + (start_pgoff << PAGE_SHIFT), len);
ee5362bc5977e4 hanliyang 2024-09-27  1395  
ee5362bc5977e4 hanliyang 2024-09-27  1396  	/* Fill in command buffer */
ee5362bc5977e4 hanliyang 2024-09-27  1397  	data->handle = csv->sev->handle;
ee5362bc5977e4 hanliyang 2024-09-27  1398  
ee5362bc5977e4 hanliyang 2024-09-27  1399  	if (start_pgoff == 0) {
ee5362bc5977e4 hanliyang 2024-09-27  1400  		data->gpa = params->gpa;
ee5362bc5977e4 hanliyang 2024-09-27  1401  		len -= params->gpa & ~PAGE_MASK;
ee5362bc5977e4 hanliyang 2024-09-27  1402  	} else {
ee5362bc5977e4 hanliyang 2024-09-27  1403  		data->gpa = (params->gpa & PAGE_MASK) + (start_pgoff << PAGE_SHIFT);
ee5362bc5977e4 hanliyang 2024-09-27  1404  	}
ee5362bc5977e4 hanliyang 2024-09-27  1405  	remain_len = params->len - (data->gpa - params->gpa);
ee5362bc5977e4 hanliyang 2024-09-27  1406  
ee5362bc5977e4 hanliyang 2024-09-27  1407  	data->length = (len <= remain_len) ? len : remain_len;
ee5362bc5977e4 hanliyang 2024-09-27  1408  
ee5362bc5977e4 hanliyang 2024-09-27  1409  	for (j = 0; j < i; j++)
ee5362bc5977e4 hanliyang 2024-09-27  1410  		data->data_blocks[j] = __sme_set(page_to_phys(pages[j]));
ee5362bc5977e4 hanliyang 2024-09-27  1411  
ee5362bc5977e4 hanliyang 2024-09-27  1412  	/* Issue command */
ee5362bc5977e4 hanliyang 2024-09-27  1413  	ret = hygon_kvm_hooks.sev_issue_cmd(kvm, CSV3_CMD_LAUNCH_ENCRYPT_DATA,
ee5362bc5977e4 hanliyang 2024-09-27  1414  							data, &argp->error);
ee5362bc5977e4 hanliyang 2024-09-27  1415  
ee5362bc5977e4 hanliyang 2024-09-27  1416  e_free_pages:
ee5362bc5977e4 hanliyang 2024-09-27  1417  	for (i = 0; i < ARRAY_SIZE(data->data_blocks); i++) {
ee5362bc5977e4 hanliyang 2024-09-27  1418  		if (pages[i])
ee5362bc5977e4 hanliyang 2024-09-27  1419  			__free_page(pages[i]);
ee5362bc5977e4 hanliyang 2024-09-27  1420  	}
ee5362bc5977e4 hanliyang 2024-09-27  1421  	kfree(pages);
ee5362bc5977e4 hanliyang 2024-09-27  1422  e_free_data:
ee5362bc5977e4 hanliyang 2024-09-27  1423  	kfree(data);
ee5362bc5977e4 hanliyang 2024-09-27  1424  
ee5362bc5977e4 hanliyang 2024-09-27  1425  	return ret;
ee5362bc5977e4 hanliyang 2024-09-27  1426  }
ee5362bc5977e4 hanliyang 2024-09-27  1427  

:::::: The code at line 1196 was first introduced by commit
:::::: e23a88d66dd209d8c87df6b19e15ea8ddd9b7915 KVM: SVM: CSV: Add KVM_CSV3_LAUNCH_ENCRYPT_DATA command

:::::: TO: Xin Jiang <jiangxin@hygon.cn>
:::::: CC: hanliyang <hanliyang@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
