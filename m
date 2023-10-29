Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91551D51A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 20:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtTFBAGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698610810; x=1730146810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WEpfFaTtHwrYR4uCA6g4+oYzMAy+oPbDraUG/OdIZI0=;
  b=RtTFBAGeP4YUsEcm9k2OcbSs4yPb3xL9ABL1Dg45smi6igUxmzKcoMNY
   lSZHahxpI807wkkRLqLd9/gBwnd9OJdGw/VMcDm2MIWgKgNZqGQyKnsBT
   UQ3QtdVwwMnNXsyOQXn9bvBhs2PS5p6/vkPXYAb+1o1biftnCsAr3ymA9
   Sop9F6iAkiwK8hTQddDyq7sS38lovDtBa+kvhJ1dTWS+gIZeC/h2HpdFF
   ko0Ayjbr9ZJu0Q1bAx7//wBLftpb4WnIF1yYYmNj7s627sHWjj8MXPNdR
   HZTLHQlG9ZFy6y6PbCliVrLWs0y4HatokprdWhBZgvVouz9hqCiRCvIFi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="368197385"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="368197385"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 13:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="789279529"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="789279529"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Oct 2023 13:20:08 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxCGU-000CnT-0E;
	Sun, 29 Oct 2023 20:20:06 +0000
Date: Mon, 30 Oct 2023 04:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v12 4/6] powerpc/kexec: turn some static helper functions
 public
Message-ID: <202310300414.dFH9Zcho-lkp@intel.com>
References: <20231029124039.6158-5-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029124039.6158-5-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc7]
[cannot apply to powerpc/next powerpc/fixes tip/x86/core next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/crash-forward-memory_notify-arg-to-arch-crash-hotplug-handler/20231029-213858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231029124039.6158-5-sourabhjain%40linux.ibm.com
patch subject: [PATCH v12 4/6] powerpc/kexec: turn some static helper functions public
config: powerpc64-randconfig-001-20231029 (https://download.01.org/0day-ci/archive/20231030/202310300414.dFH9Zcho-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310300414.dFH9Zcho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300414.dFH9Zcho-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `add_opal_mem_range'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: arch/powerpc/kexec/core_64.o: in function `get_crash_memory_ranges':
>> core_64.c:(.text+0x1010): undefined reference to `add_mem_range'
>> powerpc64-linux-ld: core_64.c:(.text+0x1064): undefined reference to `sort_memory_ranges'
>> powerpc64-linux-ld: core_64.c:(.text+0x1128): undefined reference to `add_rtas_mem_range'
>> powerpc64-linux-ld: core_64.c:(.text+0x1140): undefined reference to `add_opal_mem_range'
>> powerpc64-linux-ld: core_64.c:(.text+0x1160): undefined reference to `add_mem_range'
   powerpc64-linux-ld: core_64.c:(.text+0x1188): undefined reference to `sort_memory_ranges'
>> powerpc64-linux-ld: core_64.c:(.text+0x11e0): undefined reference to `realloc_mem_ranges'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
