Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7C28C1A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695283835; x=1726819835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T1kzVSjo25EytizyylmE6AhEP6YaU3HnIuXoRY4+Kks=;
  b=Fh29AOx/DQhuT24NIBvUCBfKCo22ve1ikAZk6tcoANKZMW+r9o56zsxe
   hrRFAl8+KIxysNH1pplUNEp1oHnmBK9BBj0DIPEKU/DBUTwhxbilZq1z2
   UTD/GZJVgan26tT0fAw6lwWYb8l12bzN4/5TQ84tv+jP1P7Um4GxoWIpm
   5ZvrNgzDphwdMByv60d3nQA4Br/ACic2g88aw7p4IfGOHYCROGDnptOJV
   7kWwGyiQa/dkkMc0RcYjtDMI1Xc7AOoqdgjJ9wkPnz11KvI6IHmMlsrPq
   5aHQMwiHKCeaVnWGb5kwQLeuwJ3IkcRc7iOq4eLfUMhYaiMmGmnwbNN7C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466762251"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="466762251"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 01:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="920635719"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="920635719"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2023 01:10:32 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjEla-0009lW-0Q;
	Thu, 21 Sep 2023 08:10:30 +0000
Date: Thu, 21 Sep 2023 16:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [qcom:arm64-for-6.7 139/142] Error:
 scripts/dtc/include-prefixes/arm64/qcom/pm7250b.dtsi:44.10-11 syntax error
Message-ID: <202309211630.0h14xtgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.7
head:   eee9602ad6498eee9ddab1b7eb6aede288f0b934
commit: 8e2d56f64572e0432c355093a7601bde29677490 [139/142] arm64: dts: qcom: pm7250b: make SID configurable
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230921/202309211630.0h14xtgj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211630.0h14xtgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211630.0h14xtgj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: scripts/dtc/include-prefixes/arm64/qcom/pm7250b.dtsi:44.10-11 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
