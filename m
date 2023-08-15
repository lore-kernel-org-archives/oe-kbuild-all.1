Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A32718046
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 21:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692134833; x=1723670833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qx1oVbkiYtBsxlmHrTVWTipv0Z59xya6ux4mW2I7f38=;
  b=BH0ODhgjaMNAfHB8UzOamXFf2RQdKNMVNgRE9f513rMFR2rXDZB2feqV
   US/6nP5a6fWUDfPX08/B9k/SsnIyzP8SO5NNeaFX1+9D2hoAN/d6lxtFk
   /ZUqesIXQEi5HtCQDMIU1MfXpH7xfbmQL/mQ376Vfx1PH0Zm7JMtBbJ8L
   w8dbjEKNBxk6J51gfOe4TcPl4LLRbfD8VNlAF+AOzJ/b83A4B4lljsOvt
   U2GbqSGAAq3dK966ksm1eL9qxsuiQ7MGU93urQ3c56aJa0ybwJDGz6+sW
   lN6h/pektQ5D/UTjbDns1AHFhss/Z/A+BhrtdpGemKAaYVamgs0wFHHCa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436280243"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="436280243"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 14:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857567385"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="857567385"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Aug 2023 14:27:11 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW1ZG-0001FH-0i;
	Tue, 15 Aug 2023 21:27:10 +0000
Date: Wed, 16 Aug 2023 05:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: sound/soc/qcom/lpass-sc7180.c:287:34: warning:
 'sc7180_lpass_cpu_device_id' defined but not used
Message-ID: <202308160550.pMV9wr10-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ajit,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 08a70a6fab2cb0db295184a63ef6f25a4a43398e FROMGIT: ASoC: qcom: sc7180: Add machine driver for sound card registration
date:   2 years, 8 months ago
config: i386-buildonly-randconfig-r004-20230816 (https://download.01.org/0day-ci/archive/20230816/202308160550.pMV9wr10-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160550.pMV9wr10-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160550.pMV9wr10-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/lpass-sc7180.c:287:34: warning: 'sc7180_lpass_cpu_device_id' defined but not used [-Wunused-const-variable=]
     287 | static const struct of_device_id sc7180_lpass_cpu_device_id[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sc7180_lpass_cpu_device_id +287 sound/soc/qcom/lpass-sc7180.c

24caf8d9eb108c5 Ajit Pandey      2020-08-14  286  
24caf8d9eb108c5 Ajit Pandey      2020-08-14 @287  static const struct of_device_id sc7180_lpass_cpu_device_id[] = {
24caf8d9eb108c5 Ajit Pandey      2020-08-14  288  	{.compatible = "qcom,sc7180-lpass-cpu", .data = &sc7180_data},
24caf8d9eb108c5 Ajit Pandey      2020-08-14  289  	{}
24caf8d9eb108c5 Ajit Pandey      2020-08-14  290  };
dcde34c47d8f7be Douglas Anderson 2020-09-16  291  MODULE_DEVICE_TABLE(of, sc7180_lpass_cpu_device_id);
24caf8d9eb108c5 Ajit Pandey      2020-08-14  292  

:::::: The code at line 287 was first introduced by commit
:::::: 24caf8d9eb108c52e144bcc7af94bb1edcb70700 ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio

:::::: TO: Ajit Pandey <ajitp@codeaurora.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
