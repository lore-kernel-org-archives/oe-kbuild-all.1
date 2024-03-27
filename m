Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCF36F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 05:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711515859; cv=none; b=CYmKimsWC3J7yMmHlWeEpFxUPzpz6OZXQZG52xRej4wUN2V0o5UoqPgE01kRMBC5FxTgCiUyg3Ji47UsEEhSZfkQLuE477txmltji2eFjDPEVQZjoIPtgYBo5xlmEXC2s1i9wwuI8ZmFRoPPVAy1JpDNivxu/NkCyFLqwFovTrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711515859; c=relaxed/simple;
	bh=om1pLU42e84ExumzSoCZJQerWqmrdts0t5PQQbfE3T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FlPdNPCzf0yjdvah9zH8Al5keIsWPWKs4qgVzLjPzQKf7D149SIdtlYpGn1LPiVu1F1RgI9NfAyGCLj8fCp8/36iuEntPLG02q26H9FfzAjaY5Pxv5stcWr/OLAKnHUHuznN60yXTfyHiMkqtlOMq0to6XP7QW7MxSUXvKgJGAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ldpkhb70; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ldpkhb70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711515857; x=1743051857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=om1pLU42e84ExumzSoCZJQerWqmrdts0t5PQQbfE3T8=;
  b=Ldpkhb70UDjM2keUaXhG8hifnrezRHFCRHPJ0IP6QBnUtsLXSuyptFNC
   YDJMj3nUjABNGC7SypPOBfadEFhVksPI00r31gtq6MVfcGRjvaXNY3ckR
   ApR7qUF37+lh38lNaZyZ1cJ2E5/sZOAYd0yZ1k9dPDOSsvrFR5ovAx+AN
   aX3P/DY/QOHIa+wjvNeEHkSAk+ayXxncCh4b8sZlkN9zTfduXy8VLbgkW
   5+J61byZ7jL4dHhFM+akMJRsQ0wT1+S9ChIUw3aVlDytLWeLAe8/RGQiU
   j04jkwMYRSDMqwTafXwm6XsmENEueSq/keBabGnvAflEMu9K4fks4fcFm
   Q==;
X-CSE-ConnectionGUID: njIfEtF7SxSyAp4JiaT2Tw==
X-CSE-MsgGUID: EvFogzY/SgeCBAbEVO3HNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6535454"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6535454"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 22:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="53643682"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Mar 2024 22:04:14 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpLSN-0000le-2d;
	Wed, 27 Mar 2024 05:04:11 +0000
Date: Wed, 27 Mar 2024 13:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2698/6883]
 drivers/platform/mpam/mpam_devices.c:247:11: error: call to undeclared
 function '__acpi_get_mem_attribute'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202403271231.DndRjPnH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ce3022885cff9ed62573d5866dee9e8f42756b4d
commit: 3e9e723f3bf92a19e5e15dda89bbb136ce463294 [2698/6883] arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
config: arm64-randconfig-002-20240327 (https://download.01.org/0day-ci/archive/20240327/202403271231.DndRjPnH-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271231.DndRjPnH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271231.DndRjPnH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/mpam/mpam_devices.c:212:24: error: no member named 'mon_sel_lock' in 'struct mpam_msc'; did you mean 'part_sel_lock'?
                   spin_lock_init(&msc->mon_sel_lock);
                                        ^~~~~~~~~~~~
                                        part_sel_lock
   include/linux/spinlock.h:335:38: note: expanded from macro 'spin_lock_init'
           __raw_spin_lock_init(spinlock_check(lock),              \
                                               ^
   drivers/platform/mpam/mpam_internal.h:43:14: note: 'part_sel_lock' declared here
           spinlock_t              part_sel_lock;
                                   ^
>> drivers/platform/mpam/mpam_devices.c:247:11: error: call to undeclared function '__acpi_get_mem_attribute'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           prot = __acpi_get_mem_attribute(msc->pcc_chan->shmem_base_addr);
                                  ^
>> drivers/platform/mpam/mpam_devices.c:247:9: error: assigning to 'pgprot_t' from incompatible type 'int'
                           prot = __acpi_get_mem_attribute(msc->pcc_chan->shmem_base_addr);
                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
