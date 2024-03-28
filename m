Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64192199BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711633032; cv=none; b=byttwRjqNKUZEWwJyaYvl99Nyf+4K7JNSnerBoUhXesaxU9uBP+It4TZ2GCHurRHSt/+RWrckDp9o5ouhcl/M2iWPPNu/n42uCnYZC9KTwOprSfx+H8Vf0CXspsZFr9yMCwb0t3A7PkxezEfII/md6+ox74iawK7ogqC+XzfKz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711633032; c=relaxed/simple;
	bh=gyZ583yStJYVwH3NrvC0sNgBz0CfQlqRzEkxj84JQPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mBNxdqr70xjDgpDLMMKP0rNScQdWWOfY2GiybjCd9pThNsUtL/aNBA2Sll4fRiigwy5L2MUJOpS++izM+kPDda2HOXtkILwKKnotiUBdCOmKjsVvBXBou6JykvywABr66RVTWLY0s0rB+0sSYezkNJht/tqMi2fALKRUgpy5wL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSfuAv2y; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSfuAv2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711633031; x=1743169031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gyZ583yStJYVwH3NrvC0sNgBz0CfQlqRzEkxj84JQPY=;
  b=TSfuAv2yMjTHmzHYD/ufY66L6rZNsdjOckDbwbVub8VotZLlcpaL3YXf
   Oo7b7iC7WZp9ZJoxraWLg1AN+Tj6EEAW5YIDjHzFQ7QzWFMlafyjka45c
   TTKO+inzFa6w1lx7in6LM+mRdnCK5ng7IRDAcoMs+0cC9lsq8+0LJNGsY
   O/y+Z48MTnvZo+B9Qs+rEBQ46ZO44/2BVMbdim7JBuq8227enpOG1ztjU
   Y0lWbxFKYtIJQHc/Qzcvtx6KaItnqSDcGRso/HVdx+zudwcblRos/czyG
   zN4H19W2Acf1ScXrVnYy3XqXpM4RycJ1DP/hE5Guux0DXqvG4xGxYjxvJ
   Q==;
X-CSE-ConnectionGUID: T4uLlJblTdyIyHuyHapDJg==
X-CSE-MsgGUID: kbOlas7wQFGZVEXzIBUUvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18168686"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="18168686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 06:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16643599"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2024 06:37:08 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rppwI-0002B0-1U;
	Thu, 28 Mar 2024 13:37:06 +0000
Date: Thu, 28 Mar 2024 21:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 701/7000] kismet: WARNING: unmet direct
 dependencies detected for ARM64_ERRATUM_845719 when selected by ARCH_MXC
Message-ID: <202403282112.uqH8B4BH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   704605877ce9913071214d2515a4c2b9077f5078
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [701/7000] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-kismet-CONFIG_ARM64_ERRATUM_845719-CONFIG_ARCH_MXC-0-0 (https://download.01.org/0day-ci/archive/20240328/202403282112.uqH8B4BH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240328/202403282112.uqH8B4BH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282112.uqH8B4BH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719 when selected by ARCH_MXC
   
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
     Depends on [n]: AARCH32_EL0 [=n]
     Selected by [y]:
     - ARCH_MXC [=y] && ARCH_NXP [=y] && COMPAT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
