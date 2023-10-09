Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530311773C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 10:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHTxPFhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696846327; x=1728382327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XJBZ9sLOFzMrKIuXBeLhsj/aUmvmh7yFY9GQdinS1QA=;
  b=jHTxPFhqV0YoQ4ukLNIj3BUs6REuvWTI4lgs6/k20d7D/cVVwhe01YWX
   FpI26YxcH/H/hsCjk/LMUUSwmdan2IhSqDQkl7qxdQ8NIg5aSoQY1MDJC
   VYdGmXdEJbqFuYm1NN1Kd0EkS2u7SvFsYpg4AEGOxXU78/ePUejh2pHx/
   1idAhKst/IssMjp9gFqZ9MASsfaX4Vnv7u2C8pYXPK4yeiI6+zhJVy46p
   2MkyL4BA2/8HR7wW+9Ks6NalxHScb2FBjtfU5BgV4JTVhRbBOZiY5gRgk
   9Ycx+FLhUz68BCLReU2RCu0IW/+c6YVra/3P0tAFDOJ82AV+gAsxffB3p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="381374792"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="381374792"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 03:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="782438743"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="782438743"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Oct 2023 03:12:04 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpnF4-00006j-1I;
	Mon, 09 Oct 2023 10:12:02 +0000
Date: Mon, 9 Oct 2023 18:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gray <bgray@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/6] powerpc/dexcr: Add sysctl entry for SBHE system
 override
Message-ID: <202310091822.fqpdBsCX-lkp@intel.com>
References: <20231009055406.142940-6-bgray@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009055406.142940-6-bgray@linux.ibm.com>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.6-rc5 next-20231009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gray/powerpc-dexcr-Make-all-aspects-CPU-features/20231009-140047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231009055406.142940-6-bgray%40linux.ibm.com
patch subject: [RFC PATCH 5/6] powerpc/dexcr: Add sysctl entry for SBHE system override
config: powerpc64-randconfig-001-20231009 (https://download.01.org/0day-ci/archive/20231009/202310091822.fqpdBsCX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310091822.fqpdBsCX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310091822.fqpdBsCX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/dexcr.c:65:13: warning: 'update_dexcr_on_cpu' defined but not used [-Wunused-function]
      65 | static void update_dexcr_on_cpu(void *_info)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/update_dexcr_on_cpu +65 arch/powerpc/kernel/dexcr.c

    64	
  > 65	static void update_dexcr_on_cpu(void *_info)
    66	{
    67		/* ensure the spec_branch_hint_enable write propagated to this CPU */
    68		smp_mb();
    69	
    70		mtspr(SPRN_DEXCR, get_thread_dexcr(&current->thread));
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
