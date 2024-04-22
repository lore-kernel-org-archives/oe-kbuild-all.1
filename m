Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CAA153579
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 15:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713799777; cv=none; b=iR4xmulf46XSlzX4daMv6TloDyX6q5XSdpsfX3JnyEr77riS/90BrXR7JEKHQ4kD7WIiJN3TAHzpc+DiWvwRZpNokmAVj5tNchEBPA+esFHpQKeker8bX1QOMD5kdVPmY4y6hBdiI7fWA2SylLJdjtw6YidPk7fX56Eqw6uTf5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713799777; c=relaxed/simple;
	bh=9hVyNqm8a1sjS1sJdVnwSPCaxWTw2RBPg760/bv/Ua4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ohsYC+/rTyjrpRm22NQqBlU+c+PGbm8TnMyTEvzLKP5ZgYsf0JS7ors2+VSLKiNhb4xe9JRVOVpxRTLwFXCcDBGzE7jQeO3TitmkybqB9B0cn0UTD540sWnJmYuawaDC7PHT1k9eBgUAmjJb419FEDd5rMjzoq2whCZ1lgbsjiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mL4wAi5x; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mL4wAi5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713799775; x=1745335775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9hVyNqm8a1sjS1sJdVnwSPCaxWTw2RBPg760/bv/Ua4=;
  b=mL4wAi5xw3wIazqrm4hKTkhh0TVczKFFBlOokhzBv6g3ZztU20ajvHan
   fcPBppuDV5HUvwnSZDAcoX+7o59+nAHb+QDQRCuLMCbzX58KDNVZ1Owdh
   fhDmrijhfzkDgL/eDFTCIp32Yf0HVDmhvgtWJ3x/g7q16cGvI46nv61Bk
   MZ2L8juVxIUTmXsNzTvV9P7dD+BRNWDQfqetzqlJOannHJdXANRxqMG+v
   d/5zok1qhk3zGnvUysWRzXa/Mootq7BDvaqgYLbvkTmmYU7bNcThP2KQ7
   GQnHeR3QBpq/T/2xvV8/J+/VourqDEXqxigh3FD2i4wmC6JNeJxrwzqk4
   w==;
X-CSE-ConnectionGUID: 75LpaJvYQLSkS6kPDOApRw==
X-CSE-MsgGUID: qsebb5OUSRyNjdsph0NQ2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20766834"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="20766834"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 08:29:35 -0700
X-CSE-ConnectionGUID: wolqIqwUQJKjIJcjrrzpBw==
X-CSE-MsgGUID: oAGyVLhAQaahJbzo2wRXcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="24032049"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Apr 2024 08:29:33 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryvbm-000044-1W;
	Mon, 22 Apr 2024 15:29:30 +0000
Date: Mon, 22 Apr 2024 23:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17814/22166]
 drivers/edac/.tmp_skx_base.o: warning: objtool: missing symbol for section
 .exit.text
Message-ID: <202404222359.bREYOZA3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   aaa8e73e6e85e82e5b0425d2039e1cbc57089fea
commit: e34047f6dc606c123911c6db8fa424bb4a035262 [17814/22166] EDAC, skx_edac: Delete duplicated code
config: x86_64-buildonly-randconfig-003-20240422 (https://download.01.org/0day-ci/archive/20240422/202404222359.bREYOZA3-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404222359.bREYOZA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404222359.bREYOZA3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/.tmp_skx_base.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
