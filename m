Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ADF213E89
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 04:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762574530; cv=none; b=aHSuCefze/BM04/ebEjJYRWqO8AIoFMme4/mu5y81qL8ruWnFFxlDRHxeva8fk1NiLGH4+cdDDxmNnP8O248DmOcPwPwjpjlJC3vLgXSFFH7oHM+weD5TCUnbvTfNgFUVFQi1KRI48RIOyEmlEiKnRfW3968pSsKGfT6IwSDHz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762574530; c=relaxed/simple;
	bh=HnjKChzcNsQ7QOoG8IaEZnKNqFfptXMhPbfraFIYw28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JRwVuhtB79xnC2UczipEPRI4++s+9yofO9n2yOfUWT6abOxoFEaHsEey3vxPYjjtZcSkI23ttMdUMCNqEfIOrU8txCEuw9tL5fVzOXn4GYWPZcdiCPfOPOURGTiLPn9/fZe/4aIS3M9QfLzjva0dnldMpOepcVbiOdJzkLI14pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0cZ712W; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0cZ712W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762574529; x=1794110529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HnjKChzcNsQ7QOoG8IaEZnKNqFfptXMhPbfraFIYw28=;
  b=h0cZ712W9OwKpFdQv7IGzHOdul4su1rTXZm6LkMPwf4R7pgitt//sHlO
   AN/ssZ+cMArw/BZbrzDe0mIljpcJgV3V78CI6NzKYY3+F/4yQdxxxMWDp
   KcvSF//Xv/vXwjyRwP40u2gGW5bFLccZpKrFFcP06nmKN+YvEFOLpkFiM
   6CcRqp6CX/aC7ZZ2mNwtOFmqB/8urIg045MiZwisgbr3B8SrFe9SAuNyB
   MmKH1REn0B8fR02cmJM2GtBMPK00tmaK05Phjf49sSgTlpMTaG5483SfF
   RZlxyzxfF01wkqQLmtfwiT+kD4rnGuzA/K11IuP3GO+/xPkB/KCT/qAeP
   A==;
X-CSE-ConnectionGUID: n2aTSx6ISAKvsDM7IRNJzA==
X-CSE-MsgGUID: etValEEqTWWTFmyyjS/Blw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="82347911"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="82347911"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 20:02:07 -0800
X-CSE-ConnectionGUID: uf1S29HMRuWtPQV4xW0FKg==
X-CSE-MsgGUID: jCvb4lERS9+orgcA8LuSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="188373654"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2025 20:02:06 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHa9L-0000hh-33;
	Sat, 08 Nov 2025 04:02:03 +0000
Date: Sat, 8 Nov 2025 12:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3124/3124]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5059:32:
 warning: 'nbl_update_fw_ops' defined but not used
Message-ID: <202511081113.jt4QTRG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: c83cda743e4b3b6d71e36276bf3dc2b35dc64515 [3124/3124] net:nebula-matrix:fix compile err
config: x86_64-randconfig-071-20251108 (https://download.01.org/0day-ci/archive/20251108/202511081113.jt4QTRG9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081113.jt4QTRG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081113.jt4QTRG9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_handle_tx_timeout':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:1378:33: warning: variable 'vector' set but not used [-Wunused-but-set-variable]
    1378 |         struct nbl_serv_vector *vector;
         |                                 ^~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_remove_txrx_queues':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:3025:35: warning: variable 'ring_mgt' set but not used [-Wunused-but-set-variable]
    3025 |         struct nbl_serv_ring_mgt *ring_mgt;
         |                                   ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_rep_start_xmit':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:4002:29: warning: variable 'adapter' set but not used [-Wunused-but-set-variable]
    4002 |         struct nbl_adapter *adapter;
         |                             ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_set_wake':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:4552:43: warning: variable 'net_resource_mgt' set but not used [-Wunused-but-set-variable]
    4552 |         struct nbl_serv_net_resource_mgt *net_resource_mgt;
         |                                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: In function 'nbl_serv_load_p4':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5736:22: warning: variable 'name' set but not used [-Wunused-but-set-variable]
    5736 |         u8 *strtab, *name, *product_code = NULL;
         |                      ^~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: At top level:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:5059:32: warning: 'nbl_update_fw_ops' defined but not used [-Wunused-const-variable=]
    5059 | static const struct pldmfw_ops nbl_update_fw_ops = {
         |                                ^~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_prepare_reset_task':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:902:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     902 |         int ret;
         |             ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_eswitch_load_rep':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:4598:54: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
    4598 |                 snprintf(net_dev_name, IFNAMSIZ, "%s_%d", net_dev->netdev->name, i);
         |                                                      ^~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:4598:50: note: directive argument in the range [0, 2147483646]
    4598 |                 snprintf(net_dev_name, IFNAMSIZ, "%s_%d", net_dev->netdev->name, i);
         |                                                  ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:4598:17: note: 'snprintf' output between 3 and 27 bytes into a destination of size 16
    4598 |                 snprintf(net_dev_name, IFNAMSIZ, "%s_%d", net_dev->netdev->name, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nbl_update_fw_ops +5059 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c

468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5058  
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24 @5059  static const struct pldmfw_ops nbl_update_fw_ops = {
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5060  	.match_record = nbl_serv_pldmfw_op_pci_match_record,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5061  	.send_package_data = nbl_serv_send_package_data,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5062  	.send_component_table = nbl_serv_send_component_table,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5063  	.flash_component = nbl_serv_flash_component,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5064  	.finalize_update = nbl_serv_finalize_update,
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5065  };
468b0cd7b1e1c1 nebula_matrix_driver 2025-09-24  5066  

:::::: The code at line 5059 was first introduced by commit
:::::: 468b0cd7b1e1c131b3ee7d2ea8b96521d3faad8b net:nebula-matrix:Add S1000 SNIC driver support

:::::: TO: nebula_matrix_driver <open@nebula-matrix.com>
:::::: CC: nebula_matrix_driver <open@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
