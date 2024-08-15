Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4F319D894
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723712168; cv=none; b=HdlKlWmTFfZt1HJRFmo0TjuYt0f0URwB249lqTqf4DH5ntxQkK3fv7HC/0uq93s6fewdWS3Qmk/cG5bA8269M42WsbyslUrLAkbfO/fYttXP5hvWDVge3odUBygw9A93c4O+8yBcjpQqA3fZxu1kGsbAQrC9PJ0DQY/Yr+hq61I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723712168; c=relaxed/simple;
	bh=M1DvPGwijVTFQ3FqE7suaTpoUBUndmqgJRCfSTjgaks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D4XBMiKWJHP6su/27hO26kpAwfdpWH8CEc2G0DsKe+oMcmFREdMfHpZnfGdiwn8tKuG0HQ5GV6nJrOAxe/7GaVjV88+MBt06Vqim9uYFKTqX3vB0cAROzAR/ZeuoOMDGn5OWS0Sg9DKMeoufDw+3d1gHtA1z0UBRRnLVFQ2eljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InwNKiji; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InwNKiji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723712166; x=1755248166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M1DvPGwijVTFQ3FqE7suaTpoUBUndmqgJRCfSTjgaks=;
  b=InwNKijivJHmvdSWfu4o5bwg+a5i90MtSNKcnnc6AXrgz1Y8q9OiBknG
   fQsimra3tw+qSqopzG7yy8TZ5NXeEU7NNrqzjz/9bJfeC5WfS0nCQiI/k
   5dHuO4sH71pkiUgCGAqmByvwfLxaNxHh1M0VlkD1SLnSacaEMesSSeWKp
   gGSpcXN/rZ4bO9zI5ujZMwNH28SVqUEBUdDd+asqIXldxgqJilwTbu+oe
   O0ZIpOyAWUsGOLVMR0pb+R/VuM92xT2wPYY4AKFx0s1H3rn1KAwjzAZ5U
   6yFpv5rClUbo5FK3Rd7vU9SeA5HMwfxf96ePSSO7XUAzu0iigG0ECsVK9
   g==;
X-CSE-ConnectionGUID: u+gmgqHnTIKN5xrUXs8VLQ==
X-CSE-MsgGUID: R7NM7xyrQsmz4SISBwN5DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="13025361"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="13025361"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 01:56:05 -0700
X-CSE-ConnectionGUID: UU2stgCVQdCrLKFG29cGqw==
X-CSE-MsgGUID: PPdED7OrTAq68R/3WOXBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600"; 
   d="scan'208";a="60054970"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Aug 2024 01:56:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seWH2-0003LY-35;
	Thu, 15 Aug 2024 08:56:00 +0000
Date: Thu, 15 Aug 2024 16:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.1.y-cicd 406/1393]
 drivers/media/platform/img/vxe-vxd/common/work_queue.c:42:15: warning:
 allocation of insufficient size '8' for type 'struct work_struct' with size
 '96'
Message-ID: <202408151651.rXeRmyMF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-linux-6.1.y-cicd
head:   9391697ba76863942bbe649df45839eab77039cc
commit: 98e8ac20e59a87199bbd8b144f0551440b4de0ab [406/1393] TI: media: platform: img: add the vxe-vxd driver into the build infra
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240815/202408151651.rXeRmyMF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151651.rXeRmyMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151651.rXeRmyMF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/common/work_queue.c: In function 'init_work':
>> drivers/media/platform/img/vxe-vxd/common/work_queue.c:42:15: warning: allocation of insufficient size '8' for type 'struct work_struct' with size '96' [-Walloc-size]
      42 |         *work = kzalloc(sizeof(*work), GFP_KERNEL);
         |               ^
   drivers/media/platform/img/vxe-vxd/common/work_queue.c: In function 'init_delayed_work':
>> drivers/media/platform/img/vxe-vxd/common/work_queue.c:65:15: warning: allocation of insufficient size '8' for type 'struct delayed_work' with size '232' [-Walloc-size]
      65 |         *work = kzalloc(sizeof(*work), GFP_KERNEL);
         |               ^
   drivers/media/platform/img/vxe-vxd/common/work_queue.c: In function 'get_delayed_work_buff':
   drivers/media/platform/img/vxe-vxd/common/work_queue.c:148:22: warning: variable 'previous' set but not used [-Wunused-but-set-variable]
     148 |         struct node *previous = NULL;
         |                      ^~~~~~~~
--
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'stream_worker':
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:550:25: warning: variable 'vxd' set but not used [-Wunused-but-set-variable]
     550 |         struct vxd_dev *vxd = NULL;
         |                         ^~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'vxd_prepare_fw':
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1384:36: warning: allocation of insufficient size '8' for type 'struct completion' with size '96' [-Walloc-size]
    1384 |         *firmware_loading_complete = kmalloc(sizeof(*firmware_loading_complete), GFP_KERNEL);
         |                                    ^
