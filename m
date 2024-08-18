Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302F1103
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Aug 2024 01:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723945023; cv=none; b=igaDHiWziL0MryXzqhKDHaFU8zEtRRHSe/torrbdIoHHRYKXubmCe/q+8tOGN6tpzFGpEupyi8lPB/VMME9yq8DJH3eecbFS+6l6x8ppZfAD7GCjxCDlr1pRMz36yomP5D1sJv0HYjjn8O0LXNEcBbnIXS10ydoJTAcTgGkBNkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723945023; c=relaxed/simple;
	bh=pKTc9YBaShJeDIbOxekvUzBsbWwjuqG4vB3IhdsLsEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZxlJCpppYP0DN6FDR0ugB/s/0yNR6odBXkxXiouajobpLClA8UFCclyvtRcSq+5EGiowuIk9a9se37pMG0u6wmUsgdIAfmnuXdGl2kcdw6xoEjBiCqBbzZaXRfVM4U6+T0YN8J53Zx6zwtk3JHqciBKGR9nOA1E4ABghKic3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5Mu4yvI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5Mu4yvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723945021; x=1755481021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pKTc9YBaShJeDIbOxekvUzBsbWwjuqG4vB3IhdsLsEs=;
  b=I5Mu4yvI2yKuJfIphcbmlKYxSLSo9w02lAyoox1C72MPZWr21EIkC7mi
   kVb2ff8HQ6rkZyE/ydnEbXGshYldV0fXf+aWAa4i1WV53JlDg0YZaQDkx
   FEbxMuQykzkP/qX72ox5GIosgdA9BtmQIz5m1JkocK6pciLbr6QIqYzhd
   Cy3kV3AswugzJLMdz3RVsYbwJmkLSS2XWhZIicS5FN91K6ZkhZBurU/ux
   kB3bGWSiPhQkiurYHt0UONWVvALZgtPNcEYi4Q0Du0xaswBIS8UdCL2sj
   /JH27Ux/x8uhHAF9sd7YBbf0+Dy48nJ4NssWN2+JXpSS53fhV0uo34Vzu
   w==;
X-CSE-ConnectionGUID: mxoMr/v0Sx2d7UhSHjRt7Q==
X-CSE-MsgGUID: oZhJrwBoTO6mW4kR+rMqTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="21754469"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="21754469"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 18:37:00 -0700
X-CSE-ConnectionGUID: +7VW4Hd4T2mufiOu+8yBmg==
X-CSE-MsgGUID: q3lqzevdR8qCf+uhtviW3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="90793410"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Aug 2024 18:36:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfUql-0007wY-1L;
	Sun, 18 Aug 2024 01:36:55 +0000
Date: Sun, 18 Aug 2024 09:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andres Salomon <dilinger@queued.net>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Sebastian Reichel <sre@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pm@vger.kernel.org, Dell.Client.Kernel@dell.com
Subject: Re: [PATCH v3 1/2] platform/x86:dell-laptop: Add knobs to change
  battery charge settings
Message-ID: <202408180954.hBMWkKuU-lkp@intel.com>
References: <20240815192848.3489d3e1@5400>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815192848.3489d3e1@5400>

Hi Andres,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on linus/master v6.11-rc3 next-20240816]
[cannot apply to amd-pstate/linux-next amd-pstate/bleeding-edge]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andres-Salomon/platform-x86-dell-laptop-remove-duplicate-code-w-battery-function/20240816-102156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20240815192848.3489d3e1%405400
patch subject: [PATCH v3 1/2] platform/x86:dell-laptop: Add knobs to change  battery charge settings
config: x86_64-randconfig-122-20240817 (https://download.01.org/0day-ci/archive/20240818/202408180954.hBMWkKuU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180954.hBMWkKuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180954.hBMWkKuU-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
>> WARNING: modpost: drivers/platform/x86/dell/dell-laptop: section mismatch in reference: dell_init+0x637 (section: .init.text) -> dell_battery_exit (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
