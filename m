Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94752DB7BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 16:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182516; cv=none; b=T5wlG2Sxo0qmK9va7U/KETD2GzG7toZi3hm1aGmS4l6tB9UU6DHiygGro+6IutMhcsHMgMWsj6pdtGw6KgY7cin3gYp9T2fuBKMV+O9vVgoCE1U1Ve2eU7I/z39WYU1y+ebgSHotqaweRdr5HjIb1E2j2r6MSudHNLnQcBlvBso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182516; c=relaxed/simple;
	bh=KT/O2ktVLZR20WoCMOwwXliPiuryBVt2WUoS9WI0xbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mfOpwJKAbi99AjfzRu+SlGhY89roa0dbD0AVpvbSX5+znVdEB2Ue2j1quNgMQ8SAEK+Evql+b4nBeqfsHjYNq5TGa5OpLN9vv9l9cVG+MSu28Co2Qd1humd7Cuoga8Aq7Xfq4kPz4hL/AIn7xp9sD00xIqRFt5/eYN3Z4BCXKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYdA7ApM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYdA7ApM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776182515; x=1807718515;
  h=date:from:to:cc:subject:message-id;
  bh=KT/O2ktVLZR20WoCMOwwXliPiuryBVt2WUoS9WI0xbI=;
  b=bYdA7ApMUYipLnIFiS6w6e5L9euk9l+NDV0OkS5VfBztt2UhnJLO5ZCy
   ciFWkn3mS8JRMesvn62HZkYlRsNAa7rUoy0qOOboXdLDOdte9DjQ/w4FP
   97mTlq670vAVKG6KvIzz+EKcqUfGfp9dtt9ZBYDlv9bzd9LJlBdbOVn1l
   XndYp5cPrIuaEGG6BMlRImDqssPHOq31D7cJts7rNdQC9eDDhfx4nVVWF
   oZ/OE/BMdulqa2un2MygoJhazySgTUu5NA0IQ9Cg5vImVbK8Clf6YBwr/
   +7TujBSRpZFcsu4jlfqv4KMr8kZR05Uc2UFM53IjkET0zSFPC1jLgB2cY
   Q==;
X-CSE-ConnectionGUID: RCtKNGPSTti0lw3ywn+zVg==
X-CSE-MsgGUID: XW8sE0leSjW7hbKHvDdhew==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77327088"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77327088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:01:54 -0700
X-CSE-ConnectionGUID: OMJco15xTpOPoEbCKSzOtQ==
X-CSE-MsgGUID: KbibQwCaSRCAvYILtyS3Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230062862"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2026 09:01:52 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCgCz-000000001cP-2hnJ;
	Tue, 14 Apr 2026 16:01:49 +0000
Date: Wed, 15 Apr 2026 00:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <threeway@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-7.0.y 188/192]
 sound/soc/codecs/lpass-wsa-macro.c:2841:23: error: called object type 'void
 *' is not a function or function pointer
Message-ID: <202604150051.0j4KBwkG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/steev/linux lenovo-x13s-linux-7.0.y
head:   577f25eff3014cf94dcfb85d3230d31ca505d3a4
commit: 55b4264d0963dd4cb190b215153faeada3dc0520 [188/192] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604150051.0j4KBwkG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150051.0j4KBwkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150051.0j4KBwkG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/lpass-wsa-macro.c:2841:23: error: called object type 'void *' is not a function or function pointer
    2841 |         return pm_clk_suspend(dev);
         |                ~~~~~~~~~~~~~~^
   sound/soc/codecs/lpass-wsa-macro.c:2850:21: error: called object type 'void *' is not a function or function pointer
    2850 |         ret = pm_clk_resume(dev);
         |               ~~~~~~~~~~~~~^
   2 errors generated.


vim +2841 sound/soc/codecs/lpass-wsa-macro.c

  2833	
  2834	static int wsa_macro_runtime_suspend(struct device *dev)
  2835	{
  2836		struct wsa_macro *wsa = dev_get_drvdata(dev);
  2837	
  2838		regcache_cache_only(wsa->regmap, true);
  2839		regcache_mark_dirty(wsa->regmap);
  2840	
> 2841		return pm_clk_suspend(dev);
  2842	}
  2843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
