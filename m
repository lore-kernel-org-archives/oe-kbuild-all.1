Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809EA375F9A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534379; cv=none; b=Ov/O2uaGwyCV++pN7aaXQMLqPcQ/LVRXRg9ZSsG8sUr9/3rIQun34UBoRXLvjwQDuExuUwiOc3XXkI6Q0Dl8u4BR9p3zcySOHekZEL9pYdJPY/XCWUdnyD5MG9nHVNYj7xCAiwZ5p4056VFgqFmhh2MBwvgIlAJ46bIrzhWWXbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534379; c=relaxed/simple;
	bh=Ase9yzhgURxLh2inH9YOkEhoVRuNbYu6x85jbm/4++g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcOi25jSdJfm0IhTvDv+Q8KiSPLqtnK0leUYcC3s71LvaNelZBdgCG2nRC5Fhs5PBQW3bCenSkWmMWsUCJfN8jjtAqE97X1nfbUxOWShznTbHnmgsI71lg/+At4pMYLAPQqarL4zOtrDX4b+DSiS4wq3f8RCt4p6a+mLJAVPjBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msTvqSDl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msTvqSDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534378; x=1807070378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ase9yzhgURxLh2inH9YOkEhoVRuNbYu6x85jbm/4++g=;
  b=msTvqSDlTMtdcdojQrI748NY/AHjllLeX5T9Bn2O26AcuVvbWKhhJOM6
   3IT6TQPu4SjxqN1wqNE77aw9+RmUhRohvcq96UwP82SPA4Y+bB1RxB7pf
   b9+FYyVtErqVWsm09mw8VhaDCPZ+u8JqTMBLxyvWBJNjWd8NNLDirn6/H
   zldn2cHG/6XqPBqa3PyUqbJsU0/YpiRJhc4vqZy2q6NXZAlquNQ/GNsyo
   76Bfpk7tdnFGGEQQOTsS/WdCVR7L+x28FKYY2rDXTKZil4WX8JZZcsrF8
   4bu69tAjgxKkuM1iYgnP2Y5PzMzAurPPI/jOnhNPzH0C1YMujnAMvt5Fw
   A==;
X-CSE-ConnectionGUID: nS+P/oilQvasuk1+UYQZIA==
X-CSE-MsgGUID: OWXcPhQBQ6yMtWREoHyuaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76369617"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76369617"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:59:38 -0700
X-CSE-ConnectionGUID: knZuKt7BRxueIkL6XT/p5Q==
X-CSE-MsgGUID: joojJ0QZQNejMY+mAtLN1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232091432"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 20:59:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xbB-0000000006h-1ANo;
	Tue, 07 Apr 2026 03:59:33 +0000
Date: Tue, 7 Apr 2026 11:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-hardening@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kees@kernel.org, tony.luck@intel.com, kernel-dev@igalia.com,
	kernel@gpiccoli.net, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] pstore/ftrace: Factor KASLR offset in the core kernel
 instruction addresses
Message-ID: <202604051301.skV8JLnH-lkp@intel.com>
References: <20260313201010.1622406-3-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313201010.1622406-3-gpiccoli@igalia.com>

Hi Guilherme,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/pstore]
[also build test ERROR on kees/for-next/kspp linus/master v7.0-rc6 next-20260403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guilherme-G-Piccoli/pstore-ftrace-Factor-KASLR-offset-in-the-core-kernel-instruction-addresses/20260315-152241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20260313201010.1622406-3-gpiccoli%40igalia.com
patch subject: [PATCH] pstore/ftrace: Factor KASLR offset in the core kernel instruction addresses
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260405/202604051301.skV8JLnH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051301.skV8JLnH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051301.skV8JLnH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "core_kernel_text" [fs/pstore/pstore.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
