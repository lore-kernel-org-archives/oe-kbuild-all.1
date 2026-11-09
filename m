Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794186559;
	b=0jgewP2xPJoQP+F8V4V7FtyQiqQCvryXr3D58eYDi7+Lx8TOtPgqr71nlnDgq/400A6c
	 /oLXAQ3RQFcYjSd1QsjkClT9edL8g3oRhI3363pABldOcg0NHZDmdg9IxSEOZ1l/kPx3U
	 MXyMmiTLWK/It5jZpN/5RScB+fi+As8IZoKdd/eNZyfTJwwEhGWi5SWPWrd71Aacj5pir
	 H4BOXK/Trp/rLKcGi/l5gAgUri+md85l1bOI3lqADFETIHT5xUtr3IfkhNCZip/kruNH1
	 I/EBt1yn4xpKLW0mauFTqpM8OWUh60yY5uG6W6vHw0Gp0+DwuIkZ4ohtnBhEUfu3aIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794186559;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mWtB7OQ0PYfp56/59+HiZbOXnE2TeT2WWiSSjZ3gkd0=;
	b=XJpVR2ud0NXLvnLPVj2ck5WEif1N/GRLK5W5UWe4/GNycqoFzziHJhlI0DprnsXwy8Op
	 VUbeDswz8THE5Z5vb+efhuMc2FnplOVw0reT5heLceBE4R+khxdPE+tX2WDPcMS85/kVy
	 VJ1uaEZxUwR5t4k9KmxHUhyzEmZ/H0+rSeowXJx2W0pW8yud7QoBgrUn9Eb1qjPPYSp2t
	 iXEin0fwg+1rBMO7+1rfwueGOQbE5FB1lUF6PVs3r2KVSJ9ahWKUXgpVyCY7RsOw1Z5pd
	 ILlkPNeQxHaaHF2I9Ka5mgd/l4tBRK5EaqsaDQm2sOB0jfsuCAlJ37c1r4PbmtNdeMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NbfVkNEJ;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62032606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 01:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62032606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NbfVkNEJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794186557; x=1825722557;
  h=date:from:to:cc:subject:message-id;
  bh=gQM2FgHWBc7NRbu3vPkSS0z9ViBPmTIsyKpKx8+TG9c=;
  b=NbfVkNEJXZfyTkTZiScYNL2mQ6FK7lAEj0NBD5kECmLpcoPQf4GAuY7f
   JoR7MKAJaLS3JCWjkejoeu/aQq+e+NnaZ9qpnSbod+y9qDSYhshg0TuN9
   Vd4TfDnB8WEMUcj3b3SyE+AsNzn5z8aNI659v2h5CEbfdGpD+GL4+MnEG
   q20/eUGAucPag/RNUi2R4KJg9t3Qb7cjKyAMrYOP/adJoII3Xfm04tnoI
   GBgeMA5h8oh63Cv1WGZJqGe6/sj743YcFIf3pzyPuY4qoQQqxOQNSstMe
   TAXdYXhn2eErFmGCu9lPst2ZKApkxdVNwoDpv6pX4Bpb+00eBwATL3ZB0
   g==;
X-CSE-ConnectionGUID: da7VZY18Q5OEvHTpVunvhw==
X-CSE-MsgGUID: ov3x4HrtQCS2edYfbevZSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2778037"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2778037"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 17:09:16 -0800
X-CSE-ConnectionGUID: wlhXGeCoSS+28GycQSx+Gw==
X-CSE-MsgGUID: xTs27ZRxQI2zB6exIOliZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="8080454"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 08 Nov 2026 17:09:14 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQDsi-0000000008R-1zQb;
	Mon, 09 Nov 2026 01:09:08 +0000
Date: Mon, 09 Nov 2026 02:08:24 +0100
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, "Darrick J. Wong" <djwong@kernel.org>
Subject: hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffd0): cannot
 reach 0000531c_trace_event_printf+0, recompile with -ffunction-sections
Message-ID: <202611090230.988B4mZW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a65162514fbad21a2c58ffed65f42b27e92b163
commit: a9a7b9e8686da4aba9cf8e9c81097401860107e4 xfs: add support for lazy direct read bounce buffering
date:   8 weeks ago
config: parisc-randconfig-r2307-20261108 (https://download.01.org/0day-ci/archive/20261109/202611090230.988B4mZW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090230.988B4mZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a9a7b9e8686d ("xfs: add support for lazy direct read bounce buffering")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090230.988B4mZW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffd0): cannot reach 0000531c_trace_event_printf+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffd0): cannot handle R_PARISC_PCREL17F for trace_event_printf
   hppa-linux-ld: final link failed: bad value

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
