Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3006238F97
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 17:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/PLCqH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696528658; x=1728064658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HoO4PJ5IPDARcTkIkgFnhCks20ntXGOqz45QA7UBmbE=;
  b=k/PLCqH8qL+vIPddkbR3xQx+MKg4R8oGSbuJkuexosXsMSjGk8fvjwby
   oYjGppuoEVjx3DGFxDTqWPN8/s7NFS/AgbLwR/gN5L8SYSskgD1w0sWxg
   DNRDNoKYMROMasiSJ6gqj8SflV4zMC6tEql4ttHFMBHCdLvHWq16UL3b4
   +sE7Tm7xFqlkI2jMWLxcB40eBoGtEigQjcTiR3TLIEv0503RSNTIdD1wq
   wkvpfFKnDMWEZwYwRVETtJincuAPZh2bBomYrwpMXr+I6+wqfbfe65hXB
   kbtmvZ7JkdXixc40qzRe25iHHWb2O++GdGqQy32srMwSkOvnReL9V6e1k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="373923359"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="373923359"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 10:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745548109"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="745548109"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Oct 2023 10:57:34 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoSbL-000LkK-2u;
	Thu, 05 Oct 2023 17:57:31 +0000
Date: Fri, 6 Oct 2023 01:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc: oe-kbuild-all@lists.linux.dev, shr@devkernel.io,
	akpm@linux-foundation.org, david@redhat.com, hannes@cmpxchg.org,
	riel@surriel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 2/4] mm/ksm: add sysfs knobs for advisor
Message-ID: <202310060119.K002rbE5-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20231006 (https://download.01.org/0day-ci/archive/20231006/202310060119.K002rbE5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060119.K002rbE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060119.K002rbE5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/ksm.o: in function `scan_get_next_rmap_item':
>> ksm.c:(.text+0x3e45): undefined reference to `__divdi3'
>> ld: ksm.c:(.text+0x3e88): undefined reference to `__divdi3'
   ld: ksm.c:(.text+0x3ed9): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
