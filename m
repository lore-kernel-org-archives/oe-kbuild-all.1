Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC02374E55
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040762; cv=none; b=U8NvNGSkIi0vFDCf9X8FSUksP7oFY4n2qmUaiqwyh4Og1JgttpcGqPw0W1UgxUIosobPyGjVPYyARdmE79c2Z1qHowOz6wutH/bLwtfgv8bV2MrVS7s44//nnZEB6VoDrVgckqU8vTSJ1ojvFqfrgDvyNLxGGxsoMPOB8pSmeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040762; c=relaxed/simple;
	bh=l+D3OA1CPWSxR0OmdGBNrPmKPQtGkZGLIlJ9vzbLHuw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lBymlN7ERY41qf6DqnU3kTzsZqKutuLpY3ntILV5cQdpvZRrCpVndZrpOx4dERflbcUxj5Pqw+i9056QKktLP7ta0aJZdpJAhSpWiC9uUAOwjSjdirn9uOWMjeJZDQ3c3tCUQMjQmw2Bom3s4k9CBuZKoCWAVcbVaztrwrL/WSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/Fc+o8/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/Fc+o8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786040759; x=1817576759;
  h=date:from:to:cc:subject:message-id;
  bh=l+D3OA1CPWSxR0OmdGBNrPmKPQtGkZGLIlJ9vzbLHuw=;
  b=C/Fc+o8/D7rc0dtggA/Nav8WHaMKFcr/W373BkF1wusM2jdd1fbsbRjV
   Bp0LKcjHLlRI7OBDmGytjRWHrYxZz0lZlJO1BWAvphpNznOzqKbetlEW7
   jXU1IDpRkaEuJZg73xbNBc14kEvdFvCTxEu5f/gZ+50Uk2R+XpRwBoEJr
   ckqyrhL/a7Y1uetajcDWsQPczmknSMOy1r7KlRlte4ZIzHiBNrfFL74eP
   hJjGtNfkQpad/S2z5cesMI9UhwPRtAbqyJoshOitrkZ3ulD57Jy393PFx
   52QBCECi3Xo8Hoo+Ar7kK+eAMybg3akjnYIx/pcd3bxDwBBzhSPORW/6n
   A==;
X-CSE-ConnectionGUID: sZ/kyvA0RwO2/+/VpjwAFw==
X-CSE-MsgGUID: ex2itqOOSrCt+xKwHHDt6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104049740"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="104049740"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 11:25:58 -0700
X-CSE-ConnectionGUID: eyeRaB7MSmCA/1nPxVKeUQ==
X-CSE-MsgGUID: jP9ABzm4TN+3MyHnwTvZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="259566861"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2026 11:25:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws2mw-00000000Fw5-0I66;
	Thu, 06 Aug 2026 18:25:54 +0000
Date: Fri, 07 Aug 2026 02:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 20/67]
 drivers/media/platform/apple/isp/isp-fw.c:295:61: warning: right shift count
 >= width of type
Message-ID: <202608070111.DwFx4iQu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Asahi,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   6b01d08e5d4d33d4a7cdfb1ecea6f78e295bfd75
commit: f295ca6ad4b4662ba63cfb311d4582352cd03132 [20/67] media: apple: isp: Support >32bit VAs for t602x
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260807/202608070111.DwFx4iQu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070111.DwFx4iQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070111.DwFx4iQu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_firmware_boot_stage2':
>> drivers/media/platform/apple/isp/isp-fw.c:295:61: warning: right shift count >= width of type [-Wshift-count-overflow]
     295 |                 isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
         |                                                             ^~


vim +295 drivers/media/platform/apple/isp/isp-fw.c

   246	
   247	static int isp_firmware_boot_stage2(struct apple_isp *isp)
   248	{
   249		struct isp_firmware_bootargs args;
   250		dma_addr_t args_iova;
   251		int err, retries;
   252	
   253		u32 num_ipc_chans = isp_gpio_read32(isp, ISP_GPIO_0);
   254		u32 args_offset = isp_gpio_read32(isp, ISP_GPIO_1);
   255		u32 extra_size = isp_gpio_read32(isp, ISP_GPIO_3);
   256		isp->num_ipc_chans = num_ipc_chans;
   257	
   258		if (!isp->num_ipc_chans) {
   259			dev_err(isp->dev, "No IPC channels found\n");
   260			return -ENODEV;
   261		}
   262	
   263		if (isp->num_ipc_chans != 7)
   264			dev_warn(isp->dev, "unexpected channel count (%d)\n",
   265				 num_ipc_chans);
   266	
   267		isp->extra_surf = isp_alloc_surface_vmap(isp, extra_size);
   268		if (!isp->extra_surf) {
   269			isp_err(isp, "failed to alloc surface for extra heap\n");
   270			return -ENOMEM;
   271		}
   272	
   273		args_iova = isp->ipc_surf->iova + args_offset + 0x40;
   274		isp->cmd_iova = args_iova + sizeof(args) + 0x40;
   275	
   276		memset(&args, 0, sizeof(args));
   277		args.ipc_iova = isp->ipc_surf->iova;
   278		args.ipc_size = isp->ipc_surf->size;
   279		args.shared_base = isp->fw.heap_top & 0xffffffff;
   280		args.shared_size = 0x10000000UL - args.shared_base;
   281		args.extra_iova = isp->extra_surf->iova;
   282		args.extra_size = isp->extra_surf->size;
   283		args.platform_id = isp->hw->platform_id;
   284		args.unk5 = 0x40;
   285		args.unk7 = 0x1;
   286		args.unk_iova1 = args_iova + sizeof(args) - 0xc;
   287		args.unk9 = 0x3;
   288		isp_iowrite(isp, args_iova, &args, sizeof(args));
   289	
   290		isp_gpio_write32(isp, ISP_GPIO_0, args_iova);
   291		/* TODO: handle this via Kconfig depends? hardware is only present on
   292		 *       64-bit SoCs.
   293		 */
   294		if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
 > 295			isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
   296		wmb();
   297	
   298		/* Wait for ISP_GPIO_7 to 0xf7fbdff9 -> 0x8042006 */
   299		isp_gpio_write32(isp, ISP_GPIO_7, 0xf7fbdff9);
   300	
   301		for (retries = 0; retries < ISP_FIRMWARE_MAX_TRIES; retries++) {
   302			u32 val = isp_gpio_read32(isp, ISP_GPIO_7);
   303			if (val == 0x8042006) {
   304				isp_dbg(isp,
   305					"got second magic number (0x%x) from firmware\n",
   306					val);
   307				break;
   308			}
   309			mdelay(ISP_FIRMWARE_MDELAY);
   310		}
   311		if (retries >= ISP_FIRMWARE_MAX_TRIES) {
   312			isp_err(isp,
   313				"never received second magic number from firmware\n");
   314			err = -ENODEV;
   315			goto free_extra;
   316		}
   317	
   318		return 0;
   319	
   320	free_extra:
   321		isp_free_surface(isp, isp->extra_surf);
   322		return err;
   323	}
   324	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
