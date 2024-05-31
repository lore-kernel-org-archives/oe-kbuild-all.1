Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0A31103
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 20:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717187419; cv=none; b=k4ls5/8s/Sqrt7AOWJTbmkLDIdsnCkziW321OOxQeyYC5OPrdCZP1bqPy0yaPuS507QKc++1tiaqvBQdD8N//fukOLwWAw/5gwp8ZOydvkmohZAeJrT7BJCauJjC2aLy67+RcljU8Wf1bvgSewMmh/4KIrw+khx98/DvsVsCv00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717187419; c=relaxed/simple;
	bh=+64pzKin0YdNzNo3VqqG6k8qQm+/atrCttaoeSV7N3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UG8Sf3AXZo9IQsokHrzq0UO5KtkDdMwiucmSdBTqSQykZP3SvubyAUwz2kcIqDCcVh8RST209beYY1jYg/H4HpDJfuGrvtnaMRn1oXRd4dWGoo7aZBSBn6DY1FBq/bFeN29+xjocN6OfZ/3LSr2ptzOK2lKm/lLMDtOo9T0zBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7OnDW8c; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7OnDW8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717187417; x=1748723417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+64pzKin0YdNzNo3VqqG6k8qQm+/atrCttaoeSV7N3A=;
  b=G7OnDW8cLcFwGGDr2aVNemUOx895g3dk00KPQv53rsDIHJxXBTQnGMof
   jAT/8A9UbClzpfaqj7tGayTxFt8smrN3wXmk97CdVcMZXMdg8KBpmMXW+
   IMM3VOCBmxmQs+Ax7vzXEe+Xed9IMiWBlsByNsi4u9T79cM0E4UwZoIKk
   Ye6pev/Rb9H3BN9ZYh2YLZSMhd55Bsq5c3m57fazqDBcpM4VLMochRVWL
   U8npXBjGdv+jqwJj4ZsuUKAy6nnuNEOAEHj4t2CvoV8W9rDEvjGznIO7D
   0Cetsf3zm6bnCxhLQ+OZQhzhu/VvagdCYXArJx3+3uJHf7CGs3aTr/vNH
   A==;
X-CSE-ConnectionGUID: pGIXYPrLQU2id3kwtpnCVQ==
X-CSE-MsgGUID: aLuURKhBREmWmAC863pNXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17544898"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="17544898"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 13:30:16 -0700
X-CSE-ConnectionGUID: mE+Rr5DZS6KJA3ca0THaIg==
X-CSE-MsgGUID: RCALAIdUSgSrfVLNVXnGIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="40711148"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 13:30:15 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD8tA-000Hmt-2j;
	Fri, 31 May 2024 20:30:12 +0000
Date: Sat, 1 Jun 2024 04:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2700/9806]
 drivers/platform/mpam/mpam_devices.c:247:11: error: call to undeclared
 function '__acpi_get_mem_attribute'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202406010419.AVhJIZza-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   735f0ab7121a98dd501241bd147c5c95e6e0b38c
