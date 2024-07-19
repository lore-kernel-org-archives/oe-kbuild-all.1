Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F306F2AF12
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721406338; cv=none; b=Cs5v3YASTE8P/0sA8x1q+ZzFI6ki/WefzmXVrsOxqBnRyCVxLJM0GZ7m2w7LiyUIjXuwYdGEc/mfJp7cim3HrH4LtTsnMqvgtVlsO8B/7f0H77qgkaowprdMvWyNmEfwjKTQScY7uxSvVNN4Y6cYComfybaGKGOVp9xXO/3m6Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721406338; c=relaxed/simple;
	bh=1c23s/pENxgLLsirYH09cUxf41Q/RKSuK4ENAvv7Ynw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGISROhZZ9QDhCGUYRYICmzLY/PC+mmoX8YeaFlGceNZNxkAhdcsISfVZ6ooOVEY8TLk2qehebGtA7F8vnLA6oL+yeA4ozDbOM9PZJoA725B1kTK3/QexIER2pCTf3Vy+pOMq/IwT4pzZn3tVq4SeCNq4zje06P4zwjFG2JHm2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9IwLJW0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9IwLJW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721406337; x=1752942337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1c23s/pENxgLLsirYH09cUxf41Q/RKSuK4ENAvv7Ynw=;
  b=J9IwLJW07U5Q3Rh5dv0ksd6fIqnDocq25ord4LYhSIDG958oyvTcX6iV
   cvCxNE1ymttIRgTXDH7w26G9jAFDLRQxaTUgo0zu2126kThZ1vuPKXplY
   flNtt5UaeQ5QA8RtZ4iv4JU4EKIkhfObA88cXfy+RBCQI0HnzgWNLBg7m
   lFibo28ckJVgpu7YWh06TCmimDgN3UAHqLW419hutkBBU0073VTw58Pcj
   gHbf6wivrQ2wURseGYkVPowphqH0JsWsKdEisQ3M6JeFv8o+RwVTo26tb
   olzEXJ07GyDiRqUdj7gtynLtIHgloPL264Zrsw40knK8hnT0hXEQR6bLW
   w==;
X-CSE-ConnectionGUID: 6epcRQ3NRKGJOlqkrx4JlQ==
X-CSE-MsgGUID: e+8q9h+HSzSA5AA8O3FcRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19175986"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="19175986"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 09:25:33 -0700
X-CSE-ConnectionGUID: h+XitkwrQ0WFsPNEJgQELw==
X-CSE-MsgGUID: ZjFDpjmMQN6F7jmYI3tpbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="56007053"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jul 2024 09:25:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUqQE-000iNO-0E;
	Fri, 19 Jul 2024 16:25:30 +0000
