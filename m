Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4C628E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 18:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685127403; x=1716663403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ipZuSgpy1gS+Qfwg/ob+kjrlnsftp73pxyYoFCBu30=;
  b=FMggQhcpiHs/xHr7OX7thbBERV17dsL0QoDCyQLPEMybG8xKMFvTD7JB
   HZYRiKohZgk7L0SW5ssY/jINoDPw1l0HxIRsBkhgFSMAoa06Vu+Y3/8a6
   B5bFDO0j6xjsLSywx4r4T/fNfq4xElMVZy18dhC558xbU3W9dszMZYP7c
   GnrapkigdfDjVCwbBwzFsd/NJgor3N5FbVbCJDOfW/g1BMYXU3vUdZ0N5
   +LpgJZInBsa0WrBQVvWsH3w0kdD+6JNljvBlqJuICSCptwgG3pDtcNnLw
   PSFs9OZI49XYtECKv2faRQrOCfdWpfZxR+kOPMQsDXxblTPfAm2n3wIsf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343773914"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="343773914"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 11:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="738374902"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="738374902"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2023 11:56:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2ccD-000JXg-0L;
	Fri, 26 May 2023 18:56:41 +0000
Date: Sat, 27 May 2023 02:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 4/8] lib/spdm.c:578:13: error: assignment to 'struct
 spdm_get_capabilities_reqrsp *' from incompatible pointer type 'u8 *' {aka
 'unsigned char *'}
Message-ID: <202305270232.hbVqeLpX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   6ffa3ef7cf68997f16b363bcb583c872a9e31f99
commit: 2f5aeff1cb43a10c2e1c97b2785977485c32a1e7 [4/8] PCI/CMA: Authenticate devices on enumeration
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230527/202305270232.hbVqeLpX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/l1k/linux/commit/2f5aeff1cb43a10c2e1c97b2785977485c32a1e7
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout 2f5aeff1cb43a10c2e1c97b2785977485c32a1e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270232.hbVqeLpX-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/spdm.c: In function 'spdm_get_capabilities':
>> lib/spdm.c:578:13: error: assignment to 'struct spdm_get_capabilities_reqrsp *' from incompatible pointer type 'u8 *' {aka 'unsigned char *'} [-Werror=incompatible-pointer-types]
     578 |         rsp = (u8 *)req + req_sz;
         |             ^
   lib/spdm.c: In function 'spdm_authenticate':
   lib/spdm.c:1238:22: error: too few arguments to function 'kzalloc'
    1238 |         transcript = kzalloc(sizeof(struct spdm_get_version_rsp) +
         |                      ^~~~~~~
   In file included from include/linux/crypto.h:17,
                    from include/crypto/hash.h:12,
                    from lib/spdm.c:22:
   include/linux/slab.h:678:37: note: declared here
     678 | static inline __alloc_size(1) void *kzalloc(size_t size, gfp_t flags)
         |                                     ^~~~~~~
   cc1: some warnings being treated as errors


vim +578 lib/spdm.c

7e7ebf8de0b00c Jonathan Cameron 2022-09-06  554  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  555  static int spdm_get_capabilities(struct spdm_state *spdm_state,
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  556  				 struct spdm_get_capabilities_reqrsp *req,
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  557  				 size_t *reqrsp_sz)
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  558  {
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  559  	struct spdm_get_capabilities_reqrsp *rsp;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  560  	size_t req_sz;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  561  	size_t rsp_sz;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  562  	int rc, length;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  563  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  564  	req->code = SPDM_GET_CAPABILITIES;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  565  	req->ctexponent = SPDM_CTEXPONENT;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  566  	req->flags = cpu_to_le32(SPDM_CAPS);
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  567  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  568  	if (spdm_state->version >= 0x12) {
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  569  		req->data_transfer_size = cpu_to_le32(spdm_state->transport_sz),
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  570  		req->max_spdm_msg_size = cpu_to_le32(UINT_MAX),
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  571  		req_sz = sizeof(*req);
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  572  		rsp_sz = sizeof(*rsp);
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  573  	} else {
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  574  		req_sz = offsetof(typeof(*req), data_transfer_size);
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  575  		rsp_sz = offsetof(typeof(*rsp), data_transfer_size);
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  576  	}
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  577  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06 @578  	rsp = (u8 *)req + req_sz;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  579  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  580  	rc = spdm_exchange(spdm_state, req, req_sz, rsp, rsp_sz);
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  581  	if (rc < 0)
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  582  		return rc;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  583  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  584  	length = rc;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  585  	if (length < rsp_sz) {
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  586  		dev_err(spdm_state->dev, "Truncated capabilities response\n");
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  587  		return -EIO;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  588  	}
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  589  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  590  	spdm_state->responder_caps = le32_to_cpu(rsp->flags);
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  591  	if ((spdm_state->responder_caps & SPDM_MIN_CAPS) != SPDM_MIN_CAPS)
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  592  		return -EPROTONOSUPPORT;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  593  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  594  	if (spdm_state->version >= 0x12) {
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  595  		u32 data_transfer_size = le32_to_cpu(rsp->data_transfer_size);
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  596  		if (data_transfer_size < SPDM_MIN_DATA_TRANSFER_SIZE) {
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  597  			dev_err(spdm_state->dev,
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  598  				"Malformed capabilities response\n");
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  599  			return -EPROTO;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  600  		}
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  601  		spdm_state->transport_sz = min(spdm_state->transport_sz,
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  602  					       data_transfer_size);
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  603  	}
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  604  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  605  	*reqrsp_sz += req_sz + rsp_sz;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  606  
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  607  	return 0;
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  608  }
7e7ebf8de0b00c Jonathan Cameron 2022-09-06  609  

:::::: The code at line 578 was first introduced by commit
:::::: 7e7ebf8de0b00c1f6975a8ca14fa97488e21fa34 spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
