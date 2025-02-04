Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF120F074
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674245; cv=none; b=rgA7ES+knN5oGH2MpK0Qqded/fFXreee5C2D66HEdSTtPnuze0Pl9tLKPHeVmFFud5sj0JdRzuZRnzkKlJ7uOkJqvKAutLu6twLjivslhkbOf1tVxgleirv8tOMVR2AOpg3iv6I7Mcs4xgodFkNOzQWP87qew1m15pEjA2ZGMuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674245; c=relaxed/simple;
	bh=oAkUrL+Uv4lO7lc2iedw/F1aDz0NV8zbZLcwgTYBCsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fwC3bkOR1in3FlkGIhEh0K/geXkoqNvKmZJdmTygDTPPbkcJEDHX9JgBlMNWapYXKBsoEiXlrfk+xhzfYVqbW0O0Ar+UdwrsN767tvp3sKgnKBUwPS48vYnSaMj990+sqD1K1P9xlCOUT4AAQTVAzdb9/u0sHXSiyA3VJfbM2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eee+Yd/H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eee+Yd/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738674243; x=1770210243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oAkUrL+Uv4lO7lc2iedw/F1aDz0NV8zbZLcwgTYBCsE=;
  b=Eee+Yd/HORRAicsQtU1M95CqJMoSv7xrQ6hh+/R8BhcBrJXa1E9+CvD6
   JDlCHagVZJOecreBTYg1fWvR8Lo5IJI6nGgbndd/My2+M358BcviO0PiW
   oDsb1DHSwFR+FSxHCXTY7enu9Bu+MbeqCQqr/V2jCZ6N9RQalPj6l4pk1
   lODOU9rLvcRFtbv3MoQTojyVsPw0OOr/uAsMG6BcTj8GgYxSYSksotsAj
   Sq/zKlOqu3nrMsL7V20uUC8XmDFG++hU9UUyOJq5a7IeZ1OUp4PZNrmbd
   Vy3v8Y+/WoZJvAnkQ08uvbwKJFvLMNxuFJTsWVOzC4nbbIWYdoDNLDxy5
   g==;
X-CSE-ConnectionGUID: 4hfRPNFJSGiQQndtA0Wi5A==
X-CSE-MsgGUID: PT9G6FwHSQCVvzSwM3hpTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42949230"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="42949230"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 05:04:02 -0800
X-CSE-ConnectionGUID: k5iCquZvT4ez4Qd0i4fi2A==
X-CSE-MsgGUID: 5pLU68ONQsO/Yhknms+M3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111035836"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Feb 2025 05:04:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfIat-000sUV-0V;
	Tue, 04 Feb 2025 13:03:59 +0000
Date: Tue, 4 Feb 2025 21:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Taranov <kotaranov@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Shiraz Saleem <shirazsaleem@microsoft.com>,
	Long Li <longli@microsoft.com>
Subject: [leon-rdma:rdma-next 6/75] /tmp/ccGnQL28.s:10: Error: junk at end of
 line, first unrecognized character is `N'
Message-ID: <202502042044.pgaHcGTu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   1a3bdbbc9a097c2c90770c899c85dda40ea5df21
commit: f662c0f5b3396a05fe9b149bf397f253cf1eb307 [6/75] RDMA/mana_ib: helpers to allocate kernel queues
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250204/202502042044.pgaHcGTu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502042044.pgaHcGTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502042044.pgaHcGTu-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccGnQL28.s: Assembler messages:
>> /tmp/ccGnQL28.s:10: Error: junk at end of line, first unrecognized character is `N'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
