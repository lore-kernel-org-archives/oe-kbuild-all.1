Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DBC3093C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771418155; cv=none; b=mGKW9tvc+N84ooyer+PKmOJH8VG2W8gcjtHjzvudox9J9sMB4n5U41xepCv7sXyoeURFcERobhTgnxSFNjwHVGULfMnEKlNU18wOoyv/kZSqu0onjfnXjVDZzC1jbMDsMtq7cQNLSe0/V8fS7CxrLmxK0Ab+XLcXFBCjun5uPKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771418155; c=relaxed/simple;
	bh=S0yFQE+Z8P0x6qJaJ/YqkJL07a2SDcFqfreLdStQGnM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dZGL2Iddkz/auFc45FYNjYWoCjIZGuxCdkqn3E1RTZRoSz5rJT9kbFVGtt7rbw751WYPExuQxUv5Dn5vTxSqYjxX6sScRgBIJSLGcbQY0FQVQfUvgsXcogNNt/1o/FffgUh5FeuOME0MNC1Rsrv5JvpkjzZ+nsSaeBJI3Yb/Vgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJg3mq8z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJg3mq8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771418153; x=1802954153;
  h=date:from:to:cc:subject:message-id;
  bh=S0yFQE+Z8P0x6qJaJ/YqkJL07a2SDcFqfreLdStQGnM=;
  b=VJg3mq8zkwWSgDvOSER78vvFPG8mMdCoY19EO6QiRlCXkFmWswF9pubM
   6dU0zMokuno7V4MxACc7hOQBEG9ivc9W9P44xmX4S/oohZoXRrtqkgF+k
   ZS/+2jSvi68wOh8vD+0vHyLivELxOLPYB7PCDx+JwlmZpx/Ag26kA5E4k
   K8HD/6UKIyAgtE8BR4bFufRt458NPqEpKauPJVgFzdU3wRwPaCdkhDm6F
   Lw/ptXNWPCCjoh5BAjR8d+ToZ/bDINMHQYiePADNvNbxxbAnW0ns3c5JC
   e8poN+3PqsGHN/e0BZacRgRyBydRV2oQs6L5gdxkd34IK8k1yPlXGhEKG
   g==;
X-CSE-ConnectionGUID: biqffpAMTAaa3Umf4GtJ9g==
X-CSE-MsgGUID: VOeYi8uzQkStnh3INNomvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="95117896"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="95117896"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 04:35:53 -0800
X-CSE-ConnectionGUID: 6BmW+UUZThObap5D6ce9jQ==
X-CSE-MsgGUID: 4PEqWqBgRdGINSuPYKr+qw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Feb 2026 04:35:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsgmS-000000012L6-3Ewr;
	Wed, 18 Feb 2026 12:35:48 +0000
Date: Wed, 18 Feb 2026 20:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xor-improvements 15/26] ERROR: modpost:
 "xor_block_altivec" [lib/raid/xor/xor.ko] undefined!
Message-ID: <202602182006.i6klqSjM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git xor-improvements
head:   ec3f2acc271aa72c99391335901d8bb75103127a
commit: ffe9982ca5b293adf68f8f6e145086bc47e5c8a0 [15/26] powerpc: move the XOR code to lib/raid/
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260218/202602182006.i6klqSjM-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602182006.i6klqSjM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602182006.i6klqSjM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xor_block_altivec" [lib/raid/xor/xor.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
