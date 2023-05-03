Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A04A7E4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 05:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683092214; x=1714628214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W9HNONDQKPNQGkIzl/GzzDI12t4M8J/QCRDk/JDOb+o=;
  b=MIswHKgSy1SLDhXvpwD+WlAmkS4TCEDw/tNWyRf97FkoRgg4f3V0tGcS
   BSRCb/bazGx0ggdOJAWgmeYjinHJ1zEE2NONR5bn8vtcN0AKT2shkkcS3
   PE5jop/VHMZtyL569Z4aV273HPgrTDuTafxR8P0Iyaarh/9TL30HMAzDM
   B8Mz22CbT3oRTSGOlxMtZimt1i2IRFIFygcnMqv4eCU9aoRgL9rYJ1CpE
   iFJgifeGYfV3nfpWLwDyhrjm/ccpeItPnZBSqgtxfCaT/BACP1Ik77b6J
   dcIuP8iAuMO5i123Yh51TX259cv/UZWoUbMDjzDk5a6bCgNGhrKVFzulf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="346052348"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="346052348"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 22:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="820645917"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="820645917"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 May 2023 22:36:52 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu5AZ-0001YS-2F;
	Wed, 03 May 2023 05:36:51 +0000
Date: Wed, 3 May 2023 13:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 12/12] pci: implement submission/completion for rawq
 commands
Message-ID: <202305031330.zWfaf5UM-lkp@intel.com>
References: <20230429093925.133327-13-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429093925.133327-13-joshi.k@samsung.com>

Hi Kanchan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master next-20230428]
[cannot apply to hch-configfs/for-next v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230429093925.133327-13-joshi.k%40samsung.com
patch subject: [RFC PATCH 12/12] pci: implement submission/completion for rawq commands
config: arm-randconfig-s052-20230430 (https://download.01.org/0day-ci/archive/20230503/202305031330.zWfaf5UM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/5e9295340fad52984048c267b4b4c422c9556c86
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
        git checkout 5e9295340fad52984048c267b4b4c422c9556c86
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305031330.zWfaf5UM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/pci.c:1932:45: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t @@
   drivers/nvme/host/pci.c:1932:45: sparse:     expected int
   drivers/nvme/host/pci.c:1932:45: sparse:     got restricted blk_status_t
>> drivers/nvme/host/pci.c:1061:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1061:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1061:33: sparse:     got restricted __le64 [usertype] u64
>> drivers/nvme/host/pci.c:1061:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1061:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1061:33: sparse:     got restricted __le64 [usertype] u64
>> drivers/nvme/host/pci.c:1061:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1061:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1061:33: sparse:     got restricted __le64 [usertype] u64
>> drivers/nvme/host/pci.c:1061:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1061:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1061:33: sparse:     got restricted __le64 [usertype] u64
>> drivers/nvme/host/pci.c:1061:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1061:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1061:33: sparse:     got restricted __le64 [usertype] u64

vim +1932 drivers/nvme/host/pci.c

  1901	
  1902	static int nvme_map_io_fb(struct request_queue *q, struct io_uring_cmd *ioucmd,
  1903				struct nvme_dev *dev, struct nvme_iod *iod,
  1904				unsigned long addr, unsigned int buf_len)
  1905	{
  1906		struct nvme_command *cmnd = &iod->cmd;
  1907		int ret, rw = nvme_is_write(cmnd);
  1908		struct iov_iter iter;
  1909		size_t nr_iter, nr_segs;
  1910		struct bio_vec *bv;
  1911	
  1912		if (!(ioucmd->flags & IORING_URING_CMD_FIXED))
  1913			return -EINVAL;
  1914	
  1915		ret = io_uring_cmd_import_fixed(addr, buf_len, rw, &iter, ioucmd);
  1916		if (ret < 0)
  1917			return ret;
  1918		nr_iter = iov_iter_count(&iter);
  1919		nr_segs = iter.nr_segs;
  1920	
  1921		/* device will do these checks anyway, so why do duplicate work? */
  1922		if (!nr_iter || (nr_iter >> SECTOR_SHIFT) > queue_max_hw_sectors(q))
  1923			goto err;
  1924		if (nr_segs > queue_max_segments(q))
  1925			goto err;
  1926		/* this will be attempted from regular path instead */
  1927		if (nr_segs > 1)
  1928			goto err;
  1929	
  1930		bv = (struct bio_vec *)&iter.bvec[0];
  1931		if (bv->bv_offset + bv->bv_len <= NVME_CTRL_PAGE_SIZE * 2)
> 1932			return nvme_setup_prp_simple(dev, iod,
  1933					(struct nvme_rw_command *)cmnd,
  1934					bv, rw ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
  1935	err:
  1936		return -EINVAL;
  1937	}
  1938	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
