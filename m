Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0566D168C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpwnWF48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699816596; x=1731352596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yMdXnICuqWYunvIt+vd/MFhd4UtPbCV2rFchuVs/bAU=;
  b=kpwnWF48gQP2EJ2vXixzTqIVzNJRxemwJ/7tdZcTooeTjNpW7JEWC+Q8
   m7gC2oF3oKzvae+zoLHHKAYL7van3gQ2kaGWYSVcVl//NTVfA1eYKybBu
   NMalApI2wNLjswgaDX57HdEK4hh03YYs3wTMXxrl5SgU+sBFydqhGelQB
   2BPjpPeVDR6y0zVwKwSgD0KRDO5us5lkkS+By2bkWlO6lk1xAOi8x/vCP
   cHN3GP5Qt2E3EvDoneazfZ/ThWp0008JHeYuUxMeMbA+b4YY3jsepeKhG
   +N3SpbMRFxu/gA6g6kb19NE3rCTDDa+Fd+h3M94x5hVxNv3EXAjCp4x4I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="369675830"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="369675830"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 11:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="881472639"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="881472639"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2023 11:16:35 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2Fwf-000BSE-14;
	Sun, 12 Nov 2023 19:16:33 +0000
Date: Mon, 13 Nov 2023 03:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 14047/30000]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:53: sparse: sparse: non-ANSI function
 declaration of function 'fsl_xcvr_get_attr_grp'
Message-ID: <202311130357.ZL7wInU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 02f2735702118a80b3beb9626de5d14de0e32d73 [14047/30000] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: i386-randconfig-062-20231021 (https://download.01.org/0day-ci/archive/20231113/202311130357.ZL7wInU4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311130357.ZL7wInU4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311130357.ZL7wInU4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:53: sparse: sparse: non-ANSI function declaration of function 'fsl_xcvr_get_attr_grp'

vim +/fsl_xcvr_get_attr_grp +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