Date: Sat, 20 Jul 2024 00:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13468/13536]
 include/uapi/linux/swab.h:60:undefined reference to `usb_set_interface'
Message-ID: <202407200054.u0ZaGJAm-lkp@intel.com>
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
commit: a276805994095f7196324e79ae0a9d816d66d531 [13468/13536] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
config: xtensa-randconfig-r032-20230103 (https://download.01.org/0day-ci/archive/20240720/202407200054.u0ZaGJAm-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200054.u0ZaGJAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200054.u0ZaGJAm-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_setup_firmware':
   drivers/bluetooth/btmtk.c:312:(.text+0xc9c): undefined reference to `usb_alloc_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:312:(.text+0xca0): undefined reference to `usb_free_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:312:(.text+0xca4): undefined reference to `usb_anchor_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:317:(.text+0xca8): undefined reference to `usb_submit_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:317:(.text+0xcac): undefined reference to `usb_unanchor_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:321:(.text+0xce0): undefined reference to `usb_alloc_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:328:(.text+0xd18): undefined reference to `usb_free_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_reset_sync':
   drivers/bluetooth/btmtk.c:370:(.text+0xe66): undefined reference to `usb_anchor_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:371:(.text+0xe73): undefined reference to `usb_submit_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:374:(.text+0xef4): undefined reference to `usb_unanchor_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:374:(.text+0xf02): undefined reference to `usb_free_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_recv_acl':
   include/net/bluetooth/hci.h:2893:(.text+0xf38): undefined reference to `usb_kill_anchored_urbs'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_recv_acl':
   drivers/bluetooth/btmtk.c:962:(.text+0xf8e): undefined reference to `usb_kill_anchored_urbs'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   drivers/bluetooth/btmtk.c:577:(.text+0x17e4): undefined reference to `usb_control_msg'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:599:(.text+0x189b): undefined reference to `usb_control_msg'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   include/linux/instrumented.h:83:(.text+0x19a7): undefined reference to `usb_control_msg'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_shutdown':
   drivers/bluetooth/btmtk.c:1483:(.text+0x1dde): undefined reference to `usb_anchor_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:1484:(.text+0x1deb): undefined reference to `usb_submit_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:1489:(.text+0x1e80): undefined reference to `usb_unanchor_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `skb_put_data.isra.0':
   include/linux/skbuff.h:2716:(.text+0x224b): undefined reference to `usb_anchor_urb'
   xtensa-linux-ld: include/linux/skbuff.h:2720:(.text+0x225a): undefined reference to `usb_submit_urb'
   xtensa-linux-ld: include/linux/skbuff.h:2721:(.text+0x22ec): undefined reference to `usb_unanchor_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   drivers/bluetooth/btmtk.c:441:(.text+0x2397): undefined reference to `usb_alloc_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:510:(.text+0x2657): undefined reference to `usb_control_msg'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_intr_complete':
   drivers/bluetooth/btmtk.c:1159:(.text+0x2d13): undefined reference to `usb_alloc_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.c:1159:(.text+0x2d5c): undefined reference to `usb_free_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `alloc_mtk_intr_urb':
   include/linux/skbuff.h:2676:(.text+0x2ea4): undefined reference to `usb_anchor_urb'
   xtensa-linux-ld: include/linux/skbuff.h:2677:(.text+0x2eaf): undefined reference to `usb_submit_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `alloc_mtk_intr_urb':
   include/linux/usb.h:1738:(.text+0x2f30): undefined reference to `usb_unanchor_urb'
   xtensa-linux-ld: include/linux/usb.h:1739:(.text+0x2f3e): undefined reference to `usb_free_urb'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `alloc_mtk_intr_urb':
   drivers/bluetooth/btmtk.c:1054:(.text+0x3040): undefined reference to `usb_set_interface'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_reg_read':
>> include/uapi/linux/swab.h:60:(.text+0x312f): undefined reference to `usb_set_interface'
   xtensa-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_subsys_reset':
   drivers/bluetooth/btmtk.c:824:(.text+0x335c): undefined reference to `usb_kill_anchored_urbs'


vim +60 include/uapi/linux/swab.h

607ca46e97a1b6 David Howells 2012-10-13  56  
607ca46e97a1b6 David Howells 2012-10-13  57  static inline __attribute_const__ __u32 __fswab32(__u32 val)
607ca46e97a1b6 David Howells 2012-10-13  58  {
7322dd755e7dd3 Arnd Bergmann 2016-05-05  59  #if defined(__arch_swab32)
607ca46e97a1b6 David Howells 2012-10-13 @60  	return __arch_swab32(val);
607ca46e97a1b6 David Howells 2012-10-13  61  #else
607ca46e97a1b6 David Howells 2012-10-13  62  	return ___constant_swab32(val);
607ca46e97a1b6 David Howells 2012-10-13  63  #endif
607ca46e97a1b6 David Howells 2012-10-13  64  }
607ca46e97a1b6 David Howells 2012-10-13  65  

:::::: The code at line 60 was first introduced by commit
:::::: 607ca46e97a1b6594b29647d98a32d545c24bdff UAPI: (Scripted) Disintegrate include/linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
