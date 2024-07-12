Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3EF6FB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 02:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720750744; cv=none; b=TodaD8n+/28r7QXoBuX8/dZXXiX4Nzqpi8Jc6dvaY1ESOr2Rz7W3IbepuNxIGwoxWEfDonbvQESVgBzNOT/9XLU9HJt+ukz9JBeW6uq/s+lcNG8l9f2l3LJuIkn7hEUv7/laO5Uhbp3wH1y23UniGvv9UDQF30LliV6/cldZ3iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720750744; c=relaxed/simple;
	bh=9Swd1PfMhyE8MA+pBV9GgUohxyVG1KcXZwAmWB28a7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NvHws/Zz5wuMLbo1WgjlWZsHjySExxG8Cgqlp6QJsx03KOicIp6pj+sFBnpLJLd/cjf4hKS/TF/9c8QettPqSGzoJ8KGuAtHElbRMntrK6olUAzKV6oqetRVykqkG5zmNpRAOClJ+uoMc7pOdnday+XfC3QB7uUsbQNesEIflyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/A+ayJx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/A+ayJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720750742; x=1752286742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Swd1PfMhyE8MA+pBV9GgUohxyVG1KcXZwAmWB28a7s=;
  b=i/A+ayJx4vIahHfyKJ4RvwAe/DQawZWuM4wGYkurgXiNjb1DKr9IdPAf
   afpA4bpoCAoBGSc3RnLnaYLU+vpnqKKo7ryWzBxxRnD+RenFWO96pWN98
   NJ+tIJaDcYXTfYcYtbI9jGc30h6pvCcqFFPxauo6REtik0MwCxg+XIlQv
   8OyZfJvLSf0rxVo+K2enGdALySda1YbaGRs+6AMOLsQ95N/vULci2W/s6
   EsQWJ1OUub89nCd/AsqwzqqPKoBr3IJEVGoO3O+3CDPZzNVrDiDw0qZzi
   n+dYkik7LHHm4y18Qup8UHF6eXB3fIxVsReXJ6tG05I3ESFrhwCKW5nAz
   w==;
X-CSE-ConnectionGUID: qyYt01iXRwqnRFxD8Ut10Q==
X-CSE-MsgGUID: Jjzar0UGS9W5tubcP/h8Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18325892"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="18325892"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 19:19:02 -0700
X-CSE-ConnectionGUID: eoj3842WT8GnJWZE2Wt+KA==
X-CSE-MsgGUID: dP6B7j/xQCS8b/Q5FUHhIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="48735052"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jul 2024 19:19:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS5sA-000aDh-2R;
	Fri, 12 Jul 2024 02:18:58 +0000
Date: Fri, 12 Jul 2024 10:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12502/12643]
 arch/riscv/include/asm/irqflags.h:39:undefined reference to
 `usb_unanchor_urb'
Message-ID: <202407121054.aZowIa9T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 0766abef85bc11d18eb25025caca92c4b9867c89 [12502/12643] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
config: riscv-randconfig-r034-20220801 (https://download.01.org/0day-ci/archive/20240712/202407121054.aZowIa9T-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121054.aZowIa9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121054.aZowIa9T-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   drivers/bluetooth/btmtk.c:531:(.text+0x764): undefined reference to `usb_alloc_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:561:(.text+0x804): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:562:(.text+0x814): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:570:(.text+0x824): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:567:(.text+0x86a): undefined reference to `usb_unanchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:537:(.text+0x880): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:550:(.text+0x89c): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_submit_intr_urb':
   drivers/bluetooth/btmtk.c:1174:(.text+0x8ce): undefined reference to `usb_alloc_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1195:(.text+0x982): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1197:(.text+0x98e): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1205:(.text+0x99e): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1202:(.text+0xa16): undefined reference to `usb_unanchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1181:(.text+0xa30): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_suspend':
   drivers/bluetooth/btmtk.c:1265:(.text+0xaaa): undefined reference to `usb_kill_anchored_urbs'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   drivers/bluetooth/btmtk.c:610:(.text+0xba0): undefined reference to `usb_autopm_get_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:623:(.text+0xbd4): undefined reference to `usb_autopm_put_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:663:(.text+0xc44): undefined reference to `usb_autopm_put_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_recv_acl':
   drivers/bluetooth/btmtk.c:941:(.text+0xfd4): undefined reference to `usb_disable_autosuspend'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `init_usb_anchor':
   include/linux/usb.h:1399:(.text+0x109c): undefined reference to `usb_set_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `__set_mtk_intr_interface':
   drivers/bluetooth/btmtk.c:1013:(.text+0x119e): undefined reference to `usb_kill_anchored_urbs'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `pm_runtime_mark_last_busy':
   include/linux/pm_runtime.h:220:(.text+0x1286): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   drivers/bluetooth/btmtk.c:506:(.text+0x1296): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:516:(.text+0x13bc): undefined reference to `usb_unanchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `alloc_mtk_intr_urb':
   drivers/bluetooth/btmtk.c:1034:(.text+0x1458): undefined reference to `usb_alloc_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_reg_read':
   drivers/bluetooth/btmtk.c:790:(.text+0x15d0): undefined reference to `usb_control_msg'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_uhw_reg_write':
   drivers/bluetooth/btmtk.c:737:(.text+0x1672): undefined reference to `usb_control_msg'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_uhw_reg_read':
   drivers/bluetooth/btmtk.c:760:(.text+0x1734): undefined reference to `usb_control_msg'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `__preempt_count_sub':
   include/asm-generic/preempt.h:59:(.text+0x2338): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_recv_isopkt':
   drivers/bluetooth/btmtk.c:1114:(.text+0x2348): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `arch_irqs_disabled_flags':
>> arch/riscv/include/asm/irqflags.h:39:(.text+0x239c): undefined reference to `usb_unanchor_urb'


vim +39 arch/riscv/include/asm/irqflags.h

6d60b6ee0c9777 Palmer Dabbelt    2017-07-10  35  
6d60b6ee0c9777 Palmer Dabbelt    2017-07-10  36  /* test flags */
6d60b6ee0c9777 Palmer Dabbelt    2017-07-10  37  static inline int arch_irqs_disabled_flags(unsigned long flags)
6d60b6ee0c9777 Palmer Dabbelt    2017-07-10  38  {
a4c3733d32a72f Christoph Hellwig 2019-10-28 @39  	return !(flags & SR_IE);
6d60b6ee0c9777 Palmer Dabbelt    2017-07-10  40  }
6d60b6ee0c9777 Palmer Dabbelt    2017-07-10  41  

:::::: The code at line 39 was first introduced by commit
:::::: a4c3733d32a72f11dee86d0731d7565aa6ebe22d riscv: abstract out CSR names for supervisor vs machine mode

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Paul Walmsley <paul.walmsley@sifive.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
