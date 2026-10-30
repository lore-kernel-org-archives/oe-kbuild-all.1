Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392290;
	b=e2lE9Or3poA/JdG55Dwe5ELmxrZOM67hyKmc9i1UxmpoI1SVcAkGX2b3UWeFDPVvIKHh
	 t7vUzdt+bBcN/FUtbO1yxzqtr32fEsN5SWNIX6XkeImXvgtMSbS0pzF8AQehvLQSoKoNT
	 DxouV/WVhq2gnqVypLQugfU6ha7mY3NuZOCtHQX1Ia9K5zyKfOnaJoAaYOgklwEym7PXW
	 hsEYcSZlqt28Ca7LrktnheLoMzTYQud4wYhVbPSQgmUc+NNkmsSik7SNakOB1jVITMc2x
	 2rxNOILgHORueBvGzH9nrdTkI9i3mFkmVLEf9YaWoKlmZ/XrzCOaf6tTseUgwytAi/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392290;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=z4HdufVrsDd/Jw1t1Olll5wB7saCjGJ6VHZ2dnKgkAs=;
	b=MjKNZrx3z+Xu7zXUlsuE0JJh2BmzFvctkZ2GWVhtSnDG2SQvY/Dzns4oKBqTKegXGfjD
	 BH9nZuULw9+Q/G0SyaoWyjwsSKYhyBbCI9Xs2C2fzc97nmBm8U2ZJdM3jdp04jvv/wKUS
	 s9KSbPpbamblUk0NDPaNlYLG1Slth+ISYtd90pQqdEEKuEgRBwwqkJ2RMUNqueqfpl4mw
	 /oEMfKvD1GGVLdZ+G3j5bxiHA+mEsmm6v4I6g5/uwEQHW8UxuPCOSb6kub75rObqU70i3
	 dOA476LQOCKY4fZ+T3Wq/+si896mRJX1py3tGfwPkiqfq6U62KUzu26celZDYHLFgTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JBc7FguI;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD25606A331
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 20:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD25606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JBc7FguI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793392289; x=1824928289;
  h=date:from:to:cc:subject:message-id;
  bh=smYx3sP0IsNTA14ebYv2CjHEh37gMwsHbtfWNWoOIqk=;
  b=JBc7FguIOmtKv+Aos2EvsnNzece3CcPzdetT5YzKKZBx/TyGOXFYc6YL
   FmMeyAUMTDlEFbVM5SpLojclF+Im9F4nSD+8XOuKiq3zJn6vQGDnq/W1P
   An94TH6FtSdQuPD7874fiAAyO5QbEGYLQ0aRhhByx4pCYbT5e87KQTRYc
   ZSAW/TwH3Zwiq1X5QJvy2SY7zLZNXG5pT+cHnUW50wbz6CQkUiAyGU6Jo
   AAJjHusknWCUTG1e75nSs1S8tmVw4SzAqm7Yij686hEQbdYiEmLT5pOdH
   LAFeT3eqaldwRIZTzXi0OXTYiNNqz4DL6S1n+UYNi0kV++QvroBA3P7kH
   w==;
X-CSE-ConnectionGUID: ObgGfw3IRSWfNdW4BqXKJw==
X-CSE-MsgGUID: 3f+4+NNqRNanvdssSv93NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2076794"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2076794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 13:31:28 -0700
X-CSE-ConnectionGUID: 1FQV4OerTbSq/egjC963rA==
X-CSE-MsgGUID: K3OoaGczQVut7kN0vBR+5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5527207"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 30 Oct 2026 13:31:26 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMtG0-000000005g3-1Eyg;
	Fri, 30 Oct 2026 20:31:24 +0000
Date: Fri, 30 Oct 2026 21:30:35 +0100
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alessio Belle <alessio.belle@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>
Subject: [linux-next:master 21240/21381]
 drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202610302136.3nli2ijx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
commit: 6c6200ffebf9766fd5d9293002298ea371c261c1 [21240/21381] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
config: riscv-randconfig-r2300-20261030 (https://download.01.org/0day-ci/archive/20261030/202610302136.3nli2ijx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610302136.3nli2ijx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610302136.3nli2ijx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *power_sync @@
   drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse:     got unsigned int [usertype] *power_sync

vim +62 drivers/gpu/drm/imagination/pvr_power.c

cc1aeedb98ad34 Sarah Walker 2023-11-22  46  
727538a4bbff07 Sarah Walker 2023-11-22  47  static int
727538a4bbff07 Sarah Walker 2023-11-22  48  pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
727538a4bbff07 Sarah Walker 2023-11-22  49  {
cc1aeedb98ad34 Sarah Walker 2023-11-22  50  	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
cc1aeedb98ad34 Sarah Walker 2023-11-22  51  	u32 slot_nr;
cc1aeedb98ad34 Sarah Walker 2023-11-22  52  	u32 value;
cc1aeedb98ad34 Sarah Walker 2023-11-22  53  	int err;
cc1aeedb98ad34 Sarah Walker 2023-11-22  54  
cc1aeedb98ad34 Sarah Walker 2023-11-22  55  	WRITE_ONCE(*fw_dev->power_sync, 0);
cc1aeedb98ad34 Sarah Walker 2023-11-22  56  
cc1aeedb98ad34 Sarah Walker 2023-11-22  57  	err = pvr_kccb_send_cmd_powered(pvr_dev, pow_cmd, &slot_nr);
cc1aeedb98ad34 Sarah Walker 2023-11-22  58  	if (err)
cc1aeedb98ad34 Sarah Walker 2023-11-22  59  		return err;
cc1aeedb98ad34 Sarah Walker 2023-11-22  60  
cc1aeedb98ad34 Sarah Walker 2023-11-22  61  	/* Wait for FW to acknowledge. */
cc1aeedb98ad34 Sarah Walker 2023-11-22 @62  	return readl_poll_timeout(pvr_dev->fw_dev.power_sync, value, value != 0, 100,
cc1aeedb98ad34 Sarah Walker 2023-11-22  63  				  POWER_SYNC_TIMEOUT_US);
727538a4bbff07 Sarah Walker 2023-11-22  64  }
727538a4bbff07 Sarah Walker 2023-11-22  65  

:::::: The code at line 62 was first introduced by commit
:::::: cc1aeedb98ad347c06ff59e991b2f94dfb4c565d drm/imagination: Implement firmware infrastructure and META FW support

:::::: TO: Sarah Walker <sarah.walker@imgtec.com>
:::::: CC: Maxime Ripard <mripard@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
