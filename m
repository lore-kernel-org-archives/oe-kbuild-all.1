Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F41137F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 02:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693015573; x=1724551573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Ipb8FAgzcVXOy/WIdNMlhMOD6IVExHfaADQFh0Iy6Q=;
  b=XVE3wXya8mNiIi7cDMQDgAJX0OKLcFsTid5q5QDEeiVkLQdV5G18As+p
   HgWpvQNHbxDj/BymaaIqQG7hGFdJbS8rQs4+8vmyFQCsnrBGLDl/E7Zrd
   eNq38SFD8ob9K20khhw6GJqQXWk/oK87N6jxfdghMOU+SdD7TfHvxCgHh
   WoZuZxO4bj0iwRUU9zTtKXtY6btl+QabWJ1RcWWXFhOkZrndTVMX2k8a7
   aOFgRKsJgMqTSiyNK1/hyt07msAE5BvdNYe2af9XFJWzWt684ooATxVaj
   jjYvPkLYKzkb7D41oBYm+fTbwsMNHfNF7Z3xnGgH1r/IVI41pPRmI1wbg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354365257"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="354365257"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 19:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772686711"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="772686711"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 19:06:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZigk-0004Fe-1C;
	Sat, 26 Aug 2023 02:06:10 +0000
Date: Sat, 26 Aug 2023 10:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:file0yZ50U 278/279]
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c:359:41: warning:
 'rpl_nau8318_amp' defined but not used
Message-ID: <202308260926.IxN6EWWX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git file0yZ50U
head:   1465811cf7b52be6e4468f9acd678a0b05e2bd4a
commit: 6b8b6892e43419f5339c47d307b1baac0eea036d [278/279] ASoC: Intel: Add rpl_nau8318_8825 driver
config: i386-randconfig-015-20230823 (https://download.01.org/0day-ci/archive/20230826/202308260926.IxN6EWWX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260926.IxN6EWWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260926.IxN6EWWX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/intel/common/soc-acpi-intel-rpl-match.c:369:41: error: redefinition of 'rpl_nau8318_amp'
     369 | static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
         |                                         ^~~~~~~~~~~~~~~
   sound/soc/intel/common/soc-acpi-intel-rpl-match.c:359:41: note: previous definition of 'rpl_nau8318_amp' with type 'const struct snd_soc_acpi_codecs'
     359 | static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
         |                                         ^~~~~~~~~~~~~~~
>> sound/soc/intel/common/soc-acpi-intel-rpl-match.c:359:41: warning: 'rpl_nau8318_amp' defined but not used [-Wunused-const-variable=]


vim +/rpl_nau8318_amp +359 sound/soc/intel/common/soc-acpi-intel-rpl-match.c

5dc51e50457a1d Terry Cheong 2023-06-02  358  
273bc8bf222710 Ajye Huang   2023-08-04 @359  static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
273bc8bf222710 Ajye Huang   2023-08-04  360  	.num_codecs = 1,
273bc8bf222710 Ajye Huang   2023-08-04  361  	.codecs = {"NVTN2012"}
273bc8bf222710 Ajye Huang   2023-08-04  362  };
273bc8bf222710 Ajye Huang   2023-08-04  363  

:::::: The code at line 359 was first introduced by commit
:::::: 273bc8bf2227108ed2851bea71786a026e34ecbb ASoC: Intel: Add rpl_nau8318_8825 driver

:::::: TO: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
