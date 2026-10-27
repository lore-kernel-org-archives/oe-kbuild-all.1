Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083942;
	b=LbpBqzz2+FKWecC+f62HtmoO43Z9yBZ7KU22Kl5y6XLkFCX0T0HsBTIAGvkuMbPZbi28
	 JrF1OKWVu1Rqj7PIZujAnuapMBNCRxWT0MzSoZX/fX37qlTWK3igSCgrJxljvw3HycpPJ
	 FJWZDOkb/Pghm16f2QnBdYBWg9cgSkwaUX5Hd3N7OF6Vg3/wWHQj23m4KMyhBcIzimpS4
	 KY9W7c5rbCHZuO9pQtxfEoc8PDI55Lf///yhODuzmeZ2NBL6kVgs64V5+XjHexl5A2SVz
	 E5051Tl623k5rEpJqIBvQN64g7DPW9ROT+IooIx1R312hL2KCzfMICmCV5g51qlN4xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083942;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pOrh2MFQFwoeKAEOwItYFzPqyXCMeW+jRXRdKXe8PJw=;
	b=arXTaFy25KiCfb4mrkhdyRE7p5A9cGYsxlt3b+qQsuZb1zCiMKnvzcEgyKoGjwCyt7RN
	 iiKPVqL41TM0g/ydGG/VvI1G6ITEqgtww4PgWouQpJ70s9YmxtNOa0g8HEs7G0iPoCaV4
	 xQI8Qhu2ZiVYcR97aEyQ4DkDQLG6LedmZXmUWN4bo3sDFopJQ0/wf+DzpwKP5J1AKT53n
	 fowJutprubZqwSHs4YH8ba1ikml2Z+mzFPX5OLoS76034eO/hRG+hM5NHvdcUQ2TEn1kN
	 br7lJGY6jK2yQU67GWuaxvA9VMAp+1o8LQDv9JI6kAGJaLN7Ur3BrbSwyjhI2p4i6Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iOU3hIFj;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A56606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 06:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7A56606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iOU3hIFj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793083940; x=1824619940;
  h=date:from:to:cc:subject:message-id;
  bh=5/DhER74t7R43mkV1F4OKqvIMomVNCrA9zuC7f2r3KU=;
  b=iOU3hIFjPS7mNRheLECiTR+6/h35yiQRzikw9lHYS45c4grjBXVCQ4KU
   Ay/6UADirai8JpERQijkClFmAGM1Him/KGQMKsii2oZp/q/RZ0atJXwms
   H4xK1QTGBLr6lvKDoy21OeY84qNaOapXaSOqUJTOOJtA3awYeFvByMsII
   B0/9E9FTz9efc42EfUdaPHAzduaH59kgp8pLkeYHkpbCiUqpKXtgc4jIA
   JIttSCjo+29neCjxc+tLb1Vevm96zVtPqvLvMac9Bi3GAscrXDJ6qkf2R
   qCtaUBO69mcq79thYWzcKdU/lBcg61x8TqqA98YKNBogZR77+ZH/oLnD+
   g==;
X-CSE-ConnectionGUID: tIW2cNxeRRK9bcH//lIzKQ==
X-CSE-MsgGUID: Uck00Ys4TIKrb3izidRr4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1765411"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1765411"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 23:52:19 -0700
X-CSE-ConnectionGUID: zk2c8gUqQjCdKbjNUELyFA==
X-CSE-MsgGUID: THHgkT/XSV+fb3Y8DpEOPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4815961"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Oct 2026 23:52:18 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLb2d-000000004Pv-3T6X;
	Tue, 27 Oct 2026 06:52:15 +0000
Date: Tue, 27 Oct 2026 07:51:45 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2]
 drivers/dma-buf/heaps/page_pool.c:235:17: sparse: sparse: symbol
 'pool_shrinker' was not declared. Should it be static?
Message-ID: <202610270749.TnClUGgT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Hridya,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   e7e4a657fff86db1dc8f902e5ff8c713b81f6d39
commit: 70ad75e771d15cdf21f43548ee47bb38b4c2f564 [2/2] ANDROID: dma-heap: Make the page-pool library built-in
config: arm-randconfig-r2308-20261027 (https://download.01.org/0day-ci/archive/20261027/202610270749.TnClUGgT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270749.TnClUGgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270749.TnClUGgT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/page_pool.c:235:17: sparse: sparse: symbol 'pool_shrinker' was not declared. Should it be static?
   drivers/dma-buf/heaps/page_pool.c:242:5: sparse: sparse: symbol 'dmabuf_page_pool_init_shrinker' was not declared. Should it be static?

vim +/pool_shrinker +235 drivers/dma-buf/heaps/page_pool.c

d3b59a75e86384 John Stultz 2020-10-02  234  
d3b59a75e86384 John Stultz 2020-10-02 @235  struct shrinker pool_shrinker = {
d3b59a75e86384 John Stultz 2020-10-02  236  	.count_objects = dmabuf_page_pool_shrink_count,
d3b59a75e86384 John Stultz 2020-10-02  237  	.scan_objects = dmabuf_page_pool_shrink_scan,
d3b59a75e86384 John Stultz 2020-10-02  238  	.seeks = DEFAULT_SEEKS,
d3b59a75e86384 John Stultz 2020-10-02  239  	.batch = 0,
d3b59a75e86384 John Stultz 2020-10-02  240  };
d3b59a75e86384 John Stultz 2020-10-02  241  

:::::: The code at line 235 was first introduced by commit
:::::: d3b59a75e86384b6d5302159fa89446ead81e71e ANDROID: dma-buf: heaps: Add a shrinker controlled page pool

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
