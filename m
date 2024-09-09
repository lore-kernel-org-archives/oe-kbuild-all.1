Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F379C8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 00:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725842594; cv=none; b=ibtfxs2xy260BfuIAG97ZwxH9UcExraX6a5cptULv/BGjlGVrINnHHsyKkxW61T8CNAaR5DEf1SivMfOgA1h3Drp9wZJP1BOVe4N4jzfN4DTwfg+bUniXw6XPDz5lxXtPchTmcoFPyMAxInSEOM8Cmon54KQybeLbKDhLTsezJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725842594; c=relaxed/simple;
	bh=+tDgkCiAx1PAxhSacAU4xqomIBRl660ZTkKbTgwEb4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f6c7lcrb76X8j6FPEBvLQRIIPoOkKI+QRlzhuy2eNGWXDtwZzXScwXi8toi/rMD8r5eMsmUrM8XuikB/6PUhdr9cG7AhpA1F3RONieKKPELRr5+e2qUmEQ7AnvIx7jTRHhi8Vi97Wet0uwPV2r5BGecDT8GN0dkwppXA2omwDUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6Qoivgf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6Qoivgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725842592; x=1757378592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tDgkCiAx1PAxhSacAU4xqomIBRl660ZTkKbTgwEb4Y=;
  b=F6Qoivgf6lMjLRrh6LWQ8kxnrTlZVuTkcPOQmwvVF543jqOSihn9+WyV
   p2yeALFyF7Oh0S0/R/CB7CRxRgc55ZxpbDYCxVrxFRpyvwkkbbeFwlkBn
   lKlxrrSmuaDqX37j/YT/lAjQz0TTWFCkX10mJIYez2lgxzyjhT3gvdyXg
   9EG1QRfLcJyIDJnliY2/mQFS0HlQKRzNik+f7ErSGI1VHBMXDyAQcezFl
   s1MaZEgKo0v7+7ubw1ecpXtUpUgGJIRPPWpA/UthKEMURypEXgSjZCbTy
   oaS9aWGY6/uPjgwdv9O0BU3gLuyTwjfXUUt67aa4+aN0NtgLOwOJZ2a5q
   Q==;
X-CSE-ConnectionGUID: 1QLF1DvLSuymxqkRZbp5Og==
X-CSE-MsgGUID: KWK0+IF3Q0a5JYItMEaQ7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35868035"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="35868035"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 17:43:11 -0700
X-CSE-ConnectionGUID: eSmj2bmHQJqT9BZr4TG/2w==
X-CSE-MsgGUID: 23DmT38XSq6iPeL2ehw1oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="97291743"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 17:43:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snSUl-000E7v-2y;
	Mon, 09 Sep 2024 00:43:07 +0000
Date: Mon, 9 Sep 2024 08:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: [linux-next:master 3671/10296] ERROR: start_text address is
 c000000000000700, should be c000000000000200
Message-ID: <202409090839.Gz712lD2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: fe91cf39db0939ac8d523b5a1c31840f7cbe205c [3671/10296] rcu/tasks: Add detailed grace-period and barrier diagnostics
config: powerpc64-randconfig-003-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090839.Gz712lD2-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090839.Gz712lD2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090839.Gz712lD2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: start_text address is c000000000000700, should be c000000000000200
   ERROR: try to enable LD_HEAD_STUB_CATCH config option
   ERROR: see comments in arch/powerpc/tools/head_check.sh

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
