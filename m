Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F383BBC8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 04:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687782; cv=none; b=RFZb+CRgBG71iYXk/Tnp6JhZfDHryHtjVhAdHg6hlr9NMsrBKN94bcNFb9AUOAvzHeLjYpMVJh3wjg96wAmdeOt4af4LT63UpX3zav49upr/L7QbRkEtukTUXxEcg30G2ui7GAVUMrIPUZjzrMkyQbTmvmCkUHbx2W+KYq7nGQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687782; c=relaxed/simple;
	bh=PSt3YEoIxgllokVzLslba2fxsNdOfwppIYzLhXQ63dY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGKzJg6122O1ICzZNBQRFcl6S29Dg4IXxjxa4gp6b6GvjZ59EEDBUfdOWDNUWY4twLrkU8BchYB1NI0P8XZdP3f+ZDnV4xr4mLK3KTqeetqHheaeCD9Gz9picjyWw7Ix2GsoFIjGK1Xn6ckEjQdinBXQ2ZWkrO223aU1GK7eSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KT9qBlTy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KT9qBlTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711687780; x=1743223780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PSt3YEoIxgllokVzLslba2fxsNdOfwppIYzLhXQ63dY=;
  b=KT9qBlTyNd773aAgAgvCAJk6+CmzT6S3aReG72L01WVrSK50punMR0Ka
   eTtriH9C1IHYMAf5kHLTWlbZP83etABZAN3fOLGE0BalCR/vXxHB10/is
   NUZZgU74JkB8ZwmrClXQByQ3N8hN9+AoU/lDSrGyc8gbUNiRiuNX3qWmL
   Mim1kw7781TpFPpaWubnFl1MQ1Ko3JwA2Dga9ejusVSZYiDwgQFnnfyCv
   IG4FJd852N8Mj0HHptczpWSZMmK55eRPB462wGfTzxvNojSlofDw1RFaz
   5kNSJ4X3kMze3ELmoXfvrcm6SrYLSS6W9qIeKUXpLuLroprMW6oSjcS9A
   w==;
X-CSE-ConnectionGUID: 6tZEVzVvQhCZQAxlUwHspA==
X-CSE-MsgGUID: 95k6eFRZSZam7F5n/Kn9qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18020177"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="18020177"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 21:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17507528"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2024 21:49:35 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq4BI-0002rG-1e;
	Fri, 29 Mar 2024 04:49:32 +0000
Date: Fri, 29 Mar 2024 12:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>
Subject: [linux-next:master 1083/1266]
 include/linux/slab.h:653:(.xiptext+0x130): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
