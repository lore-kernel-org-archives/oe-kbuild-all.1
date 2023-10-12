Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E5E28EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 05:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITUqwmGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697089766; x=1728625766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+UnJ52a5L6/XwETHQQED9zGF8bhbfqO5DxKfsQ7jr78=;
  b=ITUqwmGgg4w37eBvloglAKDkdFV4Sv/dlWZHybiD+D1RBri8tUMFsg20
   bKXA3CfIL/bgFxhxTSWjumzz/k6GXfNHHr8X86BeB1a7ILHVf6Dj6p6c3
   sDWe5S2wKsUqk18ZGd4e80vU+QSzFBNH2zLI7IHDnvkQ77IwnIhw+cakG
   LKo9g7jwZXl6HmDMgyVKKAl0xep0LBim6oOeGPb2eaYw1DSeoYQSWCBHL
   HKl6iVRDzKHdE9cn5OG5tDYNhsw6cIGzgHvyn0d0DG+w1ZjfOTbaGgI+Y
   giujXZhb/t8T4PzqVqD9MkO1oINRMHJ0RAJ2qkm/CaUYUQMs4+oob833y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364205882"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="364205882"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 22:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870430727"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="870430727"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 22:49:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqoZT-0003Es-0c;
	Thu, 12 Oct 2023 05:49:19 +0000
Date: Thu, 12 Oct 2023 13:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com, rajvi.jingar@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3 03/16] platform/x86/intel/vsec: Use cleanup.h
Message-ID: <202310121333.TE7R7kSs-lkp@intel.com>
References: <20231012023840.3845703-4-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012023840.3845703-4-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on acce85a7dd28eac3858d44230f4c65985d0f271c]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Move-structures-to-header/20231012-104217
base:   acce85a7dd28eac3858d44230f4c65985d0f271c
patch link:    https://lore.kernel.org/r/20231012023840.3845703-4-david.e.box%40linux.intel.com
patch subject: [PATCH V3 03/16] platform/x86/intel/vsec: Use cleanup.h
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121333.TE7R7kSs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121333.TE7R7kSs-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#31: FILE: drivers/platform/x86/intel/vsec.c:159:
+	struct intel_vsec_device __free(kfree) *intel_vsec_dev = NULL;
 	                                       ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
