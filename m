Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4B97E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 00:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690762371; x=1722298371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lp12deWGU3L97PQtj9u0jC0+/FGeAGK2Q+TCQNbbrCQ=;
  b=X/A9q/xcG0tCt13m6hRwP3RnHI81GyS1N0TIZiCnrRjFvLXCU6aiW0PG
   mpG5smMO3ehRekIBgdlXzNThnwXpcAcQmiXpKg+wMFFtMsP5BEzhCPm9p
   bjkoZ4RVeYQWlCnNXOCGVCJJBwg5QPlt0/ENJCUgtWUnrp3CQrNVHgZLI
   +s9Emq2mHgi5Xy6bfu3RfUaDZScgAg+h/SQrMeot4S5kUJw7t1YRHW762
   Wg0AxgL/kgho18xJMG63XF9+fOhgoMQm1xeadRMboroacTbXmqe/Ywuue
   0crOt4cvAr1q2qZ27lKfx1zBRCIoE3+iEwMvziLu3vjJTo08wgMTy2xdd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371594950"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="371594950"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 17:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="842014098"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="842014098"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2023 17:12:47 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQGWk-0004qN-1z;
	Mon, 31 Jul 2023 00:12:46 +0000
Date: Mon, 31 Jul 2023 08:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>, linux-mm@kvack.org,
	muchun.song@linux.dev, mike.kravetz@oracle.com, rppt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	fam.zheng@bytedance.com, liangma@liangbit.com,
	simon.evans@bytedance.com, punit.agrawal@bytedance.com,
	Usama Arif <usama.arif@bytedance.com>
Subject: Re: [v2 6/6] mm: hugetlb: Skip initialization of struct pages freed
 later by HVO
Message-ID: <202307310817.Y6ZmhLsV-lkp@intel.com>
References: <20230730151606.2871391-7-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730151606.2871391-7-usama.arif@bytedance.com>

Hi Usama,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-hugetlb-Skip-prep-of-tail-pages-when-HVO-is-enabled/20230730-231750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230730151606.2871391-7-usama.arif%40bytedance.com
patch subject: [v2 6/6] mm: hugetlb: Skip initialization of struct pages freed later by HVO
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230731/202307310817.Y6ZmhLsV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310817.Y6ZmhLsV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310817.Y6ZmhLsV-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: mm/hugetlb.o: in function `__alloc_bootmem_huge_page':
   hugetlb.c:(.init.text+0x574): undefined reference to `vmemmap_optimize_enabled'
   aarch64-linux-ld: mm/hugetlb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `vmemmap_optimize_enabled' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hugetlb.c:(.init.text+0x574): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: hugetlb.c:(.init.text+0x594): undefined reference to `vmemmap_optimize_enabled'
   aarch64-linux-ld: hugetlb.c:(.init.text+0x59c): undefined reference to `vmemmap_optimize_enabled'
   aarch64-linux-ld: hugetlb.c:(.init.text+0x634): undefined reference to `vmemmap_optimize_enabled'
   aarch64-linux-ld: mm/hugetlb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `vmemmap_optimize_enabled' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hugetlb.c:(.init.text+0x634): dangerous relocation: unsupported relocation
   aarch64-linux-ld: hugetlb.c:(.init.text+0x650): undefined reference to `vmemmap_optimize_enabled'
   aarch64-linux-ld: mm/hugetlb.o:hugetlb.c:(.init.text+0x658): more undefined references to `vmemmap_optimize_enabled' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
