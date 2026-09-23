Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D50441F357
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 21:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198039; cv=none; b=Y/mdyQ7LNOcFzBfkKQadATe9kD/HNWDzSTteMqQRY/hmSqPw0rY1kHeu+GKc531sy95xtPWR9txZ7HQF3wwdfQvgsbOD9Gt67xX2MOANL6C0pfz1aGbeDLNxXJ59mKG4NL8A+MjlgQXRbiVJqCKkSUbsRhvAu1tR17DHHzgUx8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198039; c=relaxed/simple;
	bh=WNZ6gSvs2lS7IUVc6h/s3qsq/haXaTcNarXWlCKMahw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jeDITpIH3MoN+aWjnAiKnGw/lVMAYAnnyIVDLhvVtaNFrQ4MS6lnHrr9AeOKkdfZW7fJ4qXvJ3P5DoGkTvQ5o1q9NyeEiPqNXpngheLFmVFAcvS7wMbA6PzPk8VF2j2C4MVG89gT0xGwxZulYZM5vN5XgTy9GRJolBG4g8owhtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CibadA91; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CibadA91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790198036; x=1821734036;
  h=date:from:to:cc:subject:message-id;
  bh=WNZ6gSvs2lS7IUVc6h/s3qsq/haXaTcNarXWlCKMahw=;
  b=CibadA91YyJGdbFFEMT1dDcXgpgUwiq4OcwHhMSlKuUwE1Eu4UtP4WA7
   966Zd3yKyQ1H5N3et2vQJrBHE/eEVrtLTRGoz8S40QBRcCwRuah8T9+U9
   v0g7AKj4jV9U1s3ROhFru0Oc2vh9xbYpKXDuW/bIHXVVvDgqVQvmCHDO3
   dzKXhEE3yx8hbF3BULIJrB35P450Tha3ZvtsuOwpCJPol0Un5ErzWnsjK
   WLHhDQ5YYTPxCjTF031fjyyEVM+tgJhOToC8QY8IwIIWFbWENAKqwcINB
   IVXdDm36a3rlGGbxUVwyAoyy3qKFv6aC7NW1vjrSGXhVQdHT0qq0iNfPm
   g==;
X-CSE-ConnectionGUID: irOyat+8SB238VeSIE8c7g==
X-CSE-MsgGUID: GB3fM3A8RlSzbSS3F8mY8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="108433729"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="108433729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:13:54 -0700
X-CSE-ConnectionGUID: Yz6TDsBaQQeikUrBIm10cA==
X-CSE-MsgGUID: GqgUnJROS5GOY7/RMEjNqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273262187"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2026 14:13:52 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9UHn-0000000003K-0WAs;
	Wed, 23 Sep 2026 21:13:51 +0000
Date: Wed, 23 Sep 2026 23:13:35 +0200
From: kernel test robot <lkp@intel.com>
To: Serhat Kumral <serhatkumral1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [rdma-rdma:wip/leon-for-next 54/54]
 drivers/infiniband/hw/irdma/hw.c:1264:4: warning: add explicit braces to
 avoid dangling else
Message-ID: <202609232309.mkq5SIuB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   df1d75774b1284f7da22ed7db27204f70bb76ba2
commit: df1d75774b1284f7da22ed7db27204f70bb76ba2 [54/54] RDMA/irdma: Free IRQ when CEQ vector mapping fails
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260923/202609232309.mkq5SIuB-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609232309.mkq5SIuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609232309.mkq5SIuB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/irdma/hw.c:1264:4: warning: add explicit braces to avoid dangling else [-Wdangling-else]
    1264 |                         else
         |                         ^
>> drivers/infiniband/hw/irdma/hw.c:1267:2: warning: non-void function does not return a value in all control paths [-Wreturn-type]
    1267 |         }
         |         ^
   drivers/infiniband/hw/irdma/hw.c:1269:2: error: expected identifier or '('
    1269 |         return status;
         |         ^
   drivers/infiniband/hw/irdma/hw.c:1270:1: error: extraneous closing brace ('}')
    1270 | }
         | ^
   2 warnings and 2 errors generated.


vim +1264 drivers/infiniband/hw/irdma/hw.c

  1214	
  1215	/**
  1216	 * irdma_cfg_ceq_vector - set up the msix interrupt vector for
  1217	 * ceq
  1218	 * @rf: RDMA PCI function
  1219	 * @iwceq: ceq associated with the vector
  1220	 * @ceq_id: the id number of the iwceq
  1221	 * @msix_vec: interrupt vector information
  1222	 *
  1223	 * Allocate interrupt resources and enable irq handling
  1224	 * Return 0 if successful, otherwise return error
  1225	 */
  1226	static int irdma_cfg_ceq_vector(struct irdma_pci_f *rf, struct irdma_ceq *iwceq,
  1227					u32 ceq_id, struct irdma_msix_vector *msix_vec)
  1228	{
  1229		int status;
  1230	
  1231		if (rf->msix_shared && !ceq_id) {
  1232			snprintf(msix_vec->name, sizeof(msix_vec->name) - 1,
  1233				 "irdma-%s-AEQCEQ-0", dev_name(&rf->pcidev->dev));
  1234			tasklet_setup(&rf->dpc_tasklet, irdma_dpc);
  1235			status = request_irq(msix_vec->irq, irdma_irq_handler, 0,
  1236					     msix_vec->name, rf);
  1237		} else {
  1238			snprintf(msix_vec->name, sizeof(msix_vec->name) - 1,
  1239				 "irdma-%s-CEQ-%d",
  1240				 dev_name(&rf->pcidev->dev), ceq_id);
  1241			tasklet_setup(&iwceq->dpc_tasklet, irdma_ceq_dpc);
  1242	
  1243			status = request_irq(msix_vec->irq, irdma_ceq_handler, 0,
  1244					     msix_vec->name, iwceq);
  1245		}
  1246		cpumask_clear(&msix_vec->mask);
  1247		cpumask_set_cpu(msix_vec->cpu_affinity, &msix_vec->mask);
  1248		irq_update_affinity_hint(msix_vec->irq, &msix_vec->mask);
  1249		if (status) {
  1250			ibdev_dbg(&rf->iwdev->ibdev, "ERR: ceq irq config fail\n");
  1251			return status;
  1252		}
  1253	
  1254		msix_vec->ceq_id = ceq_id;
  1255		if (rf->sc_dev.privileged) {
  1256			rf->sc_dev.irq_ops->irdma_cfg_ceq(&rf->sc_dev, ceq_id,
  1257							  msix_vec->idx, true);
  1258		} else {
  1259			status = irdma_vchnl_req_ceq_vec_map(&rf->sc_dev, ceq_id,
  1260							     msix_vec->idx);
  1261			if (status)
  1262				if (rf->msix_shared && !ceq_id)
  1263					irdma_destroy_irq(rf, msix_vec, rf);
> 1264				else
  1265					irdma_destroy_irq(rf, msix_vec, iwceq);
  1266			}
> 1267		}
  1268	
  1269		return status;
  1270	}
  1271	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
