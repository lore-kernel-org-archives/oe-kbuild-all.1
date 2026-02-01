Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7C52DF6F6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769928089; cv=none; b=QJ4dC9zjBoBPGw4FNp7xn/b7TmjJgnJMPbaBdbMpQA6TLgB6E3gBMbKqGFdPEweIefMunbeIZM3YiTy4eSOQOgmLhjP3ljfontdbP6DjoxKuI7SsvOie81hVjRMYZr9Go6qeKab0M5QW+a0wee7AyJ4MkH8NAybGug8s+2T5qfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769928089; c=relaxed/simple;
	bh=jE7aZLduDIJS44/Hovxth2CQg3+CMRtpvfajbECym8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9HRraROXglN8SYF3iyyDXxLru8ptJwfhp+mVYLwo4EVU4Y3VKZEixt0LTSwOa9+3onS0vb+65v3uu6XyPyqqZKeAU60XD8qvL592yizWNS/w0ppyaWubcwRnb/4BykOy6EWqRgLWkrV4JoNDRNGv+IsZIvqs002mfLjXIk/aYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXNoAGXX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXNoAGXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769928088; x=1801464088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jE7aZLduDIJS44/Hovxth2CQg3+CMRtpvfajbECym8Y=;
  b=PXNoAGXXEJL1UFVn/pWsZVipo6r6rvaJxbuRWUl+G9y7nEikgzFj0zn8
   sIvytO7HfvenoWM39mvPy6dynm02Ax5+dS8yR2h5wg+RY+ZTPYFjKsEBP
   PTooGTvmDJ6IqXgOel0v2E6QU6mDPbq6xW2oEyRigaNTQWJHlwFgG2A5b
   KmNGWpNV/5zrYPEkFi5i1eo+mOW3FVPtoFWBaZ1/RlOHMXSFIT4jQkiA9
   KRx0tiH0ouqPR3YovyDl5zApyEJpskxk2kBXjiyXDRZbsKQdJGZOlZMQs
   kGUwnJfFaBW0zpc908j4yIT09WYpXCTEniaVVEactsNXXx4f19Xy2sseX
   A==;
X-CSE-ConnectionGUID: XqcNItQaTtOURh+YpasIFw==
X-CSE-MsgGUID: IhaBJJICQFOJsrPyerGPdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="74973856"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="74973856"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 22:41:27 -0800
X-CSE-ConnectionGUID: 0O6C9zUmRzCeNOrXJtDoWQ==
X-CSE-MsgGUID: jl81MTDzQCG6mbFZh06MJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209448558"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jan 2026 22:41:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmR99-000000002v7-389u;
	Sun, 01 Feb 2026 06:41:23 +0000
Date: Sun, 1 Feb 2026 07:40:35 +0100
From: kernel test robot <lkp@intel.com>
To: Youngjun Park <youngjun.park@lge.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/5] mm: swap: associate swap devices with tiers
Message-ID: <202602010759.E4H4jPzu-lkp@intel.com>
References: <20260131125454.3187546-3-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131125454.3187546-3-youngjun.park@lge.com>

Hi Youngjun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5a3704ed2dce0b54a7f038b765bb752b87ee8cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Youngjun-Park/mm-swap-introduce-swap-tier-infrastructure/20260201-005914
base:   5a3704ed2dce0b54a7f038b765bb752b87ee8cc2
patch link:    https://lore.kernel.org/r/20260131125454.3187546-3-youngjun.park%40lge.com
patch subject: [RFC PATCH v3 2/5] mm: swap: associate swap devices with tiers
reproduce: (https://download.01.org/0day-ci/archive/20260201/202602010759.E4H4jPzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010759.E4H4jPzu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/kho/abi/memfd.h
   ERROR: Cannot find file ./include/linux/migrate.h
   WARNING: No kernel-doc for file ./include/linux/migrate.h
   ERROR: Cannot find file ./include/linux/mmap_lock.h
   WARNING: No kernel-doc for file ./include/linux/mmap_lock.h
>> Documentation/mm/swap-tier.rst:19: WARNING: Title underline too short.
--
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/mm/swap-tier.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +19 Documentation/mm/swap-tier.rst

    17	
    18	Use case
  > 19	-------
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
