Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFC38634F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765497780; cv=none; b=ThYiTM7REyuFTLHP9lP/9yOp3B+pV+G6e8LcUNpzkziwfl/x+YmIvGiAu1I4Dghm1Fc3BYrneIUo06AfqBi4QZDxVJhMKQ4b9s9m0E8N6GRT+8yaqz2PJsMO1uM+U78YsWNGlkvWMpHPEtT9pruFDPvM6y11b9Jbl4KllIts/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765497780; c=relaxed/simple;
	bh=Ebq36/vRk9nDAEGDpNczHxGOgTmJS243mayZTGyHVyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUPcMBeFVZ5ppZubCXXPcz5tvbaMCidGi/Ll1Y2Kxi2FigrX9aEdzNEOB2gqiyu9jGjISvygNMbv2iya1FhPxlaOCVfDk7HyZLgcAdwC6B3mkkZBzhl/UFbkzXMFzMWDITqK6Iddz707MPpsuzCKTtLZ2CZdcjTCxKo1xA7JV/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L42llpQv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L42llpQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765497779; x=1797033779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ebq36/vRk9nDAEGDpNczHxGOgTmJS243mayZTGyHVyw=;
  b=L42llpQvri+lN/BqW28x3/gGXTi56OuGXD0zHUj7VhI1u2kbuN5DrTGZ
   fQxNwXLqcxpKlfJ8DhXFwPuszKmy5QHYApQcLiNz4EaPkURLf2uqQpbb9
   Yw/E6Cy1ISqRBxq5jiRX9Gaiwq7MDPudo+sUk7MKHCCWBVHoZMbXEVztL
   ec/sy1DrvAWKar7rG9XQ1sD0oc4RhvxOrL34eKeyDzTXsGyWyp9R49GBh
   w+biOQSuJCvIEnBEwN1DDXI7QngQ+GSQ2hVbdxkQf05//V9fK4EaUR55v
   zG+Y8e8a7d9341qqWMy7a8gEgW/zOzHM8j8aVY1mRhjbQoJEARAtTz4Tk
   A==;
X-CSE-ConnectionGUID: 28ghqMEPRia2RMrnAz61zw==
X-CSE-MsgGUID: Fgxzz7xAQSu8JlFJqcE+4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67565725"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67565725"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:02:57 -0800
X-CSE-ConnectionGUID: LDrHflw4Q12gkyVUzWP84A==
X-CSE-MsgGUID: 4xrS2UoAR56Cusrkhotcvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201098092"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 16:02:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqcW-000000005DF-3kty;
	Fri, 12 Dec 2025 00:02:52 +0000
Date: Fri, 12 Dec 2025 08:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to
 restricted __be16
Message-ID: <202512120701.wWXYuhkv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: ac131c4148bcfa682104628d2174e8e38e03fd25 ASoC: uniphier: Standardize ASoC menu
date:   6 months ago
config: alpha-randconfig-r121-20251212 (https://download.01.org/0day-ci/archive/20251212/202512120701.wWXYuhkv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120701.wWXYuhkv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120701.wWXYuhkv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to restricted __be16
>> sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to restricted __be16
>> sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to restricted __be16
>> sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to restricted __be16

vim +304 sound/soc/uniphier/aio-compress.c

e98131222ff931 Katsuhiro Suzuki 2018-01-19  280  
e98131222ff931 Katsuhiro Suzuki 2018-01-19  281  static int aio_compr_send_to_hw(struct uniphier_aio_sub *sub,
e98131222ff931 Katsuhiro Suzuki 2018-01-19  282  				char __user *buf, size_t dstsize)
e98131222ff931 Katsuhiro Suzuki 2018-01-19  283  {
e98131222ff931 Katsuhiro Suzuki 2018-01-19  284  	u32 __user *srcbuf = (u32 __user *)buf;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  285  	u32 *dstbuf = (u32 *)(sub->compr_area + sub->wr_offs);
e98131222ff931 Katsuhiro Suzuki 2018-01-19  286  	int src = 0, dst = 0, ret;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  287  	u32 frm, frm_a, frm_b;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  288  
e98131222ff931 Katsuhiro Suzuki 2018-01-19  289  	while (dstsize > 0) {
e98131222ff931 Katsuhiro Suzuki 2018-01-19  290  		ret = get_user(frm, srcbuf + src);
e98131222ff931 Katsuhiro Suzuki 2018-01-19  291  		if (ret)
e98131222ff931 Katsuhiro Suzuki 2018-01-19  292  			return ret;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  293  		src++;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  294  
e98131222ff931 Katsuhiro Suzuki 2018-01-19  295  		frm_a = frm & 0xffff;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  296  		frm_b = (frm >> 16) & 0xffff;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  297  
e98131222ff931 Katsuhiro Suzuki 2018-01-19  298  		if (frm == IEC61937_HEADER_SIGN) {
e98131222ff931 Katsuhiro Suzuki 2018-01-19  299  			frm_a |= 0x01000000;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  300  
e98131222ff931 Katsuhiro Suzuki 2018-01-19  301  			/* Next data is Pc and Pd */
e98131222ff931 Katsuhiro Suzuki 2018-01-19  302  			sub->iec_header = true;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  303  		} else {
e98131222ff931 Katsuhiro Suzuki 2018-01-19 @304  			u16 pc = be16_to_cpu((__be16)frm_a);
e98131222ff931 Katsuhiro Suzuki 2018-01-19  305  
e98131222ff931 Katsuhiro Suzuki 2018-01-19  306  			if (sub->iec_header && sub->iec_pc != pc) {
e98131222ff931 Katsuhiro Suzuki 2018-01-19  307  				/* Force overwrite IEC frame type */
e98131222ff931 Katsuhiro Suzuki 2018-01-19  308  				sub->iec_pc = pc;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  309  				ret = aio_oport_set_stream_type(sub, pc);
e98131222ff931 Katsuhiro Suzuki 2018-01-19  310  				if (ret)
e98131222ff931 Katsuhiro Suzuki 2018-01-19  311  					return ret;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  312  			}
e98131222ff931 Katsuhiro Suzuki 2018-01-19  313  			sub->iec_header = false;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  314  		}
e98131222ff931 Katsuhiro Suzuki 2018-01-19  315  		dstbuf[dst++] = frm_a;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  316  		dstbuf[dst++] = frm_b;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  317  
e98131222ff931 Katsuhiro Suzuki 2018-01-19  318  		dstsize -= sizeof(u32) * 2;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  319  	}
e98131222ff931 Katsuhiro Suzuki 2018-01-19  320  
e98131222ff931 Katsuhiro Suzuki 2018-01-19  321  	return 0;
e98131222ff931 Katsuhiro Suzuki 2018-01-19  322  }
e98131222ff931 Katsuhiro Suzuki 2018-01-19  323  

:::::: The code at line 304 was first introduced by commit
:::::: e98131222ff931a670739cede00d1fb9d6f83763 ASoC: uniphier: add support for UniPhier AIO compress audio

:::::: TO: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
