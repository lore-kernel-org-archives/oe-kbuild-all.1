Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98872C9D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 03:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735700946; cv=none; b=hWOtpgVX5at6OK0p0pcz0w+qg6BA1aezN77J1jb58LvdmzxUPXNtv/ZDdw7o8Ger294gM7ig5XcOc/ZVN/clCnCWoXVAxAeIjZvhbGUP2AeOgeTmo/WifzQET4xs9eyVPQf6i3NJwnG9kPaLeLG4Evj6DaZD+BHawDjWsQs+lOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735700946; c=relaxed/simple;
	bh=3Umf46jwHNYLshPgl/rt20DNjrvuDLphFMF7+rRf7KM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVVKfEwix89E3Hv/58cqwWEdWn/Pbd/578LmHAeHdkNo2sm73ivb951P+uj7X47q3HqdG51nVPEjajVarkEp9jX2gATp+f+GUWivivnyr9DvC7Z0mcN94k/M+kBhCOng5CbjnOzMgWRkxASAgONGqQjUh1h98EDThgKqhElkhpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NK1tHKin; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NK1tHKin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735700943; x=1767236943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Umf46jwHNYLshPgl/rt20DNjrvuDLphFMF7+rRf7KM=;
  b=NK1tHKinlxbK9A/kKRnseHKJXvk8ylzyC5uk/aTB1KTNgRBj+wxwltiS
   D97llrB2lmBfJDR2G0KbWbSwDG+m8XrUqhzIP0pD0F7cq2o1eDytOIRjT
   g0/B/uNc8XFrygK4NznNOEPTqKgGMbeTr8j3GVUILdIyNKDyY3Stu+mT7
   L4KVJovfeCQ5n+NfuW/s+LM/HIAZPE8j1YWSbG5aRD7s6EUPdDjDhLvVI
   SVEAm8opMkQGceFnIchFqmTeqjRe1RHADHnWD4/A2nhaDT2YkGuqNYMwW
   hXRiMNBsusKV/7JITJQadiW+jFvlQElyoR4F+MyJpaJvcYCi7emjIX+1W
   A==;
X-CSE-ConnectionGUID: 6aFFzi5qQNOMH9Xkh3kYlg==
X-CSE-MsgGUID: W+6g7BukQ6mRr5INJYQyZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47382891"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="47382891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 19:09:02 -0800
X-CSE-ConnectionGUID: hkrGVa4DRSCnw50W5CAwkQ==
X-CSE-MsgGUID: X1EBpek2Tt2O1/y4zhsltw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106232690"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Dec 2024 19:09:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSp6Q-0007ax-1o;
	Wed, 01 Jan 2025 03:08:58 +0000
Date: Wed, 1 Jan 2025 11:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Suganath Prabu S <suganath-prabu.subramani@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:2830:68: warning: '%d' directive
 output may be truncated writing between 1 and 3 bytes into a region of size
 between 1 and 26
Message-ID: <202501011117.gx48tad9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 728bbc6cbff70051813730fb7977f5d99d867e12 scsi: mpt3sas: Affinity high iops queues IRQs to local node
date:   6 years ago
config: x86_64-randconfig-a013-20211029 (https://download.01.org/0day-ci/archive/20250101/202501011117.gx48tad9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011117.gx48tad9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011117.gx48tad9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpt3sas/mpt3sas_base.c: In function '_base_request_irq':
>> drivers/scsi/mpt3sas/mpt3sas_base.c:2830:68: warning: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 26 [-Wformat-truncation=]
    2830 |                 snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                                                                    ^~
   drivers/scsi/mpt3sas/mpt3sas_base.c:2830:58: note: directive argument in the range [0, 255]
    2830 |                 snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                                                          ^~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:2830:17: note: 'snprintf' output between 8 and 35 bytes into a destination of size 32
    2830 |                 snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2831 |                     ioc->driver_name, ioc->id, index);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c: In function 'mpt3sas_base_start_watchdog':
   drivers/scsi/mpt3sas/mpt3sas_base.c:681:57: warning: '%s' directive output may be truncated writing up to 23 bytes into a region of size 15 [-Wformat-truncation=]
     681 |             sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                                         ^~
   drivers/scsi/mpt3sas/mpt3sas_base.c:681:51: note: directive argument in the range [0, 255]
     681 |             sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                                   ^~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:680:9: note: 'snprintf' output between 14 and 39 bytes into a destination of size 20
     680 |         snprintf(ioc->fault_reset_work_q_name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     681 |             sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     682 |             ioc->driver_name, ioc->id);
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2830 drivers/scsi/mpt3sas/mpt3sas_base.c

