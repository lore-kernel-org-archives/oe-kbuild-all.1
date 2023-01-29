Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A5D15A2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 06:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674975293; x=1706511293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d/orxxeMdfbyAmMY6FUU8+qP3RUDB6RuZDMjC+TSrzc=;
  b=Rqnyk8QAeL4X32Zz1kKEtSLPggl5Vs99v2C0egh92p1rPzC1e/+xwHdr
   4zh5P7T9CByUddnA9qJ5QAi2yYuuS8b2lNtLGiGCoJDzsHKiA5f2EH+X+
   Ss5H9r/AgrKACtf5WRU06FgWxb+U+UJw+CVRgCxTeFWvEL2ypKZFzOeDH
   o46K1m49sD1eCncX/eE5HeICqvZok6oBoWAcj0PEDVt8eQi8yBzjR15bO
   gq5h7KGfHNHpY2ZAF+g1vEkWAUhfyvKF1uBV0OoKXV/PbkzEbk5aEUO85
   EMO7Gcwm8nFgF53s3i1dvLL1xY94E8wnG5aMtX8fQAAT64o7HhiyMAhhG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354681517"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="354681517"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 22:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="663750597"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="663750597"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2023 22:54:50 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM1aU-0002Xg-0m;
	Sun, 29 Jan 2023 06:54:50 +0000
Date: Sun, 29 Jan 2023 14:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:sc8280xp-next-20230127 61/68]
 drivers/firmware/qcom_scm.c:273: warning: expecting prototype for
 qcom_scm_call_atomic(). Prototype was for __qcom_scm_call_atomic() instead
Message-ID: <202301291431.YozLGxxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux sc8280xp-next-20230127
head:   e10708dcf38b3f2af28016c15153c8561a654db1
commit: b802e56385fbc4a4f05ffffeb31a699e18c8e698 [61/68] firmware: qcom_scm: Export SCM call functions
config: arm-randconfig-r046-20230129 (https://download.01.org/0day-ci/archive/20230129/202301291431.YozLGxxV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/b802e56385fbc4a4f05ffffeb31a699e18c8e698
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev sc8280xp-next-20230127
        git checkout b802e56385fbc4a4f05ffffeb31a699e18c8e698
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/firmware/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/firmware/qcom_scm.c:273: warning: expecting prototype for qcom_scm_call_atomic(). Prototype was for __qcom_scm_call_atomic() instead


vim +273 drivers/firmware/qcom_scm.c

b802e56385fbc4 Maximilian Luz 2023-01-27  259  
9a434cee773ae1 Elliot Berman  2020-01-07  260  /**
9a434cee773ae1 Elliot Berman  2020-01-07  261   * qcom_scm_call_atomic() - atomic variation of qcom_scm_call()
b802e56385fbc4 Maximilian Luz 2023-01-27  262   * @dev:	Device. Depending on the command and number of arguments, this
b802e56385fbc4 Maximilian Luz 2023-01-27  263   *		is optional.
9a434cee773ae1 Elliot Berman  2020-01-07  264   * @desc:	Descriptor structure containing arguments and return values
9a434cee773ae1 Elliot Berman  2020-01-07  265   * @res:	Structure containing results from SMC/HVC call
9a434cee773ae1 Elliot Berman  2020-01-07  266   *
9a434cee773ae1 Elliot Berman  2020-01-07  267   * Sends a command to the SCM and waits for the command to finish processing.
9a434cee773ae1 Elliot Berman  2020-01-07  268   * This can be called in atomic context.
9a434cee773ae1 Elliot Berman  2020-01-07  269   */
b802e56385fbc4 Maximilian Luz 2023-01-27  270  static int __qcom_scm_call_atomic(struct device *dev,
9a434cee773ae1 Elliot Berman  2020-01-07  271  				  const struct qcom_scm_desc *desc,
9a434cee773ae1 Elliot Berman  2020-01-07  272  				  struct qcom_scm_res *res)
9a434cee773ae1 Elliot Berman  2020-01-07 @273  {
9a434cee773ae1 Elliot Berman  2020-01-07  274  	switch (__get_convention()) {
9a434cee773ae1 Elliot Berman  2020-01-07  275  	case SMC_CONVENTION_ARM_32:
9a434cee773ae1 Elliot Berman  2020-01-07  276  	case SMC_CONVENTION_ARM_64:
9a434cee773ae1 Elliot Berman  2020-01-07  277  		return scm_smc_call(dev, desc, res, true);
9a434cee773ae1 Elliot Berman  2020-01-07  278  	case SMC_CONVENTION_LEGACY:
9a434cee773ae1 Elliot Berman  2020-01-07  279  		return scm_legacy_call_atomic(dev, desc, res);
9a434cee773ae1 Elliot Berman  2020-01-07  280  	default:
9a434cee773ae1 Elliot Berman  2020-01-07  281  		pr_err("Unknown current SCM calling convention.\n");
9a434cee773ae1 Elliot Berman  2020-01-07  282  		return -EINVAL;
9a434cee773ae1 Elliot Berman  2020-01-07  283  	}
9a434cee773ae1 Elliot Berman  2020-01-07  284  }
9a434cee773ae1 Elliot Berman  2020-01-07  285  

:::::: The code at line 273 was first introduced by commit
:::::: 9a434cee773ae15309ac225f27551b5492618e4a firmware: qcom_scm: Dynamically support SMCCC and legacy conventions

:::::: TO: Elliot Berman <eberman@codeaurora.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
