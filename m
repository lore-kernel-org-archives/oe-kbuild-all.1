Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DF8748F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693492438; x=1725028438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OitcXmlCq10+z4oVjGqCPE/b6zcz3m33AgnzAAYe79c=;
  b=fC1L+Lw1iJZRZXy6LKykYstBpT1g1DVDxzpDCleE+UICNPD9gHvN100C
   msQAwgbR4jw1CohMDSKaSvpwsy+UOjBgAiIJfy0iJJR5HfMz8wnejbc80
   sEHPjwDoPfYM9h2NVAMrU4i7r45pxwuqy0i0etaEpqmtKeLcufzNQ4BSc
   2zdDGX2QK6LMHQdhCbifsthswfmq0+1IaEr/IWgqJgM3L3oZTQvHHHvlA
   sWHEIsIovMp8Jd3DNZ8NJaiNTfZhKe5uhLd3D4MjISeRftfWz1mBQ9Q+z
   JmQqP5+zs38XKOnDYoRSEnqx8ZJbjf2LT6t9x4pF4g2gKhujU427ONMJl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378696694"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="378696694"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742735229"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="742735229"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 Aug 2023 07:33:53 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbik2-0000F8-24;
	Thu, 31 Aug 2023 14:33:50 +0000
Date: Thu, 31 Aug 2023 22:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 465/24604]
 ./usr/include/linux/mxc_v4l2.h:52:2: error: unknown type name 'uint32_t'
Message-ID: <202308312245.pJTm9kUg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 75d4ee65e45f476a5feb299d02dda89fe597158f [465/24604] MLK-21876-17 mxc_v4l2: add uapi headfile for yocto build pass
config: x86_64-randconfig-r015-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312245.pJTm9kUg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312245.pJTm9kUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312245.pJTm9kUg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/mxc_v4l2.h:52:2: error: unknown type name 'uint32_t'
           uint32_t u_offset;
           ^
   ./usr/include/linux/mxc_v4l2.h:53:2: error: unknown type name 'uint32_t'
           uint32_t v_offset;
           ^
>> ./usr/include/linux/mxc_v4l2.h:57:2: error: unknown type name '__u32'
           __u32                   type;   /* enum v4l2_buf_type */
           ^
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
