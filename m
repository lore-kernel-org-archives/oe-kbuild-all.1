Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6020A11CB1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 21:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688419886; x=1719955886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AHAt5rlvAVGQDJBLvoDDHE7DfyWAWCATIwSEEN3E13o=;
  b=XVq6+H9OWvnm3xC+7IgYQuRxNBRXo7MOw17t1QRyMAfZThSPc+6Lu3ds
   EOHhLvH35AlTTYsr3S5Ypx1Dnw+/GSN0tPPcGqLnk3gC3ViQD3nulNhGp
   75AkqPuhZgMVVTr5Np2bjkBphQSOvDQ4R+mLPo3Z9OtAj7IXIPpR8K5XY
   O5MRRDum069yjos3aVmrpwr3iHBa4MDU2tfdB6m+siKp/L9KevrHibFkN
   U+G/1WJggQnSN8XOFoNyuT57s+BVRaH3GSAvNdZhN9PTij9eyllDBfM30
   ZliFPFCE4syKU+Se+XvyKorWHBJph6pAYq/W0Cw22z+6FAYGzicSg0Fuc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="426656596"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="426656596"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 14:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748220307"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="748220307"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jul 2023 14:31:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGR8l-000HfL-2X;
	Mon, 03 Jul 2023 21:31:23 +0000
Date: Tue, 4 Jul 2023 05:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 5/11] lib/spdm.c:579:20: error: expected identifier before
 '.' token
Message-ID: <202307040546.3bJTvpoy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   ef86cf750323dde45d78c7120127e540477d12a9
commit: 2e73786e834706cd0f95afa8d91689f0cdb7f24a [5/11] PCI/CMA: Authenticate devices on enumeration
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230704/202307040546.3bJTvpoy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040546.3bJTvpoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040546.3bJTvpoy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/spdm.c: In function 'spdm_get_capabilities':
>> lib/spdm.c:579:20: error: expected identifier before '.' token
     579 |         case 0x10 .. 0x11:
         |                    ^
>> lib/spdm.c:579:20: error: expected expression before '.' token
   lib/spdm.c:583:20: error: expected identifier before '.' token
     583 |         case 0x12 .. SPDM_MAX_VER:
         |                    ^
   lib/spdm.c:583:20: error: expected expression before '.' token
>> lib/spdm.c:588:17: error: expected expression before 'break'
     588 |                 break;
         |                 ^~~~~
   lib/spdm.c: In function 'spdm_challenge_rsp_sz':
   lib/spdm.c:1032:9: warning: this 'else' clause does not guard... [-Wmisleading-indentation]
    1032 |         else
         |         ^~~~
   lib/spdm.c:1035:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'else'
    1035 |                 size += 2;                      /* OpaqueDataLength */
         |                 ^~~~
   lib/spdm.c: In function 'spdm_challenge':
   lib/spdm.c:1119:20: error: expected identifier before '.' token
    1119 |         case 0x10 .. 0x12:
         |                    ^
   lib/spdm.c:1119:20: error: expected expression before '.' token
   lib/spdm.c:1122:20: error: expected identifier before '.' token
    1122 |         case 0x13 .. SPDM_MAX_VER:
         |                    ^
   lib/spdm.c:1122:20: error: expected expression before '.' token
   lib/spdm.c: In function 'spdm_get_capabilities':
>> lib/spdm.c:581:24: warning: statement will never be executed [-Wswitch-unreachable]
     581 |                 rsp_sz = offsetof(typeof(*rsp), data_transfer_size);


vim +579 lib/spdm.c

4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  564  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  565  static int spdm_get_capabilities(struct spdm_state *spdm_state,
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  566  				 struct spdm_get_capabilities_reqrsp *req,
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  567  				 size_t *reqrsp_sz)
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  568  {
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  569  	struct spdm_get_capabilities_reqrsp *rsp;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  570  	size_t req_sz;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  571  	size_t rsp_sz;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  572  	int rc, length;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  573  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  574  	req->code = SPDM_GET_CAPABILITIES;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  575  	req->ctexponent = SPDM_CTEXPONENT;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  576  	req->flags = cpu_to_le32(SPDM_CAPS);
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  577  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  578  	switch (spdm_state->version) {
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06 @579  	case 0x10 .. 0x11:
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  580  		req_sz = offsetof(typeof(*req), data_transfer_size);
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06 @581  		rsp_sz = offsetof(typeof(*rsp), data_transfer_size);
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  582  		break;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  583  	case 0x12 .. SPDM_MAX_VER:
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  584  		req_sz = sizeof(*req);
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  585  		rsp_sz = sizeof(*rsp);
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  586  		req->data_transfer_size = cpu_to_le32(spdm_state->transport_sz),
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  587  		req->max_spdm_msg_size = cpu_to_le32(UINT_MAX),
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06 @588  		break;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  589  	}
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  590  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  591  	rsp = (void *)req + req_sz;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  592  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  593  	rc = spdm_exchange(spdm_state, req, req_sz, rsp, rsp_sz);
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  594  	if (rc < 0)
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  595  		return rc;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  596  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  597  	length = rc;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  598  	if (length < rsp_sz) {
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  599  		dev_err(spdm_state->dev, "Truncated capabilities response\n");
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  600  		return -EIO;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  601  	}
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  602  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  603  	spdm_state->responder_caps = le32_to_cpu(rsp->flags);
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  604  	if ((spdm_state->responder_caps & SPDM_MIN_CAPS) != SPDM_MIN_CAPS)
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  605  		return -EPROTONOSUPPORT;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  606  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  607  	if (spdm_state->version >= 0x12) {
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  608  		u32 data_transfer_size = le32_to_cpu(rsp->data_transfer_size);
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  609  		if (data_transfer_size < SPDM_MIN_DATA_TRANSFER_SIZE) {
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  610  			dev_err(spdm_state->dev,
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  611  				"Malformed capabilities response\n");
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  612  			return -EPROTO;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  613  		}
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  614  		spdm_state->transport_sz = min(spdm_state->transport_sz,
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  615  					       data_transfer_size);
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  616  	}
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  617  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  618  	*reqrsp_sz += req_sz + rsp_sz;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  619  
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  620  	return 0;
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  621  }
4d1ca4ba3c1d96 Jonathan Cameron 2022-09-06  622  

:::::: The code at line 579 was first introduced by commit
:::::: 4d1ca4ba3c1d969b9f263aa25c7f12f29dfc71f0 spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
