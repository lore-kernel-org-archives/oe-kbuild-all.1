Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911585;
	b=tpA4O38UYtOtrrOmkO2qqbNoelJvEPhnuE8Q52xaCTWHEg/N8dYqsn6HGPqN0skQF095
	 pA3XXBTds6mdeFQ9pv/LoC7Olu7oUgOXDw7QbgQH4GG2jhGDgTE5Tltz8skZic1KM+fbR
	 EWGkIXUkhA73BJYKSB7q4LmGGvrxnd4nmh7LhtGmM0JUtu4P9yVt2okv6U3ePQwbXIgbx
	 lCUFe0etAlp2ly/NM6bTM5TWxZKLAEx4N+4Kqf1tTgu91jqPZfktE9IL4boQlNlIOHvMw
	 ibaG+lNntZFuYusg5yt+Je0TqAYgw7OMmUs+C1gJAZ5maYQhSmwq3Lr1JcuCrqOrX9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911585;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Le48frlyU3rWNHS8i6SXlDxmpXVEHqa/AXbtWDlTIOs=;
	b=q2eACluB7fs8NZ6e+3Rag+lluPjxtaGSSvHk1OjSgPEZ0OSVtQZy4wPy3fT+rToEqppS
	 0CvGPloRQesmwJm8Tizkqev+SmfADiO0kp2zP5LHIAfnPXrUWXIgwWOK2ePaEBhL1QBzf
	 DReJ+rgIVSwxer9GYdnufXucyjCQe7PlR/zs+7TAyqKeJk567kYhdPmUq1Nsf6eYjQ0Fw
	 fiG20CUJz3VMfFJqILjlprGEWvEFgxUpN1QXgCoPsb3TxRfszUmOoTzpTdSF53f/KZEY9
	 qbr6I/pdAXuMYuKb6i59SsundjWDC5j3/ePwIxhIWAiByK8s0tRaCHRzik5xNqymybw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvfL2EuK;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC94606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 10:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvfL2EuK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794911586; x=1826447586;
  h=date:from:to:cc:subject:message-id;
  bh=AuNGzn1xQt4YBfNLrkGXW6k59yATJOdUHZ1EUM3lnYo=;
  b=DvfL2EuKy3ImK8k//uZgayVL+rFm2md2hxpG4YgpNzvSKARiiG7xwDKq
   IhXJC1qX5JOHQyHY+JcoQIwN0kRlWDxZm6kjewGLqIPOdVm0v3wTai8DC
   69Q3IZipp8PFKUI3RGDaP5n0qOVtErBijIzIuw3mYYjc8DLJG4mLK+76i
   ighsEDf6tP1DcsAvISgDgj0mHWGp5R04Zn+h7yOAxqDhf193uMn8jA8Cd
   pMP1rTQ9hqZufsDU+dGTD2dFE7KRlRMjX5JrUTD2pkV0A5taHfAn/FuB0
   7FZNKSKgy5HU+Tar6LtqbaeLIRD3p4wFU1kqIGflzskAMOAnC0LHm/UeP
   A==;
X-CSE-ConnectionGUID: 2fKXpXXYQT2mZpYe9UhlZg==
X-CSE-MsgGUID: g+nq+EOiQbCQJBhvXXYpWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3600080"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3600080"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:32:58 -0800
X-CSE-ConnectionGUID: ZqYV9TQIQwepvKcSF/m2CQ==
X-CSE-MsgGUID: ghyD+lsoT4el9rgz3omzYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9739816"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 02:32:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTGUd-0000000035G-136B;
	Tue, 17 Nov 2026 10:32:51 +0000
Date: Tue, 17 Nov 2026 11:32:19 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2026-07 0/1]
 drivers/vdpa/vdpa.c:674:19: sparse: sparse: cast from restricted __virtio16
Message-ID: <20261117110552.zjMOetpw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-5.15-2026-07
head:   95d994b1eec6d68e972495d175e751b721790175
commit: 447092100c7e71aa20469a270fcee441d807ed58 [0/1] vdpa: Introduce query of device config layout
config: i386-randconfig-2301-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117110552.zjMOetpw-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117110552.zjMOetpw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117110552.zjMOetpw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/vdpa/vdpa.c:674:19: sparse: sparse: cast to restricted __le16
>> drivers/vdpa/vdpa.c:674:19: sparse: sparse: cast from restricted __virtio16
   drivers/vdpa/vdpa.c:690:19: sparse: sparse: cast to restricted __le16
   drivers/vdpa/vdpa.c:690:19: sparse: sparse: cast from restricted __virtio16
   drivers/vdpa/vdpa.c:694:19: sparse: sparse: cast to restricted __le16
   drivers/vdpa/vdpa.c:694:19: sparse: sparse: cast from restricted __virtio16

vim +674 drivers/vdpa/vdpa.c

   664	
   665	static int vdpa_dev_net_mq_config_fill(struct vdpa_device *vdev,
   666					       struct sk_buff *msg, u64 features,
   667					       const struct virtio_net_config *config)
   668	{
   669		u16 val_u16;
   670	
   671		if ((features & (1ULL << VIRTIO_NET_F_MQ)) == 0)
   672			return 0;
   673	
 > 674		val_u16 = le16_to_cpu(config->max_virtqueue_pairs);
   675		return nla_put_u16(msg, VDPA_ATTR_DEV_NET_CFG_MAX_VQP, val_u16);
   676	}
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
