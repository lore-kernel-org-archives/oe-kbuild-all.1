Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5C31426C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768635; cv=none; b=mFQFEwU3DHFnNrYelR/q/Xd9G9iVkDm/wH+C0NuJ2Y6O8I9SGVHZ1xVyvsl636ZD1I+IoJ+6BBv730d/p2iEugZH+l3TNOygVnexVU0xvHvyiZ9lalalAzktV2XkGzIkJU3zg6ixElhb+E9asi0qft9HPAwDn73Nt8h3JOPoGZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768635; c=relaxed/simple;
	bh=IAI8Tw1jc3jMeU0+StT2cYZITvHx4Zj0s4mg5aXrZuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDUV79BktDqCTs6Dc+xAUWGqtbQ3SbLIcOqM+rpd3sNYKk5OKQcX7RpdjZc3KzlyFaqxwb4IdJBEKRIQSYnLlaJigWCDHNaAgRb5Lnb6T+tN7hweKuLkwF9cpKxhsLnWB6Ey+ZCWpC5Vg0ABKSughF77GNaZEmIITxvinzMVlxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdYPOtbe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdYPOtbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768634; x=1763304634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAI8Tw1jc3jMeU0+StT2cYZITvHx4Zj0s4mg5aXrZuU=;
  b=SdYPOtbedXdpcW50622JA/1tZeGv+TJfwXNr3AUpSLF5c3+VR5ET9yjK
   VzyQrOgEHG7/IQ9YFG6hs/enMYh+vqOn3/07Za2jznNJpjlm8LVM9cgrj
   aH/ywUsdQmIj/U6pFIAraO80tOBzEX0mSGhIVSCVHfjBFvzSSFxXwST1h
   7cBqNECUwIghiW0B0C1/zm12O9KvIMqQpEG5ybRuFTuLj3TKYvBOeKtlt
   9ASSesgtuQ1EbM4swMRZGHPuOO2W7UUlc7zte6MiUrchdg92QIAAyNAhi
   uQzErnigGoTkp1NEyj2DVbIQJ63vNHkaW+KbjN/wiElUJcpaRq15r3GZp
   g==;
X-CSE-ConnectionGUID: m9w+E54HQt2fTqQIOmemIg==
X-CSE-MsgGUID: /XC4miqGRM+p0H2d9QF9Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43162611"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="43162611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:50:32 -0800
X-CSE-ConnectionGUID: YbGkujlGTDm2Eeyd3P5b0w==
X-CSE-MsgGUID: u9Ac7aeNTgqHULLWO/6pjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88817532"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 06:50:31 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK85-0000hg-1Y;
	Sat, 16 Nov 2024 14:50:29 +0000
Date: Sat, 16 Nov 2024 22:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 21/28] drivers/fwctl/cxl/cxl.c:68:36: error:
 initialization of 'void *' from 'int' makes pointer from integer without a
 cast
Message-ID: <202411161712.9Lr5iHQU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   350392d25327a67c7299583a05481dfe524c7257
commit: 5c902403b6f17b767d928359b553668e4ca61b42 [21/28] fwctl/cxl: Add hw_info callback
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241116/202411161712.9Lr5iHQU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411161712.9Lr5iHQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411161712.9Lr5iHQU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/fwctl/cxl/cxl.c: In function 'cxlctl_info':
   drivers/fwctl/cxl/cxl.c:47:16: error: implicit declaration of function 'kzalloc'; did you mean 'key_alloc'? [-Wimplicit-function-declaration]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                ^~~~~~~
         |                key_alloc
   drivers/fwctl/cxl/cxl.c:47:14: error: assignment to 'struct fwctl_info_cxl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |              ^
   drivers/fwctl/cxl/cxl.c: In function 'cxlctl_hw_info':
   drivers/fwctl/cxl/cxl.c:68:9: error: cleanup argument not a function
      68 |         void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
         |         ^~~~
   drivers/fwctl/cxl/cxl.c:68:36: error: implicit declaration of function 'kvzalloc'; did you mean 'key_alloc'? [-Wimplicit-function-declaration]
      68 |         void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
         |                                    ^~~~~~~~
         |                                    key_alloc
>> drivers/fwctl/cxl/cxl.c:68:36: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]


vim +68 drivers/fwctl/cxl/cxl.c

    55	
    56	static void *cxlctl_hw_info(struct fwctl_uctx *uctx, int commands, size_t *out_len)
    57	{
    58		struct cxlctl_uctx *cxlctl_uctx =
    59			container_of(uctx, struct cxlctl_uctx, uctx);
    60		struct fwctl_device *fwctl = uctx->fwctl;
    61		struct cxlctl_dev *cxlctl =
    62			container_of(fwctl, struct cxlctl_dev, fwctl);
    63		int rc;
    64	
    65		if (commands > cxlctl_uctx->nr_commands)
    66			return ERR_PTR(-EINVAL);
    67	
  > 68		void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
    69		if (!out)
    70			return ERR_PTR(-ENOMEM);
    71	
    72		rc = cxl_mailbox_user_commands_info_get(cxlctl->mbox,
    73							commands, out, out_len);
    74		if (rc)
    75			return ERR_PTR(rc);
    76	
    77		return_ptr(out);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