f92363d1235949 Sreekanth Reddy          2012-11-30  2804  
f92363d1235949 Sreekanth Reddy          2012-11-30  2805  /**
f92363d1235949 Sreekanth Reddy          2012-11-30  2806   * _base_request_irq - request irq
f92363d1235949 Sreekanth Reddy          2012-11-30  2807   * @ioc: per adapter object
f92363d1235949 Sreekanth Reddy          2012-11-30  2808   * @index: msix index into vector table
f92363d1235949 Sreekanth Reddy          2012-11-30  2809   *
f92363d1235949 Sreekanth Reddy          2012-11-30  2810   * Inserting respective reply_queue into the list.
f92363d1235949 Sreekanth Reddy          2012-11-30  2811   */
f92363d1235949 Sreekanth Reddy          2012-11-30  2812  static int
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2813  _base_request_irq(struct MPT3SAS_ADAPTER *ioc, u8 index)
f92363d1235949 Sreekanth Reddy          2012-11-30  2814  {
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2815  	struct pci_dev *pdev = ioc->pdev;
f92363d1235949 Sreekanth Reddy          2012-11-30  2816  	struct adapter_reply_queue *reply_q;
f92363d1235949 Sreekanth Reddy          2012-11-30  2817  	int r;
f92363d1235949 Sreekanth Reddy          2012-11-30  2818  
f92363d1235949 Sreekanth Reddy          2012-11-30  2819  	reply_q =  kzalloc(sizeof(struct adapter_reply_queue), GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  2820  	if (!reply_q) {
919d8a3f3fef99 Joe Perches              2018-09-17  2821  		ioc_err(ioc, "unable to allocate memory %zu!\n",
919d8a3f3fef99 Joe Perches              2018-09-17  2822  			sizeof(struct adapter_reply_queue));
f92363d1235949 Sreekanth Reddy          2012-11-30  2823  		return -ENOMEM;
f92363d1235949 Sreekanth Reddy          2012-11-30  2824  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  2825  	reply_q->ioc = ioc;
f92363d1235949 Sreekanth Reddy          2012-11-30  2826  	reply_q->msix_index = index;
14b3114d940cdc Sreekanth Reddy          2015-01-12  2827  
f92363d1235949 Sreekanth Reddy          2012-11-30  2828  	atomic_set(&reply_q->busy, 0);
f92363d1235949 Sreekanth Reddy          2012-11-30  2829  	if (ioc->msix_enable)
f92363d1235949 Sreekanth Reddy          2012-11-30 @2830  		snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
c84b06a48c4d8a Sreekanth Reddy          2015-11-11  2831  		    ioc->driver_name, ioc->id, index);
f92363d1235949 Sreekanth Reddy          2012-11-30  2832  	else
f92363d1235949 Sreekanth Reddy          2012-11-30  2833  		snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d",
c84b06a48c4d8a Sreekanth Reddy          2015-11-11  2834  		    ioc->driver_name, ioc->id);
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2835  	r = request_irq(pci_irq_vector(pdev, index), _base_interrupt,
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2836  			IRQF_SHARED, reply_q->name, reply_q);
f92363d1235949 Sreekanth Reddy          2012-11-30  2837  	if (r) {
fc7d510ec4c8ff Joe Perches              2018-09-17  2838  		pr_err("%s: unable to allocate interrupt %d!\n",
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2839  		       reply_q->name, pci_irq_vector(pdev, index));
da3cec2515f009 Suganath prabu Subramani 2016-02-11  2840  		kfree(reply_q);
f92363d1235949 Sreekanth Reddy          2012-11-30  2841  		return -EBUSY;
f92363d1235949 Sreekanth Reddy          2012-11-30  2842  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  2843  
f92363d1235949 Sreekanth Reddy          2012-11-30  2844  	INIT_LIST_HEAD(&reply_q->list);
f92363d1235949 Sreekanth Reddy          2012-11-30  2845  	list_add_tail(&reply_q->list, &ioc->reply_queue_list);
f92363d1235949 Sreekanth Reddy          2012-11-30  2846  	return 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  2847  }
f92363d1235949 Sreekanth Reddy          2012-11-30  2848  

:::::: The code at line 2830 was first introduced by commit
:::::: f92363d12359498f9a9960511de1a550f0ec41c2 [SCSI] mpt3sas: add new driver supporting 12GB SAS

:::::: TO: Sreekanth Reddy <Sreekanth.Reddy@lsi.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
