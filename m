Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CD9194
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 03:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685156633; x=1716692633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5BTYQNaXe+P4XsD0hl6HXtqfM3QedBmw1/Qh5xptmcc=;
  b=YSERUCZSiFiXMnRFT9ck7jWnRs1mRPW3F3x6CvrDhO7tRBRX3WjI3XS2
   o3fWVLAWmBFXhkc4/Ze7AV8I7JIg1zJQV0ywsmSlyUbS2JEPP9bFrn0JP
   moRiHM/N7mWEfdaHApL4sYxbSMdv5yHRJugg5qfRBGZ37lFs4Mk5o5RZd
   9mAVBIbi5YQ6HI4Vaq3nDfjf6FtG7WqQmmWuRLefbdMnVF+UNHLVcRcqY
   eqgpf2CUiyXXp6Cv5yTQLXowRhgqlF6U899gahJtAo1TptEyGca9c6QKE
   J3PJT/l7vPUeDgnKY6nfnzZvljGUwOlnvXnCQE/htpcZmyl7m+t8GHpnL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356733697"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="356733697"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 20:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="705415965"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="705415965"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 May 2023 20:03:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2kDe-000Jjy-0n;
	Sat, 27 May 2023 03:03:50 +0000
Date: Sat, 27 May 2023 11:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yogesh Lal <quic_ylal@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: drivers/remoteproc/qcom_q6v5_pas.c:123:9: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202305271049.KVXkN2NS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18713e8a689377386f639d9317f958244825bd7b
commit: a376c10d45a8e6ee5ea55791193f90625b35e156 remoteproc: qcom: pas: Adjust the phys addr wrt the mem region
date:   3 months ago
config: arm64-randconfig-s031-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271049.KVXkN2NS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a376c10d45a8e6ee5ea55791193f90625b35e156
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a376c10d45a8e6ee5ea55791193f90625b35e156
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271049.KVXkN2NS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/qcom_q6v5_pas.c:123:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void * @@
   drivers/remoteproc/qcom_q6v5_pas.c:123:9: sparse:     expected void const volatile [noderef] __iomem *
   drivers/remoteproc/qcom_q6v5_pas.c:123:9: sparse:     got void *
>> drivers/remoteproc/qcom_q6v5_pas.c:108:6: sparse: sparse: symbol 'adsp_segment_dump' was not declared. Should it be static?
   drivers/remoteproc/qcom_q6v5_pas.c:553:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:553:26: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:553:26: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/qcom_q6v5_pas.c:575:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *dtb_mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:575:30: sparse:     expected void *dtb_mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:575:30: sparse:     got void [noderef] __iomem *

vim +123 drivers/remoteproc/qcom_q6v5_pas.c

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
 > 123		memcpy_fromio(dest, adsp->mem_region + total_offset, size);
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
