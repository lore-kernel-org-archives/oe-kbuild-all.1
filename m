Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153779;
	b=SasvgcS0mENX5Z6F9mqnhlHIiThk1Wam4SofOYaHYvqH3Ntihvkynx6drYxQfPwJGF2U
	 PFtWv7IR2ZhDN/c47Zbk5dQ9Zp1S/WOPBxXchymjHRdM+NjsacM1EFiQPgmglfrg9PDT3
	 p1a8ltO4sjgyBEvTvwTY4ibHJUx2jIMH7jXLagNQ1IVq9fGzo0DC/+R2ghfPZ0B9Raklw
	 pgVXZUexUHOrrnF4GwH1yAQRGhNOs2p+HpzOHVczx9jy2ia+zGkQdRmBU52Ij57yrsXRx
	 w5mV8tYbQcRrgoetvDmDs+5aIfn1gfvd8SH3wD4hY9IKr13vZcZwO1O4NStykWbS+5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153779;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1AjD2CRXaH/dKQQ7mmBifSeP8MPkEKEszSAmUlyXbFE=;
	b=NE08ejdIJySypqYE3UzpGTQVaTdYiW1ppcfYRAJdfWnH6zaw6pFAUqHW1Zqw/7m9wWAJ
	 +z6t/rpRIpD9+pY4SazPysSJoI49a6kDm6jm37LTjx1xyra952z1ecCWTm8+j962jUfHF
	 ySdmMgFaXyJ+PJ91E039YrkfOm8A+29nQvaBCLY5EbhOiyqyLngEk83uNWyLiFTgXlau0
	 waj27SAhmtqEPysYUI6fodFxdLfQ/S3bu5emnZyT1oDjE1RP52S82OGqoKzasCJrGDnN6
	 UPBKYanVjS8JTgbxkbcakS/Vt7SQ5mif9K0ftPNeMUY6fXqOBtaXHdlkoOQudVhXN+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbKMBuo3;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A68606A31D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 02:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A68606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lbKMBuo3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793153776; x=1824689776;
  h=date:from:to:cc:subject:message-id;
  bh=rw1f0pvSgia0M5dfg5qZxum6S0VV6VWRRoTiLOdHK7M=;
  b=lbKMBuo3aWxHbzyzhprOv5C/wFZvwCvCI2O9MEKLFMtYheDDIcJT7b4T
   BkNTLqNT0WMGU6ojYPiSJHMyxKsq+Fzkva3wT3ItBda/CpOkniCvkHWl/
   vtRAgTg3wRTAfN1WpXhu0zosTzoiIQndRkbjIEE+66ABfU56NXdb/fWKz
   1efC7IMZBIvBS/7eLgFfcrrAkTAQKmGUNqUL2tF6ul4nrtAPDALzoM6EC
   nbd2OKNBghpGJfzkvb1O7dB/erXHHupDI5+CyjchgYR1mUSXxkxm1lEdq
   NBLizg73I4pOxXEBijt9p3QehQ/kveXIg4xg+E7+CAoh3J1CCKZ/udy6A
   Q==;
X-CSE-ConnectionGUID: TkSEG7TWTheuQcq8k9mdKQ==
X-CSE-MsgGUID: 8uRjrTVmSZaxdWgg6gwurw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1880549"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1880549"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 19:16:15 -0700
X-CSE-ConnectionGUID: N5EDjKPYTuChOd+vpd1zXg==
X-CSE-MsgGUID: NoIOKrRISzWBGYkkD0D7RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4746904"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Oct 2026 19:16:13 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLtD0-000000004jP-43gg;
	Wed, 28 Oct 2026 02:16:10 +0000
Date: Wed, 28 Oct 2026 03:15:55 +0100
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superm1:superm1/usb4-d3cold 2/2]
 drivers/thunderbolt/nhi.c:1215:57: sparse: sparse: restricted pci_power_t
 degrades to integer
Message-ID: <202610280319.x9OOUi4S-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/usb4-d3cold
head:   b18c1ce29660789da3e35d409219e584516a6c1c
commit: b18c1ce29660789da3e35d409219e584516a6c1c [2/2] thunderbolt: Wait for NHI to enter into D0 during runtime resume
config: loongarch-randconfig-r2302-20261027 (https://download.01.org/0day-ci/archive/20261028/202610280319.x9OOUi4S-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280319.x9OOUi4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280319.x9OOUi4S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thunderbolt/nhi.c:1215:57: sparse: sparse: restricted pci_power_t degrades to integer

vim +1215 drivers/thunderbolt/nhi.c

  1205	
  1206	static int nhi_wait_ready(struct pci_dev *pdev)
  1207	{
  1208		int delay;
  1209	
  1210		for (delay = 1; delay < NHI_PM_TIMEOUT; delay *= 2) {
  1211			u16 pmcsr;
  1212	
  1213			pci_read_config_word(pdev, pdev->pm_cap + PCI_PM_CTRL, &pmcsr);
  1214			if (!PCI_POSSIBLE_ERROR(pmcsr) &&
> 1215			    (pmcsr & PCI_PM_CTRL_STATE_MASK) == PCI_D0)
  1216				break;
  1217			msleep(delay);
  1218		}
  1219	
  1220		if (delay > NHI_PM_TIMEOUT) {
  1221			dev_err(&pdev->dev, "NHI not ready after %dms\n", NHI_PM_TIMEOUT);
  1222			return -ETIMEDOUT;
  1223		}
  1224	
  1225		return 0;
  1226	}
  1227	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
