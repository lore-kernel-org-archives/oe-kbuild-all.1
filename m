Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441CB624
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 03:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680663717; x=1712199717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9s+Q+Nb0WFHTroeIwCH7jv29dSKDpl6s8c89nd3giM=;
  b=l11eKxcgVY1dRNHKS1P+hl3keJqX1QeAZpp0hFLionaQFSeLTlQCq8Jc
   KmlzJr0bceWEx5nonCE2NXmbMxnLnSuqhxBevBrRzVWLtfKLFaWpa0a+Y
   +VGoVfsM5c/SFQk4SrMGQTLfy1IrMGMZdijnW0iofb6avB67Wvb4tEXJ0
   iU+H0aPLiRT5MItWpHEhkLkKMB6KYHA7KPJkK23KqkGFys2r7Hli27ZhS
   jdBfQWlHx+9wek107pQ2N48OF9mFU4/L1wojBORZOHSYIz/CtQNV+IcM9
   T6jZguZkqyfnsxIOFcPYFIRo0qY/5e4LXv39bN7RwElxYu25n5vbkdqdA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="330955581"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="330955581"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 20:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="719162941"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="719162941"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Apr 2023 20:01:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjtPF-000QDu-30;
	Wed, 05 Apr 2023 03:01:53 +0000
Date: Wed, 5 Apr 2023 11:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yihang Li <liyihang9@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Xiang Chen <chenxiang66@hislicon.com>
Subject: [linux-next:master 8111/9010]
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:5143:39: error: 'struct dev_pm_info'
 has no member named 'usage_count'
Message-ID: <202304051046.WgcGP2Ga-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a53bda3aaf3de5edeea27d0b1d8781d067640b6
commit: e368d38cb9524415ceb5b2b54a0dacdfb9f73b6c [8111/9010] scsi: hisi_sas: Exit suspend state when usage count is greater than 0
config: ia64-buildonly-randconfig-r002-20230403 (https://download.01.org/0day-ci/archive/20230405/202304051046.WgcGP2Ga-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e368d38cb9524415ceb5b2b54a0dacdfb9f73b6c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e368d38cb9524415ceb5b2b54a0dacdfb9f73b6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051046.WgcGP2Ga-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c: In function '_suspend_v3_hw':
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:5143:39: error: 'struct dev_pm_info' has no member named 'usage_count'
    5143 |         if (atomic_read(&device->power.usage_count)) {
         |                                       ^


vim +5143 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

  5118	
  5119	static int _suspend_v3_hw(struct device *device)
  5120	{
  5121		struct pci_dev *pdev = to_pci_dev(device);
  5122		struct sas_ha_struct *sha = pci_get_drvdata(pdev);
  5123		struct hisi_hba *hisi_hba = sha->lldd_ha;
  5124		struct device *dev = hisi_hba->dev;
  5125		struct Scsi_Host *shost = hisi_hba->shost;
  5126		int rc;
  5127	
  5128		if (!pdev->pm_cap) {
  5129			dev_err(dev, "PCI PM not supported\n");
  5130			return -ENODEV;
  5131		}
  5132	
  5133		if (test_and_set_bit(HISI_SAS_RESETTING_BIT, &hisi_hba->flags))
  5134			return -1;
  5135	
  5136		dev_warn(dev, "entering suspend state\n");
  5137	
  5138		scsi_block_requests(shost);
  5139		set_bit(HISI_SAS_REJECT_CMD_BIT, &hisi_hba->flags);
  5140		flush_workqueue(hisi_hba->wq);
  5141		interrupt_disable_v3_hw(hisi_hba);
  5142	
> 5143		if (atomic_read(&device->power.usage_count)) {
  5144			dev_err(dev, "PM suspend: host status cannot be suspended\n");
  5145			rc = -EBUSY;
  5146			goto err_out;
  5147		}
  5148	
  5149		rc = disable_host_v3_hw(hisi_hba);
  5150		if (rc) {
  5151			dev_err(dev, "PM suspend: disable host failed rc=%d\n", rc);
  5152			goto err_out_recover_host;
  5153		}
  5154	
  5155		hisi_sas_init_mem(hisi_hba);
  5156	
  5157		hisi_sas_release_tasks(hisi_hba);
  5158	
  5159		sas_suspend_ha(sha);
  5160	
  5161		dev_warn(dev, "end of suspending controller\n");
  5162		return 0;
  5163	
  5164	err_out_recover_host:
  5165		enable_host_v3_hw(hisi_hba);
  5166	err_out:
  5167		interrupt_enable_v3_hw(hisi_hba);
  5168		clear_bit(HISI_SAS_REJECT_CMD_BIT, &hisi_hba->flags);
  5169		clear_bit(HISI_SAS_RESETTING_BIT, &hisi_hba->flags);
  5170		scsi_unblock_requests(shost);
  5171		return rc;
  5172	}
  5173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
