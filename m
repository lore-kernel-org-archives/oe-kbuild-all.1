Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973C317C69
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 03:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771211002; cv=none; b=Bf5ub77wIdJElNTuGuGIXW9h1BRGrrZ4KB5NBjkf/NdHpWfNUyjF4V1TA3d+zZjO9qJ34cW5Yad+ag1PeNAJTkzZ3DVqCuf/Hqf9UjJ+Ijec3WXxiDqDItxcPGmQ8eHRdbXhx1kmHWV2Su+XeY1BoLofwFfbkxBnKwGEqw4Jyr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771211002; c=relaxed/simple;
	bh=1O3U+h6TVdfnf2S34ngSWk6mhw2OTL+hCmh5z5/AM5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NmGg/UcSZPP3Dr85K+s1jejnDL52JCI25dWFOlRpqaWhuSvLfLzxY7EyG3tS6ADj38Rh8/isF2asaeoPW/5iMT1Nxv8HTwM6jN0NZUR9yGcC5jO7Yy696XoO1P2T020Pt4pz+vR+f0XT6g+g2HibpzpyfMSymK3kyuKQhkTYtPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=la1FkrfN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="la1FkrfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771211001; x=1802747001;
  h=date:from:to:cc:subject:message-id;
  bh=1O3U+h6TVdfnf2S34ngSWk6mhw2OTL+hCmh5z5/AM5o=;
  b=la1FkrfNQ0vSa5lohB0MU1xIX5aTbuq/yqbYYVxg4tGmu3oe33X1EKQc
   +dD13sN6eIpJS9mTrS1OyBgTy38kT9Pc12wH/QsBJZwu4VljzkiE0XHW+
   rKbJb/1N2DUU1B1aZHxIbHRD3jzlkGJgISpv7266xgaseWz0kMamnI7+x
   l/A9nNLITqxQhHFqSo8lQlW4R/gEOtJNq0d4V2o+0Ua0BrxVKh1USLeoI
   D05t1JwpIgZ7gugefh2EwEwg4SO5R8QCYVCHXm4hlaj/4UVLXVbGvLxWI
   67Rk7NHcrll2+9Yn/AiFB6yXpmGQNvfymeWjH98aBFbms5uHVTbeRhnGe
   g==;
X-CSE-ConnectionGUID: C0W6PEG4QfiFUZv7knPVag==
X-CSE-MsgGUID: 80Sc+C0qSvyGfCol9oPjSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="89704805"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="89704805"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 19:03:20 -0800
X-CSE-ConnectionGUID: hJj6I9oiQpqaGtjHCnHWVQ==
X-CSE-MsgGUID: /HmfUQDzSnmxwuh1faey5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218460401"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Feb 2026 19:03:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrotH-00000000zMC-2gyQ;
	Mon, 16 Feb 2026 03:03:15 +0000
Date: Mon, 16 Feb 2026 11:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: sound/soc/uniphier/aio-compress.c:304:34: sparse: sparse:
 cast to restricted __be16
Message-ID: <202602161028.3WuApM9d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: ac131c4148bcfa682104628d2174e8e38e03fd25 ASoC: uniphier: Standardize ASoC menu
date:   8 months ago
config: arm-randconfig-r132-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161028.3WuApM9d-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161028.3WuApM9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161028.3WuApM9d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
