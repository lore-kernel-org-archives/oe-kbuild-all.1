Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C77747A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 22:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678919291; x=1710455291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=77RiVW1n8JQ7bKYFtt/ANSfOWuYL6qW84IjceBGL5DY=;
  b=H4r05QeIaBJPCjHIpdAk5aggh0hX2zLQzOmDqiUU6ZSPtEXNggKBdTsI
   lioOXd/C3YWRJiCjUtpiZp5eCIBsRp3fqs8RjJQSqsKZApgQKOLDZ29j3
   eBCcKFTITjKMJWaVDfmvYDoknxAQC+s0+geE4ENyZKoC8xBQT9cB2zC9p
   /SBKEFFwK2nq95nR9bneplucWBpcaEq2cqLosZjDYRqPoLzpi/QtNdSUP
   XspsfcdEQuuWP2yP6b0+O5t2W4Kg+V23nv4SYn/LRKtzH6FYhMtppGdyT
   lYMyD/ovNcDWkwQqtAJ+Zke8BChqUR9n1nCporQl3UvGI7KkNNBmxSQBE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321675470"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="321675470"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 15:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="712103174"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="712103174"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Mar 2023 15:28:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcZbN-000851-2m;
	Wed, 15 Mar 2023 22:28:09 +0000
Date: Thu, 16 Mar 2023 06:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] clk: qcom: Add sync state callback to all
 SC8280XP providers
Message-ID: <202303160604.BwSTWdFw-lkp@intel.com>
References: <20230315132330.450877-5-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315132330.450877-5-abel.vesa@linaro.org>

Hi Abel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on clk/clk-next]
[also build test ERROR on rafael-pm/linux-next linus/master v6.3-rc2 next-20230315]
[cannot apply to pavel-leds/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/PM-domains-Allow-power-off-queuing-from-providers/20230315-212537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230315132330.450877-5-abel.vesa%40linaro.org
patch subject: [RFC PATCH 4/5] clk: qcom: Add sync state callback to all SC8280XP providers
config: arm-randconfig-r046-20230313 (https://download.01.org/0day-ci/archive/20230316/202303160604.BwSTWdFw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/60773bbfbd203e73efd6f80aed1d3bd44b32101d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/PM-domains-Allow-power-off-queuing-from-providers/20230315-212537
        git checkout 60773bbfbd203e73efd6f80aed1d3bd44b32101d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160604.BwSTWdFw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "gdsc_sync_state" [drivers/clk/qcom/gcc-sc8280xp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
