Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB02C1A5BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkMDuer1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697640185; x=1729176185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dJAUzcHFxiFeW5SVWfQjRE+pWzhgNIRbTyhY6xZjPMU=;
  b=TkMDuer1wbpF2LiQlcfId1LPVEZFhlV3xzoIQ5a80tuhzpzI+Y67CVoQ
   Wet++Vi18am4uljZDrbQmcfFyBPa8Skuy70jepjgVuadyMDZVLluBzD4T
   XI9R7k+r5b3zFrhaOsWbnRIp4FynIFw/SHYOGHlVwlEED4P7ATooa5aBK
   3LoSmfoOEABBCzEWtrGTvJcIKONTzBeuYBaOrGyRfcuycVEQmKVitftOS
   Vd5aJXsu21aIlacFZ4vv21x6c+jaFbutL+ozH9f/vQWlbLsOCOG685UC2
   ltwETMjkDmE+I+Xp6M9G94kyQ9yGC1UbufjtXZ7sQ2IVN5szH3I0Y6ALR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="472252945"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="472252945"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 07:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="785951706"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="785951706"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Oct 2023 07:43:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt7lD-0000Wk-0P;
	Wed, 18 Oct 2023 14:42:59 +0000
Date: Wed, 18 Oct 2023 22:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: drivers/accel/qaic/qaic_control.c:348:17: warning: array subscript
 'struct wrapper_msg[0]' is partly outside array bounds of 'unsigned
 char[44]'
Message-ID: <202310182253.bcb9JcyJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jeffrey,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06dc10eae55b5ceabfef287a7e5f16ceea204aa0
commit: 759662e4f1f8cd6ea0ec466e10cf29fe7c1fec36 accel/qaic: Add qaic driver to the build system
date:   7 months ago
config: i386-buildonly-randconfig-006-20230906 (https://download.01.org/0day-ci/archive/20231018/202310182253.bcb9JcyJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310182253.bcb9JcyJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182253.bcb9JcyJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'add_wrapper',
       inlined from 'abort_dma_cont' at drivers/accel/qaic/qaic_control.c:1107:12,
       inlined from 'qaic_manage_msg_xfer' at drivers/accel/qaic/qaic_control.c:1165:9:
>> drivers/accel/qaic/qaic_control.c:348:17: warning: array subscript 'struct wrapper_msg[0]' is partly outside array bounds of 'unsigned char[44]' [-Warray-bounds]
     348 |         w->head = wrappers;
         |         ~~~~~~~~^~~~~~~~~~
   In file included from include/linux/fs.h:45,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:855,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:10,
                    from drivers/accel/qaic/qaic_control.c:10:
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:720:9,
       inlined from 'add_wrapper' at drivers/accel/qaic/qaic_control.c:342:26,
       inlined from 'abort_dma_cont' at drivers/accel/qaic/qaic_control.c:1107:12,
       inlined from 'qaic_manage_msg_xfer' at drivers/accel/qaic/qaic_control.c:1165:9:
   include/linux/slab.h:580:24: note: object of size 44 allocated by 'kmalloc_trace'
     580 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     581 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                                 flags, size);
         |                                 ~~~~~~~~~~~~
   In function 'abort_dma_cont',
       inlined from 'qaic_manage_msg_xfer' at drivers/accel/qaic/qaic_control.c:1165:9:
   drivers/accel/qaic/qaic_control.c:1121:22: warning: array subscript 'struct wrapper_msg[0]' is partly outside array bounds of 'unsigned char[44]' [-Warray-bounds]
    1121 |         wrapper->len = size;
         |         ~~~~~~~~~~~~~^~~~~~
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:720:9,
       inlined from 'add_wrapper' at drivers/accel/qaic/qaic_control.c:342:26,
       inlined from 'abort_dma_cont' at drivers/accel/qaic/qaic_control.c:1107:12,
       inlined from 'qaic_manage_msg_xfer' at drivers/accel/qaic/qaic_control.c:1165:9:
   include/linux/slab.h:580:24: note: object of size 44 allocated by 'kmalloc_trace'
     580 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     581 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     582 |                                 flags, size);
         |                                 ~~~~~~~~~~~~


vim +348 drivers/accel/qaic/qaic_control.c

129776ac2e38231 Jeffrey Hugo 2023-03-27  339  
129776ac2e38231 Jeffrey Hugo 2023-03-27  340  static struct wrapper_msg *add_wrapper(struct wrapper_list *wrappers, u32 size)
129776ac2e38231 Jeffrey Hugo 2023-03-27  341  {
129776ac2e38231 Jeffrey Hugo 2023-03-27  342  	struct wrapper_msg *w = kzalloc(size, GFP_KERNEL);
129776ac2e38231 Jeffrey Hugo 2023-03-27  343  
129776ac2e38231 Jeffrey Hugo 2023-03-27  344  	if (!w)
129776ac2e38231 Jeffrey Hugo 2023-03-27  345  		return NULL;
129776ac2e38231 Jeffrey Hugo 2023-03-27  346  	list_add_tail(&w->list, &wrappers->list);
129776ac2e38231 Jeffrey Hugo 2023-03-27  347  	kref_init(&w->ref_count);
129776ac2e38231 Jeffrey Hugo 2023-03-27 @348  	w->head = wrappers;
129776ac2e38231 Jeffrey Hugo 2023-03-27  349  	return w;
129776ac2e38231 Jeffrey Hugo 2023-03-27  350  }
129776ac2e38231 Jeffrey Hugo 2023-03-27  351  

:::::: The code at line 348 was first introduced by commit
:::::: 129776ac2e38231fa9c02ce20e116c99de291666 accel/qaic: Add control path

:::::: TO: Jeffrey Hugo <quic_jhugo@quicinc.com>
:::::: CC: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
