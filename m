Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066FC1DFFB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 22:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790463468; cv=none; b=WZVg8YjwaoTJ+m27kse/zawOUsSIejPZqERvnR0H8/EVY6UkEs2Kc05H4pPc6czZuU4bjQp+Bysa2HF3I6nNQZPyIwom2yJ3h+15GtJ1ddFNtcrxp/i4ZIJZ27pbyiPkr6GL/+ijiGNS20nI66RDOEQxRzS6yTWXrf3rJid50/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790463468; c=relaxed/simple;
	bh=cr7ykUY8YatnxFsIrpvVzwoh5/ukD3lqkmZYcF+v+Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prSkO4iaMWyu5XeJu+aEbT9wJ1fT8FT9kZ7PAuACbafpL9In2SLCIIfjD0aatxOP3w/irqSbGBx1ju3VAUTBKwuxbUiuJXlcwzf+AhPcHYrovjm9hsQyxHGra3ILn0Dr7pF3FualVjMHSATlDyYP6+0EyG+n9n6nuuTGIAf9/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl1nNiqG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl1nNiqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790463466; x=1821999466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cr7ykUY8YatnxFsIrpvVzwoh5/ukD3lqkmZYcF+v+Mc=;
  b=Wl1nNiqGWm4ua5MHPYHl+RB87Gf6Y+VsF2c69qLPx3LdPq0okSHGzzXv
   b3ps/gdy4EV1BffLDvw+xWW/MDq6YekfhoOGsVxvf+AM+NGjJqAdgE2xQ
   uCijU5m1IIfxDmDp9c7SzcLLiYSCZXE5WGzla6ma2A6APyvW/Wcv4EVgC
   KSh4TBHz1cl6XHhjZVnHUlcn9Eh4coc577EyUOsbiIXXFoZHSMbi8OnTX
   Brk1IpCDl5m/Yw4Xmi4lX5W145UGSjpVTvWJOskaPzv4gp7vEvsxoukAd
   0mAenp3zEfhmnhtHsJF2QSm95340i3xMyq+cxQy29YodJbQHdTeQufPAy
   A==;
X-CSE-ConnectionGUID: LlUQMZLmTuKeQDymooORSQ==
X-CSE-MsgGUID: g8gz512fROGJxKRalXcGkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="102575928"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="102575928"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 15:57:45 -0700
X-CSE-ConnectionGUID: GvvOwi0PQ4SiKJ+tyAb8gA==
X-CSE-MsgGUID: RCEyLH2BQTKRlOaefn+QGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274237738"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Sep 2026 15:57:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAbKw-00000000MFB-0xGx;
	Sat, 26 Sep 2026 22:57:42 +0000
Date: Sun, 27 Sep 2026 06:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] security: Allow dropping bounding set process-wide
Message-ID: <202609270637.Wfe1SQY8-lkp@intel.com>
References: <20260922095816.1191799-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922095816.1191799-1-ruanjinjie@huawei.com>

Hi Jinjie,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pcmoore-selinux/next]
[also build test ERROR on linus/master v7.3-rc4 next-20260925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/security-Allow-dropping-bounding-set-process-wide/20260922-175816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20260922095816.1191799-1-ruanjinjie%40huawei.com
patch subject: [RFC PATCH] security: Allow dropping bounding set process-wide
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260927/202609270637.Wfe1SQY8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270637.Wfe1SQY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270637.Wfe1SQY8-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/commoncap.c: In function 'cap_prctl_drop_mask':
>> security/commoncap.c:1399:29: error: implicit declaration of function 'mk_kernel_cap' [-Wimplicit-function-declaration]
    1399 |         kernel_cap_t mask = mk_kernel_cap((u32)low, (u32)high);
         |                             ^~~~~~~~~~~~~
>> security/commoncap.c:1399:29: error: invalid initializer


vim +/mk_kernel_cap +1399 security/commoncap.c

  1396	
  1397	static int cap_prctl_drop_mask(unsigned long low, unsigned long high)
  1398	{
> 1399		kernel_cap_t mask = mk_kernel_cap((u32)low, (u32)high);
  1400	
  1401		if (cap_isclear(mask))
  1402			return 0;
  1403	
  1404		if (!ns_capable(current_user_ns(), CAP_SETPCAP))
  1405			return -EPERM;
  1406	
  1407		return cap_bset_drop_process(mask);
  1408	}
  1409	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
