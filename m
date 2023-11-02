Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C463DE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/qEYrNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698911498; x=1730447498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FLcfevI/lDPIM8N2a/NoWfaSB35qL7zOu4Ts01NpuCc=;
  b=J/qEYrNy6d225XWS8YoakuSTSk6eGrAOmdUM+KMXX8Ee0i5kEjZ88bh+
   ThqIIgG5Xbtuh/e6yo2WzR2C9myLfWGVa33HMLC12T8dfOh5/bI6DoTQj
   aM1DWZqKZndndMA/h5gzAVgr5DtIfOFET+nig8zOt6WQe15nbDMf6VrH0
   oxpGEE4aUOsvydRGI/DAvURDF4t4wqUfgeG/JIs/pJ6/Q6EsmyIvOgOVt
   8iN/6XuIWBC2Oa/jz/YJuJG6PClc668jTX5LlNdmGDvwFcSL33JmTUync
   610ez7K89WuDMr5t4iwDdIx1UVn0MiEDGWMBjacW/jNtys+KUAM3yE/xx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="387534588"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="387534588"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 00:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="827026950"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="827026950"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Nov 2023 00:51:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qySUI-0001Dq-33;
	Thu, 02 Nov 2023 07:51:34 +0000
Date: Thu, 2 Nov 2023 15:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5] platform/x86: inspur-platform-profile: Add platform
 profile support
Message-ID: <202311021547.KTmJVY2O-lkp@intel.com>
References: <20231020024007.1677962-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020024007.1677962-1-aichao@kylinos.cn>

Hi Ai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6]
[cannot apply to next-20231102]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ai-Chao/platform-x86-inspur-platform-profile-Add-platform-profile-support/20231020-104121
base:   linus/master
patch link:    https://lore.kernel.org/r/20231020024007.1677962-1-aichao%40kylinos.cn
patch subject: [PATCH v5] platform/x86: inspur-platform-profile: Add platform profile support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231102/202311021547.KTmJVY2O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021547.KTmJVY2O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021547.KTmJVY2O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/inspur_platform_profile.c:27: warning: cannot understand function prototype: 'enum inspur_tmp_profile '
   drivers/platform/x86/inspur_platform_profile.c:74: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set Power Mode to EC RAM. If Power Mode value greater than 0x3,
   drivers/platform/x86/inspur_platform_profile.c:123: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get Power Mode from EC RAM, If Power Mode value greater than 0x3,


vim +27 drivers/platform/x86/inspur_platform_profile.c

    20	
    21	/**
    22	 * Power Mode:
    23	 *           0x0: Balance Mode
    24	 *           0x1: Performance Mode
    25	 *           0x2: Power Saver Mode
    26	 */
  > 27	enum inspur_tmp_profile {
    28		INSPUR_TMP_PROFILE_BALANCE	= 0,
    29		INSPUR_TMP_PROFILE_PERFORMANCE	= 1,
    30		INSPUR_TMP_PROFILE_POWERSAVE	= 2,
    31	};
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
