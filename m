Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AD71548F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 20:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYmAIymZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699041670; x=1730577670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DCjiCeLrGZ3G0qs4tioatopoEeANFDyBR2PegV4B+vM=;
  b=SYmAIymZCzO0fHAX5LiMhArrH0GEBkGkPUqTeS+diJ5xpmiK6DgKiObE
   /DNX+kl/3poTyGg1+d5h7hFnhlra4nuHSeCulLRLaShNh96gMf50j9rkT
   NPqcyihEU7nFBo4ygUw7eFMrg9WOsfo7VU40boAyJitmjW8KAOZFi6Ces
   JIV7e9YiyMYi5adW3ORtmDMzbltoKVa/tyj0uh0Ilnj75IuJ8M6bUv5qh
   nO6PdlzyyJmd8VPrzYJN2o08ZsUweXBhzfCTET0ItqDXuj1ZPUKSmBGT/
   BgpBlzBdk9kR398ElKRsiuNxt3jKPkT1FVVWVf49oREADT7X4j1uj8QRM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1963833"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1963833"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 13:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="761720489"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="761720489"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Nov 2023 13:01:06 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz0Ln-0002u4-1k;
	Fri, 03 Nov 2023 20:01:03 +0000
Date: Sat, 4 Nov 2023 04:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:63: error:
 'VM_MAP' undeclared; did you mean 'VM_MTE'?
Message-ID: <202311040336.lIugcJiz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   765670365233dc7ad139e5e96c437d333ae94543
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231104/202311040336.lIugcJiz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040336.lIugcJiz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040336.lIugcJiz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/img/vxe-vxd/common/img_mem_man.c:24:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c: In function 'unified_free':
   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:159:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     159 |                 vunmap(buffer->kptr);
         |                 ^~~~~~
         |                 kunmap
   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c: In function 'unified_map_km':
   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:24: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     197 |         buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
         |                        ^~~~
         |                        kmap
>> drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:63: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
     197 |         buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
         |                                                               ^~~~~~
         |                                                               VM_MTE
   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:63: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   In file included from drivers/media/platform/img/vxe-vxd/common/imgmmu.c:20:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/img/vxe-vxd/common/work_queue.c: In function 'get_delayed_work_buff':
>> drivers/media/platform/img/vxe-vxd/common/work_queue.c:148:22: warning: variable 'previous' set but not used [-Wunused-but-set-variable]
     148 |         struct node *previous = NULL;
         |                      ^~~~~~~~
--
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'stream_worker':
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:550:25: warning: variable 'vxd' set but not used [-Wunused-but-set-variable]
     550 |         struct vxd_dev *vxd = NULL;
         |                         ^~~
   In file included from include/linux/mm_types.h:14,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:7,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:16:
   In function 'init_completion',
       inlined from 'vxd_prepare_fw' at drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1389:2:
   include/linux/completion.h:86:17: warning: array subscript 'struct completion[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
      86 |         x->done = 0;
         |         ~~~~~~~~^~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:18:
   In function 'kmalloc',
       inlined from 'vxd_prepare_fw' at drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1384:31:
   include/linux/slab.h:553:24: note: object of size 4 allocated by 'kmalloc_trace'
     553 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     554 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                                 flags, size);
         |                                 ~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'vxd_send_msg':
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1460:25: warning: array subscript 1 is outside array bounds of 'unsigned int[0]' [-Warray-bounds=]
    1460 |         if (msg->payload[VXD_PTD_MSG_OFFSET] != 0) {
         |             ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_pvdec_priv.h:22,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:33:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_dec.h:90:22: note: while referencing 'payload'
      90 |         unsigned int payload[0];
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1496:26: warning: array subscript 1 is outside array bounds of 'unsigned int[0]' [-Warray-bounds=]
    1496 |         item->msg.payload[VXD_PTD_MSG_OFFSET] = stream->ptd;
         |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_dec.h:90:22: note: while referencing 'payload'
      90 |         unsigned int payload[0];
         |                      ^~~~~~~
--
   drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:782:13: warning: 'hwctrl_dump_state' defined but not used [-Wunused-function]
     782 | static void hwctrl_dump_state(struct vxd_states *prev_state,
         |             ^~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:22:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_int.h:24,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:41:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:34:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c: In function 'vxd_set_reconpictcmds':
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:70:9: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      70 |         REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, type); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:559:9: note: in expansion of macro 'REGIO_WRITE_FIELD_LITE'
     559 |         REGIO_WRITE_FIELD_LITE(pict_cmds[VDECFW_CMD_CODED_PICTURE],
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:70:9: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      70 |         REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, type); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:559:9: note: in expansion of macro 'REGIO_WRITE_FIELD_LITE'
     559 |         REGIO_WRITE_FIELD_LITE(pict_cmds[VDECFW_CMD_CODED_PICTURE],
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:70:9: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      70 |         REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, type); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:563:9: note: in expansion of macro 'REGIO_WRITE_FIELD_LITE'
     563 |         REGIO_WRITE_FIELD_LITE(pict_cmds[VDECFW_CMD_CODED_PICTURE],
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:70:9: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      70 |         REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, type); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:563:9: note: in expansion of macro 'REGIO_WRITE_FIELD_LITE'
     563 |         REGIO_WRITE_FIELD_LITE(pict_cmds[VDECFW_CMD_CODED_PICTURE],
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:607:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     607 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_OPERATING_MODE],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:607:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     607 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_OPERATING_MODE],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:613:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     613 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_OPERATING_MODE],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:613:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     613 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_OPERATING_MODE],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:769:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     769 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:769:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     769 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:773:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     773 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:773:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     773 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c: In function 'vxd_set_altpictcmds':
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:864:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     864 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:864:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     864 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:869:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     869 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:869:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     869 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c: In function 'vxd_getscalercmds':
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:925:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     925 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:925:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     925 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:931:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     931 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:931:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
     931 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1014:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1014 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_OUTPUT_SIZE],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1014:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1014 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_OUTPUT_SIZE],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1019:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1019 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_OUTPUT_SIZE],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1019:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1019 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_OUTPUT_SIZE],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1025:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1025 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_HORIZONTAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1025:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1025 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_HORIZONTAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1029:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1029 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_HORIZONTAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1029:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1029 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_HORIZONTAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1034:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1034 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_HORIZONTAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1034:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1034 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_HORIZONTAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1038:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1038 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_HORIZONTAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1038:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1038 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_HORIZONTAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1044:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1044 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_VERTICAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1044:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1044 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_VERTICAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1048:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1048 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_VERTICAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1048:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1048 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_VERTICAL_SCALE_CONTROL],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1053:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1053 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_VERTICAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1053:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1053 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_VERTICAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: warning: '__value' is used uninitialized [-Wuninitialized]
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1057:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1057 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_VERTICAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:22: note: '__value' was declared here
      42 |                 type __value = value; \
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:17: note: in expansion of macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:1057:9: note: in expansion of macro 'REGIO_WRITE_FIELD'
    1057 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_SCALE_VERTICAL_CHROMA],
         |         ^~~~~~~~~~~~~~~~~
