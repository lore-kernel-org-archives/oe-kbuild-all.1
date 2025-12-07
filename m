Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979183B8D52
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 05:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765084587; cv=none; b=uMuW8r1l62SdFrXb/rnFVM5GwZLqpA04O7+gZdU410ArSDF7WbxO9CdE2sCybgvcI4IyoqQKXOXIDw/BCjqlOV8jJZulmRir9hjw3GbmO4FnXm5BfkyuMSJjF3icLes1bEQ/e7xv4HSZMI3zrAEeDZXy9YrMz7SYb9NzvNAb3e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765084587; c=relaxed/simple;
	bh=lrqI3nptXFTS4+8Cglk/ktQ5aVxi1M5L5kdUyzYx8eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uo+mcWgW86lHAf3s/t22EMM8y4bbpyPwmrhROQa2FDGMIlwZ00BSHGVex1xuMnIaAAg6uZdoj0ncBSOhbS6su4J5Pz2pLZG/72aUqDnVsBK+5Nip6XPwI5pzOOp/9GtsKpjKJ8tc+x79SHYhrKIMf49iIJzfRhEycaKtUsgt9XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gk9CPfEh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gk9CPfEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765084585; x=1796620585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lrqI3nptXFTS4+8Cglk/ktQ5aVxi1M5L5kdUyzYx8eM=;
  b=Gk9CPfEh0XgWlm6xL5CWuxY/iYhg+QeawI37DDrFcabVhbadPt2Kof/y
   ogu/xADABbwc3z2C4MTqMQjplgMzTJxMhh13OOaTOOfT/FrGaph6bSBY/
   M2F39ZIac7q+ELGwJp53yKODpmz1UvyOmPt0T/5AIkOOIb2b90DmvIa7C
   W03Rj+az+8zxs5U3jdYBjkicviy3c+hcLsA53Q2EwyINeL2zzgM5YyNIT
   tWkdte5EEBxIIOLA+OzNErPnIz8QxPw+BNbU5HiFtPDfKtmC67bx5vtOv
   Y8Bx38ZYPloBHwuMUlXeiOKELkdFq/CL4+c0IUseqckF7GnuVfwfMOqc+
   w==;
X-CSE-ConnectionGUID: jF2FnQ/XSxm7wAQLERox0A==
X-CSE-MsgGUID: 8bv91H1FQjSQtCN1+IvdhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78421391"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="78421391"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 21:16:24 -0800
X-CSE-ConnectionGUID: ROl7tsJOQ5+3gTwsmYSHpg==
X-CSE-MsgGUID: H1TsE68BT1C2ReWewmE8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195274308"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Dec 2025 21:16:23 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS789-00000000J1x-1vqa;
	Sun, 07 Dec 2025 05:16:21 +0000
Date: Sun, 7 Dec 2025 13:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, t30009442 <tangce1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482]
 drivers/firmware/ubios_uvb/odf/odf_get_fdt.c:29:54: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202512071326.3J4mASYn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: c477b8f076e2b3385ad93a517136b0066a691813 [3482/3482] ubios_uvb: support CIS framework receive function
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251207/202512071326.3J4mASYn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071326.3J4mASYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071326.3J4mASYn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/ubios_uvb/odf/odf_get_fdt.c:29:54: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/firmware/ubios_uvb/odf/odf_get_fdt.c:29:54: sparse:     expected restricted __be32 const [usertype] *p
   drivers/firmware/ubios_uvb/odf/odf_get_fdt.c:29:54: sparse:     got unsigned int const [usertype] *
--
>> drivers/firmware/ubios_uvb/odf/odf_trans.c:28:6: sparse: sparse: symbol 'free_cis_info' was not declared. Should it be static?
--
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:23:1: sparse: sparse: symbol 'cis_register_lock' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:26:6: sparse: sparse: symbol 'ubios_prepare_output_data' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:45:5: sparse: sparse: symbol 'get_cis_group_info' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:87:22: sparse: sparse: symbol 'search_local_cis_func_node' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:163:31: sparse: sparse: symbol 'uvb_occupy_window' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:225:6: sparse: sparse: symbol 'uvb_free_wd_obtain' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:233:5: sparse: sparse: symbol 'uvb_free_window' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:298:5: sparse: sparse: symbol 'uvb_fill_window' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:323:5: sparse: sparse: symbol 'uvb_poll_window_call' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:345:5: sparse: sparse: symbol 'uvb_poll_window_call_sync' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:362:5: sparse: sparse: symbol 'uvb_get_output_data' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:384:6: sparse: sparse: symbol 'free_io_param_with_buffer' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:394:5: sparse: sparse: symbol 'cis_call_uvb' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_info_process.c:465:5: sparse: sparse: symbol 'cis_call_uvb_sync' was not declared. Should it be static?
--
>> drivers/firmware/ubios_uvb/cis/uvb_info_process.c:129:6: sparse: sparse: symbol 'search_local_receiver_id' was not declared. Should it be static?
--
>> drivers/firmware/ubios_uvb/cis/cis_core.c:25:5: sparse: sparse: symbol 'create_uvb_poll_window_thread' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_core.c:38:6: sparse: sparse: symbol 'uvb_poll_window_thread_stop' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_core.c:86:5: sparse: sparse: symbol 'init_uvb' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_core.c:111:5: sparse: sparse: symbol 'init_global_vars' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_core.c:120:5: sparse: sparse: symbol 'init_cis_table' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_core.c:130:6: sparse: sparse: symbol 'free_global_vars' was not declared. Should it be static?
>> drivers/firmware/ubios_uvb/cis/cis_core.c:136:6: sparse: sparse: symbol 'uninit_uvb' was not declared. Should it be static?

vim +29 drivers/firmware/ubios_uvb/odf/odf_get_fdt.c

9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  13  
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  14  int odf_get_fdt_ubiostbl(u64 *phys_addr, char *tbl)
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  15  {
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  16  	int node, len;
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  17  	const void *prop;
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  18  
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  19  	node = fdt_path_offset(initial_boot_params, "/chosen");
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  20  	if (node < 0) {
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  21  		pr_err("failed to get device tree chosen node\n");
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  22  		return -EINVAL;
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  23  	}
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  24  	prop = fdt_getprop(initial_boot_params, node, tbl, &len);
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  25  	if (!prop) {
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  26  		pr_err("failed to get property\n");
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  27  		return -EINVAL;
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04  28  	}
9c3097dcbec30d drivers/ubios_uvb/odf/odf_get_fdt.c Anonymous_Z 2025-11-04 @29  	*phys_addr = (len == 4) ? (u64)be32_to_cpup((const u32 *)prop) :

:::::: The code at line 29 was first introduced by commit
:::::: 9c3097dcbec30da54bc5082cb3236b300770993d ubios_uvb: support parse ubios information by dtb

:::::: TO: Anonymous_Z <zhangrui182@huawei.com>
:::::: CC: t30009442 <tangce1@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
