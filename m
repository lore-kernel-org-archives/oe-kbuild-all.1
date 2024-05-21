Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F841C63
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716273509; cv=none; b=Rmu+MHrg/MJKxVhWXKYIybo1zNNjRgrnKM0HLTAa7W+dJd2ln5fYcYoOxmXfiG9MyaDbCrFGHlipDeFuqZu3UqXT3mtYjypmCpOArOdts0O1bEKFirsPprLoZ+uTZPR+/BXb42mqcbof6RJWWr6/HAz35Ygyq7bWP9F0n0mHpCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716273509; c=relaxed/simple;
	bh=BTJBuzBDQOB9rBD8q6pUogEJxKhNu/tDKwbtlS/hL3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aLtdLrOONGN8nArTkQYrZDOe0OOwUZe8c9hCoxV0moLSDhSDQ/82NxK8yKRN+kGnHOyJoOK3lSFxq/xDWKEKqkj45lWprzMvwsrxTU8H5Ssqr4Q6pddhZRypS3xFZDXUxGz6+JvsIGkxz+I4sDXWvOwcwSe5MX3USB3M9Q5Ory8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ld+1bIhl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ld+1bIhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716273508; x=1747809508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BTJBuzBDQOB9rBD8q6pUogEJxKhNu/tDKwbtlS/hL3k=;
  b=ld+1bIhlve8UBbeeG9AbOcxCZG7+g/LDhCCnyXZdi7/+LxtKN77q7W5H
   /DExc80sD2IlykL6o91y6kseAcnoJJFl/5ERWyIMtLRqZTcmWvMdlJLGn
   1KPzXB9XwPT9nWV3JUNoa2OmxADH1mOjPWs4fmW+KqhJHJyKAMA3fcu66
   ONC4XhJWVyutGLuP8nlv3jM5Yc1rr0iDflBHpIvKMsM94YzQ9WnCR9bqZ
   tATNa1eBKLBfKo3q2PmUj0pnMLUZYFbML4x4m7uFf4xwL/IX7hNMwTjrv
   NhzmWwn0BGrs7ub7+SnYUpH+c1O9rRKm1E+EwwF88pj4tAEN2KRZHt9WX
   g==;
X-CSE-ConnectionGUID: RuxELC+lRniIm8I/73qUBQ==
X-CSE-MsgGUID: wtXTGrSQSIWn1WO1EGIfng==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12556729"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12556729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 23:38:27 -0700
X-CSE-ConnectionGUID: IXGE/7rFTvGygKV9ZAIuwg==
X-CSE-MsgGUID: YMCYtZLRRUWG4OwLaNIy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37329504"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2024 23:38:24 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9J8f-0005yT-2K;
	Tue, 21 May 2024 06:38:21 +0000
Date: Tue, 21 May 2024 14:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6954/7601] drivers/ptp/ptp_hisi.c:701:undefined
 reference to `ptp_clock_unregister'
Message-ID: <202405211405.WRp9tw7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   3d005f3eb08ec52d3b09d59ffc09bec4a8ae4900
commit: b3d33603591c477d56f59972f85d4b97e7ee12d7 [6954/7601] net: hns3: add support for Hisilicon ptp sync device
config: x86_64-randconfig-122-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211405.WRp9tw7A-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211405.WRp9tw7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211405.WRp9tw7A-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/ptp/ptp_hisi.o: in function `hisi_ptp_remove':
>> drivers/ptp/ptp_hisi.c:701:(.text+0x33b): undefined reference to `ptp_clock_unregister'
   ld: drivers/ptp/ptp_hisi.o: in function `hisi_ptp_create_clock':
