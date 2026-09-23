Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E554A7ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 19:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191376; cv=none; b=eH/ZixO09VZuJhkDYsrYT8mkayQr47lhUHIwpwLkm+Tj65Vqy7ogupVy+lO8NjkXKrcf8T1Y8OSlmymGOH+y3a9lOMCJ+a2Cw63VYg1Pz/zBbsEQSmBYjnOKwLw9Zd+3AB3qzT5GO4LuNlGerrS6Rpth2sgEUD0fUQL7rsmgOHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191376; c=relaxed/simple;
	bh=jhp4ykWs0rnwf2hyxhxnAw1iLOZ/c2NG/qVEl/hNYRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NBe+GMdZtpmXyWL0AKtD9UOYRowBPUu0RIWizdbBfsXa9ibnwpGpkEAPIp1bgLjHOHcYTV/YsIcyUr1rqujVCbwdv87QrnXTJAdRkLwvSmtNHa1JvkTQyt6M+CO3L3bQPQa3iEo7Tc1EjdR0SncRqyf1/QVbMzyjk7pLaGvMNKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZqJyEWN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZqJyEWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790191374; x=1821727374;
  h=date:from:to:cc:subject:message-id;
  bh=jhp4ykWs0rnwf2hyxhxnAw1iLOZ/c2NG/qVEl/hNYRU=;
  b=iZqJyEWN4pUVULSt0L/0LqYdcLEuxqWP3wH+qe5utsBEgGF7XHJn9fXC
   Nai1xfeKohlAhyhsSCu12nqMo5cBsMzmDUEX8UlwsDs1f3CEHbpQENOqf
   1ke9FFEXA1t/wwCBbzxlr9S0eKTe89d30bcibMS5PWqNaSf8WGyGQHqwT
   RQAKeJMEd4+ANByBi5M0vM+AdK6UeD9c75MpGUGszLA9c8lAw3yDK4a2G
   CEYhgySzS0lchbpz63Vquq+/KQ6ipta9+gs7pbWwZ//GIz2owjPZYN5OA
   8v80EOtnJXsJ2/sYE7Hl5jSK5lg3Xct5BLVbQk43lV6qJpcDIIk4P/buE
   g==;
X-CSE-ConnectionGUID: 7vGEUzZXT0WD59zlyt9Img==
X-CSE-MsgGUID: CknbEWUsQ+GZK0sJxEvKLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="94743770"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="94743770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 12:22:53 -0700
X-CSE-ConnectionGUID: pMhc7JqfQpSr4ztXaRkXsA==
X-CSE-MsgGUID: 4vIqUn85SO+HWPerF4E+OA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 12:22:52 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9SYL-000000000mv-3U7S;
	Wed, 23 Sep 2026 19:22:49 +0000
Date: Wed, 23 Sep 2026 21:22:24 +0200
From: kernel test robot <lkp@intel.com>
To: Serhat Kumral <serhatkumral1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [rdma-rdma:wip/leon-for-next 54/54]
 drivers/infiniband/hw/irdma/hw.c:1269:9: error: expected identifier or '('
 before 'return'
Message-ID: <202609232130.dFHQBJnP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   df1d75774b1284f7da22ed7db27204f70bb76ba2
commit: df1d75774b1284f7da22ed7db27204f70bb76ba2 [54/54] RDMA/irdma: Free IRQ when CEQ vector mapping fails
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260923/202609232130.dFHQBJnP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609232130.dFHQBJnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609232130.dFHQBJnP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/infiniband/hw/irdma/hw.c: In function 'irdma_cfg_ceq_vector':
>> drivers/infiniband/hw/irdma/hw.c:1261:20: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
    1261 |                 if (status)
         |                    ^
   drivers/infiniband/hw/irdma/hw.c: At top level:
>> drivers/infiniband/hw/irdma/hw.c:1269:9: error: expected identifier or '(' before 'return'
    1269 |         return status;
         |         ^~~~~~
>> drivers/infiniband/hw/irdma/hw.c:1270:1: error: expected identifier or '(' before '}' token
    1270 | }
         | ^
   drivers/infiniband/hw/irdma/hw.c: In function 'irdma_cfg_ceq_vector':
>> drivers/infiniband/hw/irdma/hw.c:1267:9: warning: control reaches end of non-void function [-Wreturn-type]
    1267 |         }
         |         ^


vim +1269 drivers/infiniband/hw/irdma/hw.c

