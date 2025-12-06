Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DA118DB1F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 05:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764999046; cv=none; b=dsQNSpJiwpwXeS8Kwz4Z4EVITkXxQqa84hSPi/hnBMxkRSoybpzbNeaxeFfN3HlTnJWL8PP5cTUztABhfY+Jf7tYjy8lXABV8eH30FgwQ8glrc7P/Y+FYUjBsrZ4+cB/buHwCPRHMJkZFGzTh9OxclbbLvEPDcO7njLdJ1FYsm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764999046; c=relaxed/simple;
	bh=lRJ2bi0OZ3a1NFRQAl+mYzWHwAYaRizFgFjHvS49zp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ7yXTHiATV0Rpww1kuqA11HoAalSYBAM0EgDJR0o1TdWJKloG0rhdUFbpOaSqUlFkcHICwidPmOGGvCAmnU0c8LHX1bTG4YZ09Gf1UlDCVVjDeMSrBEJ/PBelC7J5A2HcWCO1zJxYpyOudKFr7Bn2madOkFaaDPYW9nmep6/qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crFEhHfc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crFEhHfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764999045; x=1796535045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lRJ2bi0OZ3a1NFRQAl+mYzWHwAYaRizFgFjHvS49zp0=;
  b=crFEhHfcxqU9R/Rbgx/MWyELTVe17ndcWVLFTTbHBgkTURMjV5xWlCJx
   bL2p6Ithf8mAFE7Rmh6vIrkT856aIPGVaxhHzeBnm160s5+JnGdq9+1T/
   ZCModYa6A8JMQgYid7VYYMPxXipeVUiRjOtK2tYiZAoGAA8uqUjcQJ/35
   IHT5Lo39vIjps/MEj1dc+LjZZ8fd4NlQN/nLKvtfBIDDHS9KwJC5reDas
   SKL1cBbQK4C6cCbU7OurXeYdYrcUctBBqS4JzaSW5ZJZWQHujBMAR/4m2
   6VFB7wLn8vI/sh9XvlOzX8ckOMVm7GBk7uDpRcwmdiz6W+KUFnc6OoyTh
   w==;
X-CSE-ConnectionGUID: lqNxbssPR8m9Sl/BltJSuw==
X-CSE-MsgGUID: T2fPUOJVQK2gQLcSxcQPFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66965228"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66965228"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 21:30:45 -0800
X-CSE-ConnectionGUID: +l0rSMMFQK+CUtj89KtVRg==
X-CSE-MsgGUID: wR4GIIU8Ru+EH0RUhMj+EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195538003"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Dec 2025 21:30:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRksP-00000000FtJ-3bbE;
	Sat, 06 Dec 2025 05:30:37 +0000
Date: Sat, 6 Dec 2025 13:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>, mahesh@linux.ibm.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu, gregkh@linuxfoundation.org,
	oohall@gmail.com, npiggin@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, tyreld@linux.ibm.com,
	vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com,
	sourabhjain@linux.ibm.com
Subject: Re: [PATCH 3/4] powerpc/pseries: Add RTAS error injection validation
 helpers
Message-ID: <202512061324.kG0T41Tg-lkp@intel.com>
References: <20251205094510.4671-4-nnmlinux@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205094510.4671-4-nnmlinux@linux.ibm.com>

Hi Narayana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.18 next-20251205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Narayana-Murty-N/powerpc-rtas-Handle-special-return-format-for-RTAS_FN_IBM_OPEN_ERRINJCT/20251205-214855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251205094510.4671-4-nnmlinux%40linux.ibm.com
patch subject: [PATCH 3/4] powerpc/pseries: Add RTAS error injection validation helpers
config: powerpc64-randconfig-001-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061324.kG0T41Tg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061324.kG0T41Tg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061324.kG0T41Tg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/powerpc/platforms/pseries/eeh_pseries.c:906 function parameter '__maybe_unused' not described in 'validate_corrupted_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
