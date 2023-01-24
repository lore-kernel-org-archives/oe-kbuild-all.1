Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0C6A5E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 05:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674537404; x=1706073404;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Uo0wout2+iBrj/L6YytqnihCb5YljOB25hxK6koSQC8=;
  b=FhS723D+YvG9+ui/pBfY9tPxR6+HAYBq+r/qoDptM0/XUGbDieAUCKPm
   coVtzSQt3VcGPYyAPoYnD//ILwTUdQGmPaU8xdKIaTgwu7cDAv6HZFpzJ
   XcucdLErChP+xEkjhjgrLZJtAmAEu1Bgz8oS5O5b4BHWTZ1Bj+3xbbHvC
   9Av2ryBdqQUkHpkdY7H1hchUZsBOPCbeW/js12PFN8S67mf5mYUH4WZFK
   LC77ZVXjbHoCmuzkNhy2OwoZCDvA+UY4RkNjRF6UPNIbaCW4l+TdQOWDs
   KcCS5NthjW2rF/b8X5Un4VtQ4RdDEWdsknrwT4t3/nu/dturk8UwNXT37
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328317320"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="328317320"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 21:16:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="835853977"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="835853977"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Jan 2023 21:16:41 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKBfk-0006AC-2N;
	Tue, 24 Jan 2023 05:16:40 +0000
Date: Tue, 24 Jan 2023 13:16:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>, Andrew Davis <afd@ti.com>
Subject: [ti:ti-linux-5.10.y 20399/20446]
 drivers/media/platform/chips-media/wave5/wave5-hw.c:122:28: warning: left
 shift count >= width of type
Message-ID: <202301241310.HZs4qszu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nas,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y
head:   90976f615b7ec6d31eba0db18c5b6844a3371e10
commit: 0701e20ef09c97d8bd786ac9489284e8eb5401b7 [20399/20446] wave5: Support 48bit memory address.
config: h8300-randconfig-r021-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241310.HZs4qszu-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y
        git checkout 0701e20ef09c97d8bd786ac9489284e8eb5401b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/media/platform/chips-media/wave5/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/platform/chips-media/wave5/wave5-hw.c: In function 'wave5_read_reg_for_mem_addr':
>> drivers/media/platform/chips-media/wave5/wave5-hw.c:122:28: warning: left shift count >= width of type [-Wshift-count-overflow]
     122 |         addr = ((high_addr << 32) | val);
         |                            ^~
--
   drivers/media/platform/chips-media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:284:49: warning: right shift count >= width of type [-Wshift-count-overflow]
     284 |         dev->ext_addr = ((dev->common_mem.daddr >> 32) & 0xFFFF);
         |                                                 ^~


vim +122 drivers/media/platform/chips-media/wave5/wave5-hw.c

   113	
   114	static dma_addr_t wave5_read_reg_for_mem_addr(struct vpu_instance *inst,
   115						      unsigned int reg_addr)
   116	{
   117		dma_addr_t addr;
   118		dma_addr_t high_addr = inst->dev->ext_addr;
   119		u32 val;
   120	
   121		val = vpu_read_reg(inst->dev, reg_addr);
 > 122		addr = ((high_addr << 32) | val);
   123	
   124		return addr;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
