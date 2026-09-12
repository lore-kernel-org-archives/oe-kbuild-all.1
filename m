Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B40C3C2B95
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789250706; cv=none; b=j4Y2w9leljfT27HSyLZ8EKVEAxYXzDYM1jIfl96f1tdLgSw92il5YVm37dpPY2c5259Ls7GPD43fhp6MHYL4Ribxmn0ACtF3YS2geObGiWE1iB+WbShHVGt0rJY+LA0QemxEdmt378efyJey7BZy4v5hwCq2rvEyqlWUrZKqv9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789250706; c=relaxed/simple;
	bh=EeXLKEs5eKSunW2tLlm1IvudiHn3wFxp6nbk676QKJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yz5FUL9yN1P/e1Dwy2/oV8u1k+XL+05enbsgcyStJ91we0Ud3NfQFNLKzvoP1MuWF2IlWSO6f5sPLq9qJ4MsZhZd/DJtXykJHo+K7529s1gBgncZpxLodi/AJO32M+8oz/F3rW3wUqQQL1mxg4Qo5NX0crV0dBnK4wBs2DcBlc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhcwFKts; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhcwFKts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789250703; x=1820786703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EeXLKEs5eKSunW2tLlm1IvudiHn3wFxp6nbk676QKJI=;
  b=nhcwFKtsPuWfNjwacesSFPX/3HMdXa8gw1dTocVUE17tC2DnFCF59nlZ
   OAouOBSZ/sDZJrBC1QP7lfXZt7bHjGROx2JE2Eev6pczlVPN4kzF7czXy
   Ymi7k0bVKwHTCMqwC1KXcTc99AcM6/gFAhkRQUQTtl4BBNNUTTlr1JDqO
   QZaxz3qKPhFMui2+EOEHCyt4m3OeOvCXQi7m+MfvnZDC2zM1VYSMDgt1d
   ri1Z7sSCrqs64JjySb+vpLIfMSMVUaXgMf24Hn/vUqtHEPP7IgkAsimbd
   nEEi1eqvR4Lj4YoQfcowoowfIYzJD4uXy173IOwKSVvsfiBdDPx+NavIn
   g==;
X-CSE-ConnectionGUID: S7rtHragT1KZ73MLaPowwQ==
X-CSE-MsgGUID: APC+00iHRSmZ1aZzFIGRgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="88614434"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="88614434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 15:05:03 -0700
X-CSE-ConnectionGUID: bSeezfSQTPOJyR6VVxzbiA==
X-CSE-MsgGUID: 7nyMAXStRvaYeECFWeHhig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="277514169"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Sep 2026 15:05:00 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Vpe-000000003I7-1KSW;
	Sat, 12 Sep 2026 22:04:44 +0000
Date: Sun, 13 Sep 2026 06:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: add ruff linter exclusions
Message-ID: <202609130558.xNQAh7l2-lkp@intel.com>
References: <20260911213412.3222759-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911213412.3222759-1-kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/selftests-net-add-ruff-linter-exclusions/20260911-143412
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260911213412.3222759-1-kuba%40kernel.org
patch subject: [PATCH net-next] selftests: net: add ruff linter exclusions
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20260913/202609130558.xNQAh7l2-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130558.xNQAh7l2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130558.xNQAh7l2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/drivers/net/.ruff.toml: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/net/.ruff.toml: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
