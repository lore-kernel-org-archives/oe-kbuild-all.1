Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B652C80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721375474; cv=none; b=oGUCl3q6BTXGwbaPX+eEekzXnPrGFIajpiWQmkeLY2kRbl5ISgWUJcijTm/+B/KmhtIn+sS1aZKB1+jZczwUA3dj2jtesztGD0nZREaXwpISNuEPoqfC8cT9X8AZI/HKnUWX2EtJFQOzOOidRHj+6kIkCoCfPlKgAnIrfmMeVwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721375474; c=relaxed/simple;
	bh=e64qZhC+pJ9w+xstof315ocUdQNQ7lmcdTsBoupKtFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LXc2roXjc40cAaMYpOwEARJNPdJyHzdicSqHsh+K7bWloJ7CfKZtof2zHUL/KlYTqNGE+C94qzNZBy/OXjs+WfBPOK2QbBIRagLyWPmvAZzagG1f0dfYwoS1UsXIMFHEomXbTAeXOjoBp4ihBZmTTusxPrUStUZbf1muzyqqRMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlqsqFXl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlqsqFXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721375471; x=1752911471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e64qZhC+pJ9w+xstof315ocUdQNQ7lmcdTsBoupKtFE=;
  b=LlqsqFXl9DwE3Qw2wD88JRC3B0DdfaFEcIJRsmoPhZhD2jQkoh4XC+KG
   2ZF9YB0o537rXbSa1D8+fhSPXSJVeiktMd7tbDE9qXWaKEc2tntOwp2o5
   e4ASLj818NqgYPsA2qreSuFYYoQxUjWCotO9jh0ZvRAwKzYSLxOgcSmLF
   8HNeFVgIf+5iZXZfBpu2GAyH04xWkQ7558QJ4sVBGzu6iTQwudOBJy21/
   lTiTVG56Ma1l8vz4VaS50d39toEyOMIQhogzRHYNe6xFp4SwKo1vEezFe
   bnfpRapok73ojp6CYbn5OlurLFr28udO3D4E4GHfwzl5OFisrdSn/BS4l
   Q==;
X-CSE-ConnectionGUID: iEu8BVvCRr6f15HqejAadw==
X-CSE-MsgGUID: fLa5YPbgSzCLAfRRqzSNSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="36411725"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="36411725"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 00:51:10 -0700
X-CSE-ConnectionGUID: dEwdmEZUSGS8/LVimr4WXQ==
X-CSE-MsgGUID: KjpwUF09QXWcKdPX8y1vVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="51736324"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jul 2024 00:51:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUiOQ-000hy8-2u;
	Fri, 19 Jul 2024 07:51:06 +0000
Date: Fri, 19 Jul 2024 15:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13285/13432] riscv64-linux-ld:
 include/linux/usb.h:1400:undefined reference to `usb_submit_urb'
Message-ID: <202407191531.HcWtZBqb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   41c196e567fb1ea97f68a2ffb7faab451cd90854
commit: 838969e6664d749c5271ed7ce812ce4b6862b403 [13285/13432] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
config: riscv-randconfig-s031-20220227 (https://download.01.org/0day-ci/archive/20240719/202407191531.HcWtZBqb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407191531.HcWtZBqb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407191531.HcWtZBqb-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_process_coredump':
   drivers/bluetooth/btmtk.c:437:(.text+0x7f8): undefined reference to `usb_disable_autosuspend'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_reset_sync':
   drivers/bluetooth/btmtk.c:370:(.text+0x856): undefined reference to `usb_alloc_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_recv_acl':
   drivers/bluetooth/btmtk.c:941:(.text+0x922): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:965:(.text+0x932): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:966:(.text+0x942): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   drivers/bluetooth/btmtk.c:523:(.text+0x98a): undefined reference to `usb_unanchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `kmalloc_type':
   include/linux/slab.h:448:(.text+0x9aa): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   drivers/bluetooth/btmtk.c:541:(.text+0x9e2): undefined reference to `usb_alloc_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:573:(.text+0xa96): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:564:(.text+0xaa2): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:565:(.text+0xab2): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:533:(.text+0xb2a): undefined reference to `usb_unanchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_submit_intr_urb':
   drivers/bluetooth/btmtk.c:1171:(.text+0xb44): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1195:(.text+0xc10): undefined reference to `usb_kill_anchored_urbs'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_resume':
   drivers/bluetooth/btmtk.c:1254:(.text+0xd1c): undefined reference to `usb_autopm_get_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `clear_bit':
   arch/riscv/include/asm/bitops.h:289:(.text+0xd50): undefined reference to `usb_autopm_put_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_suspend':
   drivers/bluetooth/btmtk.c:1268:(.text+0xdfc): undefined reference to `usb_autopm_put_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   drivers/bluetooth/btmtk.c:593:(.text+0x10ee): undefined reference to `usb_set_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_shutdown':
   drivers/bluetooth/btmtk.c:1481:(.text+0x1212): undefined reference to `usb_kill_anchored_urbs'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `init_usb_anchor':
   include/linux/usb.h:1400:(.text+0x1306): undefined reference to `usb_anchor_urb'
>> riscv64-linux-ld: include/linux/usb.h:1400:(.text+0x1316): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_isointf_init':
   drivers/bluetooth/btmtk.c:1225:(.text+0x147e): undefined reference to `usb_unanchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_isointf_init.constprop.0':
   drivers/bluetooth/btmtk.c:1232:(.text+0x152c): undefined reference to `usb_alloc_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   drivers/bluetooth/btmtk.c:516:(.text+0x1706): undefined reference to `usb_control_msg'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `alloc_mtk_intr_urb':
   drivers/bluetooth/btmtk.c:1029:(.text+0x17c4): undefined reference to `usb_control_msg'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `usb_fill_int_urb':
   include/linux/usb.h:1754:(.text+0x18c4): undefined reference to `usb_control_msg'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_setup':
   drivers/bluetooth/btmtk.c:1393:(.text+0x2390): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1404:(.text+0x23a0): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1410:(.text+0x23f4): undefined reference to `usb_unanchor_urb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
