Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80B43611E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720363777; cv=none; b=cRe40vrxt08q/iNqm5oLU+iRyJRQ95H/UaFtbUMykG4w2vq/gxZsNujnvHj399Nk+555DomUsTlduif65iB94fb9LstgLI+ojC0dTswKsu/WvOyMPuv6TN3botvbdzBs2W4I2L9wO7TnJRbUrDBE+UObJPFtfG9yr5WHf/hKD1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720363777; c=relaxed/simple;
	bh=sWVCI/5dSVauUg1aIY46zBrIC7eoDbiR5zXhfxgs2+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kq7q+vPdaoDQ1mpUdRETxZxItwaGZ54WJgufRQdhN+jQUwPzwQUimWclJZv5MDEcce0DhJARfZuauRpAq9nNGzYXOunI0hreAAfPf/qGYixZdusmteEEZ2HDDzO9OTawlbTb6JRo5Yy53Nti27ErDT8RyWR7tvZVjsLaXXPMxM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7reLWpe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7reLWpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720363775; x=1751899775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWVCI/5dSVauUg1aIY46zBrIC7eoDbiR5zXhfxgs2+g=;
  b=K7reLWpeiJQM30OX3mVVyGuWfE8t0fiADQH3NUutu9yLU9hsdU0OZHI8
   ZEUF1BaegJF17bsiVsT1DdLy2cYJH8uihm0yir8dPZicGk/6ncPUmp6Zh
   LgkBfdY/qR05GiQhoEf5ih8nHfqd7TWOm3ArFMa6zT5UIcES09dJ1GKqg
   Ay1Qtv8mcfbRijD9ZVnub95f3UsxeogLXn6ZnYMoBnDUFWJL85R3EIVS1
   oiVJH7NragUi3Ot0S0QfCSeigmlKDSoL65xyq7QMZHXdN/La9akXOCvsq
   XfmmDHE8mP3aQkAzFJ+URnwDgbVNnLCLl1lc7mjfn6vnjy9GtWOPky6ZX
   A==;
X-CSE-ConnectionGUID: e7PtqFhXTMWbJx2i/+SC8g==
X-CSE-MsgGUID: zvcfnp47QjyYrGodi6ewhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28726953"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="28726953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 07:49:35 -0700
X-CSE-ConnectionGUID: yyRmtm0yQVuUXrU5fuFRaw==
X-CSE-MsgGUID: 2/f2iIZ/TJOmtEKcAIDGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="78418806"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jul 2024 07:49:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQTCk-000V1K-38;
	Sun, 07 Jul 2024 14:49:30 +0000
Date: Sun, 7 Jul 2024 22:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10437/10451] riscv32-linux-ld: section
 .data..percpu VMA [c2591000,c259730b] overlaps section __ksymtab VMA
 [c2582828,c259537f]
Message-ID: <202407072240.F2G1kQX2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 58bd9b396896ad2c8d5a4ac293bd8a98c726245b [10437/10451] Merge branch 'zstd-next' of https://github.com/terrelln/linux.git
config: riscv-randconfig-r042-20221215 (https://download.01.org/0day-ci/archive/20240707/202407072240.F2G1kQX2-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072240.F2G1kQX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407072240.F2G1kQX2-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: section .data LMA [00603000,00a02f2b] overlaps section .text LMA [00082fa0,01fb8c2b]
   riscv32-linux-ld: section .pci_fixup VMA [c257fb88,c2582827] overlaps section .bss VMA [c2439000,c2590b27]
>> riscv32-linux-ld: section .data..percpu VMA [c2591000,c259730b] overlaps section __ksymtab VMA [c2582828,c259537f]
   riscv32-linux-ld: section __ksymtab_gpl VMA [c2595380,c25ab8a3] overlaps section .data..percpu VMA [c2591000,c259730b]
   fs/reiserfs/super.o: in function `handle_attrs':
   fs/reiserfs/super.c:1410:(.text+0x118): relocation truncated to fit: R_RISCV_GPREL_I against `.LC0'
   fs/reiserfs/super.o: in function `init_inodecache':
   fs/reiserfs/super.c:669:(.init.text+0x2c): relocation truncated to fit: R_RISCV_GPREL_I against `.LC41'
   fs/ext4/super.o: in function `_ext4_show_options':
   fs/ext4/super.c:3024:(.text+0x2c64): relocation truncated to fit: R_RISCV_GPREL_I against `.LC34'
   fs/f2fs/super.o: in function `f2fs_show_quota_options':
   fs/f2fs/super.c:1862:(.text+0x20c4): relocation truncated to fit: R_RISCV_GPREL_I against `.LC52'
   drivers/clk/clk-max9485.o: in function `max9485_i2c_probe':
   drivers/clk/clk-max9485.c:268:(.text+0x244): relocation truncated to fit: R_RISCV_GPREL_I against `.LC0'
   drivers/usb/gadget/udc/gr_udc.o: in function `__preempt_count_sub':
   include/asm-generic/preempt.h:59:(.text+0x2364): relocation truncated to fit: R_RISCV_GPREL_I against `.LC41'
   drivers/media/i2c/imx290.o: in function `imx290_probe':
   drivers/media/i2c/imx290.c:1618:(.text+0xca0): relocation truncated to fit: R_RISCV_GPREL_I against `.LC9'
   drivers/media/i2c/ov5640.o: in function `ov5640_set_power_mipi':
   drivers/media/i2c/ov5640.c:2544:(.text+0x3aec): relocation truncated to fit: R_RISCV_GPREL_I against `.LC11'
   drivers/media/i2c/ov7670.o: in function `ov7670_probe':
   drivers/media/i2c/ov7670.c:1838:(.text+0x16ec): relocation truncated to fit: R_RISCV_GPREL_I against `.LC3'
   drivers/media/i2c/st-mipid02.o: in function `mipid02_probe':
   drivers/media/i2c/st-mipid02.c:810:(.text+0xb4c): relocation truncated to fit: R_RISCV_GPREL_I against `.LC9'
   fs/reiserfs/fix_node.o: in function `ip_check_balance':
   fs/reiserfs/fix_node.c:1696:(.text+0x42ac): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
