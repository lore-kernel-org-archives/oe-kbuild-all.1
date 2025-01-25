Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B689800
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737829595; cv=none; b=cVebGLFEyMEnW97nx/tu9uhgGzU4aZnqitNtQbVQuLhwjv3vdbclWvY1saKfDjIuEQTO7r/J5kMLQqxHDZiMKcV/tCN6IYtzynVmbhK5yaqyv2Q3ToJ4z1FTMptMxxutO8z6h2bmMWtFJ64rr4gchkeeSXwPc4SXoCa7agGb5M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737829595; c=relaxed/simple;
	bh=PW8iDgv7jXonXBvDiNoZbrq/YtljY7Tlw+lksV4irPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xb9u66UhsIr5DV+qvJU4T6nHOKj7IPoK2Gnla2FegxIT3TB2FArnXkVMXqchizcU9F/GG1pMfGcLgq3wfJJ+afR+jBdp7U18cpjbF8+3pKSUJQ+PxhJcd9zQGlWh/TkD/kTNsto2xL/weP9hfK13xOncxDTljAmqHHPVXH+5jhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ma97nL12; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ma97nL12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737829593; x=1769365593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PW8iDgv7jXonXBvDiNoZbrq/YtljY7Tlw+lksV4irPU=;
  b=ma97nL12MFTSe7gORLA0fTTUoRJWekg6AZAmZT8R84D9mzZzP4GhrXMU
   YcjTB3YB6SNb/GTKBfeX8znRLPRqIBSVGTla4o7LN997uCjTR56qoAV0t
   3aChyQGFVwr8MnNwVPHXjaN7X4cBPdhQan0V/pvfXhqu362dWbfThWkF+
   XO1q/Hn1hEFzI8XhaHtuyRzsJYx+Rje1YS8ObqFtk03SRH5R3nTCMphli
   z3M3ZoXAF7uL6pqlsNcLvWWAlobXoeujtAc7+o0qxa32hGQjZlswfH00M
   70cKX4vLN+jrmF0famV4BgiRqKZTIVMbDPTNQPbewdL23DOSzj8VBXz7C
   Q==;
X-CSE-ConnectionGUID: JcfYTn0lTXuBUNlUl5GmAg==
X-CSE-MsgGUID: NhfdhTqqRXOU2YrFs3Uu0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38595839"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="38595839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 10:26:32 -0800
X-CSE-ConnectionGUID: tGBb68/eTHa7yRmNpsxqHw==
X-CSE-MsgGUID: nmYY4G2lRKCCw6kWLfzkvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="107852810"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jan 2025 10:26:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbkrV-000e7X-1N;
	Sat, 25 Jan 2025 18:26:29 +0000
Date: Sun, 26 Jan 2025 02:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 6/6] drivers/media/i2c/lt6911uxe.c:117:2:
 warning: comparison of distinct pointer types ('typeof ((pixel_rate)) *'
 (aka 'long long *') and 'uint64_t *' (aka 'unsigned long long *'))
Message-ID: <202501260210.u4PTdt0U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   f90d04942b56016c8b10b96b7ee22e548ecf24cf
commit: ab102e852e0ceccbb73cb592162734206651897a [6/6] media: i2c: update lt6911uxe for upstream and bug fix
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250126/202501260210.u4PTdt0U-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260210.u4PTdt0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260210.u4PTdt0U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/lt6911uxe.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/i2c/lt6911uxe.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/i2c/lt6911uxe.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/media/i2c/lt6911uxe.c:117:2: warning: comparison of distinct pointer types ('typeof ((pixel_rate)) *' (aka 'long long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     117 |         do_div(pixel_rate, lt6911uxe->cur_mode.lanes);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   drivers/media/i2c/lt6911uxe.c:392:20: warning: unused variable 'lt6911uxe' [-Wunused-variable]
     392 |         struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
         |                           ^~~~~~~~~
   drivers/media/i2c/lt6911uxe.c:627:36: warning: unused variable 'lt6911uxe_acpi_ids' [-Wunused-const-variable]
     627 | static const struct acpi_device_id lt6911uxe_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
   9 warnings generated.


vim +117 drivers/media/i2c/lt6911uxe.c

   109	
   110	static s64 get_pixel_rate(struct lt6911uxe *lt6911uxe)
   111	{
   112		s64 pixel_rate;
   113	
   114		pixel_rate = (s64)lt6911uxe->cur_mode.width *
   115			     lt6911uxe->cur_mode.height *
   116			     lt6911uxe->cur_mode.fps * 16;
 > 117		do_div(pixel_rate, lt6911uxe->cur_mode.lanes);
   118	
   119		return pixel_rate;
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
