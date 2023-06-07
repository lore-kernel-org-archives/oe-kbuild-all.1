Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28E919BC8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 23:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686182078; x=1717718078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o0coyrEYJkX6FBDvnT+ZO3PeoSubsXx9+zPnYTYGm44=;
  b=NzZXKWm3zDVg+oTQy/y1dn5NeJG4QGwpT7SBeF7+i2MbF4mhwD6G02/v
   L+C0J6Y8b3sQTYlho+gEwZzd0wAFygKrhWClGckwyLmnKlxEV1YG9Mvha
   FTlzhzhYC2NU5B8vGZIvZV3oLDZR66zGyJ1rakENMG1S2dTzHOeXSWz4v
   Q0m+hHK7VZH+JvjV6SgC3AP2fNPO4WROYDvOze47/8BBIqLrcJkbtzL3u
   7pF7uL2mnqpg1kxGX9XkdbJTsuuIxVxyB0FJ9mGKYdKlfr7MGlswWmNqu
   SXB4tAVEv6AlhNHWt9ttmacNK3hoXTfYO9lcJT99y7JdhTW9mJIS6HzNX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337503228"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="337503228"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 16:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="774826443"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="774826443"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2023 16:54:34 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q72z3-000711-1U;
	Wed, 07 Jun 2023 23:54:33 +0000
Date: Thu, 8 Jun 2023 07:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Muchun Song <muchun.song@linux.dev>, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 15/16] powerpc/book3s64/radix: Add support for vmemmap
 optimization for radix
Message-ID: <202306080711.eEcyyPFk-lkp@intel.com>
References: <20230606045608.55127-16-aneesh.kumar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606045608.55127-16-aneesh.kumar@linux.ibm.com>

Hi Aneesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes akpm-mm/mm-everything linus/master v6.4-rc5]
[cannot apply to nvdimm/libnvdimm-for-next tip/x86/core nvdimm/dax-misc next-20230607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/powerpc-mm-book3s64-Use-pmdp_ptep-helper-instead-of-typecasting/20230606-125913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230606045608.55127-16-aneesh.kumar%40linux.ibm.com
patch subject: [PATCH 15/16] powerpc/book3s64/radix: Add support for vmemmap optimization for radix
reproduce:
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch powerpc next
        git checkout powerpc/next
        b4 shazam https://lore.kernel.org/r/20230606045608.55127-16-aneesh.kumar@linux.ibm.com
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080711.eEcyyPFk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/powerpc/vmemmap_dedup.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
