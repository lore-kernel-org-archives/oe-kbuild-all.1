Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F42595
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687374198; x=1718910198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7H5En4r0zGR77bmM2iIQWjdWSTDccoljAUj1AMqUSw0=;
  b=RWfDz7f2fbnPqctjpcYyzPi04htFc/pEcKKq1Ace/fGn7Kygf3f7w0HO
   FjVIkrrQhzx6zsYba3lguTsY21+bsPylVjcQMTvqJVyZsMgyVGpRhZmHf
   c+5nPtp/A0mBdq13M8awk+7ldkGGz8eGpLUYHwueByWEsQaYwqm/CXIgq
   TTIkBI+9pS+SZdeK8Eb8TFHTsdxrNaIfIC9WdXshR/Bo3qA2LrwL9MmFN
   z/8AOC0EHopeNknj+nA4y0fMmWLlzRwAJSJZ0AlAzJUAASFd65ghaJ0jd
   ZtHM4RXlx9Xabx67AdEsg8XbVWw6HLunUHLSFb0ur8Om9PgBccGFTvHhP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="359139868"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="359139868"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 12:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="888800733"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="888800733"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jun 2023 12:03:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC36p-00072P-2h;
	Wed, 21 Jun 2023 19:03:15 +0000
Date: Thu, 22 Jun 2023 03:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 131/145] ERROR: modpost: module
 snd-hda-scodec-cs35l41-i2c uses symbol cs35l41_hda_pm_ops from namespace
 SND_HDA_SCODEC_CS35L41, but does not import it.
Message-ID: <202306220351.KSa2LWoj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linux,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   56a52577a86d37cbdd9150c82ba277fe482b2b38
commit: 0b32a845bbd24e8c3315cc80ea634d5be3d7e43b [131/145] UPSTREAM: ASoC: Intel: Skylake: Fix Kconfig dependency
config: x86_64-randconfig-a005-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220351.KSa2LWoj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220351.KSa2LWoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220351.KSa2LWoj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: module snd-hda-scodec-cs35l41-spi uses symbol cs35l41_hda_pm_ops from namespace SND_HDA_SCODEC_CS35L41, but does not import it.
>> ERROR: modpost: module snd-hda-scodec-cs35l41-i2c uses symbol cs35l41_hda_pm_ops from namespace SND_HDA_SCODEC_CS35L41, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