>> drivers/ptp/ptp_hisi.c:597:(.text+0x1873): undefined reference to `ptp_clock_register'


vim +701 drivers/ptp/ptp_hisi.c

   586	
   587	static int hisi_ptp_create_clock(struct hisi_ptp_pdev *ptp)
   588	{
   589		dev_info(ptp->ptp_tx->dev, "register ptp clock\n");
   590	
   591		snprintf(ptp->info.name, PTP_CLOCK_NAME_LEN, "%s", HISI_PTP_NAME);
   592		ptp->info.owner = THIS_MODULE;
   593		ptp->info.adjfine = hisi_ptp_adjfine;
   594		ptp->info.adjtime = hisi_ptp_adjtime;
   595		ptp->info.settime64 = hisi_ptp_settime;
   596		ptp->info.gettimex64 = hisi_ptp_gettime;
 > 597		ptp->clock = ptp_clock_register(&ptp->info, ptp->ptp_tx->dev);
   598		if (IS_ERR(ptp->clock)) {
   599			dev_err(ptp->ptp_tx->dev,
   600				"failed to register ptp clock, ret = %ld\n",
   601				PTR_ERR(ptp->clock));
   602			return PTR_ERR(ptp->clock);
   603		}
   604	
   605		return 0;
   606	}
   607	
   608	static void hisi_ptp_timer(struct timer_list *t)
   609	{
   610		struct hisi_ptp_pdev *ptp = from_timer(ptp, t, suppress_timer);
   611		unsigned long flags;
   612	
   613		write_lock_irqsave(&ptp->rw_lock, flags);
   614	
   615		dev_dbg(ptp->ptp_tx->dev, "ptp timer timeout handler.\n");
   616	
   617		ptp->last_jiffies = jiffies;
   618		ptp->irq_cnt = 0;
   619	
   620		hisi_ptp_wait_and_enable(ptp);
   621	
   622		write_unlock_irqrestore(&ptp->rw_lock, flags);
   623	}
   624	
   625	static int hisi_ptp_probe(struct platform_device *pdev)
   626	{
   627		struct hisi_ptp_pdev *ptp = &g_ptpdev;
   628		unsigned long flags;
   629		const char *type;
   630		int ret;
   631	
   632		dev_info(&pdev->dev, "ptp probe start\n");
   633	
   634		ret = device_property_read_string(&pdev->dev, "type", &type);
   635		if (ret) {
   636			dev_err(&pdev->dev, "failed to read device type, ret = %d\n",
   637				ret);
   638			return ret;
   639		}
   640	
   641		if (!memcmp(type, "rx", strlen("rx"))) {
   642			ret = hisi_ptp_get_rx_resource(pdev, ptp);
   643		} else if (!memcmp(type, "tx", strlen("tx"))) {
   644			ret = hisi_ptp_get_tx_resource(pdev, ptp);
   645		} else {
   646			dev_err(&pdev->dev,
   647				"failed to probe unknown device, type: %s\n",
   648				type);
   649			ret = -EINVAL;
   650		}
   651		if (ret)
   652			return ret;
   653	
   654		write_lock_irqsave(&ptp->rw_lock, flags);
   655	
   656		if (ptp->rx_total == 0 || ptp->rx_total != ptp->rx_cnt ||
   657		    ptp->tx_cnt != 1) {
   658			write_unlock_irqrestore(&ptp->rw_lock, flags);
   659			dev_info(&pdev->dev,
   660				 "waiting for devices...rx total:%u, now:%u. tx total:1, now:%u\n",
   661				 ptp->rx_total, ptp->rx_cnt, ptp->tx_cnt);
   662			return 0;
   663		}
   664	
   665		if (!ptp->rx_base) {
   666			write_unlock_irqrestore(&ptp->rw_lock, flags);
   667			dev_err(&pdev->dev,
   668				"failed to probe, no base rx device, please check the asl file!\n");
   669			return -EINVAL;
   670		}
   671	
   672		hisi_ptp_disable(ptp);
   673		hisi_ptp_cal_time_comp(ptp);
   674		hisi_ptp_peri_rx_init(ptp);
   675		hisi_ptp_net_tx_init(ptp);
   676		hisi_ptp_unmask_irq(ptp);
   677	
   678		write_unlock_irqrestore(&ptp->rw_lock, flags);
   679	
   680		ret = hisi_ptp_create_clock(ptp);
   681		if (ret) {
   682			write_lock_irqsave(&ptp->rw_lock, flags);
   683			hisi_ptp_disable(ptp);
   684			write_unlock_irqrestore(&ptp->rw_lock, flags);
   685			return ret;
   686		}
   687	
   688		set_bit(HISI_PTP_INIT_DONE, &ptp->flag);
   689	
   690		dev_info(&pdev->dev, "ptp probe end\n");
   691		return 0;
   692	}
   693	
   694	static int hisi_ptp_remove(struct platform_device *pdev)
   695	{
   696		struct hisi_ptp_pdev *ptp = &g_ptpdev;
   697		struct hisi_ptp_rx *rx;
   698		unsigned long flags;
   699	
   700		if (test_and_clear_bit(HISI_PTP_INIT_DONE, &ptp->flag)) {
 > 701			ptp_clock_unregister(ptp->clock);
   702			ptp->clock = NULL;
   703	
   704			write_lock_irqsave(&ptp->rw_lock, flags);
   705			hisi_ptp_disable(ptp);
   706			write_unlock_irqrestore(&ptp->rw_lock, flags);
   707	
   708			dev_info(&pdev->dev, "unregister ptp clock\n");
   709		}
   710	
   711		write_lock_irqsave(&ptp->rw_lock, flags);
   712		if (ptp->ptp_tx && ptp->ptp_tx->dev == &pdev->dev) {
   713			ptp->tx_cnt--;
   714			ptp->ptp_tx = NULL;
   715			dev_info(&pdev->dev, "remove tx ptp device\n");
   716		} else {
   717			list_for_each_entry(rx, &ptp->ptp_rx_list, node) {
   718				if (rx->dev == &pdev->dev) {
   719					ptp->rx_cnt--;
   720					list_del(&rx->node);
   721					dev_info(&pdev->dev, "remove rx ptp device\n");
   722					break;
   723				}
   724			}
   725		}
   726		write_unlock_irqrestore(&ptp->rw_lock, flags);
   727	
   728		return 0;
   729	}
   730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
