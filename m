Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8DC1C1F37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732825645; cv=none; b=UAcXx2+dyccYGgVCUrHhdMtMJz1oPUENigUMVnNimkYRugk0OlYx+2LuBqNMOqHcvc9/Jm1BqSF2tqSzule8UKfpp1dyGr1YcyxNKNpv85xILiizGPKti8eGrCHupr8Ehxt9/GMpHgqGfZdn5XKTNSXvdB4/C243HYXIpqGS+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732825645; c=relaxed/simple;
	bh=k4QKNDWiRcP7YULAn/qEDpxOd8/L7vxAoi7HAMaecvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mru3IGIrZIt4ofMkQ5sPO9hbRjoBbhLzL78g921SYX3oVcSGYwhMJTSuHiphvWwsDvz0NJWwIPrNK1nmu7189feCCaFkvDKLCI+8wK5IAulna8nqvR28wnbwaz0U+mphjOZe4nkUM0LKjooGyY93ngwK9/Cnetekyx3hxDbRXMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8geKFQh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8geKFQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732825643; x=1764361643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4QKNDWiRcP7YULAn/qEDpxOd8/L7vxAoi7HAMaecvQ=;
  b=A8geKFQhghSxqYEOrcQHAP6Y4GQDpVm2mXEUkZxX2RWzfe9XZY65K34A
   R2brltBmUmqMf4RRpDb1Mh6DQcCtlTaUn0dA/JmLAoTjXAiE94JY44hlv
   GQeG/lSpVi9Y4CmKvmzGWngNKVBv4Q60jOcf+CCVWoCqKIQWSOA4vI85n
   8QDeWbUQEK4P5ClR0iQjE8y4q+5UG2kQCTqUJ/V1ZcarEDt9U1RkGbAXf
   R5EK3smNT8l2yMNJaPWFVPk39B4NH0iA5bNTwX36wzhE9sQaFSCLwq9zd
   j7Mx39PmzFlUGnwbBg664sMo3topPffSU2TYdn9fw7Eu8EIXJxHxck/RH
   g==;
X-CSE-ConnectionGUID: awqwtL9KRo6Q8IqaUlsOOg==
X-CSE-MsgGUID: HflOyFR+QQeZy/YKTG0YWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20655669"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="20655669"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 12:27:20 -0800
X-CSE-ConnectionGUID: gUXZZ7lQQOSrR37sajPMeQ==
X-CSE-MsgGUID: FqOUTE/QQwa+YVbtDiZPVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="96743957"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2024 12:27:19 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGl6a-0009z1-2F;
	Thu, 28 Nov 2024 20:27:16 +0000
Date: Fri, 29 Nov 2024 04:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1559/1559]
 drivers/platform/mpam/mpam_devices.c:247:32: error: implicit declaration of
 function '__acpi_get_mem_attribute'
Message-ID: <202411290425.MTffltyg-lkp@intel.com>
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
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 3e9e723f3bf92a19e5e15dda89bbb136ce463294 [1559/1559] arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
config: arm64-randconfig-004-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290425.MTffltyg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290425.MTffltyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290425.MTffltyg-lkp@intel.com/

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
   include/linux/spinlock.h:343:24: note: in definition of macro 'spin_lock_init'
     343 |         spinlock_check(_lock);                  \
         |                        ^~~~~
   drivers/platform/mpam/mpam_devices.c:212:38: error: 'struct mpam_msc' has no member named 'mon_sel_lock'; did you mean 'part_sel_lock'?
     212 |                 spin_lock_init(&msc->mon_sel_lock);
         |                                      ^~~~~~~~~~~~
   include/linux/spinlock.h:344:11: note: in definition of macro 'spin_lock_init'
     344 |         *(_lock) = __SPIN_LOCK_UNLOCKED(_lock); \
         |           ^~~~~
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
