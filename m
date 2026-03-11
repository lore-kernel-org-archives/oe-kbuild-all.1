Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151CD29A9C3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210784; cv=none; b=rAR2xTI81zKa9FJdzmRXavpsVXV5LaO2/Ur+IhTEmtgLDC54FZ3o7mgb3MEBqdPQN3Oq+SO/L3aOgKwa8L4gclu9TIK151JBG5YgAMB08dBSNswK/94xmDX1AOfZu72fDwmFQ77FVzyex9ZVJieqspmwTEWccjPGcgHBbOUngDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210784; c=relaxed/simple;
	bh=s3Qj5iooBQSNpnkECR1ekTS3gDPWMWoE+HWCqLNHRHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwx+yYCL5ylmiIQrisdOqtSvOxNxQwGXe2t9noJN9j8CAtfBj8T0S0tVy9qvKyl8FVULDLjVApVL6K2mxuqIEnt7dUVFMHlhXBSc31cmofOgGb12b8cxWOvE6TP5LpABHiG8OA5RCGTJbicdbX1iSWuOKCUnINp3Jkyu7NDQtbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDuYh8kS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDuYh8kS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773210783; x=1804746783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s3Qj5iooBQSNpnkECR1ekTS3gDPWMWoE+HWCqLNHRHo=;
  b=HDuYh8kSPP71ljXxg5vJLM/5S3VXzIwlN3SV4dYRXjB/gwWUTp0NIVy2
   sow0mYsc2YuTWaxHVt824r0Ky7a4svvnOWyN8iqeGQ4s+ZIVQPw2XFmz5
   L+AZw5Ki/FspPjk6E8We/7OHLjE/45ed25jm2mbpMuIhvxYtR3S6b5JID
   3auY1ERaboAK4vXMb/NDKq3Lf3pZ8EE1v5xtT0fVGlE0FqfsXDSXFNrYo
   RXL5XqMR5ZbwGZmcQSQpHNzDRN0SYdGTBScOaB0WZ4uQ80oAYbSUwp8eM
   wxY5CZ/MOde327egrsa+bfke7E1ynvBkqdTGC7JkL6EcAj6CLKOsqfQP5
   A==;
X-CSE-ConnectionGUID: xQXATY4XTNec7/h6DHJdmg==
X-CSE-MsgGUID: j+jvD5/kQ+WFsr6Rry31oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77876633"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="77876633"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 23:33:03 -0700
X-CSE-ConnectionGUID: u4KXvO9eTJ6rhPMlowGgQQ==
X-CSE-MsgGUID: Ey6L2F/5SZCZCLk4t19oXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220311556"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Mar 2026 23:33:00 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0D7r-000000000oN-1OqP;
	Wed, 11 Mar 2026 06:32:59 +0000
Date: Wed, 11 Mar 2026 14:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] iomap: Support buffered RWF_WRITETHROUGH via async dio
 backend
Message-ID: <202603111414.egTuxyS6-lkp@intel.com>
References: <c84ddc3f864f840d646b6aa19fd9b3e83e079c0b.1773076216.git.ojaswin@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c84ddc3f864f840d646b6aa19fd9b3e83e079c0b.1773076216.git.ojaswin@linux.ibm.com>

Hi Ojaswin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on linus/master v7.0-rc3 next-20260310]
[cannot apply to hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ojaswin-Mujoo/iomap-Support-buffered-RWF_WRITETHROUGH-via-async-dio-backend/20260310-013922
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/c84ddc3f864f840d646b6aa19fd9b3e83e079c0b.1773076216.git.ojaswin%40linux.ibm.com
patch subject: [RFC 1/3] iomap: Support buffered RWF_WRITETHROUGH via async dio backend
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260311/202603111414.egTuxyS6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111414.egTuxyS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111414.egTuxyS6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/iomap/buffered-io.c:640 function parameter 'private' not described in 'iomap_readahead'
>> Warning: fs/iomap/buffered-io.c:1186 function parameter 'offset' not described in 'iomap_writethrough_begin'
>> Warning: fs/iomap/buffered-io.c:1186 function parameter 'len' not described in 'iomap_writethrough_begin'
   Warning: fs/iomap/buffered-io.c:640 function parameter 'private' not described in 'iomap_readahead'
>> Warning: fs/iomap/buffered-io.c:1186 function parameter 'offset' not described in 'iomap_writethrough_begin'
>> Warning: fs/iomap/buffered-io.c:1186 function parameter 'len' not described in 'iomap_writethrough_begin'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
