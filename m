Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FB32264D3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 04:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288870; cv=none; b=MtvvrdcolrQ99B5d+asN5na8l9/ZqY45VwQeQmeb7byFqJDT+muP39DS5f+bHDyCLlftqG8E5oof7tzX4Lb5bvk4ujLtx7iixl3kCNhS/lcrerdmJa5kEgqhsJVLf9pIxRNYwBl4I0YuVU9u18926pncnreFQwZEa9Y9nbwZcRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288870; c=relaxed/simple;
	bh=naeTLqZu6MMAoWKRz7e+5CAnowWsI7mMr4Q2zIAM3Dw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SSFc8/b1NslqRwY4gD8eexO5WXIuD2rgon6ZZwL1ZzNWg3xCTkFfH3PrHv1xnKQ3J0CXK0owAM36nV2s9xN8KdsIaYabUGeP3vX0p29dIXgOD6ZP7/6kgXDOEJbmwWidD8YFTuKoIyrXZuV4Dn4akPqg2xXQXC1Q4NGeHeMWbAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHpQJoE2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHpQJoE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780288869; x=1811824869;
  h=date:from:to:cc:subject:message-id;
  bh=naeTLqZu6MMAoWKRz7e+5CAnowWsI7mMr4Q2zIAM3Dw=;
  b=JHpQJoE2RiChbaRFVQhWNHpf1IBhu3+RIcnvQPnrdilJHRXxlLm8uGwm
   DyQTvIofLNX3PkwY8KUVFPvMPFKOIjmITfb1xfsH1h2K6mtvv9boPKSsP
   rt/+dZW9pD1Hg1pXR1iIvJPxaz3Gaug5WvFu72XIp+hcOFGfD7KqCc3s0
   N31IoZKgtQaMFo+VUjLyC+8qbBkT+2OPs8Rs5Saj44TSLfHk7TSaGF8Ap
   qMmqW+eJVflzkdRhMjzGfwgvGPuSwb1eoe3c2UcPMYHCEqPaIYTGRhnxV
   J5zL3r1vgbdIhZksVKOIV5KAjNHVlJJOnp7zTSt66fBvS443Qd0pnyith
   A==;
X-CSE-ConnectionGUID: anLYKF93TrWIEiGo+twvwg==
X-CSE-MsgGUID: k3sV3LvZQMORAD6jaLxS1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81013359"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="81013359"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 21:41:08 -0700
X-CSE-ConnectionGUID: Ha1AzRFmQxyw9mJKUSB/4Q==
X-CSE-MsgGUID: prdGWD0zQ3anWSywZH9yyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="242405384"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 May 2026 21:41:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTuSW-00000000ABG-1HwO;
	Mon, 01 Jun 2026 04:41:04 +0000
Date: Mon, 01 Jun 2026 12:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
 Hannes Reinecke <hare@kernel.org>
Subject: [libata:for-next 12/13] Warning:
 drivers/ata/libata-scsi.c:1850 function parameter 'ap' not described in
 'ata_scsi_translate'
Message-ID: <202606011207.M7VA2A90-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-next
head:   28cee4cb852c2c8c27925c65bc612be2acb7d7ca
commit: ebfb3924ee1c09d8794892aaee308a8a52f284d9 [12/13] ata: libata: Pass ap parameter directly to functions in the issuing path
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260601/202606011207.M7VA2A90-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011207.M7VA2A90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606011207.M7VA2A90-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ata/libata-scsi.c:1850 function parameter 'ap' not described in 'ata_scsi_translate'
>> Warning: drivers/ata/libata-scsi.c:1850 function parameter 'ap' not described in 'ata_scsi_translate'
--
>> Warning: drivers/ata/libata-core.c:5163 function parameter 'ap' not described in 'ata_qc_issue'
>> Warning: drivers/ata/libata-core.c:5163 function parameter 'ap' not described in 'ata_qc_issue'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
