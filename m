Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B5D824A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721391922; cv=none; b=L/Ztguf07Oo+Zd8VEMH//Vmf1iL/pkSbLIVBsRmp2qTWVDid+TXchWQNslhgl2VhGMGwShxOs7J/G3X/cWtzGcUKNSKV9HUB8xwnZ4AZFUqsNMYvjKIAuth37qJb5eV/1a80sIsj+sBARtszKVOlMS9dQj4kr7Z5OWw3gNSzrOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721391922; c=relaxed/simple;
	bh=MtFS057LBAIX52/XD0rts7M/kszcWDcaZT5uT9dDaY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C6dcEJdrcrUgk56bdC9hKmUo3y7bMd7EA5BAcYYhIR5r/6TfmM3UVhdQS3s3QYKsX2xUYZEWnN62GtJJ0vyMx50LBkyPT9z5nlw+D7/vwWMHAFQsWDEr08pZ2FW4yFYkExiowbPqik2w2bm6lhN0RGHsuG3Y8hqseiPvz+XOwe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4Pg8UTd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4Pg8UTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721391920; x=1752927920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MtFS057LBAIX52/XD0rts7M/kszcWDcaZT5uT9dDaY0=;
  b=K4Pg8UTdD4gDh0pCxDFJ2n+uvnZwIrBoIseHO4UKYdGHRi+sre9HqtGK
   GNbs3PlzjCkRuW58S6r3g93fqrOAmKgFhtszQWECi9371Ui8kT3fihR4P
   JlxMLk6AfY+BsrKioO6eBwRJby49aRrNqkpV0lDrRlk1lD/WeZJbZOiNa
   hZkDbwPrLoDvEHUMLERd3TQfFD1e9DdRkhc4B27TgXLTfpw+++mpqVnws
   vvxNAFeB4ehRaGmpwTE7sU8xUjdxt9JXxoB/2GMS94eUhXkr6V1E+viKW
   KpWPTxUj3p3dZ+X82mO7JFjLoy/tyW8ozMLs5/cujZGlUzN4IsFLf6HZv
   A==;
X-CSE-ConnectionGUID: Q9LN3HN3Q0ufZB8tcVVuIg==
X-CSE-MsgGUID: +GAOyQZ1Q+WVxLtET4kOng==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19144632"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="19144632"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 05:25:20 -0700
X-CSE-ConnectionGUID: fcm17nuPT8mWkmkMg0A6Ww==
X-CSE-MsgGUID: B4LEZ1eCRR25WN0lBbFyNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="88587999"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jul 2024 05:25:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUmfk-000iA0-0P;
	Fri, 19 Jul 2024 12:25:16 +0000
Date: Fri, 19 Jul 2024 20:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 13085/13536] riscv64-linux-ld:
 drivers/bluetooth/btmtk.c:477:undefined reference to `usb_control_msg'
Message-ID: <202407192020.DOyqx0Uo-lkp@intel.com>
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
commit: 0c9b6e2f7742d52437d477f4ed045fa0b4d55f44 [13085/13536] Bluetooth: btmtk: Fix kernel crash when entering btmtk_usb_suspend
config: riscv-randconfig-s031-20220227 (https://download.01.org/0day-ci/archive/20240719/202407192020.DOyqx0Uo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407192020.DOyqx0Uo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407192020.DOyqx0Uo-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_reset_sync':
   drivers/bluetooth/btmtk.c:363:(.text+0x7f8): undefined reference to `usb_disable_autosuspend'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:374:(.text+0x856): undefined reference to `usb_alloc_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_recv_acl':
   drivers/bluetooth/btmtk.c:966:(.text+0x91e): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:966:(.text+0x92e): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:966:(.text+0x93e): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `kmalloc_noprof':
   include/linux/slab.h:660:(.text+0x98c): undefined reference to `usb_unanchor_urb'
   riscv64-linux-ld: include/linux/slab.h:660:(.text+0x998): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `kmalloc_type':
   include/linux/slab.h:448:(.text+0x9b4): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `usb_fill_control_urb':
   include/linux/usb.h:1669:(.text+0xa22): undefined reference to `usb_alloc_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   drivers/bluetooth/btmtk.c:533:(.text+0xad6): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:533:(.text+0xae2): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:533:(.text+0xaf2): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_submit_intr_urb':
   drivers/bluetooth/btmtk.c:1185:(.text+0xb72): undefined reference to `usb_unanchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `__create_pipe':
   include/linux/usb.h:1974:(.text+0xb82): undefined reference to `usb_free_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_submit_intr_urb':
   drivers/bluetooth/btmtk.c:1200:(.text+0xc62): undefined reference to `usb_kill_anchored_urbs'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_resume':
   drivers/bluetooth/btmtk.c:1254:(.text+0xd62): undefined reference to `usb_autopm_get_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_suspend':
   drivers/bluetooth/btmtk.c:1258:(.text+0xd96): undefined reference to `usb_autopm_put_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   drivers/bluetooth/btmtk.c:596:(.text+0xe4c): undefined reference to `usb_autopm_put_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_func_query':
   drivers/bluetooth/btmtk.c:714:(.text+0x1132): undefined reference to `usb_set_interface'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_shutdown':
   drivers/bluetooth/btmtk.c:1489:(.text+0x1254): undefined reference to `usb_kill_anchored_urbs'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `__set_mtk_intr_interface':
   drivers/bluetooth/btmtk.c:998:(.text+0x1346): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1000:(.text+0x1356): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1020:(.text+0x14c6): undefined reference to `usb_unanchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   drivers/bluetooth/btmtk.c:506:(.text+0x156c): undefined reference to `usb_alloc_urb'
>> riscv64-linux-ld: drivers/bluetooth/btmtk.c:477:(.text+0x1746): undefined reference to `usb_control_msg'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `__skb_put':
   include/linux/skbuff.h:2676:(.text+0x1804): undefined reference to `usb_control_msg'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `alloc_mtk_intr_urb':
   drivers/bluetooth/btmtk.c:1042:(.text+0x1904): undefined reference to `usb_control_msg'
   riscv64-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_setup':
   drivers/bluetooth/btmtk.c:1411:(.text+0x23d0): undefined reference to `usb_anchor_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1411:(.text+0x23e0): undefined reference to `usb_submit_urb'
   riscv64-linux-ld: drivers/bluetooth/btmtk.c:1433:(.text+0x243c): undefined reference to `usb_unanchor_urb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
