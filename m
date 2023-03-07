Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657CD7C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 00:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678148202; x=1709684202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bs2mzqrGbeNSdRPbv1/u6smieTzLNw5EOZLYQXyJbP8=;
  b=eEW9q8x1YP/tomXzQnyxpmjZJq/UJAjo8qJZmDtGykxpr5enyBbvgnBx
   5Jm9OXp4/YmE/vH/nDIUFyoHoZyciSNZSZiht/UAX6Bs9/LscqKPgGbUN
   B+fNLMuU6lVuIk3VCtt5RRDw/wuTNkP5XmlEPpdB0yadZwqJIX+VhMJq7
   /kHRQb3pXEfO20rCTQt4LuXzH3tglQ4DkN2Cd42tqGiygoifXe2nvcNXP
   HxTmpQ2ZFDTLWWQb9lCbEUz39x5R2Q5SV71fgJaEWXEYpECO0MNWFgwWZ
   T8zkPYyXzg9PQ8uyJDTSkNIBFu4FcVgVrqB3P76BIYka9xXL8IOj0V7D1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315373639"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="315373639"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 16:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="678710293"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="678710293"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Mar 2023 16:16:40 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZL0R-0000l5-2W;
	Tue, 07 Mar 2023 00:16:39 +0000
Date: Tue, 7 Mar 2023 08:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: sound/soc/qcom/lpass-sc7180.c:287:34: warning:
 'sc7180_lpass_cpu_device_id' defined but not used
Message-ID: <202303070842.EsU1F4B6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 08a70a6fab2cb0db295184a63ef6f25a4a43398e FROMGIT: ASoC: qcom: sc7180: Add machine driver for sound card registration
date:   2 years, 3 months ago
config: x86_64-buildonly-randconfig-r003-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070842.EsU1F4B6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=08a70a6fab2cb0db295184a63ef6f25a4a43398e
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 08a70a6fab2cb0db295184a63ef6f25a4a43398e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070842.EsU1F4B6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/lpass-sc7180.c:287:34: warning: 'sc7180_lpass_cpu_device_id' defined but not used [-Wunused-const-variable=]
     287 | static const struct of_device_id sc7180_lpass_cpu_device_id[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sc7180_lpass_cpu_device_id +287 sound/soc/qcom/lpass-sc7180.c

24caf8d9eb108c Ajit Pandey      2020-08-14  286  
24caf8d9eb108c Ajit Pandey      2020-08-14 @287  static const struct of_device_id sc7180_lpass_cpu_device_id[] = {
24caf8d9eb108c Ajit Pandey      2020-08-14  288  	{.compatible = "qcom,sc7180-lpass-cpu", .data = &sc7180_data},
24caf8d9eb108c Ajit Pandey      2020-08-14  289  	{}
24caf8d9eb108c Ajit Pandey      2020-08-14  290  };
dcde34c47d8f7b Douglas Anderson 2020-09-16  291  MODULE_DEVICE_TABLE(of, sc7180_lpass_cpu_device_id);
24caf8d9eb108c Ajit Pandey      2020-08-14  292  

:::::: The code at line 287 was first introduced by commit
:::::: 24caf8d9eb108c52e144bcc7af94bb1edcb70700 ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio

:::::: TO: Ajit Pandey <ajitp@codeaurora.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
