Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C75156256
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 05:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725513659; cv=none; b=Jn1DBgAu30uuPSH2DcM+5hTo0VS8vcqiXafFaQYnbjhJ1sa42XYUyLrWl/xqBE8E+T15/81Dhr/eFLaWzsoZ0pyZKWSVOAORL5nuF5JXP8afGKwyqWEAzC3dec9QnFykQSX3zeHlA8v4+OnRrfIVXOpIE4knjJXdF1yw0T73txk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725513659; c=relaxed/simple;
	bh=umojxs7FCABcxsp7OyjdtTAmyz3TVg7WS21v1hGZFxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIh8fpxdWWAIpLAj6Zzc/Xh3VAaQ85L3+5L8NMOwHhGKGX7eLMUDiIUOvafFO2RdMQGk+ZIGiEUspkp2TsBDWqB/4Wtwb5/GVpQAWAHNQBx++Khj9dlDINgjzroO0Ka/l3Rn/vZZ2RhUl6AOcswDUsHj81PbQhkkGxFcCG3mRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fndyr4cF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fndyr4cF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725513658; x=1757049658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=umojxs7FCABcxsp7OyjdtTAmyz3TVg7WS21v1hGZFxQ=;
  b=fndyr4cFNyfL9Ev/JYGIjPcpvX5lPROVL7fLXpgAZzWANFhinCeqe7KX
   dy8jRVYXOuGhRfNGPmbkuWUbORY9Z4RgqkhbQoCxjuw9m/I/H+F4KtcgG
   HtExOtbA6U1cTasRQ0G4n4X0hvgXsmNt1bC1+cQNLa9zTPMmPhBrDUwnp
   oL0tk/jIxX/AHN5HXS3IdzIaruUhMsBH+MsewgKZkL75vswPgrXEsEA4R
   CSce4Al7LMJNyC3un0m1Qxn/FzkcqAQV5CjH+rw/80BxbNAjHl9qi2azV
   jF4CT8hrKOOufxhu1HTa3/zNKoMvGiAZVPE0r1O2A86/NaRGOdYrixljo
   Q==;
X-CSE-ConnectionGUID: j+ExUhuNQqawQLu+nBhZbQ==
X-CSE-MsgGUID: 6hzRps7CTGGq0L8PKUL3xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="46734699"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="46734699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 22:20:57 -0700
X-CSE-ConnectionGUID: l9gfc784QBOebBpNFiIpvg==
X-CSE-MsgGUID: vqbbonNLTUWoJhI0X2jdlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="65341617"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2024 22:20:55 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm4vN-0008xh-0Q;
	Thu, 05 Sep 2024 05:20:53 +0000
Date: Thu, 5 Sep 2024 13:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2700/13861]
 drivers/platform/mpam/mpam_devices.c:247:32: error: implicit declaration of
 function '__acpi_get_mem_attribute'
Message-ID: <202409051300.VBHKGPkR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   392f26f46bac569be21dbe2b3ca67641e02cb148
commit: 3e9e723f3bf92a19e5e15dda89bbb136ce463294 [2700/13861] arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
config: arm64-randconfig-004-20240905 (https://download.01.org/0day-ci/archive/20240905/202409051300.VBHKGPkR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051300.VBHKGPkR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409051300.VBHKGPkR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/platform/mpam/mpam_devices.c:6:
   drivers/platform/mpam/mpam_devices.c: In function 'mpam_msc_drv_probe':
   drivers/platform/mpam/mpam_devices.c:212:38: error: 'struct mpam_msc' has no member named 'mon_sel_lock'; did you mean 'part_sel_lock'?
     212 |                 spin_lock_init(&msc->mon_sel_lock);
         |                                      ^~~~~~~~~~~~
   include/linux/spinlock.h:335:45: note: in definition of macro 'spin_lock_init'
     335 |         __raw_spin_lock_init(spinlock_check(lock),              \
         |                                             ^~~~
>> drivers/platform/mpam/mpam_devices.c:247:32: error: implicit declaration of function '__acpi_get_mem_attribute' [-Wimplicit-function-declaration]
     247 |                         prot = __acpi_get_mem_attribute(msc->pcc_chan->shmem_base_addr);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/mpam/mpam_devices.c:247:32: error: incompatible types when assigning to type 'pgprot_t' from type 'int'


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
 > 212			spin_lock_init(&msc->mon_sel_lock);
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
