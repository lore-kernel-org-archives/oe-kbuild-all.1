Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2223F33F38E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 15:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752856; cv=none; b=VJTdIR3LC4PzC4V+Hi1jgbG6MQOkGCkfSM2IAYBrZxAD3o0n1Ifi5LBvbOq5IJ3UlpTk5Co3BEXp7wd+Lm12i0dviGYeWzTsvlDHOAVrq3chw/9gaKHnMKzXrnEjZPSKwMf3Bb62BBvyOefFSB+CI1lavX9yDrS6iXHcy96Rk+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752856; c=relaxed/simple;
	bh=4XZu2+qPr55oW9l5tygGVvnwA2kohVOzQzGuKRDgRtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlY1qH3ONwRs8w+bQFEVhEt9717BojV0edtvYAGfDFitSWiyyUEG9toHUD/Hq4DpFHkoVjF1qaPY7drv9A05iKS4uUMOc9RUsSmthAlnWRBEY4sZE+e2M/rjgQf1uehBit1gPK61hD+92hqzgjIbLIb/gScQrgMBHz605Kvll/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmZr2mT8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmZr2mT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761752855; x=1793288855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4XZu2+qPr55oW9l5tygGVvnwA2kohVOzQzGuKRDgRtc=;
  b=UmZr2mT8svpN1t0iPwR8QymWd+xztGKmsHDwvwzXAGs9+giiQd5TCSdd
   AEa6vFg+RyF73oVM8o50y/gOmS8BabEL0Z5moffHCVjz4rwUabhjVNnSU
   z+yY3fwwvqvcGyoBZV6RSQx42FPBl0uyThLGVLJ6auKyxae3mQFp+52mL
   Ls9cBtasQO6tYfDmbPY9bG37Qp/e+huReR9qgZ05SOVvP9uQyKtKb0u4L
   eJSO8VHwblS97rR8oSdilQyArKTEhz+5sB3puPBHjoRD1FI6YLe4s/O7G
   xyPoefKiD1hA0V753M5PWsuZZxqHG3pdGCRoQM6kN+TTYbJAIRKr6TeFb
   g==;
X-CSE-ConnectionGUID: Vpdt/6JaTXu88VZEo7eItA==
X-CSE-MsgGUID: KicDlzCOTtmyCG0yS5W5fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="62903841"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="62903841"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:47:35 -0700
X-CSE-ConnectionGUID: t6R9+A5PRlKasCr37+dCTQ==
X-CSE-MsgGUID: D9BMPDQ0Tg2Z0agfXErFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185585013"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2025 08:47:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE8OY-000Kk7-0e;
	Wed, 29 Oct 2025 15:47:30 +0000
Date: Wed, 29 Oct 2025 23:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 892/4731] drivers/spi/spi-aspeed-smc.c:399:3-10:
 WARNING: invalid free of devm_ allocated data
Message-ID: <202510292356.JnTUBxCl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 64d87ccfae3326a9561fe41dc6073064a083e0df [892/4731] spi: aspeed: Only map necessary address window region
config: sparc64-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292356.JnTUBxCl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292356.JnTUBxCl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-aspeed-smc.c:399:3-10: WARNING: invalid free of devm_ allocated data

vim +399 drivers/spi/spi-aspeed-smc.c

   383	
   384	static int aspeed_spi_set_window(struct aspeed_spi *aspi)
   385	{
   386		struct device *dev = aspi->dev;
   387		off_t offset = 0;
   388		phys_addr_t start;
   389		phys_addr_t end;
   390		void __iomem *seg_reg_base = aspi->regs + CE0_SEGMENT_ADDR_REG;
   391		void __iomem *seg_reg;
   392		u32 seg_val_backup;
   393		u32 seg_val;
   394		u32 cs;
   395		size_t window_size;
   396	
   397		for (cs = 0; cs < aspi->data->max_cs; cs++) {
   398			if (aspi->chips[cs].ahb_base) {
 > 399				iounmap(aspi->chips[cs].ahb_base);
   400				aspi->chips[cs].ahb_base = NULL;
   401			}
   402		}
   403	
   404		for (cs = 0; cs < aspi->data->max_cs; cs++) {
   405			seg_reg = seg_reg_base + cs * 4;
   406			seg_val_backup = readl(seg_reg);
   407	
   408			start = aspi->ahb_base_phy + offset;
   409			window_size = aspi->chips[cs].ahb_window_size;
   410			end = start + window_size;
   411	
   412			seg_val = aspi->data->segment_reg(aspi, start, end);
   413			writel(seg_val, seg_reg);
   414	
   415			/*
   416			 * Restore initial value if something goes wrong or the segment
   417			 * register is written protected.
   418			 */
   419			if (seg_val != readl(seg_reg)) {
   420				dev_warn(dev, "CE%d expected window [ 0x%.9llx - 0x%.9llx ] %zdMB\n",
   421					 cs, (u64)start, (u64)end - 1, window_size >> 20);
   422				writel(seg_val_backup, seg_reg);
   423				window_size = aspi->data->segment_end(aspi, seg_val_backup) -
   424					      aspi->data->segment_start(aspi, seg_val_backup);
   425				aspi->chips[cs].ahb_window_size = window_size;
   426				end = start + window_size;
   427			}
   428	
   429			if (window_size != 0)
   430				dev_dbg(dev, "CE%d window [ 0x%.9llx - 0x%.9llx ] %zdMB\n",
   431					cs, (u64)start, (u64)end - 1,  window_size >> 20);
   432			else
   433				dev_dbg(dev, "CE%d window closed\n", cs);
   434	
   435			offset += window_size;
   436			if (offset > aspi->ahb_window_size) {
   437				dev_err(dev, "CE%d offset value 0x%llx is too large.\n",
   438					cs, (u64)offset);
   439				return -ENOSPC;
   440			}
   441	
   442			/*
   443			 * No need to map the address deocding range when
   444			 * - window size is 0.
   445			 * - the CS is unused.
   446			 */
   447			if (window_size == 0 || cs >= aspi->num_cs)
   448				continue;
   449	
   450			aspi->chips[cs].ahb_base =
   451				devm_ioremap(aspi->dev, start, window_size);
   452			if (!aspi->chips[cs].ahb_base) {
   453				dev_err(aspi->dev,
   454					"Fail to remap window [0x%.9llx - 0x%.9llx]\n",
   455					(u64)start, (u64)end - 1);
   456				return -ENOMEM;
   457			}
   458		}
   459	
   460		return 0;
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
