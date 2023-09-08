Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B203C1FB7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 22:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694213078; x=1725749078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RfFfouDR9DIFIbpviqe8GZ7l2dPoFwBdhBuUV1D6kUY=;
  b=ELjolgQs7PsCBa0AKg/K2sKFIPb2DNRLF199/6JWI8nnNIyq5rtKn4P5
   24vd7uZd9j6055Zy5szky1aFnZ7cQXtnHtcC2G4GVC3SK656Bw8nWjUo4
   A1IdBjKYNnTBnvOecOOIfO2usPaWxl6L9XgxaWcGxxrEqKqD7YmcOjRvT
   QXkiv/H93iTvbtY0heBfGDSqxkfcEPx92zkttOPruKFzRHsyqjbREyN/9
   w/8eejf/odtFp4UzBYe7D/NDplVLu+1n7Z7pXn/NrW0YMUkGWKqXN45yY
   K7NMFdip0dwZ7IG3spIaE1CHuXcjQ7k8eQ6bLo6xfGVI28A/K8I1am4S8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375137687"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="375137687"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 15:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989425059"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="989425059"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2023 15:44:33 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qekDH-0002gh-2D;
	Fri, 08 Sep 2023 22:44:31 +0000
Date: Sat, 9 Sep 2023 06:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-ia64@vger.kernel.org
Subject: [aegl:resctrl2_v65 4/4] fs/resctrl2/arch/x86/amd_mbec.c:189:32:
 warning: 'bmec_feature' defined but not used
Message-ID: <202309090610.Z43gD7TB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_v65
head:   13c888afbee9f7da0a4a969617dea9889da9d711
commit: 13c888afbee9f7da0a4a969617dea9889da9d711 [4/4] resctrl2: AMD Bandwidth Monitoring Event Configuration
config: i386-randconfig-051-20230909 (https://download.01.org/0day-ci/archive/20230909/202309090610.Z43gD7TB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090610.Z43gD7TB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090610.Z43gD7TB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl2/arch/x86/amd_mbec.c:189:32: warning: 'bmec_feature' defined but not used [-Wunused-const-variable=]
     189 | static const struct x86_cpu_id bmec_feature[] = {
         |                                ^~~~~~~~~~~~


vim +/bmec_feature +189 fs/resctrl2/arch/x86/amd_mbec.c

   188	
 > 189	static const struct x86_cpu_id bmec_feature[] = {
   190		X86_MATCH_FEATURE(X86_FEATURE_BMEC, 0),
   191		{ }
   192	};
   193	MODULE_DEVICE_TABLE(x86cpu, bmec_feature);
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
