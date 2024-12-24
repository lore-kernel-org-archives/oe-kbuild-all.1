Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E41D8DFB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735064152; cv=none; b=k4gb4KtO16TCVrSpnhwR/j0k9GoYgV4382jU4tQ2H1GMIzb0I8vjDaimmdRN16IppoBeStLgaB2AX5sTlOSfp4AvkkKxvhqrqrQPwZf6fK/85niNSASOcmqIJ1DJGfyE1EYRLR36hmi1BUsJ35aQ2TIu0y0uEXRYmtp9uU71QqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735064152; c=relaxed/simple;
	bh=4xD41qKLCv9BInzJNNUQVZdq8zzgtKAP8c8P0ugLAfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fJZZRJczNSj1k0i6CrOMvpqH5oRKUDSsB6nkYfNS6B4SKbKAINwu4VBTRSk3B7XflreFt0Ka1I7eiXqYJ9C/JA+K4RCJDLseLiyjdmEHfAR74d0xpqREyolti5BZYomO8Lh7FRZib1I6+0+tIb0n3NpHBijBd4Oy1L7B5UcZJVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3NxvaEm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3NxvaEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735064151; x=1766600151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4xD41qKLCv9BInzJNNUQVZdq8zzgtKAP8c8P0ugLAfI=;
  b=P3NxvaEmE6vQrmnWv7QOkara+H1VRdJuO+Aa6xItmsr1bjJA4GGyGv9C
   g9MFMy1qzmfJhctNQV/hhoyLbdCNAguz0T5HkRJvyb2XuMGfeq5xZW66B
   PW8FK5cuZVJ9Nq3DnU84TK8jvrEjnTTDL5QAPkrqJDN6Sj2zh211OnNIe
   wH/p40tvSS+dV0v/42OM4MUO0PeyhV8y3nNH6oAN/QuSia2Rby5wh5690
   MV2ZuMdPKIZeMYTPDnwh2lXuwV3T5SfzZgGzua2PJKmR/ZOhLJfFGXnl9
   QDHk+7x7FeFp3bZc8+s+B8oD5eWQrAtBMh3//tuldqM/zz6p0Hfry1X6G
   w==;
X-CSE-ConnectionGUID: 7zQegLbYThmIdT4mTBJJhg==
X-CSE-MsgGUID: ac/0SeRJRt28rmexX7ZADQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39214714"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="39214714"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 10:15:50 -0800
X-CSE-ConnectionGUID: tirz0dYiRPmtjyG/QPEW5Q==
X-CSE-MsgGUID: PW8sHXVlTAuElOjQMfV+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103638664"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Dec 2024 10:15:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ9Ra-0001Lm-2d;
	Tue, 24 Dec 2024 18:15:46 +0000
Date: Wed, 25 Dec 2024 02:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yuyu Li <liyuyu6@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Junxian Huang <huangjunxian6@hisilicon.com>
Subject: [leon-rdma:rdma-next 32/1045]
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:699:13: warning:
 'pvrdma_report_event_handle' defined but not used
Message-ID: <202412250218.Mfftlmj6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   afe2e50bf66e078829b0b15249542da262a945ed
commit: 6577fade345296c6ed8aa054181c67a05cb135f2 [32/1045] RDMA/pvrdma: Support report_port_event() ops
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20241225/202412250218.Mfftlmj6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250218.Mfftlmj6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250218.Mfftlmj6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:184:30: error: 'pvrdma_report_event_handle' undeclared here (not in a function)
     184 |         .report_port_event = pvrdma_report_event_handle,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c:699:13: warning: 'pvrdma_report_event_handle' defined but not used [-Wunused-function]
     699 | static void pvrdma_report_event_handle(struct ib_device *ibdev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pvrdma_report_event_handle +699 drivers/infiniband/hw/vmw_pvrdma/pvrdma_main.c

   698	
 > 699	static void pvrdma_report_event_handle(struct ib_device *ibdev,
   700					       struct net_device *ndev,
   701					       unsigned long event)
   702	{
   703		struct pvrdma_dev *dev = container_of(ibdev, struct pvrdma_dev, ib_dev);
   704	
   705		switch (event) {
   706		case NETDEV_DOWN:
   707			pvrdma_dispatch_event(dev, 1, IB_EVENT_PORT_ERR);
   708			break;
   709		case NETDEV_UP:
   710			pvrdma_write_reg(dev, PVRDMA_REG_CTL,
   711					 PVRDMA_DEVICE_CTL_UNQUIESCE);
   712	
   713			mb();
   714	
   715			if (pvrdma_read_reg(dev, PVRDMA_REG_ERR))
   716				dev_err(&dev->pdev->dev,
   717					"failed to activate device during link up\n");
   718			else
   719				pvrdma_dispatch_event(dev, 1, IB_EVENT_PORT_ACTIVE);
   720			break;
   721	
   722		default:
   723			break;
   724		}
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
