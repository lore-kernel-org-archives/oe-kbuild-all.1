Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9881963E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 04:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689050007; x=1720586007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ewu6VMUcTeikFWa5CFXvONYk/FtXbAlUf+kOjZwvfOY=;
  b=aWTFE8F3bQYUN7/ppmdzsAkJozi+meuc+qGMMK6xPZsr2gwbB0zU5AJe
   UMg3E1LEcQ2VWFr1Xllx5a6pQGKMpMWhEvJdf38iiVmEz0q03O+HCf9A8
   KCQYa6cyunE+6FLfnWyuUUck0zzhih60/3y3z79gUk8WqMpCFUth4wwLH
   GMAzuJKm89S+Ic+nq/wG6gSXQJAPcqftjlrVQP9pmOV36b/usRGpRcAQO
   hBIF2ZwIHzkxjdaNRCUG6jFNvMBt5NhoJJA2Kgj3BMv1x+RJLTDbZlsZH
   F/pZlNbEuC5hD4rJ86Q39rVnfHbq7Gsby8d+lmE3d5VY4nEjyDb8Op+J8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354380702"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="354380702"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 21:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="865627539"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="865627539"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 21:32:41 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ53I-0004Jh-36;
	Tue, 11 Jul 2023 04:32:40 +0000
Date: Tue, 11 Jul 2023 12:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>, ray.huang@amd.com,
	rafael@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Wyes Karny <wyes.karny@amd.com>, Perry Yuan <perry.yuan@amd.com>
Subject: Re: [PATCH] cpufreq: amd-pstate: Add sysfs file for base frequency
Message-ID: <202307111214.8H56UUiU-lkp@intel.com>
References: <20230629135454.177421-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629135454.177421-1-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.5-rc1 next-20230711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/cpufreq-amd-pstate-Add-sysfs-file-for-base-frequency/20230630-203900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230629135454.177421-1-mario.limonciello%40amd.com
patch subject: [PATCH] cpufreq: amd-pstate: Add sysfs file for base frequency
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111214.8H56UUiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111214.8H56UUiU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pm/amd-pstate.rst:286: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +286 Documentation/admin-guide/pm/amd-pstate.rst

   283	
   284	``base_frequency``
   285		Shows the base frequency of the CPU. Frequencies above this will be in the
 > 286	  ``boost`` range. This attribute is read-only.
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
