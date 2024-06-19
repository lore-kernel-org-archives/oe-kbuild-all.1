Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C17A724
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718834339; cv=none; b=MZ5sb3+AWrgDVQaIllvuUK4YEm/pQ1DbTMxA6iDLrWz28r9BV9N5q6RAhK0oPhifUydxBUbI7elGBF3+Iqsx8sr1o1VauoVaKIjNWHM3+Iv/hvSG4dQVcrkYTuf2BMfe0Y47JmclnHvnhWulnEygsClDut0BXeZ0bSxFOVKrbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718834339; c=relaxed/simple;
	bh=pr80fyP6GM89jX6AAFmV7RKpLd7J9TLIM7ikZNtkOMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFx95U3YKGkOA9Uxvte0FkYRZdGxvoI4Z/aFeqbi7N207qptgJq5FtayzCoy/vVgd/TpoD7ZHamAwaDET9Hxcg4lGaJFGw87Yeem0EiOkxb2ISLMHz8rroRFrm8YZSKcT25brD9Gpiv5e5cdgJLXyJ+2Wvn5YcmzXcP8myRzO3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNJsqw7c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNJsqw7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718834338; x=1750370338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pr80fyP6GM89jX6AAFmV7RKpLd7J9TLIM7ikZNtkOMc=;
  b=mNJsqw7cHj950f61NlCZmf7W298KQSl0QquxwLeB4IEcgK4d6AwXRkXC
   maJBZUI7RIl/380rMboyhisvvUf60UQ2ZsbZBQdKFL1q04A72V6DP2yt1
   7BcDTkqh1cBkOurJxCYuXNOgucTUXHXtLBl15EaRu9p80hf1oAitQzcPR
   xhg3p5ynPa2iaJmwqO6jtQp9TaPYDkc8F1jFB8aBAiaw8Y50et1052Ptz
   jDjLOtrF0rpJpDcVO5vfvh5/+TH1pqNEIGWYY8G90Z6HQ8NoN9jZNsYLH
   5+FzZMqfGpY+JB/uXLZChhqqJU2IduXNMXGYGfnjwN7FBYdsuVdsNVw/2
   A==;
X-CSE-ConnectionGUID: vFyLiTTrQBe3nK+DqHsCpQ==
X-CSE-MsgGUID: gBhisjbWS02j74b6KW2EBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15623324"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15623324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 14:58:57 -0700
X-CSE-ConnectionGUID: qjWtfBVZTqq1Iy2sZ3bA+A==
X-CSE-MsgGUID: V7L3SAU/QiuKsmDTFBU4Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42147347"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jun 2024 14:58:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK3KQ-00072K-0k;
	Wed, 19 Jun 2024 21:58:54 +0000
Date: Thu, 20 Jun 2024 05:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] cxl: avoid duplicating report from MCE & device
Message-ID: <202406200558.bTK7SkRR-lkp@intel.com>
References: <20240618165310.877974-1-ruansy.fnst@fujitsu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618165310.877974-1-ruansy.fnst@fujitsu.com>

Hi Shiyang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on linus/master tip/x86/core v6.10-rc4 next-20240619]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shiyang-Ruan/cxl-avoid-duplicating-report-from-MCE-device/20240619-011058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20240618165310.877974-1-ruansy.fnst%40fujitsu.com
patch subject: [RFC PATCH] cxl: avoid duplicating report from MCE & device
config: i386-buildonly-randconfig-005-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200558.bTK7SkRR-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200558.bTK7SkRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200558.bTK7SkRR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/cxl/core/mbox.o: in function `cxl_memdev_state_create':
>> mbox.c:(.text+0x814): undefined reference to `mce_register_decode_chain'
   ld: drivers/cxl/core/mbox.o: in function `cxl_handle_mce':
   mbox.c:(.text+0x1cc5): undefined reference to `mce_usable_address'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