Message-ID: <202403291202.l27Op2ak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: c64e38ed88d13557ebeb4cb8def02390a8f3dfc4 [1083/1266] mm/slab: enable slab allocation tagging for kmalloc and friends
config: xtensa-randconfig-r006-20221106 (https://download.01.org/0day-ci/archive/20240329/202403291202.l27Op2ak-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291202.l27Op2ak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291202.l27Op2ak-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.o: in function `kmalloc_noprof':
>> include/linux/slab.h:653:(.xiptext+0x130): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:212:(.xiptext+0x156): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:212:(.xiptext+0x166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x36c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x382): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x396): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x3ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.o: in function `arch_local_irq_enable':
   arch/xtensa/include/asm/irqflags.h:61:(.xiptext+0x5eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x4)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_early_fixup':
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x618): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x66a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x68a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x6b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:142:(.xiptext+0x7da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:154:(.xiptext+0x850): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.o:drivers/mtd/chips/cfi_util.c:221:(.xiptext+0x26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:221:(.xiptext+0x42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0x52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:240:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_util.c:244:(.xiptext+0x126): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:287:(.xiptext+0x133): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:287:(.xiptext+0x14b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x18c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:294:(.xiptext+0x1d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:294:(.xiptext+0x1e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x20c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x23f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x257): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x280): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x2bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:207:(.xiptext+0x2e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x317): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_build_cmd_addr':
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:264:(.xiptext+0x360): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd_addr
   drivers/mtd/chips/cfi_util.c:264:(.xiptext+0x36f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_build_cmd_addr':
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x39f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x3d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_build_cmd_addr':
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x400): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x418): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd_addr
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:271:(.xiptext+0x426): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_build_cmd_addr':
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x454): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x4aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:278:(.xiptext+0x4de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.c:282:(.xiptext+0x4f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `fixup_convert_atmel_pri':
   drivers/mtd/chips/cfi_cmdset_0002.c:319:(.text+0xee3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:731:(.text+0x12c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x518)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_fixup_m29ew_delay_after_resume':
   drivers/mtd/chips/cfi_cmdset_0002.c:597:(.text+0x13bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x518)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_read':
   drivers/mtd/chips/cfi_cmdset_0002.c:1250:(.text+0x1a7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xcd0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_reboot':
   drivers/mtd/chips/cfi_cmdset_0002.c:3088:(.text+0x1c80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x518)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_destroy':
   drivers/mtd/chips/cfi_cmdset_0002.c:3103:(.text+0x1cd2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x11c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2789:(.text+0x2076): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x518)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_ppb_unlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2800:(.text+0x20c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x518)
   drivers/mtd/chips/cfi_cmdset_0002.c:2859:(.text+0x223c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x518)
   drivers/mtd/chips/cfi_cmdset_0002.c:2863:(.text+0x228c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x518)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_secsi_read':
   drivers/mtd/chips/cfi_cmdset_0002.c:1380:(.text+0x2b9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc30)
   drivers/mtd/chips/cfi_cmdset_0002.c:1374:(.text+0x2dc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc30)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_enter':
   drivers/mtd/chips/cfi_cmdset_0002.c:1287:(.text+0x2eea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc30)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1414:(.text+0x3088): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc30)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1862:(.text+0x32ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1474)
   drivers/mtd/chips/cfi_cmdset_0002.c:1904:(.text+0x344f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1916:(.text+0x34d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1587:(.text+0x3c9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x518)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_lock_user_prot_reg':
   drivers/mtd/chips/cfi_cmdset_0002.c:1638:(.text+0x3cee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x11c)
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0xa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':


vim +653 include/linux/slab.h

a0c3b940023eef Hyeonggon Yoo         2022-08-17  596  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  597  /**
838de63b101147 Vlastimil Babka       2022-11-10  598   * kmalloc - allocate kernel memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  599   * @size: how many bytes of memory are required.
838de63b101147 Vlastimil Babka       2022-11-10  600   * @flags: describe the allocation context
f1b6eb6e6be149 Christoph Lameter     2013-09-04  601   *
f1b6eb6e6be149 Christoph Lameter     2013-09-04  602   * kmalloc is the normal method of allocating memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  603   * for objects smaller than page size in the kernel.
7e3528c3660a2e Randy Dunlap          2013-11-22  604   *
59bb47985c1db2 Vlastimil Babka       2019-10-06  605   * The allocated object address is aligned to at least ARCH_KMALLOC_MINALIGN
59bb47985c1db2 Vlastimil Babka       2019-10-06  606   * bytes. For @size of power of two bytes, the alignment is also guaranteed
59bb47985c1db2 Vlastimil Babka       2019-10-06  607   * to be at least to the size.
59bb47985c1db2 Vlastimil Babka       2019-10-06  608   *
01598ba6b1a863 Mike Rapoport         2018-11-11  609   * The @flags argument may be one of the GFP flags defined at
e9d198f2be851f Thorsten Scherer      2023-03-12  610   * include/linux/gfp_types.h and described at
01598ba6b1a863 Mike Rapoport         2018-11-11  611   * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
7e3528c3660a2e Randy Dunlap          2013-11-22  612   *
01598ba6b1a863 Mike Rapoport         2018-11-11  613   * The recommended usage of the @flags is described at
2370ae4b1d5aa7 Mauro Carvalho Chehab 2020-04-10  614   * :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
7e3528c3660a2e Randy Dunlap          2013-11-22  615   *
01598ba6b1a863 Mike Rapoport         2018-11-11  616   * Below is a brief outline of the most useful GFP flags
7e3528c3660a2e Randy Dunlap          2013-11-22  617   *
01598ba6b1a863 Mike Rapoport         2018-11-11  618   * %GFP_KERNEL
01598ba6b1a863 Mike Rapoport         2018-11-11  619   *	Allocate normal kernel ram. May sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  620   *
01598ba6b1a863 Mike Rapoport         2018-11-11  621   * %GFP_NOWAIT
01598ba6b1a863 Mike Rapoport         2018-11-11  622   *	Allocation will not sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  623   *
01598ba6b1a863 Mike Rapoport         2018-11-11  624   * %GFP_ATOMIC
01598ba6b1a863 Mike Rapoport         2018-11-11  625   *	Allocation will not sleep.  May use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  626   *
7e3528c3660a2e Randy Dunlap          2013-11-22  627   * Also it is possible to set different flags by OR'ing
7e3528c3660a2e Randy Dunlap          2013-11-22  628   * in one or more of the following additional @flags:
7e3528c3660a2e Randy Dunlap          2013-11-22  629   *
838de63b101147 Vlastimil Babka       2022-11-10  630   * %__GFP_ZERO
838de63b101147 Vlastimil Babka       2022-11-10  631   *	Zero the allocated memory before returning. Also see kzalloc().
838de63b101147 Vlastimil Babka       2022-11-10  632   *
01598ba6b1a863 Mike Rapoport         2018-11-11  633   * %__GFP_HIGH
01598ba6b1a863 Mike Rapoport         2018-11-11  634   *	This allocation has high priority and may use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  635   *
01598ba6b1a863 Mike Rapoport         2018-11-11  636   * %__GFP_NOFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  637   *	Indicate that this allocation is in no way allowed to fail
7e3528c3660a2e Randy Dunlap          2013-11-22  638   *	(think twice before using).
7e3528c3660a2e Randy Dunlap          2013-11-22  639   *
01598ba6b1a863 Mike Rapoport         2018-11-11  640   * %__GFP_NORETRY
01598ba6b1a863 Mike Rapoport         2018-11-11  641   *	If memory is not immediately available,
7e3528c3660a2e Randy Dunlap          2013-11-22  642   *	then give up at once.
7e3528c3660a2e Randy Dunlap          2013-11-22  643   *
01598ba6b1a863 Mike Rapoport         2018-11-11  644   * %__GFP_NOWARN
01598ba6b1a863 Mike Rapoport         2018-11-11  645   *	If allocation fails, don't issue any warnings.
7e3528c3660a2e Randy Dunlap          2013-11-22  646   *
01598ba6b1a863 Mike Rapoport         2018-11-11  647   * %__GFP_RETRY_MAYFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  648   *	Try really hard to succeed the allocation but fail
dcda9b04713c3f Michal Hocko          2017-07-12  649   *	eventually.
f1b6eb6e6be149 Christoph Lameter     2013-09-04  650   */
c64e38ed88d135 Suren Baghdasaryan    2024-03-21  651  static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
f1b6eb6e6be149 Christoph Lameter     2013-09-04  652  {
6fa57d78aa7f21 Kees Cook             2022-11-17 @653  	if (__builtin_constant_p(size) && size) {
cc252eae85e095 Vlastimil Babka       2018-10-26  654  		unsigned int index;
3bf019334fbbb5 Kees Cook             2022-11-17  655  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  656  		if (size > KMALLOC_MAX_CACHE_SIZE)
c64e38ed88d135 Suren Baghdasaryan    2024-03-21  657  			return kmalloc_large_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  658  
cc252eae85e095 Vlastimil Babka       2018-10-26  659  		index = kmalloc_index(size);
c64e38ed88d135 Suren Baghdasaryan    2024-03-21  660  		return kmalloc_trace_noprof(
3c615294058429 GONG, Ruiqi           2023-07-14  661  				kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
f1b6eb6e6be149 Christoph Lameter     2013-09-04  662  				flags, size);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  663  	}
c64e38ed88d135 Suren Baghdasaryan    2024-03-21  664  	return __kmalloc_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  665  }
c64e38ed88d135 Suren Baghdasaryan    2024-03-21  666  #define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
ce6a50263d4dde Christoph Lameter     2013-01-10  667  

:::::: The code at line 653 was first introduced by commit
:::::: 6fa57d78aa7f212fd7c0de70f5756e18513dcdcf slab: Remove special-casing of const 0 size allocations

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
