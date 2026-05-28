Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9BC3E0758
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973581; cv=none; b=KflgcOo8hPSCeVZNDvGG9SQbdgVd3sjUeyciUPC7VkTW6sHDbTJYH17qvgrpuIsSXQ9wZSI9TtMFFx2nTtvBdX6ekdRyLzj1/B0+rDQs8zubJ3ZGg/VVuB9ZXYIkBMPDPE4Si/ovDG9MszyyNafrveSPtgmJD6M53nIwJatC6V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973581; c=relaxed/simple;
	bh=HEy7mKacEP1S/fPhPucD0kya4UrRHAEo7+8IS4Ms124=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NW2pg7ehA1b1FLPxGmZ9Vxd1aT3z9Ryvyquym/cPmxCGNGtiEWMNSOPX18d9/tBHlg1WTToiJr8JI+8rTYpAFMk9nIllg5buTjs3bDdyfUXbGbsRB0KbIKNhkBr5QZiXe+YH8WxmLz0kPiQnsPz5/8BToTYH5EIho5jh6erDX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSOP1vY+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSOP1vY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779973580; x=1811509580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HEy7mKacEP1S/fPhPucD0kya4UrRHAEo7+8IS4Ms124=;
  b=aSOP1vY+f9dtn3qclLl6KcMen6NPmWowSgy1/670kSXCckysYlmZ8KJr
   9YMRpxQMgAxLXqEK5hVgr1+R807DJ9H43VAFmSgQSiIYPHJXZnFiVnugs
   7X5zOYKLmY2Av1r4F1w9mbHwcCIY5u/MYYvzbgi1hsdpqOe08BCXi2/u7
   ZVmsShYT2XtMW2TVEfJSoY+5bba3WfP8joX3NyibUsuxzW3Q72phkux9h
   TOdoqclp7B5mzVOJp691CDfIo9jJcpPnmuwv9Fp30rQJe0wWPZ/svcYgX
   hJ4I0wo9msLusqo7gp1fqWfvJe1N0OBit0SdfTEG/afyPSn9Q5r3V+/UI
   w==;
X-CSE-ConnectionGUID: iE9gmPzETlilPY2ArT4N7g==
X-CSE-MsgGUID: g0pV0JcDSgS5Hgc6d6X6jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="103488125"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="103488125"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 06:06:19 -0700
X-CSE-ConnectionGUID: R6Munf91Te+cbCb8kqLK1g==
X-CSE-MsgGUID: +/azEfm0Tl6/JkrifPf6ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266155379"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 28 May 2026 06:06:13 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSaR9-000000000Px-33nX;
	Thu, 28 May 2026 13:06:11 +0000
Date: Thu, 28 May 2026 15:06:00 +0200
From: kernel test robot <lkp@intel.com>
To: Aichun Shi <shiaichun@open-hieco.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 11/11] EDAC/amd64: Harden Hygon Family 0x18 UMC
 SMN base against bad DFID
Message-ID: <202605281516.yB5gAy7r-lkp@intel.com>
References: <20260528035246.526012-12-shiaichun@open-hieco.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528035246.526012-12-shiaichun@open-hieco.net>

Hi Aichun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ras/edac-for-next]
[also build test ERROR on linus/master v7.1-rc5 next-20260527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aichun-Shi/ras-amd-atl-Add-Hygon-DF1-Data-Fabric-system-information-helper/20260528-121009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20260528035246.526012-12-shiaichun%40open-hieco.net
patch subject: [RFC PATCH v2 11/11] EDAC/amd64: Harden Hygon Family 0x18 UMC SMN base against bad DFID
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260528/202605281516.yB5gAy7r-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281516.yB5gAy7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281516.yB5gAy7r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ras/amd/atl/access.c:13:
>> drivers/ras/amd/atl/internal.h:22:10: fatal error: asm/hygon/node.h: No such file or directory
      22 | #include <asm/hygon/node.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from drivers/ras/amd/atl/hygon/system.c:10:
>> drivers/ras/amd/atl/hygon/../internal.h:22:10: fatal error: asm/hygon/node.h: No such file or directory
      22 | #include <asm/hygon/node.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +22 drivers/ras/amd/atl/internal.h

    19	
    20	#include <asm/amd/nb.h>
    21	#include <asm/amd/node.h>
  > 22	#include <asm/hygon/node.h>
    23	#include <linux/processor.h>
    24	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