--
   In file included from drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:31:
   drivers/media/platform/img/vxe-vxd/encoder/topaz_color_formats.h:18:6: warning: no previous prototype for 'plane_size' [-Wmissing-prototypes]
      18 | void plane_size(enum img_format color_format, unsigned int stride,
         |      ^~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:448:5: warning: no previous prototype for 'topaz_process_message' [-Wmissing-prototypes]
     448 | int topaz_process_message(struct topaz_stream_context *str_ctx, struct mtx_tohost_msg tohost_msg)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:706:6: warning: no previous prototype for 'handle_encoder_firmware_response' [-Wmissing-prototypes]
     706 | void handle_encoder_firmware_response(struct img_writeback_msg *wb_msg, void *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_allocate_coded_package':
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1727:18: warning: allocation of insufficient size '8' for type 'struct coded_package_host' with size '40' [-Walloc-size]
    1727 |         *package = kzalloc(sizeof(*package), GFP_KERNEL);
         |                  ^
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: At top level:
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2463:15: warning: no previous prototype for 'topaz_validate_params' [-Wmissing-prototypes]
    2463 | unsigned char topaz_validate_params(struct img_video_params *video_params,
         |               ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2767:14: warning: no previous prototype for 'topaz_insert_command' [-Wmissing-prototypes]
    2767 | unsigned int topaz_insert_command(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2786:14: warning: no previous prototype for 'topaz_insert_command_with_sync' [-Wmissing-prototypes]
    2786 | unsigned int topaz_insert_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2810:14: warning: no previous prototype for 'topaz_insert_mem_command' [-Wmissing-prototypes]
    2810 | unsigned int topaz_insert_mem_command(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2831:14: warning: no previous prototype for 'topaz_insert_mem_command_with_sync' [-Wmissing-prototypes]
    2831 | unsigned int topaz_insert_mem_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2947:6: warning: no previous prototype for 'topaz_set_pipe_usage' [-Wmissing-prototypes]
    2947 | void topaz_set_pipe_usage(unsigned char pipe, unsigned char val)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_video_destroy_context':
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:3115:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    3115 |                 if (topaz_mmu_stream_free(str_ctx->mmu_ctx,
         |                 ^~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:3119:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    3119 |                         kfree(video->coded_package[i]->header_buffer);
         |                         ^~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_send_source_frame':
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:3390:22: warning: variable 'halfway_bu' set but not used [-Wunused-but-set-variable]
    3390 |         unsigned int halfway_bu;
         |                      ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +42 drivers/media/platform/img/vxe-vxd/common/work_queue.c

db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  35  
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  36  void init_work(void **work_args, void *work_fn, uint8_t hwa_id)
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  37  {
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  38  	struct work_struct **work = (struct work_struct **)work_args;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  39  	//create a link
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  40  	struct node *link = kmalloc(sizeof(*link), GFP_KERNEL);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  41  
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25 @42  	*work = kzalloc(sizeof(*work), GFP_KERNEL);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  43  	if (!(*work)) {
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  44  		pr_err("Memory allocation failed for work_queue\n");
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  45  		return;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  46  	}
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  47  	INIT_WORK(*work, work_fn);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  48  
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  49  	link->key = (void **)work;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  50  	mutex_lock(&mutex);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  51  	//point it to old first node
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  52  	link->next = work_head;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  53  
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  54  	//point first to new first node
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  55  	work_head = link;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  56  	mutex_unlock(&mutex);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  57  }
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  58  
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  59  void init_delayed_work(void **work_args, void *work_fn, uint8_t hwa_id)
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  60  {
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  61  	struct delayed_work **work = (struct delayed_work **)work_args;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  62  	//create a link
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  63  	struct node *link = kmalloc(sizeof(*link), GFP_KERNEL);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  64  
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25 @65  	*work = kzalloc(sizeof(*work), GFP_KERNEL);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  66  	if (!(*work)) {
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  67  		pr_err("Memory allocation failed for delayed_work_queue\n");
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  68  		return;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  69  	}
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  70  	INIT_DELAYED_WORK(*work, work_fn);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  71  
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  72  	link->key = (void **)work;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  73  	mutex_lock(&mutex);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  74  	//point it to old first node
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  75  	link->next = delayed_work_head;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  76  
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  77  	//point first to new first node
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  78  	delayed_work_head = link;
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  79  	mutex_unlock(&mutex);
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  80  }
db2072ab3739da drivers/media/platform/vxe-vxd/common/work_queue.c Sidraya 2023-04-25  81  

:::::: The code at line 42 was first introduced by commit
:::::: db2072ab3739dae296cd1b9476279854caac02bb TI: v4l: vxd-dec: Add utility modules

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Guillaume La Roque <glaroque@baylibre.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
