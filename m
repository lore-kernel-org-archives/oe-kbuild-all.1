Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEC63DDB10
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913885; cv=none; b=hsGVmEIrTtTAyBEJgbolDruW7oXauYeMmmLMcO89iaNVfg/gFil2+a6rIAbLX6cQaj9jkVaQJajKpBPpDy4wVa3Wtk8jmdgy4KdLwcWp79zLnYrFZmXOsHiUa7bX/KL4Pg5r7pV+xjAUGcxWz9MEFhd3dzQduK5dX89ZSpvQbAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913885; c=relaxed/simple;
	bh=qiDuQTjJJBlEn0w/6Xb2BH/GwwY4HfLWFmJRnAZfzCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3heCIqMA1iPWpmUNU4af7mlw5RMF/lFpEXTsxBCZCsn17OuGn0OVx/2hZSaQwwzZm+Jax6LvRTpJ5ltF0Kiq55EkC9nej61a/HN24I7mihKZlT7EkoUCSqjTntwClMn5ipCds4c73Gu8UL2vw2egmIRustzK99vLxnt9PDJ2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGYrsg6u; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGYrsg6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785913884; x=1817449884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qiDuQTjJJBlEn0w/6Xb2BH/GwwY4HfLWFmJRnAZfzCw=;
  b=kGYrsg6ugdUFlCTcPDIk4cOIHu02KtJ3JCrGg6Stz7YCtVbp809A0N1S
   PDmqTJRUbI+M94719AWXd+LeZU/egEj8nLvKHDTqaKg1l5NM1tJ/RjACh
   OhPGYJ1GWzT1lbv22dQbR8rDA3Lc8LzlxoSqr//B4Gl/GzXt8KURaNqvx
   Y/pTPPDDGpWWFWyO+drPcdU+4nZhuxI9eOC7A7u8DxRse67WV1v5uA5In
   8XWC8prCnEzXRiYUsxKkwsGlBJvFrtSdcsO7bgJ2O8BZAL1JPbLtdj8w+
   QHfCSVgB2pmSGzMSe+zmLmsLRsJwC0lxcq2nQcqRhjGJo8JbMu4FMoeZn
   g==;
X-CSE-ConnectionGUID: GacAAQhzRpSghh5JPwCtQQ==
X-CSE-MsgGUID: g7C04VNcSqeghV69notSEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="89003151"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="89003151"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 00:11:23 -0700
X-CSE-ConnectionGUID: sRdq7Dp0TCqY8GcZKonBvw==
X-CSE-MsgGUID: r/CmNt4GTnSYN/ZJH39f4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="255458693"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Aug 2026 00:11:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrVmY-00000000Bon-3mCX;
	Wed, 05 Aug 2026 07:11:18 +0000
Date: Wed, 5 Aug 2026 15:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jiangshan Yi <yijiangshan@kylinos.cn>, kees@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	13667453960@163.com, Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: Re: [PATCH] lkdtm/core: fix resource leaks on module init error path
Message-ID: <202608051446.cKZTkVXV-lkp@intel.com>
References: <20260701151438.3772375-1-yijiangshan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701151438.3772375-1-yijiangshan@kylinos.cn>

Hi Jiangshan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v7.2-rc6 next-20260804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiangshan-Yi/lkdtm-core-fix-resource-leaks-on-module-init-error-path/20260804-225548
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260701151438.3772375-1-yijiangshan%40kylinos.cn
patch subject: [PATCH] lkdtm/core: fix resource leaks on module init error path
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260805/202608051446.cKZTkVXV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051446.cKZTkVXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051446.cKZTkVXV-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
>> WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x1ec (section: .init.text) -> lkdtm_heap_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x1f0 (section: .init.text) -> lkdtm_heap_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x1fc (section: .init.text) -> lkdtm_usercopy_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_module_init+0x200 (section: .init.text) -> lkdtm_usercopy_exit (section: .exit.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
