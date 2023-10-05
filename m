Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815434CE9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mErfrfBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696541837; x=1728077837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RUUpuLhJ5XKZ1tuXjOeo39ERh3dlU7kmgjoWLsjBoRs=;
  b=mErfrfBVHVKbmxh8WZZW4Zc3O3P7eQDgHPvYuSjdTrBXBJKqheByns3R
   77Qcx/+aMWFRO7iLDWDg3O0RxDOg7IK5lmJ5q9wvpMbbuRjC96TBHj2MI
   djfeao+do4sK3NpoR+Pc+vz8SaGE+0WlSWT3cIVFxzj/VcTAvYyLKX7wz
   Rpur4ag0wBlbbbPhop4D9OVDzQV4Sejg/5ie+j1VQEtEFlkhmPtHYXDOf
   5i8W3NNqawp9sWVG8+PoM+amQIuZB+WaDsB7IPvDkOST07oXtP8Nr0W87
   VsONpBkhPYmxcJOYsB0pG9BkF1XabnTDuf+S2FUoRkuxh18Kq28qLrctt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363904859"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363904859"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 14:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817776212"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="817776212"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2023 14:37:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoW1q-000LvQ-15;
	Thu, 05 Oct 2023 21:37:06 +0000
Date: Fri, 6 Oct 2023 05:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc: oe-kbuild-all@lists.linux.dev, shr@devkernel.io,
	akpm@linux-foundation.org, david@redhat.com, hannes@cmpxchg.org,
	riel@surriel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 2/4] mm/ksm: add sysfs knobs for advisor
Message-ID: <202310060504.eMl8wb3o-lkp@intel.com>
References: <20231004190249.829015-3-shr@devkernel.io>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004190249.829015-3-shr@devkernel.io>

Hi Stefan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 12d04a7bf0da67321229d2bc8b1a7074d65415a9]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Roesch/mm-ksm-add-ksm-advisor/20231005-030402
base:   12d04a7bf0da67321229d2bc8b1a7074d65415a9
patch link:    https://lore.kernel.org/r/20231004190249.829015-3-shr%40devkernel.io
patch subject: [PATCH v1 2/4] mm/ksm: add sysfs knobs for advisor
config: arm-randconfig-001-20231006 (https://download.01.org/0day-ci/archive/20231006/202310060504.eMl8wb3o-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060504.eMl8wb3o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060504.eMl8wb3o-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: mm/ksm.o: in function `run_advisor':
>> ksm.c:(.text+0x21e8): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: ksm.c:(.text+0x2290): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: ksm.c:(.text+0x22cc): undefined reference to `__aeabi_ldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
