Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C46F7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 00:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683161142; x=1714697142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2b4dBTpXD0CBod7F+1p6u2XQJljUIlqTb3chxe7/XTA=;
  b=n3EMH5f8Dt40pUI3KSXj3Dfod1OpYPRyH73a8YXImC7rHjY2iSe189dc
   zqyTUGf3L+TCpYxWEOylgxBF3MCwGbGyyJLT/VLYZh3R6+RoQ+9DXpBJU
   2sZm8NNN7zX9RWN5HFrbxN6tn3ycorWLjSoQ93zxN5c+blitHtOS2FgrA
   QeFiuY+Dd+Vn6p3d27L520Mud+5ukYwpwGED6nALDc1TM6TWKUQeGoWo0
   AUCRzkbbjle0Ara7zn4QhHvwwsNuRTPXfLACBioAMhTOO3Mstu5/tcUPg
   4YrCiczgiv23NnYT1n8b72tP4OOSMrCiLsh/uR1sGKPX7VkPiT6hCBpmp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376866013"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="376866013"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 17:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="871153870"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="871153870"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 May 2023 17:45:39 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puN6I-0002OU-2h;
	Thu, 04 May 2023 00:45:38 +0000
Date: Thu, 4 May 2023 08:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Sukholitko <boris.sukholitko@broadcom.com>,
	netfilter-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Ilya Lifshits <ilya.lifshits@broadcom.com>,
	Boris Sukholitko <boris.sukholitko@broadcom.com>
Subject: Re: [PATCH nf-next 15/19] netfilter: nft: add payload application
Message-ID: <202305040828.dS4A4XA6-lkp@intel.com>
References: <20230503125552.41113-16-boris.sukholitko@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503125552.41113-16-boris.sukholitko@broadcom.com>

Hi Boris,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes linus/master v6.3 next-20230428]
[cannot apply to nf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Sukholitko/selftest-netfilter-use-proc-for-pid-checking/20230503-205838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20230503125552.41113-16-boris.sukholitko%40broadcom.com
patch subject: [PATCH nf-next 15/19] netfilter: nft: add payload application
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230504/202305040828.dS4A4XA6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2dbe43b4daeda03360373d0a4f8ed72efee89a6a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Boris-Sukholitko/selftest-netfilter-use-proc-for-pid-checking/20230503-205838
        git checkout 2dbe43b4daeda03360373d0a4f8ed72efee89a6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040828.dS4A4XA6-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: net/netfilter/nft_conntrack_ext.o: in function `nf_flow_offload_apply_payload':
   nft_conntrack_ext.c:(.text+0xb4): undefined reference to `__nf_ct_ext_find'
>> powerpc-linux-ld: nft_conntrack_ext.c:(.text+0x124): undefined reference to `nft_payload_mangle'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
