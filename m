Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D140B11B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648805; cv=none; b=b79JHOmgIXDBhxlcQ6EEpHWGRn/ONuWntcZDgLjix/Aow0NZ+x0hNlTRIYkh870pmSY2iJENblvb1Rlbuh6BTos2wWFJNmTaz0EkJk/gkZrUqXw42+v+12R3WFAcqSHc/XR7j07FfElnIU6WggT94IcC+60C1vulz5feEadr3qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648805; c=relaxed/simple;
	bh=t5HwzHMJfMduvQr4wjGn2VmfKjr88JPRJLftpgirrc0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j60A/XJIzlmf7Soj8lIXHkb85SIrY+l5PDKRA100RzXZbIRfT5H0v5VQ3BmBbKJyPRg2twO8hsdiIFL7rNGdLmGU9GY22YQgadfPUKn4iAv0ma8MJKJRiv4oV2vWyEsJ4OJYcVTbx3MwNejjDcOQz54o63Rj43fZxeVWq0iOn7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+RLdiyR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+RLdiyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784648803; x=1816184803;
  h=date:from:to:cc:subject:message-id;
  bh=t5HwzHMJfMduvQr4wjGn2VmfKjr88JPRJLftpgirrc0=;
  b=U+RLdiyRayRCOu1VkFZdoreyNy7hJvkjpkW6y6cjGPmV24EZF77zCoX7
   A9a7V4/yZdLJVaQGOdySv/IiBGKYz+pbCExepi2KC78AJFWSaj4QmYa6o
   epDLxa4Rkwj9gFPurcD6zIu2ZTCy7IrEzda2Uy/5rSzxZ9OOgbPdX5UeS
   0bvaxeyWr+Rv1+FGeKxYo9XnWbrr4FJGzr37Gow9J+sv/EExbupeIF7ra
   cuc3Nmgfrw89vBMDIwBrCUVH/Tfb8EU3zAW6ikntFIu6jopDTiqvySt13
   cruxs3ZBOxVNUW24gBiQeUILIczF4iE8CPvFfrX9G9JCdcBOIr+gzmzq2
   A==;
X-CSE-ConnectionGUID: kKu0vpXvS4GYj8+KLnIs1g==
X-CSE-MsgGUID: hzspCm9nRS2tsKjcv/dQXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96388559"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="96388559"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:46:43 -0700
X-CSE-ConnectionGUID: nIdLv1xrQzirk06lRNqypg==
X-CSE-MsgGUID: ThOw+kLiQnWryYelLgjMpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="254394019"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jul 2026 08:46:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmCg2-00000000XgA-1Ja9;
	Tue, 21 Jul 2026 15:46:38 +0000
Date: Tue, 21 Jul 2026 23:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: {standard input}:2136: Error: register save offset not a
 multiple of 4
Message-ID: <202607212343.xxM2bw1t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eduard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b95f03f04d475aa6719d15a636ddf32222d55657
commit: bf0c571f7feb6fa05a512e2a5e50702501849d61 bpf: introduce forward arg-tracking dataflow analysis
date:   3 months ago
config: m68k-randconfig-r064-20260721 (https://download.01.org/0day-ci/archive/20260721/202607212343.xxM2bw1t-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260721/202607212343.xxM2bw1t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf0c571f7feb ("bpf: introduce forward arg-tracking dataflow analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607212343.xxM2bw1t-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:2136: Error: register save offset not a multiple of 4
   {standard input}:2137: Error: register save offset not a multiple of 4
   {standard input}:2138: Error: register save offset not a multiple of 4
   {standard input}:2139: Error: register save offset not a multiple of 4
   {standard input}:2140: Error: register save offset not a multiple of 4

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
