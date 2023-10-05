Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E8262A4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnKqIjTz"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696514006; x=1728050006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mkDu/moWPGX/+w3l75/qEs455tu2uW/RCbhSnpd5sRs=;
  b=hnKqIjTzOdYXabkx+gqtegWKbOYvsWRg2q5e5E58sJoL+K9EjW40RWll
   G/GXVlUlU0HG7bDIuAUWfGhBdVIHGAfILEBoUcRZEbtwlSeUbxEn9fm/f
   /xaYDiUhlOYH2WP/6chE3rRI2AD69u7zR4wRyQF4jtwAUxYi59XGGtlB4
   OAoqhhMU4P+0QvgF4mL7/hmB1bpxTve7JrxAyeDYgEU2KlTmZhHazAlv5
   GTkGHaCMZgUqg9FVb+8LBihYwtfl0R7ULCzh8vuUuvcPeVcwWS1IQjF8I
   fHZMtr27kXmN1CmL+rWBISwBr/ncXfBFrDyW5pOWCeT6dFtyLfN8hz42d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="380780442"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="380780442"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755466692"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="755466692"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Oct 2023 06:53:22 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoOn2-000LTY-07;
	Thu, 05 Oct 2023 13:53:20 +0000
Date: Thu, 5 Oct 2023 21:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/3] x86/boot/e820: Expose kexec range update,
 remove and table update functions
Message-ID: <202310052150.9vrauAwJ-lkp@intel.com>
References: <169645819587.11424.5389114333710932782.stgit@skinsburskii.>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169645819587.11424.5389114333710932782.stgit@skinsburskii.>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master tip/auto-latest v6.6-rc4 next-20231005]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/x86-boot-e820-Expose-kexec-range-update-remove-and-table-update-functions/20231005-062443
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/169645819587.11424.5389114333710932782.stgit%40skinsburskii.
patch subject: [RFC PATCH v3 1/3] x86/boot/e820: Expose kexec range update, remove and table update functions
config: i386-randconfig-061-20231005 (https://download.01.org/0day-ci/archive/20231005/202310052150.9vrauAwJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310052150.9vrauAwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310052150.9vrauAwJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/e820.c:540:12: sparse: sparse: symbol '__e820__range_remove' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
