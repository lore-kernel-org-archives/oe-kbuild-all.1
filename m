Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2472E1DF75B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150404; cv=none; b=jOumafeaEou3p+d9H/xB4gzacibnRNNW4AOT9rTB/r2Y9kLbVTvc4lkV78kmYA6fUfxC1AH537M+dVnNsc5J2uzC2d/TmFjClvS//jfloYN8dn4qEE86EBEZWqWXDeJQfY/ZYqdgExT8ZIitSA/WmMDEadMUffBuqUilqOzfADo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150404; c=relaxed/simple;
	bh=g7kAAnSUZtR5ZnX6JXVS3RzLB1qxkWkCBxfeveEfLqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QFkoPUZvXcqgZ3xtAmpBhtFDKfaM5jcgBbR5D65FA2Zlq3NkcMeFn8aMqgePp6Kvpd+ZYSUMTn7a1Oy8lx2oJCm3lPxNR/K0xmKgmJIgI1X8bX7E3PRXw4KMN2utc18gKiOgdyrOBjYVRHla7tPkZ8yKGfyp6e35i16vlRAyaTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=latvdvdK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="latvdvdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782150402; x=1813686402;
  h=date:from:to:cc:subject:message-id;
  bh=g7kAAnSUZtR5ZnX6JXVS3RzLB1qxkWkCBxfeveEfLqY=;
  b=latvdvdKq1OiigIph2e+r5owLttp6zE21gi69CWS3Fp45TjC68+c90Zn
   WOfc0RUChxTHl5ueoZNfFwuTJ/oogGxhBaUpse/BIyYCnYfhRd9jzCyl8
   q4kESeYkukMzN7KujwCmwubNrT4cp4rlk8jujj14WHai0x5HbI6nppELb
   C3akxSdML53nhHF+/h1BOcbVI/2eCo9le4MwLVeOPKUq9noY4EnNptAPd
   Zy6v8g4hFacExQNhgQ6zM8ea9H6NJ2b70KVJeAN6XIURZXFyUICYa7TIt
   nV+2K5Xx+MHrdbPO6mKbtW42KXa7dD1nbozjUcbBqZ1lnpr5dGb3Pw4l+
   w==;
X-CSE-ConnectionGUID: ha4e9Sk6S7+Fh91IHhj3qw==
X-CSE-MsgGUID: +en9QG2MS6q+aIw3SO/0gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="85438772"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="85438772"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:46:42 -0700
X-CSE-ConnectionGUID: dHZ64R7WSluwPITuWyNe9A==
X-CSE-MsgGUID: 1kJfrxb6RwOzx5xd0oQUJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249405258"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Jun 2026 10:46:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbiit-000000001eV-32dv;
	Mon, 22 Jun 2026 17:46:16 +0000
Date: Tue, 23 Jun 2026 01:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: sound/soc/codecs/rt5575-spi.c:85:26: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202606230139.rFZUVpCa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: 420739112e95c9bb286b4e87875706925970abd3 ASoC: rt5575: Add the codec driver for the ALC5575
date:   6 months ago
config: sparc64-randconfig-r134-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230139.rFZUVpCa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230139.rFZUVpCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 420739112e95 ("ASoC: rt5575: Add the codec driver for the ALC5575")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230139.rFZUVpCa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/rt5575-spi.c:85:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __le32 [usertype] @@
   sound/soc/codecs/rt5575-spi.c:85:26: sparse:     expected unsigned int [usertype] addr
   sound/soc/codecs/rt5575-spi.c:85:26: sparse:     got restricted __le32 [usertype]

vim +85 sound/soc/codecs/rt5575-spi.c

    63	
    64	/**
    65	 * rt5575_spi_burst_write - Write data to SPI by rt5575 address.
    66	 * @spi: SPI device.
    67	 * @addr: Start address.
    68	 * @txbuf: Data buffer for writing.
    69	 * @len: Data length.
    70	 *
    71	 */
    72	static void rt5575_spi_burst_write(struct spi_device *spi, u32 addr, const u8 *txbuf, size_t len)
    73	{
    74		struct rt5575_spi_burst_write buf = {
    75			.cmd = RT5575_SPI_CMD_BURST_WRITE,
    76		};
    77		unsigned int end, offset = 0;
    78	
    79		while (offset < len) {
    80			if (offset + RT5575_SPI_BUF_LEN <= len)
    81				end = RT5575_SPI_BUF_LEN;
    82			else
    83				end = len % RT5575_SPI_BUF_LEN;
    84	
  > 85			buf.addr = cpu_to_le32(addr + offset);
    86			memcpy(&buf.data, &txbuf[offset], end);
    87			spi_write(spi, &buf, sizeof(buf));
    88	
    89			offset += RT5575_SPI_BUF_LEN;
    90		}
    91	}
    92	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
