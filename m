Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C3529BDBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781466588; cv=none; b=GXZmvXjqJBMgb6S30NTqZ5xA0tkFVddZAjq4utZ9qtjK7jPBq2/g5LwupLa01pQjWD3hwfOFFJrKy8yHMelAVJDwNZSgg3c9UgBl9afPl8A+BIIzHpQihaj9zfwleQ0u4SD41K4WRVB6k+5EDq8GozYzzU24oBzYsdBtjw4StRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781466588; c=relaxed/simple;
	bh=Kh70/NZ19SDAgBSx/jDaFW3S/AZYE4dKeHAEjehGoNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=coiB1s0Zg9CnABLAnZva5TzGsQHREnYXPnquPL/Znjhiy75j2BFIzKc4hJhrqZKJJ57fN2tRimE95sA4Gb37YSJuALrw+gll+YQg5cp0BpQWfoNG7tAG9yaFqr2jAbpeZDPFmNdNbuykmC/Pbxs5O7ObMUzAoVrWHMcJwbsvvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzwTWatY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzwTWatY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781466586; x=1813002586;
  h=date:from:to:cc:subject:message-id;
  bh=Kh70/NZ19SDAgBSx/jDaFW3S/AZYE4dKeHAEjehGoNo=;
  b=DzwTWatYfkeFhJYZhbWddrNp8r0F1haRWLVHAU0qMT9RG6BOzPeX/uLe
   PXel9oBCxuzJz7NzWQGFLNY3fo5dSyj9j39i/j9gBrZ4VArMThSv6iZUO
   tkr5sKkh4X7oTFJud6bIizB/X3JLTecPxjHDRR5Bys5RHdyieeQqLi5nf
   AGRJxxaa+QUfNT3D5BFAsM8hlxL6nSRPveTNon3V/SkJRyDkTeGtrFzAR
   Ho45oygoshjNPMKio19Lt15GxqVV13MzycJ9g1Aeetll0Tpfk0rmXjTgg
   wODbEbTDxou2xzv0sIhEvjvB/Blz7IKG6iLrWGlov/P75Nsx3FaBhcf8E
   A==;
X-CSE-ConnectionGUID: upZ5yP0vQbqNP4lByr2+Kg==
X-CSE-MsgGUID: LSQwcRBeRO2W2LcjhcBh+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82197782"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82197782"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 12:49:46 -0700
X-CSE-ConnectionGUID: OpR8HO8fRG6votwlWJqwyg==
X-CSE-MsgGUID: j3jkmehfTtSW3rE9GrA+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="251218073"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jun 2026 12:49:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYqpw-00000000RAU-2cg6;
	Sun, 14 Jun 2026 19:49:40 +0000
Date: Mon, 15 Jun 2026 03:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse:
 cast to restricted __be16
Message-ID: <202606150348.YJMTCNFG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: ac131c4148bcfa682104628d2174e8e38e03fd25 ASoC: uniphier: Standardize ASoC menu
date:   12 months ago
config: s390-randconfig-r113-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150348.YJMTCNFG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150348.YJMTCNFG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ac131c4148bc ("ASoC: uniphier: Standardize ASoC menu")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150348.YJMTCNFG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse: cast to restricted __be16

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
