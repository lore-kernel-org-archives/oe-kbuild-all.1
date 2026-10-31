Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793462444;
	b=Mi84xfNpMJJwR71KSKjlwaAMUSTu+pch4cHwGK5slwqtzg8OZk821pgRaLG4lJrzOV2s
	 IHAJ37aqIeNoBM6RedOGcahkxSg/w1e2/xq4aERFs2u8CSWJkR8VjXTHHVP8cI3NTADl+
	 OAd6BDWatPtVMINY0n8VHHcSYRainmUpP0tVg6L9p0N32UACCIu+Axy89tB4WaE5/JSW8
	 yOIJ/X23AVy/fXzFuNrursyDB1a2y+P/iQ901rF/CesonQIjtl/S4AlBUcuPfZDsyO7Q7
	 FEjXV4l4Ryv87Z8HPfR5x3i2SZKvyLNRFITM7nQPqMhTDQzu5XvaCjjUaSyJNKINGfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793462444;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Xp42BCytUDmClLZADRTcM9s94E4M0HrbNLNK+3EXneY=;
	b=HfQTmxur+8YFnac9+4502RuyPK/mzm/oqpFgSipu3qSEIJ0hJQ34hxUzvfH2YjNAMjFm
	 KjnlPeQvUwt19wls+fo9akJ7DYgxneLckY3dOgiVShjx1KlAGhDWgyS7jY2jUkubHh86l
	 458ZHCHPGf/P5rLNN9ldw7bJvkbRgjgIZZvLSUHm9tu9yZhmpbFq6AaKMBHbszKbXSjvS
	 ZAeQ8qYBtGSNfU7UpEuf4INDxh7OrISxeTUqoCAiWFERBwVy1EinpGJNzzSaxWcyesOco
	 VSBx1KWf0Ni9kwBoCV2nS5EiFKOpiU3A6usMFGrkcTuO4wTQtoqnVMYXjdi8pK6rNHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSAYesPr;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40688606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 16:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40688606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSAYesPr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793462442; x=1824998442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a/oHrh7JtApBDOsxtkOnzpYdrNjIvrK7tD7gPcW69p8=;
  b=QSAYesPrPpADx5SU7q8Y0CRooiRdJch/Z17d+k3h4ItNqMvLeAZ9JyIU
   6sCKHXDkW9+QcQ/braFCYDLWkulIJBNQ1j35IcYtH56F3IkE2nEDECXH+
   E2Zc/NPCo8AWiNR4lyQHOJKc9pY/ZM9Nsz9hKT3BSZ1WP93QNFTk64Ure
   XU44P0cncXyDDl5WTuR5mZ1zQaqFH7kmuP65kS0Ysibh8jAvv3L0UaXb4
   aYLjlAXoHFspn/PrIK0BymbaEv0VU/yzrW+mgDRkp52UA9qY0XG2l95jY
   gxi7KS31bzWzJ/QL/HLLClg2WvLV8NhT4LAjpzqlcizduAhDi4v8edydb
   Q==;
X-CSE-ConnectionGUID: DSaeoP18Rk6lkVbunPStKw==
X-CSE-MsgGUID: a9DHtfpVQsCuy/R/8OWJjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2212133"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2212133"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 09:00:40 -0700
X-CSE-ConnectionGUID: h/QafiSZTBmwJPvOR7Zo+w==
X-CSE-MsgGUID: dTov0jMjTAmtdWYZWliYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5839453"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2026 09:00:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNBVS-00000000cw0-3Yc5;
	Sat, 31 Oct 2026 16:00:34 +0000
Date: Sun, 1 Nov 2026 00:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: chitranshmandhaniya@gmail.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com, david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com, qipeng.zha@intel.com
Subject: Re: [PATCH 2/8] platform/x86: isst_if_mbox_pci: switch to
 devm_mutex_init()
Message-ID: <202610312321.ZcUHUnej-lkp@intel.com>
References: <20261030082303.284271-3-chitranshmandhaniya@gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030082303.284271-3-chitranshmandhaniya@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chitranshmandhaniya-gmail-com/platform-x86-isst_if_mmio-switch-to-devm_mutex_init/20261030-135255
base:   linus/master
patch link:    https://lore.kernel.org/r/20261030082303.284271-3-chitranshmandhaniya%40gmail.com
patch subject: [PATCH 2/8] platform/x86: isst_if_mbox_pci: switch to devm_mutex_init()
config: x86_64-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610312321.ZcUHUnej-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610312321.ZcUHUnej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610312321.ZcUHUnej-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c: In function 'isst_if_mbox_remove':
>> drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c:198:32: warning: variable 'punit_dev' set but not used [-Wunused-but-set-variable]
     198 |         struct isst_if_device *punit_dev;
         |                                ^~~~~~~~~


vim +/punit_dev +198 drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c

31a166fe9c269af drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c Srinivas Pandruvada 2019-06-26  195  
31a166fe9c269af drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c Srinivas Pandruvada 2019-06-26  196  static void isst_if_mbox_remove(struct pci_dev *pdev)
31a166fe9c269af drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c Srinivas Pandruvada 2019-06-26  197  {
31a166fe9c269af drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c Srinivas Pandruvada 2019-06-26 @198  	struct isst_if_device *punit_dev;
31a166fe9c269af drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c Srinivas Pandruvada 2019-06-26  199  
31a166fe9c269af drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c Srinivas Pandruvada 2019-06-26  200  	punit_dev = pci_get_drvdata(pdev);
31a166fe9c269af drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c Srinivas Pandruvada 2019-06-26  201  	isst_if_cdev_unregister(ISST_IF_DEV_MBOX);
31a166fe9c269af drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c Srinivas Pandruvada 2019-06-26  202  }
31a166fe9c269af drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c Srinivas Pandruvada 2019-06-26  203  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
