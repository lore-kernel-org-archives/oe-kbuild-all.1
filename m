Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADE6155382
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 21:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743631161; cv=none; b=fZBv9cWTK9ZbjO3nE1I0qpQp8UYTJWIu7Ltynr/NkmhhYrVolKPPXtMcKlhA3xbMXssLMiKYTJL1wNyfkonH6PCQLar4kUrLrQkeiSuFBxi8FVDKeyL34RGzBgNt5jrIvY5KQ0MOnfbBlP6j6jgwreQn/JFGty3UAf96ZRKSUGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743631161; c=relaxed/simple;
	bh=rqLaTp0P2F84a4w4ILihMuNTsmz8rIl0t7pKaxZ28nE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPNRe3XXCYO4iExpNBjXJeh/qklzWVt1QHWHU+C7C0o1tW8HI3tA9M6nxsQTTUSOGnSBzLaSvDq2Sol/Eq+L8kLeo/seO/u7szzsEkWj6Sst5eVsusBAWRGKjmT0hN0l7pHGPOk5wS+6CgKwv+O+xHBBV0IPKt23nF4hn1XGGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMOtQAMe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMOtQAMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743631160; x=1775167160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqLaTp0P2F84a4w4ILihMuNTsmz8rIl0t7pKaxZ28nE=;
  b=FMOtQAMe6xhZZ2S4eU/vowzr3MY482rzUenY+MTG92+8gYDEL8JhPnYn
   1Fj/Ridz9x3oiVhJnM/IroOxY+2O1dO0NgD+8YEwMUqOso+dzcr7z70lq
   QwCWTSWkJfTPn1CV/dBAm2B9E0G1Y/xC2aj+2hIfINZKcQe2fmy10kKSM
   EbDxFtAC8zkS88LodmKtM1Evcmb+vEryrwpBK4slgdqE3uZMw28B1MRxM
   PHkocKfgclo+ieVuqp2FGIsVHxnZUc/xM/L3aC8pTUpMfsOdu+icnfpSV
   lfrjvS/9JwW+X4IvjnNFYtlXzZj8Cqv+m6gxifzTu/tbGxJv3+tt60elk
   A==;
X-CSE-ConnectionGUID: bdYEpncuQ5mwkYYqP2YOTg==
X-CSE-MsgGUID: GSU8DYojS3WWxyTnNV43QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44914310"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="44914310"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 14:59:19 -0700
X-CSE-ConnectionGUID: qbLUqH+ARNWHk8rqTEcj5Q==
X-CSE-MsgGUID: 9X60Z9cySS2SQPmMwYjr8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="126721457"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Apr 2025 14:59:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u067A-000B3q-03;
	Wed, 02 Apr 2025 21:59:16 +0000
Date: Thu, 3 Apr 2025 05:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2839/2839] drivers/dma/idxd/perfmon.o: warning:
 objtool: perfmon_init()+0x73: unreachable instruction
Message-ID: <202504030550.AkZJTxTF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tom,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   faf7eef4adf1de1ce630b582ca245747042e43bd
commit: bceacf8315c0518375a30a5f85eff25bbcdb380a [2839/2839] dmaengine: idxd: Add IDXD performance monitor support
config: x86_64-buildonly-randconfig-005-20250402 (https://download.01.org/0day-ci/archive/20250403/202504030550.AkZJTxTF-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030550.AkZJTxTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030550.AkZJTxTF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/idxd/perfmon.o: warning: objtool: perfmon_init()+0x73: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
