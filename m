Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AD0265623
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 14:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609625; cv=none; b=E+01/kUjQVJmbrgXRuAdM8cD1dLOtchYHa5ZsK8p2pNuf1N5iUB80jMYbx0GjvtjqmSs1mYu9/T55Bk9jbySqewmkxmde88V+7J4kAeaVNiVxp1aV/Rdi1MWTkkE0ue/vdhxWAIVBoj3PNJXnjG4EdwnGt57iS7b2z1ddMXr6QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609625; c=relaxed/simple;
	bh=JCIN3Mah3K1e/3SUVeK/BjbROmaYNc+ls08UcS8Cu64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ix4b/FKCH/MpTAA91Wp35vS1DMAdfqd+SDMm+QLxCBtaf+FazJ6dQMuC2obB7dBxipMaD5YjVB8r7hVoKHx8AbOA/mIAw5dYdnaHy3QGqD26p8sNQOOYzjgY/w1f5Irq09r4oxS0udQ+xGa+BKsv5rJjN6YslBYCysq0FkH77Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4qusQD5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4qusQD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769609625; x=1801145625;
  h=date:from:to:cc:subject:message-id;
  bh=JCIN3Mah3K1e/3SUVeK/BjbROmaYNc+ls08UcS8Cu64=;
  b=F4qusQD56gUX7Bf8/VnInyP8rPaY3fww1myhOH1hmR930PJ5enKZHEpF
   in8V5suEYTyxJn4Cz94M1yWWIiCNis+0YQBUG0ggbqozCghMFsho2M+j0
   5mHa6BF8ILvhEG3pJqCbx2K5uk8g5wFyu1PBmbBuTerI1O/dVCd/sFe1T
   LmBWoTH1YNWikergSAY6sy8Og9GVmHwmQRTTurWg/KZ49sWapUWqvS3Zr
   h0CoqpjY0cZHIkmRHsVpknw7FQc0eL2KAydOyAtgi2Ttkfs9kLlIQewsB
   GPiybAwGOoNvd84x8HeBpkwBSePORIgcpGQLphDJp5K/255Gn6VSAezrt
   w==;
X-CSE-ConnectionGUID: Y6mba3MWQ9KsEO5oJ8TK8Q==
X-CSE-MsgGUID: xBl8wv5HRperGg2uK1knkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82249949"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82249949"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 06:13:44 -0800
X-CSE-ConnectionGUID: lxPjMZUvS/a+Fbh5nMdsQQ==
X-CSE-MsgGUID: JBk29riYSBO3x7GVcPnIKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231231898"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 06:13:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl6Id-00000000Zjs-3DTe;
	Wed, 28 Jan 2026 14:13:39 +0000
Date: Wed, 28 Jan 2026 22:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 11/27] WARNING: modpost: module
 msm uses symbol dma_buf_mapping_sgt_type from namespace DMA_BUF, but does not
 import it.
Message-ID: <202601282236.bjiWMhJK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   1a9ae6af19a2a7cc9af7c824230c5c51e6270e35
commit: 6a6a503d395190b09b5a712726b55d1ac7c97370 [11/27] dma-buf: Convert all the simple exporters to use SGT mapping type
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260128/202601282236.bjiWMhJK-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601282236.bjiWMhJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601282236.bjiWMhJK-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module msm uses symbol dma_buf_mapping_sgt_type from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
