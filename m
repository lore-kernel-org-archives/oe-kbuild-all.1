Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5446D13D2B7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712682054; cv=none; b=cfcdIBRm2DU3jpMli9g88L9Kbai5woKiB1+BY0SHQOOtxf6p97Ua7sT6PypJj6TSjvB3ctvSp8IyBuKcsNWTPFkMoP8RX2QAiS6opQYpTCr+Fmo6JQadau/Q8oErWMSblx9Z2W4P3xUguiYCeSI94HjmyoxSyeB5FUn8rFrMXlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712682054; c=relaxed/simple;
	bh=MxH/he7GqC8YN6lJPCW8QnKlMXc5yRCT5xAy3PJSZk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JQMC/jQBsGmkPFUL5RToL5LaTOr3nk/Spad4wOosuzuaac8vb8Qj1AKfiFuYDu9hAGAWlHKMtbSJWyXdlZOx+2X+NH7JQClKLMGKP5SEzKGwaviCi8LHJhS49zs0ShDko8c6jIhSQEojUcZo/m1833we5+e6bs/7AJzD+UjvRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXJ2092u; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXJ2092u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712682052; x=1744218052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MxH/he7GqC8YN6lJPCW8QnKlMXc5yRCT5xAy3PJSZk0=;
  b=cXJ2092uDSCLP3OAdJAc5W9/vfXrm6VeGFP0OeBsQH3ujOiDeC8xw+Sl
   /av4ATrebWmdKojystgJV4K/fppc9ZLIJI2bj6hFDionLGtW9iWK2wpSO
   nFgZHcaSP3Ml0GtmGSY4tcNKEKHAKJbldgn9+DPJd6gba4RdUYiu0X60n
   qP5c/oAQzT4tOKG3DsXpEPiqXrDmLGXxFwuQjWlok2gMsg8n+oU4zLqpP
   Jpc58dzhJ3zoU4HxUKJUK5PqIpN2Duj3Ews/C84WYw5GuW2321NvGA4Wc
   H3XT5H6mGxmySxX+Gn365mr9nqc/8QwL0f4popBdAN/+syWnsiQffZkpW
   g==;
X-CSE-ConnectionGUID: FI+oV4k4SOeMmQJXqfbFTw==
X-CSE-MsgGUID: AZm97HPuR82S5dqRgULIpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30494669"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="30494669"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 10:00:50 -0700
X-CSE-ConnectionGUID: joEg8BkeQkuD5K73mT9f8A==
X-CSE-MsgGUID: L05J8dkXRWGpjGqNoKXPrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="24955990"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2024 10:00:49 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruEpy-0006K8-2X;
	Tue, 09 Apr 2024 17:00:46 +0000
Date: Wed, 10 Apr 2024 01:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 451/456] (.text+0xb90): multiple
 definition of `eytzinger0_sort_r'; fs/bcachefs/eytzinger.o:(.text+0x700):
 first defined here
Message-ID: <202404100003.4zF0qBwk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   7a558c88692bfaf587bfeb687ea9fe0d4d98632c
commit: 14c3048e0c1aad74af0692c5312d4e4fc4edf7cf [451/456] eytzinger: Promote to include/linux/
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100003.4zF0qBwk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100003.4zF0qBwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100003.4zF0qBwk-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: lib/sort.o: in function `eytzinger0_sort_r':
>> (.text+0xb90): multiple definition of `eytzinger0_sort_r'; fs/bcachefs/eytzinger.o:(.text+0x700): first defined here
   alpha-linux-ld: lib/sort.o: in function `eytzinger0_sort':
>> (.text+0x3310): multiple definition of `eytzinger0_sort'; fs/bcachefs/eytzinger.o:(.text+0x2750): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
