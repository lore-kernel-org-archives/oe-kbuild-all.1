Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18B71078E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 13:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692191729; x=1723727729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rh4NbQ086pnM+N9WETF/GdxVXfv3j0QnzSSmVMyPXnc=;
  b=UBsx/N+aFlK+B0aST/L5gPHt3pwaOVoafh9mhgmzp85SnJd2s1kxj9xv
   GKsLckvCaxSeGfwy5Puy/Ve8MMf6fch1B1hwHfsFnj3BkWyP5MfSu5ANp
   WKzxtDhAy9wAhz6cSJDDFhg3WGj7KV1Vq8nnbgDw1q5fdyex7F4MPT5Lz
   6hO92JOcJgWFV4l09ZJXXX0NgeF96Hn1C3h4lXaWOMxqeMvcLTuDZd2Ur
   wYdOmbhuDJO4QR+ek7BLnYTZn2X2SwLv838GxluyNQXcX/j6ad0ivQILF
   8u5UbYlqH4qlBPubbEQ7se+fo0H8whpp6VB0Izk4mNKxfGiGtn1Gculx7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352854156"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="352854156"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 06:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824235145"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="824235145"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2023 06:15:22 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWGMo-0000Jx-2q;
	Wed, 16 Aug 2023 13:15:19 +0000
Date: Wed, 16 Aug 2023 21:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 08/20] ARC: boot log: eliminate struct cpuinfo_arc #4:
 boot log per ISA
Message-ID: <202308162101.Ve5jBg80-lkp@intel.com>
References: <20230815004813.555115-9-vgupta@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815004813.555115-9-vgupta@kernel.org>

Hi Vineet,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vgupta-arc/for-curr]
[also build test WARNING on linus/master v6.5-rc6]
[cannot apply to vgupta-arc/for-next next-20230816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vineet-Gupta/ARC-uaccess-remove-arc-specific-out-of-line-handles-for-Os/20230815-085308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-curr
patch link:    https://lore.kernel.org/r/20230815004813.555115-9-vgupta%40kernel.org
patch subject: [PATCH 08/20] ARC: boot log: eliminate struct cpuinfo_arc #4: boot log per ISA
config: arc-nsimosci_hs_smp_defconfig (https://download.01.org/0day-ci/archive/20230816/202308162101.Ve5jBg80-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308162101.Ve5jBg80-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308162101.Ve5jBg80-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arc/kernel/setup.c:299:17-23: ERROR: application of sizeof to pointer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
