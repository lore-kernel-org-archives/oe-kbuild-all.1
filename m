Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47DC213E7B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 18:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752518998; cv=none; b=MgKJNAhoeUh94uu5z2CJM8TtFtGLlYBrjBepTSJJI5ZDJDD3VKPQegK3KQXKoY9iUB68o4OC4itTadm6+32rwS0ehHkX6sLa4YcDjT+X54Dv8rHeFz4qCIyqaHHMqfzp+A97bWXLr1UQlmnTfLVdtt8l2B1L6Oqnor1b5Jk5aRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752518998; c=relaxed/simple;
	bh=PzZMhucNEdUjHBk4gEneXnSqDCDsJLXKo+onhKZwiI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RzGMk+o5Mji4+tMBz/WBcCYuBNDf8UutRABJLlQDsO2ko5zaG6iisf6+GByRXdRLt4HVf9LqdWVHlfPFpQrR0YSrCdwUtc819XqBstWFEHAixV7UaGNBXokeXaQEI58utLeyawYAwujn1xZYZPajvojvXaL1/mEMQsyHC8AnKIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXxIimzc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXxIimzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752518997; x=1784054997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PzZMhucNEdUjHBk4gEneXnSqDCDsJLXKo+onhKZwiI8=;
  b=fXxIimzc4utxOuM0RUcyqCFIsicMk4dHbaY7WiWp2JndaJRFCku6VaT9
   WdNdWrMoUz8WQmOg75rVfqfDpcvoCHdh9pfWN0jgxOGcg1hmdSynxSiUv
   xGgrKBStGHy/0qJ0JZWmZx2kmZAOCT1BWcMP8ZF5JUdVusZN49B478UUB
   VpuLOG+94x3xHdkmbrzJhnBgdrDry6tprIMdPbq+Jitvzw03sCXhm+zzs
   Az6psqfaxALHPrT/YwteTl4fcwfASA9XZyc6r/GbTYvMIxoiO6mJtGD9e
   ns6G8JR/D/E5zfkUwX9AUGBe0KvphFzeXRJuB2LhssUyPsZy+CdEF82P/
   A==;
X-CSE-ConnectionGUID: ZTo4doNLS3mkjxVy6TE+aw==
X-CSE-MsgGUID: Z27iE5XqSNytmeJf/t3E2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66171339"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="66171339"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 11:49:56 -0700
X-CSE-ConnectionGUID: JrCWLBvBSYu2Mc8h+lYPOA==
X-CSE-MsgGUID: bcbzpHCCThmK1WRyurC9iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="156651275"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jul 2025 11:49:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubOFM-0009EP-22;
	Mon, 14 Jul 2025 18:49:52 +0000
Date: Tue, 15 Jul 2025 02:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/g3s/i3c 7/19] drivers/i3c/internals.h:35:9: error:
 implicit declaration of function 'writesl'
Message-ID: <202507150208.BZDzzJ5E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
head:   96358bcce0f6b8c20c9453ca17d3ad1d16515fd4
commit: 8af3723cb0b4ec9f1f4442b617b1990ec0302c8e [7/19] i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()
config: x86_64-buildonly-randconfig-003-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150208.BZDzzJ5E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150208.BZDzzJ5E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150208.BZDzzJ5E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/master.c:21:
   drivers/i3c/internals.h: In function 'i3c_writel_fifo':
>> drivers/i3c/internals.h:35:9: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
      35 |         writesl(addr, buf, nbytes / 4);
         |         ^~~~~~~
>> drivers/i3c/internals.h:40:17: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
      40 |                 writel(tmp, addr);
         |                 ^~~~~~
   drivers/i3c/internals.h: In function 'i3c_readl_fifo':
>> drivers/i3c/internals.h:53:9: error: implicit declaration of function 'readsl' [-Werror=implicit-function-declaration]
      53 |         readsl(addr, buf, nbytes / 4);
         |         ^~~~~~
>> drivers/i3c/internals.h:57:23: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
      57 |                 tmp = readl(addr);
         |                       ^~~~~
   cc1: some warnings being treated as errors


vim +/writesl +35 drivers/i3c/internals.h

    25	
    26	/**
    27	 * i3c_writel_fifo - Write data buffer to 32bit FIFO
    28	 * @addr: FIFO Address to write to
    29	 * @buf: Pointer to the data bytes to write
    30	 * @nbytes: Number of bytes to write
    31	 */
    32	static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
    33					   int nbytes)
    34	{
  > 35		writesl(addr, buf, nbytes / 4);
    36		if (nbytes & 3) {
    37			u32 tmp = 0;
    38	
    39			memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
  > 40			writel(tmp, addr);
    41		}
    42	}
    43	
    44	/**
    45	 * i3c_readl_fifo - Read data buffer from 32bit FIFO
    46	 * @addr: FIFO Address to read from
    47	 * @buf: Pointer to the buffer to store read bytes
    48	 * @nbytes: Number of bytes to read
    49	 */
    50	static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
    51					  int nbytes)
    52	{
  > 53		readsl(addr, buf, nbytes / 4);
    54		if (nbytes & 3) {
    55			u32 tmp;
    56	
  > 57			tmp = readl(addr);
    58			memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
    59		}
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
