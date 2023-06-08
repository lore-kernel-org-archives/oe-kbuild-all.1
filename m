Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE1ECD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 01:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686188957; x=1717724957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0DOa52CNROAYOoC8c0C/vIfAGneSZ5LSIRsRRnpKr+s=;
  b=jln/0Ncs9oAXC8Jim62Jz7u21wi68pQf+6uosxiASb+wpLI4CiKKZwC9
   DtoHCdyDyb5q13ji2ZyQ88nBL/B2cMMtyw2PC29J91J9BRhuOQPjRLSgj
   ty7NoNYvaSiCpEOw2SswBBZrMwJgj3ZQg9DT3FkYvGeOr+xtTknjJ0Qel
   d3g0SYrHI0viDXN12dCFCgxVo1QQ6KsTZJs3uH2DC2STG6lLKOL0AMsZ2
   oMvjEfMDySJiG9LBNTVTgYWuy8+jC9iJA54aU4oBk9GEmslC7ezfaQAlm
   7zBKARDITtMVTCJUH73VqWcge0KnX3OUQGoJkSRJVvhm16k4Vq+42U0XF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443534345"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="443534345"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 18:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709768792"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="709768792"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jun 2023 18:49:12 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q74lz-000777-2V;
	Thu, 08 Jun 2023 01:49:11 +0000
Date: Thu, 8 Jun 2023 09:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yogesh Lal <quic_ylal@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: drivers/remoteproc/qcom_q6v5_pas.c:108:6: warning: no previous
 prototype for 'adsp_segment_dump'
Message-ID: <202306080904.9oavZM8B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yogesh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a27648c742104a833a01c54becc24429898d85bf
commit: a376c10d45a8e6ee5ea55791193f90625b35e156 remoteproc: qcom: pas: Adjust the phys addr wrt the mem region
date:   4 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230608/202306080904.9oavZM8B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a376c10d45a8e6ee5ea55791193f90625b35e156
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a376c10d45a8e6ee5ea55791193f90625b35e156
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/remoteproc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080904.9oavZM8B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/qcom_q6v5_pas.c:108:6: warning: no previous prototype for 'adsp_segment_dump' [-Wmissing-prototypes]
     108 | void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
         |      ^~~~~~~~~~~~~~~~~


vim +/adsp_segment_dump +108 drivers/remoteproc/qcom_q6v5_pas.c

   107	
 > 108	void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
   109			       void *dest, size_t offset, size_t size)
   110	{
   111		struct qcom_adsp *adsp = rproc->priv;
   112		int total_offset;
   113	
   114		total_offset = segment->da + segment->offset + offset - adsp->mem_phys;
   115		if (total_offset < 0 || total_offset + size > adsp->mem_size) {
   116			dev_err(adsp->dev,
   117				"invalid copy request for segment %pad with offset %zu and size %zu)\n",
   118				&segment->da, offset, size);
   119			memset(dest, 0xff, size);
   120			return;
   121		}
   122	
   123		memcpy_fromio(dest, adsp->mem_region + total_offset, size);
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
