Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E72F29ACCD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 22:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785881934; cv=none; b=srikDvREfOxiimaCTCHtAmJFArViPe56daGc+0Up1DXcb9AMdFel5VuyvJ0oouflvjJVwMbVxo0KSFXoa4I6ayAccZJ2tAjXo8os8HrfVhneB/PiSqMhzW+GUXlFkPpPm+m6i8pQxNu8hxDtJFIySuMycFo4EggJ6QHScnqkFvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785881934; c=relaxed/simple;
	bh=VsKR6XMoBunHG5cQmPTVT2QIcvo3fIYYW3mLz2Wh4Gc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=COS25n/P48StdUc57V63UXowoe1Q/8PDZdkYXNrI7Y6Um59xSKLN8pFaDcHyvZy54w/qerLIs9TKEcTUf20HoTqCjPZu5Sdbru2aPTSFlDuZqwhcxxVWkL+LXuWivbXmYP5pquFV25gg3bP+IQVa23xyZosLI0tGlwQTH8eVUy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4nUtIqq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4nUtIqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785881932; x=1817417932;
  h=date:from:to:cc:subject:message-id;
  bh=VsKR6XMoBunHG5cQmPTVT2QIcvo3fIYYW3mLz2Wh4Gc=;
  b=V4nUtIqq9Fd1YnjDf2xMhMbj3/mLtyRafsAx/cUzokbvHUjVLuqeFd6p
   UigGM4snuHz2qRkkRwHmc2ibsl9Ocm6hgNFbASfw1+a4rdQLpPW61lzI2
   pMeZaoXj0Fl5NSMpcaQScggaBQXsZvdmaDEiZvjU6yVaotqKRFspZCcAy
   vE3QMHrccMhntm/GUUmEMEk7AX5FO09InyWV1QPqu2F1wguEgwPLJUeVl
   O5PhCw99fklEd+dSyGos92XXXy+uzdDwgPLIviPTIc03mKWk8VPzKhuj0
   +PCkxrsaMPTxEsW7TE+bsp9JXRbx3577/7j3OZgckv8rbc70JFHIOBcyz
   Q==;
X-CSE-ConnectionGUID: 8+BNUinJQn+JTACpRLGhdQ==
X-CSE-MsgGUID: gjaOb4XyQLO8N51pmHY/5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86216245"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86216245"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 15:18:51 -0700
X-CSE-ConnectionGUID: ezOnxlKLTPKlKCWm8kLmbw==
X-CSE-MsgGUID: reNv8/fFT6yuhMg6ewuXzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="262209888"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Aug 2026 15:18:50 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrNTD-00000000AtH-0GQs;
	Tue, 04 Aug 2026 22:18:47 +0000
Date: Wed, 05 Aug 2026 06:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 587/700]
 drivers/usb/host/ehci-fotg210.c:180:6: warning: no previous prototype for
 'fotg210_port_oc'
Message-ID: <202608050607.nCLKilkK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 4c302f546c0071a42617d28de4405321db76583c [587/700] usb: ehci: Add ehci driver for fotg210
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050607.nCLKilkK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050607.nCLKilkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050607.nCLKilkK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/ehci-fotg210.c: In function 'fotg210_port_speed':
   drivers/usb/host/ehci-fotg210.c:139:16: error: 'struct ehci_hcd' has no member named 'fusbh200'
     139 |         if(ehci->fusbh200)
         |                ^~
   drivers/usb/host/ehci-fotg210.c: In function 'fotg210_enable_occ':
   drivers/usb/host/ehci-fotg210.c:168:17: error: 'struct ehci_hcd' has no member named 'fusbh200'
     168 |         if (ehci->fusbh200) {
         |                 ^~
   drivers/usb/host/ehci-fotg210.c: At top level:
>> drivers/usb/host/ehci-fotg210.c:180:6: warning: no previous prototype for 'fotg210_port_oc' [-Wmissing-prototypes]
     180 | bool fotg210_port_oc(struct ehci_hcd *ehci) {
         |      ^~~~~~~~~~~~~~~
   drivers/usb/host/ehci-fotg210.c: In function 'fotg210_port_oc':
   drivers/usb/host/ehci-fotg210.c:184:16: error: 'struct ehci_hcd' has no member named 'fusbh200'
     184 |         if(ehci->fusbh200){
         |                ^~
   drivers/usb/host/ehci-fotg210.c: In function 'fotg210_start_ehci':
   drivers/usb/host/ehci-fotg210.c:245:17: error: 'struct ehci_hcd' has no member named 'fusbh200'
     245 |         if (ehci->fusbh200) {
         |                 ^~
   drivers/usb/host/ehci-fotg210.c: In function 'ehci_fotg210_drv_probe':
   drivers/usb/host/ehci-fotg210.c:342:21: error: 'struct ehci_hcd' has no member named 'fotg210'
     342 |                 ehci->fotg210 = 1;
         |                     ^~
   drivers/usb/host/ehci-fotg210.c:345:21: error: 'struct ehci_hcd' has no member named 'fusbh200'
     345 |                 ehci->fusbh200 = 1;
         |                     ^~
   drivers/usb/host/ehci-fotg210.c:361:13: error: 'struct ehci_hcd' has no member named 'enable_port_occ'
     361 |         ehci->enable_port_occ = fotg210_enable_occ;
         |             ^~
   drivers/usb/host/ehci-fotg210.c:362:15: error: 'struct ehci_hcd' has no member named 'port_speed'; did you mean 'port_c_suspend'?
     362 |         ehci->port_speed = fotg210_port_speed;
         |               ^~~~~~~~~~
         |               port_c_suspend


vim +/fotg210_port_oc +180 drivers/usb/host/ehci-fotg210.c

   179	
 > 180	bool fotg210_port_oc(struct ehci_hcd *ehci) {
   181		struct fotg210_regs *regs = (void *) ehci->regs;
   182		u32 isr;
   183	
   184		if(ehci->fusbh200){
   185			isr = ehci_readl(ehci, &regs->bmisr);
   186			if (isr & BMISR_OVC)
   187				return true;
   188		}
   189		else {
   190			isr = ehci_readl(ehci, &regs->otgisr);
   191			if (isr & OTGISR_OVC)
   192				return true;
   193		}
   194	
   195		return false;
   196	}
   197	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
