Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C4217724
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 19:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687377267; x=1718913267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SA3jH/ZlbkN0lTBEQeSUoKlbMap/MBHcyxZDoC5whj0=;
  b=h2manQr8LLAwnXj2n6oY1E+A+9uI5UdjFUFfqepEOd8HgGc/skY3yrpv
   j1FDdwLHKvXs6kh/7Hy07eRcq5FeT/ehSc/MdZNfj/icUL/SLHTWwaijL
   6/riQyQSys6OcUhoOeSOoeUmCAVsKARxqsXbZ9Wg2F/saWFQzAIQVylif
   DdegwJrUu77k7CW6jE0ir9GZDLdxp5G8wvd6tSrNDj/tRs7ATPc/BO6KW
   7l8gL2ehD+rWdcBkTTb/j1581szn3zrkMjiANLjQcvsg5EnkTINwtihDa
   XaSeSvDvEw+cgbc6ZqTTQ3iRIFK/80eyeDH4MWEE/Tqt5idAKTaUT+693
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360302701"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="360302701"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 12:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="714633528"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="714633528"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2023 12:54:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC3uD-00073r-1N;
	Wed, 21 Jun 2023 19:54:17 +0000
Date: Thu, 22 Jun 2023 03:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Agrawal, Akshu" <Akshu.Agrawal@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Akshu Agrawal <akshu.agrawal@amd.com>,
	Daniel Kurtz <djkurtz@chromium.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mark Brown <broonie@kernel.org>
Subject: [jsarha:topic/cros-sof-v4.14 6065/9354]
 sound/soc/amd/acp-da7219-max98357a.c:227:36: warning: 'cz_audio_acpi_match'
 defined but not used
Message-ID: <202306220346.4qIT5zEy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: c3d2d4fb29cf8e12d925e98c29a1d55cdf644fd3 [6065/9354] FROMGIT: ASoC: AMD: Add machine driver for ST DA7219 MAX98357
config: x86_64-buildonly-randconfig-r002-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220346.4qIT5zEy-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220346.4qIT5zEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220346.4qIT5zEy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/da7219.c:1545:36: warning: 'da7219_acpi_match' defined but not used [-Wunused-const-variable=]
    static const struct acpi_device_id da7219_acpi_match[] = {
                                       ^~~~~~~~~~~~~~~~~
   sound/soc/codecs/da7219.c:1539:34: warning: 'da7219_of_match' defined but not used [-Wunused-const-variable=]
    static const struct of_device_id da7219_of_match[] = {
                                     ^~~~~~~~~~~~~~~
--
>> sound/soc/amd/acp-da7219-max98357a.c:227:36: warning: 'cz_audio_acpi_match' defined but not used [-Wunused-const-variable=]
    static const struct acpi_device_id cz_audio_acpi_match[] = {
                                       ^~~~~~~~~~~~~~~~~~~


vim +/cz_audio_acpi_match +227 sound/soc/amd/acp-da7219-max98357a.c

   226	
 > 227	static const struct acpi_device_id cz_audio_acpi_match[] = {
   228		{ "AMD7219", 0 },
   229		{},
   230	};
   231	MODULE_DEVICE_TABLE(acpi, cz_audio_acpi_match);
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
