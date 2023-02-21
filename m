Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EF4A933
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677020447; x=1708556447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7TDZjQ4e8rwPYMawOxRf+E9wMY9Jgj3YZJ5tg4KwAvY=;
  b=COE3lhDt4Oe7Kx1QBi5ptIZ4cPV1uQLx5dnixoZH6+ibckCZmgDPmlrE
   uR33wwGv9F3RVXxV9CguxiH2EJIiLrebd0ZfE/C7+8c4Mb2ivnARuKvMh
   lOdtgNdBGGPn4fyZMS3lCH9WZ5cTEFHHOhZ3wYmu8eh4eQpUfeHxcTkyp
   WtoU9ywBDYeNmAo7au9BqSekX4Cw78ZQ7yhGGbHDzGksWMfu3BW950eM0
   o2UooV9EucfArQ7wmIkaDhoMrCW9hSl7FJ57xEytRMcWNskiR96eZOvch
   6QEKiLOxTtLi53D3exLWmXVI9RQ9vKqW3Czy2RC+lioU14kz0qyZrImgp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="320915308"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="320915308"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 15:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="673861023"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="673861023"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2023 15:00:45 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUbcr-0000K1-1D;
	Tue, 21 Feb 2023 23:00:45 +0000
Date: Wed, 22 Feb 2023 07:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 52/57] sound/soc/qcom/qdsp6/q6prm.c:205 q6prm_set_lpass_clock() warn:
 inconsistent indenting
Message-ID: <202302220603.g5q60eUy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   1f3ac4514a512e9f791badc3c6754a55a40a1492
commit: 98513e6addbe033ebe68d0e525d79b7d55038d4d [52/57] q6prm debug
config: openrisc-randconfig-m041-20230221 (https://download.01.org/0day-ci/archive/20230222/202302220603.g5q60eUy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220603.g5q60eUy-lkp@intel.com/

smatch warnings:
sound/soc/qcom/qdsp6/q6prm.c:205 q6prm_set_lpass_clock() warn: inconsistent indenting

vim +205 sound/soc/qcom/qdsp6/q6prm.c

   193	
   194	int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
   195				  unsigned int freq)
   196	{
   197		int ret;
   198		if (freq) {
   199			ret = q6prm_request_lpass_clock(dev, clk_id, clk_attr, clk_attr, freq);
   200			pr_err("AAA3 %d = %d | %d\n", clk_id, ret, freq);
   201			return ret;
   202		}
   203	
   204		ret = q6prm_release_lpass_clock(dev, clk_id, clk_attr, clk_attr, freq);
 > 205			pr_err("AAA4 %d = %d | %d\n", clk_id, ret, freq);
   206		return ret;
   207	}
   208	EXPORT_SYMBOL_GPL(q6prm_set_lpass_clock);
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
