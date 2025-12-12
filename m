Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224AC231A23
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 05:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765516948; cv=none; b=KB94NGPs9hgN7R7rjydOfu6vWL8yYi/DkRFs9r35oQyk4JtrkBNjaBCECkcaD3zqOjKAlTXgHbd3xF3Gr/U0Ol/wZrNaN5F3FdmebnF26M8jQoC0W0w8gU3128js2BbhpMZCTQjQ84QoviF/R5KIOgiBm1k30odE1Ylu0Z8iMV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765516948; c=relaxed/simple;
	bh=ePIBFdCPEpwWmJaNhALrWP117XJP2ylPX9kAsJ5P7J8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VnFs7dwPwoMrlwy5/gdMr4IpTb/k+OhDrCr1MU/MtoURuggWRTZ56hQKTSNyN0sJ3X6a1fHYeR+pUxjlism/Y2FLRKBHqyBtK0vNUSa3zl/S692QNFwcOkRP0SSHXXIRAxrYS1Fl3isf3lArTWR0sdYbhr/AWDHV4bSVz7HJL2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hc/SHejr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc/SHejr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765516947; x=1797052947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ePIBFdCPEpwWmJaNhALrWP117XJP2ylPX9kAsJ5P7J8=;
  b=Hc/SHejrUhUXlsE8ZfUqD+0wLF6EExQaODO8tp9Ig/EFt8CDbJahr/KO
   3+cK0Su+BUfFRZwOPralovmh7hD7vgq2dYsH7G/kbd6zRsX4FZh1/wyhq
   FmWqNJYrpkf2V1nKDK3lchSmMyXjjtO9MLlIiERfDK3/3+0MzH/ZC/kOI
   Blojqr1NHlsUC1t785wgbXmponL36I0Kx3Q9jP+m23cmId0ptpDRAYMEl
   J0H4oUOUk5amADvTEtQtHFNe9j2WJW7ghk0u5HLenhms8rAOodrCcr+kd
   a94haTwFqSIt3GUJye8DGkN/JY+cjEJRF3hw9LpruxmctZcAdb8xIo+vI
   g==;
X-CSE-ConnectionGUID: xVn+jCjzR3u1thyWtKAaZQ==
X-CSE-MsgGUID: npcwBBKzSfmIpilLtJ3IJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67676125"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67676125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 21:22:27 -0800
X-CSE-ConnectionGUID: +HGwJhByQLO53ypCr58u6g==
X-CSE-MsgGUID: HlvBLsXUSpuUxQOJlyqaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197042615"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2025 21:22:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTvbj-000000005aB-19Vx;
	Fri, 12 Dec 2025 05:22:23 +0000
Date: Fri, 12 Dec 2025 13:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: drivers/mtd/nand/raw/nand_legacy.c:42:17: sparse: sparse: cast from
 restricted __le16
Message-ID: <202512121344.mk9pws1F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthias,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 2abb6e53b5b08987265946b258ca29762091930c gpio: tqmx86: use cleanup guards for spinlock
date:   12 months ago
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121344.mk9pws1F-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121344.mk9pws1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121344.mk9pws1F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/nand_legacy.c:42:17: sparse: sparse: cast from restricted __le16

vim +42 drivers/mtd/nand/raw/nand_legacy.c

3d4af7c195850c Boris Brezillon 2018-09-07  32  
3d4af7c195850c Boris Brezillon 2018-09-07  33  /**
3d4af7c195850c Boris Brezillon 2018-09-07  34   * nand_read_byte16 - [DEFAULT] read one byte endianness aware from the chip
3d4af7c195850c Boris Brezillon 2018-09-07  35   * @chip: NAND chip object
3d4af7c195850c Boris Brezillon 2018-09-07  36   *
3d4af7c195850c Boris Brezillon 2018-09-07  37   * Default read function for 16bit buswidth with endianness conversion.
3d4af7c195850c Boris Brezillon 2018-09-07  38   *
3d4af7c195850c Boris Brezillon 2018-09-07  39   */
3d4af7c195850c Boris Brezillon 2018-09-07  40  static uint8_t nand_read_byte16(struct nand_chip *chip)
3d4af7c195850c Boris Brezillon 2018-09-07  41  {
3d4af7c195850c Boris Brezillon 2018-09-07 @42  	return (uint8_t) cpu_to_le16(readw(chip->legacy.IO_ADDR_R));
3d4af7c195850c Boris Brezillon 2018-09-07  43  }
3d4af7c195850c Boris Brezillon 2018-09-07  44  

:::::: The code at line 42 was first introduced by commit
:::::: 3d4af7c195850cfccaddc2cf03b010b95236b695 mtd: rawnand: Move legacy code to nand_legacy.c

:::::: TO: Boris Brezillon <boris.brezillon@bootlin.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
