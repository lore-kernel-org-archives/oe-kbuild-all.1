Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82738126F0A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723043960; cv=none; b=GzDheKH9y78gdK+nBqMv+rIvOzYeuzPOvV5sumykDfJ1BbXN01G4plViaykGXdrQgvcNNBAav+e7BpHyxVuD0i2ggG7FmqCaInTaC9WYUi4cwbgZFoRrXYpDiJERQ3FYvWmO5q1gLPyqvHSO7LqINPAQ22+LJeG6JKWcfwh6DOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723043960; c=relaxed/simple;
	bh=cyxSkTb5aYJz3wtcUH9+3zRWQS0oNabaaCGAdPbv1EA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oHA8O53oEsiCpKFLQ/9jFVwQJV5l9XW1npaGFomhhpxOW/WIub4hEeuKYTohMbiv8rBVSQ9Mgql9ccoNDoubSjo3rmUPLdZkrYe597EY9FATPZ/IwRtjF+uRaS9VUd9oCx91IDRcXuNrHb7sLFVWlCZ3VlxuLuIhbSug5QMmnsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCGF/N86; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCGF/N86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723043959; x=1754579959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cyxSkTb5aYJz3wtcUH9+3zRWQS0oNabaaCGAdPbv1EA=;
  b=TCGF/N86k26EBeuiSbcopaq2eQVOAvFzt940xlunPzPKlXQGV2pA6PZG
   eeN/Kukp4TadLGrIn1JEba0YgUwpq+dtmPubihcGO9bfe3ophdpZz63wI
   TDbS9esxue343Nvcn5j+fm7T6benH1HdcktIdIcxq7IJatq0PFUaJc9oo
   r4pcCqjgkxj/edANLk87cUSQNvhRBCCSckLD6eg7dTymvuJ7BnMffW32i
   lo7K25cShylxTiJKhnCOfD0bI7h//lTomrDAMB7MMj6+w50tVGg/244Ah
   jVOCM43ukbsNAIpL075SYRXjDy45Jj/5Vwviiq2zhq8JM6s+H6Mbmlxn1
   Q==;
X-CSE-ConnectionGUID: 2GREZaiyTtaGkRypZ9o7IA==
X-CSE-MsgGUID: kOJ3I+mHSN6hHDOmOnX1jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20976401"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="20976401"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 08:19:18 -0700
X-CSE-ConnectionGUID: eAQMTYwaQV+gyLQl49Boig==
X-CSE-MsgGUID: H/g3wfXgRyeOSLIM5xJr8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61769113"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2024 08:19:17 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbiRW-0005UQ-2Q;
	Wed, 07 Aug 2024 15:19:14 +0000
Date: Wed, 7 Aug 2024 23:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 12646/12694] setup.c:undefined reference to
 `topology_apply_cmdline_limits_early'
Message-ID: <202408072323.uYi6b83y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3572a71554cfe7fb3b2c281151802081033d71df
commit: 2dadf9dacb879b15222e21211cadb9dfadb16d9e [12646/12694] UPSTREAM: x86/cpu/topology: Rework possible CPU management
config: i386-buildonly-randconfig-006-20240807 (https://download.01.org/0day-ci/archive/20240807/202408072323.uYi6b83y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408072323.uYi6b83y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408072323.uYi6b83y-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0xf81): undefined reference to `topology_apply_cmdline_limits_early'
>> ld: setup.c:(.init.text+0xf96): undefined reference to `topology_init_possible_cpus'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
