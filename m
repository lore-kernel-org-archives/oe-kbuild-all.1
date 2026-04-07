Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7C37881D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534564; cv=none; b=O/Fz5Nz1YMX8f8lWrYs0kxYFx6ykFHlJDHB/a2xEJZb7UfU4hT/Y+Zle06x+SVj57IUvW2YL0IbXhVUTdbsHb3euyqaCf9DLhBlu4WtCM+2tMNFVDawzhiM9kAdAhcf9yJUXLzmFEbeqSsoX/S0RPmNYnfkJO1WRm43KB+ZdA+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534564; c=relaxed/simple;
	bh=SaHqrvzH6pHQAhhc0CVhIWIWTeopqLmOj0WHBY2V+XY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QDMqF7omeUCdRJQ2z544/PdZbcDk6bB58er6/nt6wgr68hSUah2xPscMEaAhl3zavhMSFFSkYNW6vDQm8FwmIB4axzUk5fAo6UHnyaZaW6SlR+ZKET56maOFn6Q+veHib/dNiQw5wPsI7LedE/nfuHpD85GNCJuh1euXmTqapj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDPz83wY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDPz83wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534563; x=1807070563;
  h=date:from:to:cc:subject:message-id;
  bh=SaHqrvzH6pHQAhhc0CVhIWIWTeopqLmOj0WHBY2V+XY=;
  b=IDPz83wYFZ6uDKI8dDFKyJgkxG2SMOpeXJRxUlTx4hsGLdP5aJ11khYC
   lfOmTc0MIEiq+lnaOyQyhDtrmuM+qHjv89ulOHKtrZjnEp1E0YgytdaMK
   DQGzWDZIzVjaEx9G99RrJ28MFefWjNI0HIZLIOrXFfdVdcIATSQ/bdyOX
   rR/X5WMdYxp81FJoeAJIgxTJgjte5EuWHxTpYQ41bhXahGrfKCfZMu+u+
   qQjf8In+bDuyy/T6HcY5D0d5vPyi2UxVtf2Ni4zQYwTHPHP+yy/sru0Mv
   WpWTBhUGnaiPTHR+ddFLrfAWedcEEc3j4Gg0aVTam8gqVPCEuwFpUFEf7
   Q==;
X-CSE-ConnectionGUID: 0da9R+5nS8qWZbJ6TQjj5g==
X-CSE-MsgGUID: PDCHAc7zTTaG8WuSxcSDeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76386038"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76386038"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:02:39 -0700
X-CSE-ConnectionGUID: zddimtG+SviGfxD9nk2L9w==
X-CSE-MsgGUID: j2JOOYySQXGwGuBHcmVuXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227957169"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 21:02:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xe5-0000000008H-3yKW;
	Tue, 07 Apr 2026 04:02:33 +0000
Date: Tue, 07 Apr 2026 12:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Subject: drivers/net/wireless/mediatek/mt76/debugfs.c:77:16: warning:
 variable 'queued' set but not used
Message-ID: <202604060722.tkO80FXo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lorenzo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1791c390149f56313c425e8add1fd15baf40afb8
commit: 2d8be76c16746f1c90f4a01c188b6aad190b747e mt76: debugfs: improve queue node readability
date:   4 years, 6 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260406/202604060722.tkO80FXo-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260406/202604060722.tkO80FXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2d8be76c1674 ("mt76: debugfs: improve queue node readability")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604060722.tkO80FXo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/debugfs.c: In function 'mt76_rx_queues_read':
>> drivers/net/wireless/mediatek/mt76/debugfs.c:77:16: warning: variable 'queued' set but not used [-Wunused-but-set-variable]
      77 |         int i, queued;
         |                ^~~~~~


vim +/queued +77 drivers/net/wireless/mediatek/mt76/debugfs.c

17f1de56df0512 Felix Fietkau    2017-11-21  73  
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  74  static int mt76_rx_queues_read(struct seq_file *s, void *data)
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  75  {
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  76  	struct mt76_dev *dev = dev_get_drvdata(s->private);
6ea62c50792c6a Lorenzo Bianconi 2020-04-19 @77  	int i, queued;
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  78  
2d8be76c16746f Lorenzo Bianconi 2021-09-25  79  	seq_puts(s, "     queue | hw-queued |      head |      tail |\n");
f473b42ac516be Felix Fietkau    2020-05-24  80  	mt76_for_each_q_rx(dev, i) {
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  81  		struct mt76_queue *q = &dev->q_rx[i];
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  82  
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  83  		queued = mt76_is_usb(dev) ? q->ndesc - q->queued : q->queued;
2d8be76c16746f Lorenzo Bianconi 2021-09-25  84  		seq_printf(s, " %9d | %9d | %9d | %9d |\n",
2d8be76c16746f Lorenzo Bianconi 2021-09-25  85  			   i, q->queued, q->head, q->tail);
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  86  	}
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  87  
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  88  	return 0;
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  89  }
6ea62c50792c6a Lorenzo Bianconi 2020-04-19  90  

:::::: The code at line 77 was first introduced by commit
:::::: 6ea62c50792c6ad8b283c02d19f4304c7f3a3ccf mt76: add rx queues info to mt76 debugfs

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