..


vim +197 drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c

309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  170  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  171  static int unified_map_km(struct heap *heap, struct buffer *buffer)
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  172  {
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  173  	void *dev = buffer->device;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  174  	void *sgt = buffer->priv;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  175  	void *sgl = img_mmu_get_sgl(sgt);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  176  	unsigned int num_pages = sg_nents(sgl);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  177  	unsigned int orig_nents = img_mmu_get_orig_nents(sgt);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  178  	void **pages;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  179  	int ret;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  180  	pgprot_t prot;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  181  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  182  	dev_dbg(dev, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__, buffer->id, buffer);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  183  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  184  	if (buffer->kptr) {
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  185  		dev_warn(dev, "%s called for already mapped buffer %d\n", __func__, buffer->id);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  186  		return 0;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  187  	}
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  188  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  189  	pages = kmalloc_array(num_pages, sizeof(void *), GFP_KERNEL);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  190  	if (!pages)
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  191  		return -ENOMEM;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  192  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  193  	img_mmu_get_pages(pages, sgt);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  194  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  195  	prot = PAGE_KERNEL;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  196  	prot = pgprot_writecombine(prot);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25 @197  	buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  198  	kfree(pages);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  199  	if (!buffer->kptr) {
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  200  		dev_err(dev, "%s vmap failed!\n", __func__);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  201  		return -EFAULT;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  202  	}
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  203  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  204  	ret = dma_map_sg(dev, sgl, orig_nents, DMA_FROM_DEVICE);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  205  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  206  	if (ret <= 0) {
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  207  		dev_err(dev, "%s dma_map_sg failed!\n", __func__);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  208  		vunmap(buffer->kptr);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  209  		return -EFAULT;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  210  	}
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  211  	dev_dbg(dev, "%s:%d buffer %d orig_nents %d nents %d\n", __func__,
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  212  		__LINE__, buffer->id, orig_nents, ret);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  213  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  214  	img_mmu_set_sgt_nents(sgt, ret);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  215  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  216  	dev_dbg(dev, "%s:%d buffer %d vmap to 0x%p\n", __func__, __LINE__,
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  217  		buffer->id, buffer->kptr);
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  218  
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  219  	return 0;
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  220  }
309ef81727dfe5a drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  221  

:::::: The code at line 197 was first introduced by commit
:::::: 309ef81727dfe5aec2a8cbcf0db6d42e7c7292e8 v4l: vxd-dec: Create vxd_dec Mem Manager helper library

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
