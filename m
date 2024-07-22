Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495416D4E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721651445; cv=none; b=P6MX72X68OgZfI5m9Ar3xhMOTVMWj+AKPjpe2HG+v3mIWnwO6xamCq/AucTvWK8HOO67CJTpkBQYrurAit2ktar/lBvEY44IlzRqRDO1AsKDPjdyXXbowYz8/WNcUZWcrwhXJuMtpIsxKerAQC/CIeT7sPHgcgE0Xt7G9nzrwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721651445; c=relaxed/simple;
	bh=/D+ie0ajv4ovaGvvgY/n/86hySXju7Y3R9tEI0HFprE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UDAKm/xohn5ihwLV0bugTYsQMav5D4SakaYcwPb36Wd0ufhc8FgopCaBFI4hI/Vc+5p1RvqIQsbfvXKaouhS56cbmyUI9eBh4RWeMeMTYf0qc/bhZuz9LLXfLP4H+RtNSb5ZOltXR0ONJu1mqzhwLkCJ0UYB5YVZBLURnl0FBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbBBEiI+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbBBEiI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721651444; x=1753187444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/D+ie0ajv4ovaGvvgY/n/86hySXju7Y3R9tEI0HFprE=;
  b=hbBBEiI+HZP31wEVwRcUw17uAO+t13BTCuGuYlNPxrY/mDJnAylrg5ta
   dk3Ga+Nsen14ZMQzBpIw39floAdj0NEjh2XPAv5RseUJrEUoLNzqVDFk4
   f2LXzd35TA0NY3trquaXMjqREcsuxpBySckFpAEsJPDKv1r62QLHxDSlR
   kU53RfMxR/NJ1fkZ2VHAykV4BSUQftlWbFxUNSnZxrDmgU9wrUGHbmcsE
   opaB4hSNZ/SlmN9bZidegdt8ky6XibkI3pkyl/tpqwHFa4v3hU1UaUQJE
   HtWJJTGsdD9ebrhe+QQc86i7y1WOw20Cisk0pjxhxAFtTpi6zOlbjLDUq
   g==;
X-CSE-ConnectionGUID: dWxIfmnkSemQws3EaHefog==
X-CSE-MsgGUID: vGzIZHMlRamy4K5cIMZTKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="30603796"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="30603796"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 05:30:44 -0700
X-CSE-ConnectionGUID: +xnSgBK8SPOEgBYCu0LMpQ==
X-CSE-MsgGUID: u4t69TBeQ/uucZac8jtF8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="89318129"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Jul 2024 05:30:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVsBc-000l8t-0V;
	Mon, 22 Jul 2024 12:30:40 +0000
Date: Mon, 22 Jul 2024 20:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bp 2/4] kernel/events/hw_breakpoint.c:997:16: error:
 implicit declaration of function 'arch_modify_hw_breakpoint'; did you mean
 'arch_install_hw_breakpoint'?
Message-ID: <202407222053.oyCsd5c5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bp
head:   b45f92fe92ab4e5bf3568b81df7d7a4c7a52acbe
commit: 440ac04ab997e21edb88bb4923258370dcfe7c3d [2/4] hw_breakpoint_modify function
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240722/202407222053.oyCsd5c5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407222053.oyCsd5c5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407222053.oyCsd5c5-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/events/hw_breakpoint.c: In function 'hw_breakpoint_modify':
>> kernel/events/hw_breakpoint.c:997:16: error: implicit declaration of function 'arch_modify_hw_breakpoint'; did you mean 'arch_install_hw_breakpoint'? [-Wimplicit-function-declaration]
     997 |         return arch_modify_hw_breakpoint(bp, addr);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                arch_install_hw_breakpoint


vim +997 kernel/events/hw_breakpoint.c

   994	
   995	int hw_breakpoint_modify(struct perf_event *bp, unsigned long addr)
   996	{
 > 997		return arch_modify_hw_breakpoint(bp, addr);
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
