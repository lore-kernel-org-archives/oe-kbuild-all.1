Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B557627B4F2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638794; cv=none; b=LsYUNTP+ke2MIqKQiU5RT0SsONKpfvXnssdJ0bgVE6BW7DNszXFJz+OXUcLLXWWnisTrZTom1gNC871EWYs+FfpMB4e+J0icYXsTaliSgdpdZH5RphuohJI79wPD+oa/0ILOlg5iqixv7fkNU1uhLoG+j+dcaaG5okWl8M1xP7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638794; c=relaxed/simple;
	bh=AdavQ1KrEiGB1m01imZA4IoQpPWQC0FZlOqzIXofoKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ku5jvoHpI1totTLqfBm84opI7cI8PMQ0Nr46WkAbLejVvPhBREFBD1IINWYABTlskKCH/eWSaAxB88puHkMgGws7si+gpFM4aUDL7D0mUoE0ITxwrWCjT/EkKGc/CyrT8qsLBnJUzHdrfdwGNH8Aiy66nbZWPwjUwhKWq9ynD18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyMPp+oH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyMPp+oH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749638792; x=1781174792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AdavQ1KrEiGB1m01imZA4IoQpPWQC0FZlOqzIXofoKA=;
  b=kyMPp+oHZJHwnn6uYxeU1wV74DcpSns2/YGrDfAEQx9zPOPhOKSSEGs1
   7t/b5NXN3c0WVWFqOHdFW5wIphyXziBwmORQMt+qRJ1+WyJq3ri71oHAo
   MIM0VqmOQtep6pp2rtxDShAUUtZCwoJn6DrTJBVl3fKBVBgJp98s+h6IH
   Zjp9aIz1HSd3MQXNCg8Qli34JxyF2w/ZIYB5is1EIrLxWBTvpnA8rjFpu
   jyaIlkV+auYd9LL6EYkS2Bj5RX7LVatp3CaeqzsXe933dozRSCzX80kDG
   /00FefbagilBnoCmK+VOprBwqaMt1APpMSpY5uVy4okuOF4BdsnGuWFQr
   g==;
X-CSE-ConnectionGUID: WEmMCO9TRWaj6fo11JGWfA==
X-CSE-MsgGUID: 2gdJbJv8Tf+xbSxkZ3KUsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62813550"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="62813550"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:46:32 -0700
X-CSE-ConnectionGUID: W9+qYwsGTJ6QS83/bKaCDw==
X-CSE-MsgGUID: 00Xj08O8QaO1u9H6t71aHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147040596"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2025 03:46:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPIyS-000AJD-32;
	Wed, 11 Jun 2025 10:46:28 +0000
Date: Wed, 11 Jun 2025 18:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:log_dr6_changes 2/2] vmlinux.o: warning:
 objtool: exc_debug_user+0x1e: call to _printk() leaves .noinstr.text section
Message-ID: <202506111843.hofKgoly-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git log_dr6_changes
head:   fa4845cf524d2905493e299e4650dc943be4dfe4
commit: fa4845cf524d2905493e299e4650dc943be4dfe4 [2/2] x86/traps: Log DR6 changes
config: x86_64-buildonly-randconfig-001-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111843.hofKgoly-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111843.hofKgoly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111843.hofKgoly-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: exc_debug_user+0x1e: call to _printk() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: exc_debug+0x21: call to _printk() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: noist_exc_debug+0x21: call to _printk() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
