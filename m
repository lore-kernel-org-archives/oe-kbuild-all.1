Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71701B86FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721299781; cv=none; b=m7ZRTK/zQJhrKYHcSs8CsxD0QlndTAGNkMVZ/017Sj0Rc44O5dd7wtB0F8GWaNDkUnGxo+m7TnglbfTO+7ZmHyiKuJ6fx4jGrfLxTItTjdE0o3bWKCDYSN4VsRGTQxKTkIn4CHnj+yd2tylUpmgF7NVVQwbV6Ex8hyaRWqmvigA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721299781; c=relaxed/simple;
	bh=0DaIc+7PUscolcvVdPiNoB38FMffMQPUO1BjP3APk2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRHXgvBhkP/342AyB3XWytHYKZ0GMqPmWevLSCeq/Z1Uv3L/pVC89v0vq3FE0kMG3CrZVV0FLyFvw0zZy39Ztcvk4kRIexyJFJKZN9fPzUT7ircvndTghlAZlaezX2jJTnL7nyLaDg3qsWeBIW3/DdH7tAhvafOEN9zeoUO8HIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0NHTZ+L; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0NHTZ+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721299780; x=1752835780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0DaIc+7PUscolcvVdPiNoB38FMffMQPUO1BjP3APk2I=;
  b=U0NHTZ+LORyBhrM1sAEmAScZyzH3qAfXO14iF2jcMSRkRvforPj8qw/9
   qqXU+O6CIZ6euXGddB5UjbB9lbtSJE0ECEOQA7EcVHM8N0stK+CwgCp74
   4io9s8rMmbdEPjWM/3jYH+N+uPjEjOlGspnFa52JSGQ4RCZ8db4vsu2u/
   ctmZSKudlKpRTq6GKDmgW7ulGT+fKkyZtSLg57gAcnCgIa15/jdqFQfla
   apFus+oNeJbWyvSYHzWIwKEB2GwAKKmDz3U0CsXidZxa138YiHkeJDkxC
   uEAQMQAlZxBGv5JzmtoFoMPwvb2NnDHtkF/rmGCeWtDj41zZ+kYoRgZbk
   A==;
X-CSE-ConnectionGUID: 34fuvxkJTuSe0V+GqrUX8g==
X-CSE-MsgGUID: kKFYqFUyQamV0nz0VVSyug==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18986942"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="18986942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 03:49:37 -0700
X-CSE-ConnectionGUID: +tgjZLItQN6266+RFvvo3A==
X-CSE-MsgGUID: KR+ozVKsQgmDAMb5Xe26UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="50773555"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jul 2024 03:49:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUOhZ-000hAc-08;
	Thu, 18 Jul 2024 10:49:33 +0000
