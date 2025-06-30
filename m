Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60E1B412A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 19:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312311; cv=none; b=ba1/okhWkEknvVUVlVMHjNhXndRe0X/SK3+ElNL77Y5Bcee20Dxq4lzIb2wnQMxWthwXa+QucCZMC0MDT1XsNHUFK/IdhbeHpwwf1pY+FFG5A/6idoul7+MMEUwpP1lW+3C65+gDsp1dTOJT+apMivREHQL6Jt+VKqa+GMpJdwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312311; c=relaxed/simple;
	bh=dvOYvpI4h7ZdqBP8WrgygIru9v6opQhOqNsfkPxx0Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1dWBplaRzNiryL7fEvcv0CzAQrYmaA7ZQjiTV+xW3p03LbNwRPgqcZJ0ikGp9+JtFIalJEgOW3CHyOP3v5xHGdh/ecKMb9mjCWN5svWfU1NnToprlcfUdqYeqJV0UtM5jIFxSvFl8sHxGPn+KHDKy8N8LaTKzN3fU8l6Fbtbrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+G1clbY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+G1clbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751312310; x=1782848310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dvOYvpI4h7ZdqBP8WrgygIru9v6opQhOqNsfkPxx0Mk=;
  b=d+G1clbYZz7F6N1iXW4/YH/AD7zLZxJ578iUcMWtvUYnGztBnjOKKA1+
   KBFzfq/3Y1xX3/HZEoeZWOX2tZYXgrp6wOnVHDF2CnP1+Xhfun3VZcdvv
   QTgKY0RdBWxJzJAzU3RPyLP/maLG0OF3fF7PREy8jVpfqYGPEkXLUCe9u
   YTmGDYqX2KJnfnHlMNqe2nfYS4xKhTngl3izoHyXasi7Ez9yzHvFGk1pC
   Gvq+zMD6ctZgNVxwF6KthTxO7t2WlLPH99b5R+Mo96KhSLkmeScD+WoIW
   w7jHBjWQvincIzRAOI3waoQkffrG+pCnCjrrBxF//jQyqRKLxc6AoS1iW
   A==;
X-CSE-ConnectionGUID: mTNQxkxXSSSDPbWM0aSgwA==
X-CSE-MsgGUID: pAwLQTzZSyWTaswM5d05dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53415608"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="53415608"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 12:38:29 -0700
X-CSE-ConnectionGUID: IQH9P7/eQW6ImcXtA08qcg==
X-CSE-MsgGUID: TB8M7GFJRtmDh0RKowsG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153299884"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Jun 2025 12:38:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWKKf-000ZK2-2g;
	Mon, 30 Jun 2025 19:38:25 +0000
Date: Tue, 1 Jul 2025 03:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Message-ID: <202507010308.KUbUR1fM-lkp@intel.com>
References: <20250630081315.33288-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630081315.33288-2-biju.das.jz@bp.renesas.com>

Hi Biju,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on ulf-hansson-mmc-mirror/next v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/mmc-tmio-Add-64-bit-read-write-support-for-SD_BUF0-in-polling-mode/20250630-161511
base:   linus/master
patch link:    https://lore.kernel.org/r/20250630081315.33288-2-biju.das.jz%40bp.renesas.com
patch subject: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for SD_BUF0 in polling mode
config: sh-randconfig-001-20250630 (https://download.01.org/0day-ci/archive/20250701/202507010308.KUbUR1fM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010308.KUbUR1fM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010308.KUbUR1fM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mmc/host/renesas_sdhi.h:15,
                    from drivers/mmc/host/renesas_sdhi_sys_dmac.c:25:
   drivers/mmc/host/tmio_mmc.h: In function 'sd_ctrl_read64_rep':
>> drivers/mmc/host/tmio_mmc.h:248:9: error: implicit declaration of function 'ioread64_rep'; did you mean 'ioread32_rep'? [-Wimplicit-function-declaration]
     248 |         ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
         |         ^~~~~~~~~~~~
         |         ioread32_rep
   drivers/mmc/host/tmio_mmc.h: In function 'sd_ctrl_write64_rep':
>> drivers/mmc/host/tmio_mmc.h:254:9: error: implicit declaration of function 'iowrite64_rep'; did you mean 'iowrite32_rep'? [-Wimplicit-function-declaration]
     254 |         iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
         |         ^~~~~~~~~~~~~
         |         iowrite32_rep


vim +248 drivers/mmc/host/tmio_mmc.h

   244	
   245	static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, int addr,
   246					      u64 *buf, int count)
   247	{
 > 248		ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
   249	}
   250	
   251	static inline void sd_ctrl_write64_rep(struct tmio_mmc_host *host, int addr,
   252					       const u64 *buf, int count)
   253	{
 > 254		iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
