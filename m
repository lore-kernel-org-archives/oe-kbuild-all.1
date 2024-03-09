Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD2F20DF1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 20:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710017084; cv=none; b=UyjMtUAIc3vU0eEaUlhDgH8TAa5GLOGnov1y1fATiGJN7UcHHTrfVaf7+2Tyc875MAxaT6q5aLst68v/CHTm/hvSJr8yDR9rAG9mzOscPQ6bINWUpPolq3SboPnwK969C1fQ9XyfHpAvY584ctFvgOUbaY1/shgbRH17SsrAI44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710017084; c=relaxed/simple;
	bh=n5UNnJVfuoy/e8kWGOlpUVWDedc5J78cf6Ycy+cjmJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d93yTXqwmHk6m5ZJdtg74T7nCsMJhBGGlianHCbm4BFtOTNLAbx3ZrzqK0fg8r0oBE5v5E/oNJ/1r+u0+P8u1IgfJ7CHO3R43K4aMeZSMwWELT2KvMs4EPUQlnHB90ZxQLv907ZS9RrLGnX5pjiqGrNYtlQPS3UpLMaHLnu7Yvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9wXwjDo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9wXwjDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710017081; x=1741553081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n5UNnJVfuoy/e8kWGOlpUVWDedc5J78cf6Ycy+cjmJY=;
  b=Q9wXwjDolBkRIe3Xnk1KL+qdzAVzbcSFH5ao7shUSjBEgar/Hiy9RDH3
   APUXNhQp3PqmyTEY6s0IMbLc0ftULO/XWxs3ckz0hEaNKHlZDy6C9V6BK
   ErEFprto+py9wE09qzg6mPqHfgQ94GiU8ad/1b6Puiq8MQ1h2pbZUB9aZ
   5002djywffjfpoqG9HXYuUX4bTsbTgZQ1wmQz06OSDFW3SABpNKl1BwMa
   lnUWmqQfms5e/ZzZQeLihiB2veOT170hiIir9tvCgepOdLI8iJToIZP/2
   UAc82mlkgVoZg5S1lNjY2MxFvExn66o8pNC1aQSFItNfrfi/nQ9ufuzy6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8536920"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="8536920"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 12:44:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15436537"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2024 12:44:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj3Yb-0007e9-2Z;
	Sat, 09 Mar 2024 20:44:37 +0000
Date: Sun, 10 Mar 2024 04:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 21/21] page-writeback.c:undefined
 reference to `__tracepoint_netfs_folio'
Message-ID: <202403100409.oS2T9E0R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   4b19245d19affeb7108cfd195f1523e575ca62ce
commit: 4b19245d19affeb7108cfd195f1523e575ca62ce [21/21] netfs: Use writeback_iter() and improve the writeback algorithm
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240310/202403100409.oS2T9E0R-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100409.oS2T9E0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100409.oS2T9E0R-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: mm/page-writeback.o: in function `writeback_get_folio':
>> page-writeback.c:(.text+0x1808): undefined reference to `__tracepoint_netfs_folio'
>> arc-elf-ld: page-writeback.c:(.text+0x1808): undefined reference to `__tracepoint_netfs_folio'
>> arc-elf-ld: page-writeback.c:(.text+0x1960): undefined reference to `__traceiter_netfs_folio'
>> arc-elf-ld: page-writeback.c:(.text+0x1960): undefined reference to `__traceiter_netfs_folio'
   arc-elf-ld: page-writeback.c:(.text+0x19fc): undefined reference to `__traceiter_netfs_folio'
   arc-elf-ld: page-writeback.c:(.text+0x19fc): undefined reference to `__traceiter_netfs_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
