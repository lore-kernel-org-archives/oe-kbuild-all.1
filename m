Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868C6849C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246244; cv=none; b=XpQocGYUL7iAtnQUVvMFdmbYhjnoobsEaIj1xXUohggJKsB9zP7Xrueoe7OYloXdzZ/gkran1kPNav1lrlGhVbU+VYFYbgjEJlcPo7xIqx8H6c48ScLnVlfnun90G5tyNVzW096X+dnrUjfU30LoIy3BsO+3PqEalELYdVCjDNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246244; c=relaxed/simple;
	bh=M8k3WILHwIXAJAjzZ6OhaWuEZA6Sbtkoe0mNMRH6/U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDuNQhyFO5xcS8ND4jnho+HYIi6+LyZIDsvnLH+VCTvC9KJYUuNacw8Ojw6OOFF2Z8xfSJ4+tU0Qhjos3OOH8D5OglTZPJSDmqtw8UvHGAQYFHb4QFKRS6u62aUgYBtY0PKPpsm8SafDp0RRVgjvfRxMI97rBd+0mrJjBLXccV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaZsXzu+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaZsXzu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246242; x=1797782242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M8k3WILHwIXAJAjzZ6OhaWuEZA6Sbtkoe0mNMRH6/U4=;
  b=EaZsXzu+ZYf6hs9WO3KnxqRKNEzpcxvJ8n9cz0LtX6v7CyvyuPAUstse
   keQAM+MmZt4qcZHyIEclDUcjSq6Warvj11VQz/hvywMdgT41rNQ4ul6RV
   k6FTsHX12GNJBs9w9/+MctKLzKH39qGC1hnbjIZ4UxXTQpcnahmiqf5Mo
   KqDa1MT7anKXCwyaQJMtR8ikV6wzD5otP+S8KHSQizzITWgu7JADqv2OY
   elSJeag7h3048DFMejfgglV2wLjyvd79oa0qzM6MIxtjNcK3m+xalpmwK
   JkkzA9VO8TpDBjnuR/WRawUJ6GDPF9w/TZ3hV7kNiOWcUwJ1+AbRK78+i
   A==;
X-CSE-ConnectionGUID: AbHq9xTJSEepVvdk2vefJg==
X-CSE-MsgGUID: Bse6PhrZQti0A2qym/L7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70748088"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70748088"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:57:20 -0800
X-CSE-ConnectionGUID: j20DfxI7Rz+f3uLOGipOFw==
X-CSE-MsgGUID: RVtQQip2SomxC4CrXsKuiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199642885"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 07:57:20 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzKX-000000004nn-3KCX;
	Sat, 20 Dec 2025 15:57:17 +0000
Date: Sat, 20 Dec 2025 23:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/3] soc cache: L3 cache driver for HiSilicon SoC
Message-ID: <202512202328.j12YpAxc-lkp@intel.com>
References: <20251217102357.1730573-2-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217102357.1730573-2-wangyushan12@huawei.com>

Hi Yushan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc1 next-20251219]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-L3-cache-driver-for-HiSilicon-SoC/20251217-203916
base:   linus/master
patch link:    https://lore.kernel.org/r/20251217102357.1730573-2-wangyushan12%40huawei.com
patch subject: [PATCH RFC v2 1/3] soc cache: L3 cache driver for HiSilicon SoC
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202328.j12YpAxc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202328.j12YpAxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202328.j12YpAxc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/hisilicon/hisi_soc_l3c.c:20:10: fatal error: asm/cputype.h: No such file or directory
      20 | #include <asm/cputype.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/soc/hisilicon/hisi_soc_l3c.c

    19	
  > 20	#include <asm/cputype.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
