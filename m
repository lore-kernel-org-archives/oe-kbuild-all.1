Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B0F39A7FA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803607; cv=none; b=lr4vGR034XE+PYSsgFmoZIYluuRjwWS8XhXDDmUN534s2wStsO6/HlwpbUgyM+lYVuuC2YhGZirLTCISy632PRRYCUjouNQeF47Nk9mJoIVX2wsfuZK1BHFH+tNmlApfgx8OFnyET0OeDy7knzL22hLDmw5jA9ttS57pAzTXRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803607; c=relaxed/simple;
	bh=u807GDXl6AfyYnwhstz4xz6F9IaRZh4bPJgTrqhtQSw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PIsodHd5WXhsjKgQanhd2dwqGuND/kYk7KTOx5iAMfNT7RtPgz6P+92TDR96t1plnTGZxoPrVN7kq81kVmV+jv3wUsjFkgX89nXwJyuK28ORCUQGWrhdYLQbgovZXF1LZ0NC1LEJ4GRpd2UGKP91l38uoFmyUxBIBk0LkripLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0IaFx2o; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0IaFx2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772803605; x=1804339605;
  h=date:from:to:cc:subject:message-id;
  bh=u807GDXl6AfyYnwhstz4xz6F9IaRZh4bPJgTrqhtQSw=;
  b=R0IaFx2o6EpIMsDdHT4j7cIjg+Mb5Y2Fg4phNxw6ckumj997xGmwZeM6
   ta2CjH1qyiyOxaXw9vxNF4wXSmjkz7zmidgbl/UuzS5J6tuvxnVBVUTTh
   ziekktXrRW4GzAGaU4KzwUq6hvRhjt7Esq6hkSFW+M0TWGYHyDA58H26S
   gu5uceHSJd0IcQAxkOYEGkdGQIYYz9agvIOzdOMf0K68d/AT9RTQlrbx/
   8fY264yyxs/hXuVIwJyx0Ev/xJ33VNbHG9VHV1DQzio+8lxIe3eNjYsJo
   5Wy/7b3bXZztpmMWyCXjISnzZzmD8xZCetvxtBfeZJRdT/BgQu5fEDsDM
   g==;
X-CSE-ConnectionGUID: 1wElpWXRRo6/1/H4E7bbfg==
X-CSE-MsgGUID: 62hupj28S8+dxLBJe2ZmDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84236453"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84236453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 05:26:42 -0800
X-CSE-ConnectionGUID: cTAPoCizTnOw/03vjHTuKA==
X-CSE-MsgGUID: I9qlTEPDSIW6WuizPpxDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="216143993"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 05:26:40 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyVCP-000000000sT-45g4;
	Fri, 06 Mar 2026 13:26:37 +0000
Date: Fri, 06 Mar 2026 21:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1]
 block/blk-mq-tag.h:42:43: warning: declaration of 'struct blk_mq_alloc_data'
 will not be visible outside of this function
Message-ID: <202603062119.zT34zQPx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Todd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   616facef85c6671c7a18d5cac129b886025496ea
commit: 3dc6e416a159a0bf3336e4c3469531fbbd128146 [0/1] ANDROID: force struct blk_mq_alloc_data to be defined in KMI
config: x86_64-randconfig-016-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062119.zT34zQPx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062119.zT34zQPx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062119.zT34zQPx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:11:
   In file included from block/blk-mq.h:6:
>> block/blk-mq-tag.h:42:43: warning: declaration of 'struct blk_mq_alloc_data' will not be visible outside of this function [-Wvisibility]
      42 | extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
         |                                           ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:11:
   block/blk-mq.h:281:19: error: no member named 'plug' in 'struct task_struct'
     281 |                 return current->plug;
         |                        ~~~~~~~  ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
>> block/blk-mq-sched.h:27:55: warning: declaration of 'struct elevator_type' will not be visible outside of this function [-Wvisibility]
      27 | int blk_mq_init_sched(struct request_queue *q, struct elevator_type *e);
         |                                                       ^
   block/blk-mq-sched.h:47:12: error: incomplete definition of type 'struct elevator_queue'
      47 |         if (e && e->type->ops.allow_merge)
         |                  ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:48:11: error: incomplete definition of type 'struct elevator_queue'
      48 |                 return e->type->ops.allow_merge(q, rq, bio);
         |                        ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:57:12: error: incomplete definition of type 'struct elevator_queue'
      57 |         if (e && e->type->ops.completed_request)
         |                  ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:58:4: error: incomplete definition of type 'struct elevator_queue'
      58 |                 e->type->ops.completed_request(rq, now);
         |                 ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:66:44: error: incomplete definition of type 'struct elevator_queue'
      66 |         if ((rq->rq_flags & RQF_ELVPRIV) && e && e->type->ops.requeue_request)
         |                                                  ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:67:4: error: incomplete definition of type 'struct elevator_queue'
      67 |                 e->type->ops.requeue_request(rq);
         |                 ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:74:12: error: incomplete definition of type 'struct elevator_queue'
      74 |         if (e && e->type->ops.has_work)
         |                  ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
   In file included from block/blk.h:12:
   block/blk-mq-sched.h:75:11: error: incomplete definition of type 'struct elevator_queue'
      75 |                 return e->type->ops.has_work(hctx);
         |                        ~^
   include/linux/blkdev.h:36:8: note: forward declaration of 'struct elevator_queue'
      36 | struct elevator_queue;
         |        ^
   In file included from block/vendor_hooks.c:6:
>> block/blk.h:206:17: warning: declaration of 'struct elevator_type' will not be visible outside of this function [-Wvisibility]
     206 |                               struct elevator_type *new_e);
         |                                      ^
   4 warnings and 9 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +42 block/blk-mq-tag.h

32bc15afed04bd John Garry 2020-08-19  41  
cb96a42cc1f50b Ming Lei   2014-06-01 @42  extern unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
cae740a04b4d6d John Garry 2020-02-26  43  extern void blk_mq_put_tag(struct blk_mq_tags *tags, struct blk_mq_ctx *ctx,
cae740a04b4d6d John Garry 2020-02-26  44  			   unsigned int tag);
70f36b6001bf59 Jens Axboe 2017-01-19  45  extern int blk_mq_tag_update_depth(struct blk_mq_hw_ctx *hctx,
70f36b6001bf59 Jens Axboe 2017-01-19  46  					struct blk_mq_tags **tags,
70f36b6001bf59 Jens Axboe 2017-01-19  47  					unsigned int depth, bool can_grow);
32bc15afed04bd John Garry 2020-08-19  48  extern void blk_mq_tag_resize_shared_sbitmap(struct blk_mq_tag_set *set,
32bc15afed04bd John Garry 2020-08-19  49  					     unsigned int size);
32bc15afed04bd John Garry 2020-08-19  50  

:::::: The code at line 42 was first introduced by commit
:::::: cb96a42cc1f50ba1c7b1e9b2343bec80b926107f blk-mq: fix schedule from atomic context

:::::: TO: Ming Lei <tom.leiming@gmail.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
