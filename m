Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02478C89
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 18:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726339278; cv=none; b=GVhAotlrYV2VvJOWxn+oCvEsO4sFXeORI7ujwpwJpY7qFrPCrTqR2cx0E/K9n9Cd4lmIwwsr/heQMXKYzqzqZKvfBFBL4tiGI+bHJaoKoNfSsfbdBr+L+1CWnLdVmfnCvpBQq+nBtlQsHMqoHN8h+PZIOjbTI9+PIFKpJiGWegk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726339278; c=relaxed/simple;
	bh=4rW6FC/yqteP/iHFXRosAYOXibGAHdXVHLwwvchyTvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzQOu+JYnqNHXavRuCS8jwwWeImt54H0MxzNMajIzFqYilZIOWTZT16su+kk3CxHP9OYWxmbfywxO5tA5q3MrGhP+eVQB+jcCTdsysgNd1dJLXmWfglqcfka4/CUubcQnVBJT+cYsmOHfhGyYfIgEcNohKdeLylxN9Qkt/fYuN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I95jAyg+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I95jAyg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726339277; x=1757875277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4rW6FC/yqteP/iHFXRosAYOXibGAHdXVHLwwvchyTvU=;
  b=I95jAyg+XBmAVsIQhQeZN/wsyDfemj/iH2I3gw4Bd0bB5IyefydALcQq
   gDjqS2VY3mW4D+JKjkDy5MXulT6GkDCAz/O4uu8ZxlwEXXbdz84iMvT+F
   ioAEzHsuUnsTolbR+M73PbMQsBNsp2CYPrI9yRgmj+TwoCHZweyhO4JsT
   oA0OWhgEj5BbSv9A0jM7ZCfXyD8WFoENZErcgs9RoCLrzC5Rg4GnzEzT8
   Tlp9JsRDjcpTmHV/6efGZibBq9ipoVfttPJngovxbUqdSMt6t+Ua9EC7C
   uG71HUsxTeogopyqc0TKBzpMWaQeQ+nFQeM+AVyQzHBgPnH6hI6slLL2r
   w==;
X-CSE-ConnectionGUID: 9QP6/ED5Q6Cyc5iH3uexkw==
X-CSE-MsgGUID: cVvDWFPjRaifzJK98mza0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="28972395"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="28972395"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 11:41:16 -0700
X-CSE-ConnectionGUID: YeAmaiGvQPe/EgbhiL3GFg==
X-CSE-MsgGUID: WpNy6/5mSv2NId8Ozn07EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="69228828"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Sep 2024 11:41:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spXho-00084M-2F;
	Sat, 14 Sep 2024 18:41:12 +0000
Date: Sun, 15 Sep 2024 02:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/5] ext4: add aligned allocation hint in mballoc
Message-ID: <202409150217.h8hcxyMF-lkp@intel.com>
References: <3a17d8d55c88799a3af9a7d337f183863912e28e.1726034272.git.ojaswin@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a17d8d55c88799a3af9a7d337f183863912e28e.1726034272.git.ojaswin@linux.ibm.com>

Hi Ojaswin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ojaswin-Mujoo/ext4-add-aligned-allocation-hint-in-mballoc/20240911-170427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/3a17d8d55c88799a3af9a7d337f183863912e28e.1726034272.git.ojaswin%40linux.ibm.com
patch subject: [RFC 1/5] ext4: add aligned allocation hint in mballoc
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240915/202409150217.h8hcxyMF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150217.h8hcxyMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150217.h8hcxyMF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "__umoddi3" [fs/ext4/ext4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
