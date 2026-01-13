Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE243803D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293222; cv=none; b=uWw+YDVyEHoiC7JXbYLKWYQAvwu9zk7T54hUPJ2siEc+H91tkoAR92HO2gp8FExPmtvyEmA2RMiSqnXmtT7njDZJKlAC3D2ACCFW4TQihe0YLyCfNZxl/q1tAbuAqCsqy+5otw+ZudF7pSNSjjYPIjseA5ANxabEOJ0hJXpkZwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293222; c=relaxed/simple;
	bh=tp60oRhdNRQbXTijDoJ7wvtnx8bFiF+H8IRPXWienN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W2gYo21LLhuyIv6jFt4Gnu4zI1l2P5SPhNgPDr9kh2ldTXE/KpyPyNmORP+xemxEH5mjOS26MQ9M305UOBkSb+nR2xCgAwBsTEZ9Hi9m6LgsPgRvBTKEVNJ2/E2Kw4zFifEr/AXePxgO2JVBwCDPDjIVrTlFVIhg/61hYL1EtOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kG32c03K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kG32c03K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768293221; x=1799829221;
  h=date:from:to:cc:subject:message-id;
  bh=tp60oRhdNRQbXTijDoJ7wvtnx8bFiF+H8IRPXWienN8=;
  b=kG32c03Ksp5zmUDsQqw4milEzTUPb4LA89fKv5VhHAsi9JWIFh8GO26L
   nwNyypaXPhQ5a3CPeDBLy3tK5fgmQfPtthrg8iY0fyetLY0VazH7pK8a+
   y1Cu5XkW8IOfCEBo21bN4vSXZb8L0Mwo6LF5R+h+3mtBuzZ29C8qzCIqp
   /mf6colLzkTj0sEuvdYxMMnl9EJ00PW1Zw7xkEH1p9e+lmr+MZFuSzWfZ
   BogVG6A/qxymfA272EJODVzsPRFYFat2Jbu6vtCgCMViMSxEwZD3m8iid
   DuRZeABTeCx9uut34YgAyY0IidLcbdCcCeU2TUPEQtgixmtS+c2RrDJdx
   g==;
X-CSE-ConnectionGUID: +1FfH8aeQQqD1UD4Bv9HwQ==
X-CSE-MsgGUID: yu7fP6r2QviM+SnrOOvDPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69732665"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69732665"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:33:41 -0800
X-CSE-ConnectionGUID: xIzNyZJZQrOb7weGf7zDjw==
X-CSE-MsgGUID: WfOO2qRARdWPEVneHZN4Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204221060"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 00:33:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfZqJ-00000000ET2-3K69;
	Tue, 13 Jan 2026 08:33:35 +0000
Date: Tue, 13 Jan 2026 16:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse:
 cast to restricted __be16
Message-ID: <202601131601.7Dbl2dpZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: ac131c4148bcfa682104628d2174e8e38e03fd25 ASoC: uniphier: Standardize ASoC menu
date:   7 months ago
config: nios2-randconfig-r134-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131601.7Dbl2dpZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131601.7Dbl2dpZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131601.7Dbl2dpZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to restricted __be16
>> sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to restricted __be16
>> sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to restricted __be16
>> sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to restricted __be16
   sound/soc/uniphier/aio-compress.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini

vim +304 sound/soc/uniphier/aio-compress.c

e98131222ff931a Katsuhiro Suzuki 2018-01-19  280  
e98131222ff931a Katsuhiro Suzuki 2018-01-19  281  static int aio_compr_send_to_hw(struct uniphier_aio_sub *sub,
e98131222ff931a Katsuhiro Suzuki 2018-01-19  282  				char __user *buf, size_t dstsize)
e98131222ff931a Katsuhiro Suzuki 2018-01-19  283  {
e98131222ff931a Katsuhiro Suzuki 2018-01-19  284  	u32 __user *srcbuf = (u32 __user *)buf;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  285  	u32 *dstbuf = (u32 *)(sub->compr_area + sub->wr_offs);
e98131222ff931a Katsuhiro Suzuki 2018-01-19  286  	int src = 0, dst = 0, ret;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  287  	u32 frm, frm_a, frm_b;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  288  
e98131222ff931a Katsuhiro Suzuki 2018-01-19  289  	while (dstsize > 0) {
e98131222ff931a Katsuhiro Suzuki 2018-01-19  290  		ret = get_user(frm, srcbuf + src);
e98131222ff931a Katsuhiro Suzuki 2018-01-19  291  		if (ret)
e98131222ff931a Katsuhiro Suzuki 2018-01-19  292  			return ret;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  293  		src++;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  294  
e98131222ff931a Katsuhiro Suzuki 2018-01-19  295  		frm_a = frm & 0xffff;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  296  		frm_b = (frm >> 16) & 0xffff;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  297  
e98131222ff931a Katsuhiro Suzuki 2018-01-19  298  		if (frm == IEC61937_HEADER_SIGN) {
e98131222ff931a Katsuhiro Suzuki 2018-01-19  299  			frm_a |= 0x01000000;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  300  
e98131222ff931a Katsuhiro Suzuki 2018-01-19  301  			/* Next data is Pc and Pd */
e98131222ff931a Katsuhiro Suzuki 2018-01-19  302  			sub->iec_header = true;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  303  		} else {
e98131222ff931a Katsuhiro Suzuki 2018-01-19 @304  			u16 pc = be16_to_cpu((__be16)frm_a);
e98131222ff931a Katsuhiro Suzuki 2018-01-19  305  
e98131222ff931a Katsuhiro Suzuki 2018-01-19  306  			if (sub->iec_header && sub->iec_pc != pc) {
e98131222ff931a Katsuhiro Suzuki 2018-01-19  307  				/* Force overwrite IEC frame type */
e98131222ff931a Katsuhiro Suzuki 2018-01-19  308  				sub->iec_pc = pc;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  309  				ret = aio_oport_set_stream_type(sub, pc);
e98131222ff931a Katsuhiro Suzuki 2018-01-19  310  				if (ret)
e98131222ff931a Katsuhiro Suzuki 2018-01-19  311  					return ret;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  312  			}
e98131222ff931a Katsuhiro Suzuki 2018-01-19  313  			sub->iec_header = false;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  314  		}
e98131222ff931a Katsuhiro Suzuki 2018-01-19  315  		dstbuf[dst++] = frm_a;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  316  		dstbuf[dst++] = frm_b;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  317  
e98131222ff931a Katsuhiro Suzuki 2018-01-19  318  		dstsize -= sizeof(u32) * 2;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  319  	}
e98131222ff931a Katsuhiro Suzuki 2018-01-19  320  
e98131222ff931a Katsuhiro Suzuki 2018-01-19  321  	return 0;
e98131222ff931a Katsuhiro Suzuki 2018-01-19  322  }
e98131222ff931a Katsuhiro Suzuki 2018-01-19  323  

:::::: The code at line 304 was first introduced by commit
:::::: e98131222ff931a670739cede00d1fb9d6f83763 ASoC: uniphier: add support for UniPhier AIO compress audio

:::::: TO: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
