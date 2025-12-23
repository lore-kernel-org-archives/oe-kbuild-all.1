Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD132E686
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484249; cv=none; b=LUssed0qIlPyPoXP1IHlef9asXDSyVLO94NTz74OGvJSoKl7Fwc07Kjd2+iWrQgEwsDbL8vBDCBnMu5CLhcytmO4ZO0rMMbm0ezvB5wUVPBe979erCVFqB481dVCsJ0dS263ryoJhBrbVEjZxc6wHn8Gz163ioFADvfQKQNO/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484249; c=relaxed/simple;
	bh=zrgYu33y/QE3FfIk1pTzM1zfycRPEsBf11oRbR2+8xY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FRmMF8mrOIBMxTenVWXwXxQRtCFT715DzaX1iRBci41snpeHjmozCjA9C2r4NW6KIpkfZ/5HpVegujsnXuDvuTzDSrZJU1EbSOrNJXrvLOthRwvLdL+sTNrztcklEDbML22vjmbxhZ5DP2Xj7RQOBwsN4SyuT/k5AS0F9IRi9sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkgTr0tm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkgTr0tm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766484248; x=1798020248;
  h=date:from:to:cc:subject:message-id;
  bh=zrgYu33y/QE3FfIk1pTzM1zfycRPEsBf11oRbR2+8xY=;
  b=YkgTr0tmHZoMqETEAX1vHAunpTIlTvpm76Nqh7Ntys6+TKa+tDYtbM1o
   oQwT2GX2hLAGbN1ib94CZW9WhdLMDYclW+rjh3MOSmMlKuLS0bMNssMxX
   i6Z5XPu0e+A5I2CCeTC6GVn17bR+feXqpl5gQIR9Tj/oYCpDIOm4nldka
   mn6jeSwigIR5qWOKcT+Y11fWv2hZ4sLjSfOmcXOTlFfadKhJLHUjkZiLV
   hbgWADKFArDhNogK6vK9+8AaB4quqZnhGYdJNNOs2NE74S+5799bCcNhP
   7pIpgl4h5U2X9JnAesHlY/JkOB3WrANcXRDUx6tQo5RrsuABzEU3xwzfx
   g==;
X-CSE-ConnectionGUID: oUZpE6s5SwiGnc+ulV9WJA==
X-CSE-MsgGUID: fEspia6+TSqbNe4c2tz+lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68270543"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68270543"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 02:04:06 -0800
X-CSE-ConnectionGUID: kldXEc1yR6uTkcba5Pz6uQ==
X-CSE-MsgGUID: ebARti8tSmKr/vy5KQLX+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="198986347"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2025 02:04:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXzFJ-000000001il-1eLN;
	Tue, 23 Dec 2025 10:04:01 +0000
Date: Tue, 23 Dec 2025 18:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2/2]
 drivers/platform/mpam/mpam_devices.c:247:11: error: implicit declaration of
 function '__acpi_get_mem_attribute'
Message-ID: <202512231755.XRc0hf4e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi James,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: 3e9e723f3bf92a19e5e15dda89bbb136ce463294 [2/2] arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
config: arm64-randconfig-004-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231755.XRc0hf4e-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231755.XRc0hf4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231755.XRc0hf4e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/platform/mpam/mpam_devices.c:6:
   drivers/platform/mpam/mpam_devices.c: In function 'mpam_msc_drv_probe':
   drivers/platform/mpam/mpam_devices.c:212:24: error: 'struct mpam_msc' has no member named 'mon_sel_lock'; did you mean 'part_sel_lock'?
     212 |   spin_lock_init(&msc->mon_sel_lock);
         |                        ^~~~~~~~~~~~
   include/linux/spinlock.h:335:38: note: in definition of macro 'spin_lock_init'
     335 |  __raw_spin_lock_init(spinlock_check(lock),  \
         |                                      ^~~~
>> drivers/platform/mpam/mpam_devices.c:247:11: error: implicit declaration of function '__acpi_get_mem_attribute' [-Werror=implicit-function-declaration]
     247 |    prot = __acpi_get_mem_attribute(msc->pcc_chan->shmem_base_addr);
         |           ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/mpam/mpam_devices.c:247:11: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'
   cc1: some warnings being treated as errors


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