commit: 3e9e723f3bf92a19e5e15dda89bbb136ce463294 [2700/9806] arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
config: arm64-randconfig-002-20240601 (https://download.01.org/0day-ci/archive/20240601/202406010419.AVhJIZza-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010419.AVhJIZza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010419.AVhJIZza-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/mpam/mpam_devices.c:212:24: error: no member named 'mon_sel_lock' in 'struct mpam_msc'; did you mean 'part_sel_lock'?
     212 |                 spin_lock_init(&msc->mon_sel_lock);
         |                                      ^~~~~~~~~~~~
         |                                      part_sel_lock
   include/linux/spinlock.h:335:38: note: expanded from macro 'spin_lock_init'
     335 |         __raw_spin_lock_init(spinlock_check(lock),              \
         |                                             ^
   drivers/platform/mpam/mpam_internal.h:43:14: note: 'part_sel_lock' declared here
      43 |         spinlock_t              part_sel_lock;
         |                                 ^
>> drivers/platform/mpam/mpam_devices.c:247:11: error: call to undeclared function '__acpi_get_mem_attribute'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     247 |                         prot = __acpi_get_mem_attribute(msc->pcc_chan->shmem_base_addr);
         |                                ^
   drivers/platform/mpam/mpam_devices.c:247:9: error: assigning to 'pgprot_t' from incompatible type 'int'
     247 |                         prot = __acpi_get_mem_attribute(msc->pcc_chan->shmem_base_addr);
         |                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/__acpi_get_mem_attribute +247 drivers/platform/mpam/mpam_devices.c

   170	
   171	static int mpam_msc_drv_probe(struct platform_device *pdev)
   172	{
   173		int err;
   174		pgprot_t prot;
   175		void * __iomem io;
   176		struct mpam_msc *msc;
   177		struct resource *msc_res;
   178		void *plat_data = pdev->dev.platform_data;
   179	
   180		mutex_lock(&mpam_list_lock);
   181		do {
   182			msc = devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
   183			if (!msc) {
   184				err = -ENOMEM;
   185				break;
   186			}
   187	
   188			INIT_LIST_HEAD_RCU(&msc->glbl_list);
   189			msc->pdev = pdev;
   190	
   191			err = device_property_read_u32(&pdev->dev, "arm,not-ready-us",
   192						       &msc->nrdy_usec);
   193			if (err) {
   194				/* This will prevent CSU monitors being usable */
   195				msc->nrdy_usec = 0;
   196			}
   197	
   198			err = get_msc_affinity(msc);
   199			if (err)
   200				break;
   201			if (cpumask_empty(&msc->accessibility)) {
   202				pr_err_once("msc:%u is not accessible from any CPU!",
   203					    msc->id);
   204				err = -EINVAL;
   205				break;
   206			}
   207	
   208			mutex_init(&msc->lock);
   209			msc->id = mpam_num_msc++;
   210			INIT_LIST_HEAD_RCU(&msc->ris);
   211			spin_lock_init(&msc->part_sel_lock);
   212			spin_lock_init(&msc->mon_sel_lock);
   213	
   214			if (device_property_read_u32(&pdev->dev, "pcc-channel",
   215						     &msc->pcc_subspace_id))
   216				msc->iface = MPAM_IFACE_MMIO;
   217			else
   218				msc->iface = MPAM_IFACE_PCC;
   219	
   220			if (msc->iface == MPAM_IFACE_MMIO) {
   221				io = devm_platform_get_and_ioremap_resource(pdev, 0,
   222									    &msc_res);
   223				if (IS_ERR(io)) {
   224					pr_err("Failed to map MSC base address\n");
   225					devm_kfree(&pdev->dev, msc);
   226					err = PTR_ERR(io);
   227					break;
   228				}
   229				msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
   230				msc->mapped_hwpage = io;
   231			} else if (msc->iface == MPAM_IFACE_PCC) {
   232				msc->pcc_cl.dev = &pdev->dev;
   233				msc->pcc_cl.rx_callback = mpam_pcc_rx_callback;
   234				msc->pcc_cl.tx_block = false;
   235				msc->pcc_cl.tx_tout = 1000; /* 1s */
   236				msc->pcc_cl.knows_txdone = false;
   237	
   238				msc->pcc_chan = pcc_mbox_request_channel(&msc->pcc_cl,
   239									 msc->pcc_subspace_id);
   240				if (IS_ERR(msc->pcc_chan)) {
   241					pr_err("Failed to request MSC PCC channel\n");
   242					devm_kfree(&pdev->dev, msc);
   243					err = PTR_ERR(msc->pcc_chan);
   244					break;
   245				}
   246	
 > 247				prot = __acpi_get_mem_attribute(msc->pcc_chan->shmem_base_addr);
   248				io = ioremap_prot(msc->pcc_chan->shmem_base_addr,
   249						  msc->pcc_chan->shmem_size, pgprot_val(prot));
   250				if (IS_ERR(io)) {
   251					pr_err("Failed to map MSC base address\n");
   252					pcc_mbox_free_channel(msc->pcc_chan);
   253					devm_kfree(&pdev->dev, msc);
   254					err = PTR_ERR(io);
   255					break;
   256				}
   257	
   258				/* TODO: issue a read to update the registers */
   259	
   260				msc->mapped_hwpage_sz = msc->pcc_chan->shmem_size;
   261				msc->mapped_hwpage = io + sizeof(struct acpi_pcct_shared_memory);
   262			}
   263	
   264			list_add_rcu(&msc->glbl_list, &mpam_all_msc);
   265			platform_set_drvdata(pdev, msc);
   266		} while (0);
   267		mutex_unlock(&mpam_list_lock);
   268	
   269		if (!err) {
   270			/* Create RIS entries described by firmware */
   271			if (!acpi_disabled)
   272				err = acpi_mpam_parse_resources(msc, plat_data);
   273			else
   274				err = mpam_dt_parse_resources(msc, plat_data);
   275		}
   276	
   277		if (!err && fw_num_msc == mpam_num_msc)
   278			mpam_discovery_complete();
   279	
   280		return err;
   281	}
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
