Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1172AED6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 21:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687037997; x=1718573997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LuIR2ORQCwFa1s2ukhXrTYFgFE0QY8glW9k4wZv8zDE=;
  b=S9kU60il0zTrPRZyk7qo6e/73tDllJFCyPeDzSHW9QD5msXX50JF5qpn
   +bmgCmD2bpr3Ps9u78KvwwmdCxaVt+cL72uZzfJKrdssziFPKzjXQJmJR
   fkW3UUvtzdA78mw5c2E0YC6SiMtsROl3uDcSZ9bGT8hfXWdee6SbpjOzT
   t2j4KCz4M009wVpVFvEYXY2l0PWDbXveJzvlBQvWsbsN5OceaBSGN9ZNA
   heWp6/6MlfqdUFZXtObA6u40C/is17CK/t1befwQ08z9nbJi/l6af8nw0
   ncyaiJdsA0HzF+ul0Dww+kOiBYsN0q7c/7JDgJurjVq9CdB9lmG5A8cDv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="425371850"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="425371850"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 14:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="1043464793"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="1043464793"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jun 2023 14:39:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAdeB-00037u-0J;
	Sat, 17 Jun 2023 21:39:51 +0000
Date: Sun, 18 Jun 2023 05:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Pi-Hsun Shih <pihsun@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 3768/9999] warning: (PINCTRL_MTK
 && ..) selects EINT_MTK which has unmet direct dependencies (PINCTRL && ..)
 && ..))
Message-ID: <202306180511.MmlpQzvr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: ce81cc2139314b111602c95744a88bdb2a25c40a [3768/9999] FROMGIT: pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings
config: arm64-randconfig-s041-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180511.MmlpQzvr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180511.MmlpQzvr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180511.MmlpQzvr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: (PINCTRL_MTK && PINCTRL_MTK_PARIS) selects EINT_MTK which has unmet direct dependencies (PINCTRL && (ARCH_MEDIATEK || COMPILE_TEST) && (PINCTRL_MTK || PINCTRL_MTK_MOORE || COMPILE_TEST))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
