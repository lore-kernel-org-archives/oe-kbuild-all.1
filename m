Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50E1624C6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766700697; cv=none; b=KfzNHb4g35deI4P0j6ClzRGR8vTiabdw42ohpDLFSMBSYZUXw+ar8X0n/l2NXBo1gGTk1dnEVYXZXa2XsTk6Oh6IGCPFYnYHZ6W775xiP6AtXJXDFFQuw9sq5a/iIlCBqOIYSs6+zL02JJaXoWIDD8qfgfw+4PVwMvQeVAFD1lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766700697; c=relaxed/simple;
	bh=eU3IMxHt17rXFdt4Po1i8eYBReUPASeFYfxhAJKkKSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gO/uR+N29HcKHZyPpt8TqoVaNtqUX2+9PDvc0vkkIJpuZTSwOl/K004WXQ9wvZEXnoyx3P8buQQ0+krQ2fhcpxd6z79g+QJBLt2eK284qoEShSVk8Aju+xsoUYkfeOEpetLIqnn5Hn2yp/zxPUd2Z5M+475TZWelJJpoZ9Sw94Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awXcNQ8a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awXcNQ8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766700695; x=1798236695;
  h=date:from:to:cc:subject:message-id;
  bh=eU3IMxHt17rXFdt4Po1i8eYBReUPASeFYfxhAJKkKSE=;
  b=awXcNQ8a3ZmyRom1eDnCHWQNdPf9EOctlRMeNcyz5ZPe+QfzoHpiA4OB
   SigT1sGUKDCdOaq6YGa39tJm0dbJjkaSUhwWSSO5B0Vmher88oV/G8mzl
   Cul1IIJ/2l/hUtcbI2FGcVG1tp65XxvfQ1T3aWVUaXK71W+bJ06mIjnuA
   RYBhTSWMtwjdGNv+piMGNq0pDVe84CE9v0vl+j5kf8H9TuikE9BvABBW1
   NmYhaCuInhuVd48IqdLMTGR/JIEPdtEtPA70Jlvmgdj4NRNxvTVkDeFUR
   GcwT1YIz5Zx+AQP9BNFwr5vs1Z4ipQEm4HSk48S2otY1XfhsndrkibPSL
   Q==;
X-CSE-ConnectionGUID: 9WTwuvMyR5++RaPKLhMfVg==
X-CSE-MsgGUID: DiU9dzfPTTygXkgb0Q7OBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79934583"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79934583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 14:11:34 -0800
X-CSE-ConnectionGUID: AER6vhrgQZiSa2PTSNi41w==
X-CSE-MsgGUID: +jvH60f8R+abhQaU1U21lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="199526031"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Dec 2025 14:11:33 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYtYP-000000004Un-2qw9;
	Thu, 25 Dec 2025 22:11:29 +0000
Date: Fri, 26 Dec 2025 06:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/firmware/uvb/odf/odf_trans.c:119:14: error: call to undeclared
 function 'memremap'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202512260611.ZxyYeJeZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi klmengkd,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: e440694adcf8b5ee8eab5914302130003d121a0e [13/13] uvb: change dir name
config: arm64-randconfig-r061-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260611.ZxyYeJeZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260611.ZxyYeJeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260611.ZxyYeJeZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/uvb/odf/odf_trans.c:28:6: warning: no previous prototype for function 'free_cis_info' [-Wmissing-prototypes]
      28 | void free_cis_info(void)
         |      ^
   drivers/firmware/uvb/odf/odf_trans.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | void free_cis_info(void)
         | ^
         | static 
>> drivers/firmware/uvb/odf/odf_trans.c:119:14: error: call to undeclared function 'memremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     119 |                                 header = memremap(ubrt_table->sub_tables[i].pointer,
         |                                          ^
>> drivers/firmware/uvb/odf/odf_trans.c:120:38: error: use of undeclared identifier 'MEMREMAP_WB'
     120 |                                         sizeof(struct ubios_od_header), MEMREMAP_WB);
         |                                                                         ^
