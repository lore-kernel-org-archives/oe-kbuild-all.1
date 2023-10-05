Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AC8EA6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 01:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+adsnTR"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696468382; x=1728004382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VVynd+E2oXjDW4eXcmQeX+pxzwLJmpuXmxCEdtwoB5c=;
  b=f+adsnTRh16njiWNhgNlqQ92gE7tEhkHqTRZkOV0c73wiFtvUvz+l5nL
   K+Pk9wYqRB9jTn0hvKEAywAhNITKmML8wjQwhf9j7FaWQEEJYn2zDRH7Y
   7oylFq4s3Z6cim/1jAK59evVQPQaGvXsuHM3r+xrL8DYnC+DCFKh7/Tyq
   Bbkc/VnPt1qpLpkYPmJdPM7r2mK8kVIvwLA1L+ifor//5/s9+hTuFR4q+
   BI4jdJLCVxYsWN0QvSri50yEPje6a2doGnGn1nGAEJndVYME9d7U4e9mS
   WS6lwQ/ecQkaw0DuK5GzMpTkL5wTcKckaTkC7dXr6cDnSKdDBYJtVVEt5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="387236017"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="387236017"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 18:13:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="745231792"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="745231792"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Oct 2023 18:12:58 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoCum-000Kpc-1g;
	Thu, 05 Oct 2023 01:12:45 +0000
Date: Thu, 5 Oct 2023 09:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
	devicetree@vger.kernel.org, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Timothy Pearson <tpearson@raptorengineering.com>,
	linux-kernel@vger.kernel.org,
	Georgy Yakovlev <Georgy.Yakovlev@sony.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 3/3] mfd: sie-cronos-cpld: Add driver for SIE cronos CPLD
Message-ID: <202310050807.eDZkgFy5-lkp@intel.com>
References: <2e9763cb4fa258fe11769a4ff1544d96c536a4a2.1696285339.git.sanastasio@raptorengineering.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e9763cb4fa258fe11769a4ff1544d96c536a4a2.1696285339.git.sanastasio@raptorengineering.com>

Hi Shawn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on robh/for-next linus/master v6.6-rc4 next-20231004]
[cannot apply to lee-leds/for-leds-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Anastasio/dt-bindings-mfd-sie-cronos-cpld-Add-initial-DT-binding/20231003-073243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/2e9763cb4fa258fe11769a4ff1544d96c536a4a2.1696285339.git.sanastasio%40raptorengineering.com
patch subject: [PATCH 3/3] mfd: sie-cronos-cpld: Add driver for SIE cronos CPLD
config: i386-randconfig-063-20231005 (https://download.01.org/0day-ci/archive/20231005/202310050807.eDZkgFy5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050807.eDZkgFy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050807.eDZkgFy5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/sie-cronos-cpld.c:509:34: warning: 'cronos_cpld_dt_ids' defined but not used [-Wunused-const-variable=]
     509 | static const struct of_device_id cronos_cpld_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~


vim +/cronos_cpld_dt_ids +509 drivers/mfd/sie-cronos-cpld.c

   508	
 > 509	static const struct of_device_id cronos_cpld_dt_ids[] = {
   510		{ .compatible = "sie,cronos-cpld", },
   511		{ }
   512	};
   513	MODULE_DEVICE_TABLE(of, cronos_cpld_dt_ids);
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