44d9e52977a1b9 Mustafa Ismail     2021-06-02  1214  
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1215  /**
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1216   * irdma_cfg_ceq_vector - set up the msix interrupt vector for
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1217   * ceq
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1218   * @rf: RDMA PCI function
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1219   * @iwceq: ceq associated with the vector
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1220   * @ceq_id: the id number of the iwceq
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1221   * @msix_vec: interrupt vector information
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1222   *
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1223   * Allocate interrupt resources and enable irq handling
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1224   * Return 0 if successful, otherwise return error
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1225   */
2c4b14ea950710 Shiraz Saleem      2022-02-17  1226  static int irdma_cfg_ceq_vector(struct irdma_pci_f *rf, struct irdma_ceq *iwceq,
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1227  				u32 ceq_id, struct irdma_msix_vector *msix_vec)
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1228  {
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1229  	int status;
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1230  
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1231  	if (rf->msix_shared && !ceq_id) {
99f96b4552330d Michal Swiatkowski 2023-03-15  1232  		snprintf(msix_vec->name, sizeof(msix_vec->name) - 1,
99f96b4552330d Michal Swiatkowski 2023-03-15  1233  			 "irdma-%s-AEQCEQ-0", dev_name(&rf->pcidev->dev));
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1234  		tasklet_setup(&rf->dpc_tasklet, irdma_dpc);
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1235  		status = request_irq(msix_vec->irq, irdma_irq_handler, 0,
99f96b4552330d Michal Swiatkowski 2023-03-15  1236  				     msix_vec->name, rf);
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1237  	} else {
99f96b4552330d Michal Swiatkowski 2023-03-15  1238  		snprintf(msix_vec->name, sizeof(msix_vec->name) - 1,
99f96b4552330d Michal Swiatkowski 2023-03-15  1239  			 "irdma-%s-CEQ-%d",
99f96b4552330d Michal Swiatkowski 2023-03-15  1240  			 dev_name(&rf->pcidev->dev), ceq_id);
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1241  		tasklet_setup(&iwceq->dpc_tasklet, irdma_ceq_dpc);
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1242  
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1243  		status = request_irq(msix_vec->irq, irdma_ceq_handler, 0,
99f96b4552330d Michal Swiatkowski 2023-03-15  1244  				     msix_vec->name, iwceq);
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1245  	}
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1246  	cpumask_clear(&msix_vec->mask);
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1247  	cpumask_set_cpu(msix_vec->cpu_affinity, &msix_vec->mask);
fb5bd854710e41 Nitesh Narayan Lal 2021-09-03  1248  	irq_update_affinity_hint(msix_vec->irq, &msix_vec->mask);
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1249  	if (status) {
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1250  		ibdev_dbg(&rf->iwdev->ibdev, "ERR: ceq irq config fail\n");
45225a93ccc01a Shiraz Saleem      2022-02-17  1251  		return status;
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1252  	}
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1253  
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1254  	msix_vec->ceq_id = ceq_id;
df1d75774b1284 Serhat Kumral      2026-09-18  1255  	if (rf->sc_dev.privileged) {
b800e82feba7bd Shiraz Saleem      2025-08-27  1256  		rf->sc_dev.irq_ops->irdma_cfg_ceq(&rf->sc_dev, ceq_id,
b800e82feba7bd Shiraz Saleem      2025-08-27  1257  						  msix_vec->idx, true);
df1d75774b1284 Serhat Kumral      2026-09-18  1258  	} else {
b800e82feba7bd Shiraz Saleem      2025-08-27  1259  		status = irdma_vchnl_req_ceq_vec_map(&rf->sc_dev, ceq_id,
b800e82feba7bd Shiraz Saleem      2025-08-27  1260  						     msix_vec->idx);
df1d75774b1284 Serhat Kumral      2026-09-18 @1261  		if (status)
df1d75774b1284 Serhat Kumral      2026-09-18  1262  			if (rf->msix_shared && !ceq_id)
df1d75774b1284 Serhat Kumral      2026-09-18  1263  				irdma_destroy_irq(rf, msix_vec, rf);
df1d75774b1284 Serhat Kumral      2026-09-18  1264  			else
df1d75774b1284 Serhat Kumral      2026-09-18  1265  				irdma_destroy_irq(rf, msix_vec, iwceq);
df1d75774b1284 Serhat Kumral      2026-09-18  1266  		}
df1d75774b1284 Serhat Kumral      2026-09-18 @1267  	}
df1d75774b1284 Serhat Kumral      2026-09-18  1268  
b800e82feba7bd Shiraz Saleem      2025-08-27 @1269  	return status;
44d9e52977a1b9 Mustafa Ismail     2021-06-02 @1270  }
44d9e52977a1b9 Mustafa Ismail     2021-06-02  1271  

:::::: The code at line 1269 was first introduced by commit
:::::: b800e82feba7bd758f6564975e9f9995866162e3 RDMA/irdma: Add GEN3 support for AEQ and CEQ

:::::: TO: Shiraz Saleem <shiraz.saleem@intel.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