>> drivers/firmware/uvb/odf/odf_trans.c:126:5: error: call to undeclared function 'memunmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |                                 memunmap(header);
         |                                 ^
   drivers/firmware/uvb/odf/odf_trans.c:128:22: error: use of undeclared identifier 'MEMREMAP_WB'
     128 |                                         sub_table_size, MEMREMAP_WB);
         |                                                         ^
   drivers/firmware/uvb/odf/odf_trans.c:203:3: error: call to undeclared function 'memunmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     203 |                 memunmap(sub_table);
         |                 ^
   drivers/firmware/uvb/odf/odf_trans.c:303:14: error: call to undeclared function 'memremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     303 |                                 header = memremap(ubrt_table->sub_tables[i].pointer,
         |                                          ^
   drivers/firmware/uvb/odf/odf_trans.c:304:38: error: use of undeclared identifier 'MEMREMAP_WB'
     304 |                                         sizeof(struct ubios_od_header), MEMREMAP_WB);
         |                                                                         ^
   drivers/firmware/uvb/odf/odf_trans.c:310:5: error: call to undeclared function 'memunmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     310 |                                 memunmap(header);
         |                                 ^
   drivers/firmware/uvb/odf/odf_trans.c:312:22: error: use of undeclared identifier 'MEMREMAP_WB'
     312 |                                         sub_table_size, MEMREMAP_WB);
         |                                                         ^
   drivers/firmware/uvb/odf/odf_trans.c:362:3: error: call to undeclared function 'memunmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     362 |                 memunmap(sub_table);
         |                 ^
   drivers/firmware/uvb/odf/odf_trans.c:406:3: error: call to undeclared function 'memremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     406 |                 memremap(od_root_phys, sizeof(struct ubios_od_header), MEMREMAP_WB);
         |                 ^
   drivers/firmware/uvb/odf/odf_trans.c:406:58: error: use of undeclared identifier 'MEMREMAP_WB'
     406 |                 memremap(od_root_phys, sizeof(struct ubios_od_header), MEMREMAP_WB);
         |                                                                        ^
   drivers/firmware/uvb/odf/odf_trans.c:412:2: error: call to undeclared function 'memunmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     412 |         memunmap((void *)od_root_origin);
         |         ^
   drivers/firmware/uvb/odf/odf_trans.c:414:80: error: use of undeclared identifier 'MEMREMAP_WB'
     414 |         od_root_origin = (struct ubios_od_root *)memremap(od_root_phys, od_root_size, MEMREMAP_WB);
         |                                                                                       ^
   1 warning and 14 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/memremap +119 drivers/firmware/uvb/odf/odf_trans.c

