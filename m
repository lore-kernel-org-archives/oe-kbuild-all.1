Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EA018FC9F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733347968; cv=none; b=QErxW5UmMa4dYXowgRbZ/mYzqZy6uaMM2f+iTQdVSM0GtulU9L0FuUbna4Tcqn4NJms4CcH535fNTmcsRr7kf5lK39ix4XFFrWwSUA1+SlyfA1ce2E6EHTlyqsJ/yqIxn7UnXkbMSh7ysQn9gssSiHi3W3uUGzdhEgq4OISh2kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733347968; c=relaxed/simple;
	bh=f4pFtf8Fhuc3E2WBly2ebssRPhq1Cz/fY7JE9dwaYzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKQs0rAskPRV/5TEXHj0Kq5yQetyRR91DZG0xvQzAmxiGPqU0Y7mgTf6CUJ64YPK99LwA7OWizbz9dJSiiNnwIJ3fMoPCAepspmfvy8g9tAoKadTyOb719H8fCA9ye01HJZEjbmGR1JSE6JwXhko92MMDGjJyO2dXoWfb+hXSrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dc7cNp0P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dc7cNp0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733347966; x=1764883966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f4pFtf8Fhuc3E2WBly2ebssRPhq1Cz/fY7JE9dwaYzk=;
  b=dc7cNp0PQD+12lo0eqNYZhnRXwDLeTR/FiYM65GBv0slttfWqKJvYQfQ
   nh2utuclztVbVdXcl+feZgTfGwJnKdy/AdfNbqsmXgkzgsKDkAT32pkyl
   cg949RJpCeV3MW6Kqpv2+pHOCQ9hPWHrXJxKjcCGVwYlsBLaDFQSXuQuS
   Ft47F0Wj63hWRxRxR/tKXx4u+oGhffUp1RxUZa5MN2CwnfbVsFqAdidX4
   ecVW4NSI6IuozdEMvf42cC8rc+0ESPR6wOSnzWjfPS5QaCEUZm9zQABmN
   lPqwiv+Tkur9gUajxpVlG8IILiAdkVYP3cQBv7Jfu80TGuAeUfzZ3tw2v
   w==;
X-CSE-ConnectionGUID: AQkSL8KqSCWFA3GtZa4FDw==
X-CSE-MsgGUID: XMDGFSFpQj2lNdXIAVmtgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="21221044"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="21221044"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 13:32:45 -0800
X-CSE-ConnectionGUID: WF9MR7xHRaivoCb+NkdMjg==
X-CSE-MsgGUID: /IYVe9kCTUGFWs3e9ZbRuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="98859895"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2024 13:32:44 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIwzC-0003WD-09;
	Wed, 04 Dec 2024 21:32:42 +0000
Date: Thu, 5 Dec 2024 05:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 03/15] ARM: rework ARM11 CPU selection logic
Message-ID: <202412050521.vmz1hbvH-lkp@intel.com>
References: <20241204102904.1863796-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204102904.1863796-4-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next linus/master arm/for-next arm/fixes v6.13-rc1 next-20241204]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/ARM-use-CONFIG_AEABI-by-default-everywhere/20241204-185507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241204102904.1863796-4-arnd%40kernel.org
patch subject: [PATCH 03/15] ARM: rework ARM11 CPU selection logic
config: arm-kismet-CONFIG_CPU_ARM1136R0-CONFIG_SOC_IMX31-0-0 (https://download.01.org/0day-ci/archive/20241205/202412050521.vmz1hbvH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241205/202412050521.vmz1hbvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050521.vmz1hbvH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CPU_ARM1136R0 when selected by SOC_IMX31
   WARNING: unmet direct dependencies detected for CPU_ARM1136R0
     Depends on [n]: !SMP [=y]
     Selected by [y]:
     - SOC_IMX31 [=y] && ARCH_MXC [=y] && ARCH_MULTI_V6 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
