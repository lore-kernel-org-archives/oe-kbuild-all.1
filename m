Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EF438385
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713251315; cv=none; b=IGbQTiHrHaPXlK68N8sA7ZkRqWVl5RfY6otyOYDuz3ftTlnSawt86Gh0i4bpqn9CRWkri/kQNCRwOTA/pWTcS9HUgQbvRnRaavw06apMCqtBybpFEfpX9z0Ju5vw1+r+VEQd3ir1Kn3C75CthFQXI0qPh7gRCRz5ZY3g/ZTqpg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713251315; c=relaxed/simple;
	bh=VbtCv9uj29+mVvc8X/WIM1COTuA5NkrVwnb067/u2vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMUpQHd30/9U0vjKOnA4a5kIhimOyXsM0nXVPC0abM/XJ5kI1V3IwhqBRNfLIRtpiweYjZgbXkIY0FTRejXOnxOdrrY4+6wnNIWG4gK8vH/zXIenmeby8/79RGqPTO9x0zKfGt91ZAYGxRTVt7dr2gB3yAgxYx3gAQD0dUJ88zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TK755ZVW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TK755ZVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713251311; x=1744787311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VbtCv9uj29+mVvc8X/WIM1COTuA5NkrVwnb067/u2vo=;
  b=TK755ZVWKv8RBmspob7Z42eBNT0H6dRVSWsfyaQajqdzMBmmoalKvIaz
   wRHHT0iOweaR0SBJasvxnRUIaWj16iFBmhfAGpi/x59AOObKLzcLtgi8G
   c+CIKvJXI+fFyMwQ0+jhkkAMEFLSKmvKrg3822yk1wwW2YAK2sSemoQRI
   3z1QCDPWFyl9nT8fT4FxOcZjrbm1+HW8Yw5Pou05FsJznVfCRprCtzlaK
   9PFplno4kurQTCOCwGv/qIBHlGjcKpYRiQZwLHXEi6NDBViws602MYdcP
   /CMQkFOATV011ZpIbTAtpDU1j+opJpItTZLhqHs2t8Gy/JwAgFoaVC2Ee
   g==;
X-CSE-ConnectionGUID: lnG/fVreSlSEXLlGa+o7MQ==
X-CSE-MsgGUID: dgJOpZEjSnOCFulHRtW/pQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8799063"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8799063"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:07:04 -0700
X-CSE-ConnectionGUID: 7cyyEsgKRUqUOYHKWSPOvw==
X-CSE-MsgGUID: 8+H5/Cw7Q8mEWa8OJ0XDjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22578568"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 16 Apr 2024 00:07:03 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwcuD-00051k-0s;
	Tue, 16 Apr 2024 07:07:01 +0000
Date: Tue, 16 Apr 2024 15:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2699/7415]
 drivers/platform/mpam/mpam_devices.c:247:11: error: implicit declaration of
 function '__acpi_get_mem_attribute' is invalid in C99
Message-ID: <202404161519.aROKO5WS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e053d517d2275e5ae3f8e80d96fa0bb1727c60a8
commit: 3e9e723f3bf92a19e5e15dda89bbb136ce463294 [2699/7415] arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
config: arm64-randconfig-r061-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161519.aROKO5WS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161519.aROKO5WS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161519.aROKO5WS-lkp@intel.com/

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
>> drivers/platform/mpam/mpam_devices.c:247:11: error: implicit declaration of function '__acpi_get_mem_attribute' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           prot = __acpi_get_mem_attribute(msc->pcc_chan->shmem_base_addr);
                                  ^
   drivers/platform/mpam/mpam_devices.c:247:9: error: assigning to 'pgprot_t' from incompatible type 'int'
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
