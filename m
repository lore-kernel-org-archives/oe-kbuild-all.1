Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31E2E0914
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 21:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771537491; cv=none; b=N9zzUudl4NPnSyGoFnlAsxpBCXzyRXSUvgjRnAW9Yzni1iK8FTP0doMevrgn5Jh9wauoM4AhKFEm1EA/ImoJIXEjBK8lLlVGTNRqFfVMcUpx2VlZepwS9gKfRjPJSutdYarQNv8x88OdGSam3SEo1Jiz5JkwGuMc/VGv16gVU00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771537491; c=relaxed/simple;
	bh=F9e8cpUEdXuDCdlUlp2XUQovAGbtfRSznCtP7Lq1CIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjRT/vav3YHQUhraQsa4NCiZnEKJbnhloW8CN7FpniNb3bq3KbmX9SOFwsA8QB7WFGbtBQqwok6FYpK6a+R3G2seJbKEGFPRr/b+ER8A5PTtAVPid9dn9pmRfib0SaM7nwnuDgxU42GTYRFaM8rwsqpduy1qmFyErbD45el0lxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv+geZY6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv+geZY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771537491; x=1803073491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F9e8cpUEdXuDCdlUlp2XUQovAGbtfRSznCtP7Lq1CIk=;
  b=Fv+geZY656+vqfnVOSKnyJ+7YdDz2q8J4edBhLqVmW+fXlbwii4pNqki
   POow8i1q4Eb0BzEs61ExLmAdizGwpbraI4AXntG35oiV4+4KH98UQFMn8
   YDDWaQyqcy/SRXRm/2LjKGxrdp/kLXEQpsY1mz+DyVpA4OUJhy10Y/PlX
   Yx/sXgPB5GvvV/iYqE7a7lQrPh6s5xCwD0foe045DFjMXkJgQxK2gjIol
   ygwjzRYxfcHIWjOKImIibXvKDfIVRe5+nTNcexYxYUzeT8u4L6qEIPm1e
   3JT10v6y3Ao0kAo078j31EChLMQM6LVWal94G2wclSoSXftx9vx4fQRLO
   A==;
X-CSE-ConnectionGUID: nQx0HgnsSf6hg5h7//gxTQ==
X-CSE-MsgGUID: rI9JKyspQay3Ohh/wEDXEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76251001"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="76251001"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 13:44:50 -0800
X-CSE-ConnectionGUID: MUiChfOYRS+HXcFQtHwx4Q==
X-CSE-MsgGUID: rRx/DI0fTi+iDxQ3claTGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="213278257"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Feb 2026 13:44:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtBpG-000000013ZU-1ufA;
	Thu, 19 Feb 2026 21:44:46 +0000
Date: Fri, 20 Feb 2026 05:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/8] net: xilinx: tsn: Add TSN endpoint and MCDMA
 support
Message-ID: <202602200544.ymyn5uh3-lkp@intel.com>
References: <20260219054911.2017362-4-srinivas.neeli@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219054911.2017362-4-srinivas.neeli@amd.com>

Hi Srinivas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.19 next-20260219]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Neeli/dt-bindings-net-Add-TSN-Endpoint-Ethernet-MAC-support/20260219-135600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260219054911.2017362-4-srinivas.neeli%40amd.com
patch subject: [RFC PATCH 3/8] net: xilinx: tsn: Add TSN endpoint and MCDMA support
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260220/202602200544.ymyn5uh3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200544.ymyn5uh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200544.ymyn5uh3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c:63 expecting prototype for tsn_ep_start_xmit_dmaengine(). Prototype was for tsn_ep_start_xmit() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