Date: Thu, 18 Jul 2024 18:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 13064/13432]
 include/asm-generic/bitops/generic-non-atomic.h:128:undefined reference to
 `usb_kill_anchored_urbs'
Message-ID: <202407181821.iyQzSSCl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73399b58e5e5a1b28a04baf42e321cfcfc663c2f
commit: 0c9b6e2f7742d52437d477f4ed045fa0b4d55f44 [13064/13432] Bluetooth: btmtk: Fix kernel crash when entering btmtk_usb_suspend
config: riscv-randconfig-r006-20230319 (https://download.01.org/0day-ci/archive/20240718/202407181821.iyQzSSCl-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181821.iyQzSSCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181821.iyQzSSCl-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   drivers/bluetooth/btmtk.c:523:(.text+0x5fc): undefined reference to `usb_alloc_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `kmalloc_noprof':
   include/linux/slab.h:660:(.text+0x62a): undefined reference to `usb_free_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   drivers/bluetooth/btmtk.c:559:(.text+0x6bc): undefined reference to `usb_anchor_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.c:561:(.text+0x6cc): undefined reference to `usb_submit_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.c:565:(.text+0x70e): undefined reference to `usb_unanchor_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.c:567:(.text+0x718): undefined reference to `usb_free_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_submit_intr_urb':
   drivers/bluetooth/btmtk.c:1171:(.text+0x76c): undefined reference to `usb_alloc_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `kmalloc_noprof':
   include/linux/slab.h:664:(.text+0x79a): undefined reference to `usb_free_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `usb_mark_last_busy':
   include/linux/usb.h:803:(.text+0x83e): undefined reference to `usb_anchor_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_submit_intr_urb':
   drivers/bluetooth/btmtk.c:1195:(.text+0x84a): undefined reference to `usb_submit_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.c:1200:(.text+0x88a): undefined reference to `usb_unanchor_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.c:1200:(.text+0x894): undefined reference to `usb_free_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `generic_test_bit':
>> include/asm-generic/bitops/generic-non-atomic.h:128:(.text+0x904): undefined reference to `usb_kill_anchored_urbs'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_reg_read':
   drivers/bluetooth/btmtk.c:789:(.text+0xa92): undefined reference to `usb_control_msg'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `put_unaligned_le32':
   include/asm-generic/unaligned.h:47:(.text+0xb50): undefined reference to `usb_control_msg'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_uhw_reg_read':
   drivers/bluetooth/btmtk.c:760:(.text+0xbfa): undefined reference to `usb_control_msg'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `cpu_relax':
   arch/riscv/include/asm/vdso/processor.h:22:(.text+0x10e8): undefined reference to `usb_autopm_get_interface'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_subsys_reset':
   drivers/bluetooth/btmtk.c:923:(.text+0x111a): undefined reference to `usb_autopm_put_interface'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   drivers/bluetooth/btmtk.c:588:(.text+0x1152): undefined reference to `usb_autopm_put_interface'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_process_coredump':
   drivers/bluetooth/btmtk.c:407:(.text+0x14d0): undefined reference to `usb_disable_autosuspend'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `skb_put_data':
   include/linux/skbuff.h:2718:(.text+0x1634): undefined reference to `usb_anchor_urb'
   riscv32-linux-ld: include/linux/skbuff.h:2721:(.text+0x1644): undefined reference to `usb_submit_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   drivers/bluetooth/btmtk.c:455:(.text+0x1690): undefined reference to `usb_unanchor_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `generic_test_bit':
   include/asm-generic/bitops/generic-non-atomic.h:128:(.text+0x17de): undefined reference to `usb_anchor_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_intr_complete':
   drivers/bluetooth/btmtk.c:1128:(.text+0x17ee): undefined reference to `usb_submit_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_recv_isopkt':
   drivers/bluetooth/btmtk.c:1071:(.text+0x1838): undefined reference to `usb_unanchor_urb'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `strnlen':
   include/linux/fortify-string.h:233:(.text+0x1a70): undefined reference to `usb_set_interface'
   riscv32-linux-ld: include/linux/fortify-string.h:233:(.text+0x1ab0): undefined reference to `usb_kill_anchored_urbs'
   riscv32-linux-ld: drivers/bluetooth/btmtk.o: in function `__set_mtk_intr_interface':
   drivers/bluetooth/btmtk.c:993:(.text+0x1be0): undefined reference to `usb_alloc_urb'


vim +128 include/asm-generic/bitops/generic-non-atomic.h

21bb8af513d35c Alexander Lobakin 2022-06-24  114  
21bb8af513d35c Alexander Lobakin 2022-06-24  115  /**
21bb8af513d35c Alexander Lobakin 2022-06-24  116   * generic_test_bit - Determine whether a bit is set
21bb8af513d35c Alexander Lobakin 2022-06-24  117   * @nr: bit number to test
21bb8af513d35c Alexander Lobakin 2022-06-24  118   * @addr: Address to start counting from
21bb8af513d35c Alexander Lobakin 2022-06-24  119   */
0e862838f29014 Alexander Lobakin 2022-06-24  120  static __always_inline bool
0e862838f29014 Alexander Lobakin 2022-06-24  121  generic_test_bit(unsigned long nr, const volatile unsigned long *addr)
21bb8af513d35c Alexander Lobakin 2022-06-24  122  {
21bb8af513d35c Alexander Lobakin 2022-06-24  123  	/*
21bb8af513d35c Alexander Lobakin 2022-06-24  124  	 * Unlike the bitops with the '__' prefix above, this one *is* atomic,
21bb8af513d35c Alexander Lobakin 2022-06-24  125  	 * so `volatile` must always stay here with no cast-aways. See
21bb8af513d35c Alexander Lobakin 2022-06-24  126  	 * `Documentation/atomic_bitops.txt` for the details.
21bb8af513d35c Alexander Lobakin 2022-06-24  127  	 */
21bb8af513d35c Alexander Lobakin 2022-06-24 @128  	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
21bb8af513d35c Alexander Lobakin 2022-06-24  129  }
21bb8af513d35c Alexander Lobakin 2022-06-24  130  

:::::: The code at line 128 was first introduced by commit
:::::: 21bb8af513d35c005c401706030f4eb469538d1d bitops: always define asm-generic non-atomic bitops

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