24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   97  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   98  static int create_cis_info_from_odf(void)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   99  {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  100  	struct ubios_od_list_info list;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  101  	struct ubios_od_value_struct vs;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  102  	struct ubios_od_value_struct ub_vs;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  103  	struct ubios_ubrt_table *ubrt_table = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  104  	struct acpi_table_header *table = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  105  	u8 *sub_table = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  106  	struct ubios_od_header *header = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  107  	acpi_status status;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  108  	int i = 0;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  109  	int err = 0;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  110  	u32 sub_table_size = 0;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  111  	int ub_vs_err = 0;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  112  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  113  	status = acpi_get_table(ACPI_SIG_UBRT, 0, &table);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  114  	if (ACPI_SUCCESS(status)) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  115  		ubrt_table = (struct ubios_ubrt_table *)table;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  116  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  117  		for (i = 0; i < ubrt_table->count; i++) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  118  			if (ubrt_table->sub_tables[i].type == UBRT_CALL_ID_SERVICE) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31 @119  				header = memremap(ubrt_table->sub_tables[i].pointer,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31 @120  					sizeof(struct ubios_od_header), MEMREMAP_WB);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  121  				if (!header) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  122  					pr_err("failed to map cis table to od header in ACPI\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  123  					return -ENOMEM;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  124  				}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  125  				sub_table_size = header->total_size;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31 @126  				memunmap(header);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  127  				sub_table = (u8 *)memremap(ubrt_table->sub_tables[i].pointer,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  128  					sub_table_size, MEMREMAP_WB);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  129  				break;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  130  			}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  131  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  132  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  133  		if (!sub_table) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  134  			pr_err("failed to get cis table address in ACPI\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  135  			return -ENOMEM;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  136  		}
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  137  		pr_info("get cis sub table success\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  138  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  139  		err = odf_get_list_from_table(sub_table, ODF_NAME_CIS_GROUP, &list);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  140  		if (err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  141  			pr_err("create cis info from odf failed, group not found, err = %d\n",
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  142  				err);
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  143  			goto free_sub_table;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  144  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  145  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  146  		ub_vs_err = odf_get_vs_from_table(sub_table, ODF_NAME_CIS_UB, &ub_vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  147  	} else {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  148  		err = odf_get_list(od_root,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  149  				ODF_FILE_NAME_CALL_ID_SERVICE "/" ODF_NAME_CIS_GROUP, &list);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  150  		if (err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  151  			pr_err("create cis info from odf failed, group not found, err = %d\n",
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  152  				err);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  153  			return err;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  154  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  155  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  156  		ub_vs_err = odf_get_struct(od_root,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  157  				ODF_FILE_NAME_CALL_ID_SERVICE "/" ODF_NAME_CIS_UB, &ub_vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  158  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  159  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  160  	g_cis_info = kzalloc(sizeof(struct cis_info) + (sizeof(void *) * list.count), GFP_KERNEL);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  161  	if (!g_cis_info) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  162  		err = -ENOMEM;
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  163  		goto free_sub_table;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  164  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  165  	g_cis_info->group_count = list.count;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  166  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  167  	err = odf_get_data_from_list(&list, 0, &vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  168  	if (err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  169  		pr_err("create cis info from odf failed: get data from CIS group failed, err = %d\n",
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  170  			err);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  171  		goto fail;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  172  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  173  	for (i = 0; i < list.count; i++) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  174  		g_cis_info->groups[i] = create_group_from_vs(&vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  175  		if (!g_cis_info->groups[i]) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  176  			pr_err("create cis group from odf failed\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  177  			err = -ENODATA;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  178  			goto fail;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  179  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  180  		(void)odf_next_in_list(&list, &vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  181  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  182  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  183  	if (!ub_vs_err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  184  		pr_info("found ub struct in cis info\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  185  		err = odf_get_u8_from_struct(&ub_vs, ODF_NAME_CIS_USAGE, &(g_cis_info->ub.usage));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  186  		if (err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  187  			pr_err("create group: get [usage] failed, err = %d\n", status);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  188  			goto fail;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  189  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  190  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  191  		err = odf_get_u8_from_struct(&ub_vs, ODF_NAME_CIS_INDEX, &(g_cis_info->ub.index));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  192  		if (err)
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  193  			pr_warn("ub struct not get [index], use default value\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  194  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  195  		err = odf_get_u32_from_struct(&ub_vs, ODF_NAME_CIS_FORWARDER_ID,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  196  				&(g_cis_info->ub.forwarder_id));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  197  		if (err)
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  198  			pr_warn("ub struct not get forwarder, use default value\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  199  	} else
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  200  		pr_warn("not found ub struct in cis info\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  201  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  202  	if (sub_table)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  203  		memunmap(sub_table);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  204  
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  205  	pr_info("get cis table from odf success\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  206  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  207  	return 0;
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  208  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  209  fail:
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  210  	free_cis_info();
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  211  free_sub_table:
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  212  	if (sub_table)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  213  		memunmap(sub_table);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  214  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  215  	return err;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  216  }
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  217  

:::::: The code at line 119 was first introduced by commit
:::::: 24fa96b6e010d05e59d99562a415b1a64544e292 ubios_uvb: support UBIOS object description specification parse

:::::: TO: Anonymous_Z <zhangrui182@huawei.com>
:::::: CC: t30009442 <tangce1@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
