Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D8E20E1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693586510; x=1725122510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LslN9SthGpAVhUwqtTZ/5FMvkgp7M5tS2tkSfOW73C8=;
  b=GFgSTNeGvd0qpkRNyktKy1l7YaUCZBgUYj8NJrSytdgCSNv5yMU8/yOG
   LaZwAx0whSI/YZJwtTmvBk8a5PxEumkZotfUwCpKBLDoBi0Lewohc59G9
   QJHtRvD3eJpQQsHF+4D3IyeO5a6d5JYwb1a2aHmhe+Go/sdbY+A4RcNuz
   a3HxtLZTd3n2TH+A0vKuMjakudXDN8ed6Vpifw1Mhhuxg3EyIPPuiDNp2
   zEWQLTITLic2+ePAK7X0al+yuH2IeQrWXlJx6UcMxBpVgWjqihI4NUG8b
   pUU4qme88WQpJd7HZcKVXdfoaapYfOMpF+j9iw+BkIyF8kZGZFx4buwmw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375162110"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="375162110"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 09:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="769243870"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="769243870"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Sep 2023 09:41:47 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc7DN-0001U3-1z;
	Fri, 01 Sep 2023 16:41:45 +0000
Date: Sat, 2 Sep 2023 00:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6175/24603] arceb-elf-gcc: error:
 unrecognized argument in option '-mtune=cortex-a9'
Message-ID: <202309020036.GWe8cx61-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: b83a99edcb3eb46360f4b4470a51e0f0749bd73e [6175/24603] Merge branch 'mxc/next' into next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230902/202309020036.GWe8cx61-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020036.GWe8cx61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020036.GWe8cx61-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arceb-elf-gcc: error: unrecognized argument in option '-mtune=cortex-a9'
   arceb-elf-gcc: note: valid arguments to '-mtune=' are: arc600 arc601 arc700 arc700-xmac arc725d arc750d arc7xx core3 release31a
>> arceb-elf-gcc: error: unrecognized argument in option '-mfpu=neon'
   arceb-elf-gcc: note: valid arguments to '-mfpu=' are: fpud fpud_all fpud_div fpud_fma fpuda fpuda_all fpuda_div fpuda_fma fpus fpus_all fpus_div fpus_fma
>> arceb-elf-gcc: error: unrecognized command-line option '-march=armv7-a'
>> arceb-elf-gcc: error: unrecognized command-line option '-mfloat-abi=softfp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
