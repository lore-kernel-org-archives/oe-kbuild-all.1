Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1729E1A265E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869908; cv=none; b=YClDqEWuwasgJP+Np2WxRReQgQ+Qa4VwX+WBrr5pXpaggisD0WAgMPzEWuSwaZUzaP4bAInbpK3/AJ34HPm4Fh6Kf1QiFCvpbAR31qUj4AlUslj5Ec4AcYov1+IRo2Sx+IwhoCLYwovirait3hRqsbjVugzqnmrcG1zB81UG0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869908; c=relaxed/simple;
	bh=1oTZwRqAZP1VSQ1hSUfsqF0olfRVCB5oA2nMfmoyvOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpAo+rtHaCXMRGpCidF0S4L7P09igkb6w9nWRTmQhzr0yPpNKqoGlX4vlr5AvKx++G+elc2wrItS0P1x9qCOpolKUIrWI9iY2p363/9JIcZBiVzdsqCQSl63bLAhRokNpZ3iF7C7fj960mAUB1l4Fmhzl5dW/8s1pojLTsftzik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lr8eloh4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lr8eloh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738869907; x=1770405907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1oTZwRqAZP1VSQ1hSUfsqF0olfRVCB5oA2nMfmoyvOE=;
  b=lr8eloh486eB+phoqofP0iyquDNvjVgye+bzukBHo4hvhkqqDUhiPHEU
   DAaW1nv5dPPV9N/GB8vMNAl+3MRnHx86rCHe0KjzsJ8iVRsz4RhzsLxCX
   hq18YdCbCFzQ1MbVgGc/YIlyBzIeriMta/1BhB3aqUGGql84I8GSkBLRK
   nGzPIbMu6mKKVv2CECEpOy7Uzky7QpkrVeWUP3k7Nv3vxvWleVVruilG3
   TDhPuta7mYBVganc9s3tt5vaiJAKpNEVKmLLvndfQcx72dsMl1o7SInAb
   k63BPO6PnvUUa9JYBlN+ArgLx00bJn4CQkUqp5QI/KwzVmka6G+L75yis
   w==;
X-CSE-ConnectionGUID: 1cr1ILHqSFm6/5l2/rs1Mw==
X-CSE-MsgGUID: mIqHdjbsTfKfLAOquE4s9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50116938"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="50116938"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:25:06 -0800
X-CSE-ConnectionGUID: 5w4gqOJMRxmyBIkR2LlChQ==
X-CSE-MsgGUID: 0K35hC4XQWqk/bdKCFbaaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111078746"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2025 11:25:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg7Uj-000xFT-0r;
	Thu, 06 Feb 2025 19:25:01 +0000
Date: Fri, 7 Feb 2025 03:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1418/1780] kismet: WARNING: unmet direct
 dependencies detected for FB_DEFERRED_IO when selected by
 FB_DMAMEM_HELPERS_DEFERRED
Message-ID: <202502070305.1rGTDnW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   808eb958781e4ebb6e9c0962af2e856767e20f45
commit: 236ee083f1b9128fd5bd266054c5b8868f803cee [1418/1780] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU
config: arm-kismet-CONFIG_FB_DEFERRED_IO-CONFIG_FB_DMAMEM_HELPERS_DEFERRED-0-0 (https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070305.1rGTDnW0-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_DEFERRED_IO when selected by FB_DMAMEM_HELPERS_DEFERRED
   WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
     Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=y] && MMU [=n]
     Selected by [y]:
     - FB_DMAMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
