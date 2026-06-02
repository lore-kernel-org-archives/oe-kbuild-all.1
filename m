Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A173A7F40
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780381972; cv=none; b=seL8eNl4Ok1H4I5MsptaxvEfWAbU2nh/vzjab4NZQ+Rmxz4GMM+67TcESN6bQPBeqmUQQTiHv8PSmOmsWd/J8xvqqYezZvyrcrf+GBa7ID0+9T+pk0hSViId1EFTCODzdFtY/DE1PeyWCJKOPmQImP2Xq0P22ILYv6+Xj7yP7R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780381972; c=relaxed/simple;
	bh=WnPaPjM7YtlavS1oOSfeK+UZHbxJ9/SslfnXH7BGjew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VDCQZ4HvfgDupakaEK+7Re+WzPif5hkVWXtajmq0UzV6vaQbE3L1YJQH1RvTTav819bv9PWlDayi9DvhfOtLJbB9UzpPS3xNFBKqwxU2gULZaURyb30DdoUjA6KJd+BRNiHV5yANz6XtJGa+8ELLYvVwitvtrHOOHaJXNKBMYmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dw89qXE0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dw89qXE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780381968; x=1811917968;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WnPaPjM7YtlavS1oOSfeK+UZHbxJ9/SslfnXH7BGjew=;
  b=Dw89qXE0RprGuh13glgmKsAReqHbOg8ZnlW6kEuxuyYT9rQYF8NdIjEB
   pictVA0X926aqTkSX9q7fmVWym+GERIMgc9byI3fiennPA3C+QpCk3tov
   26McsWgTLEOGsYoiE2Su0kG7h78Cuhi/M77qkZVlMNk2dwhZHuzhlun3s
   ulJzoSGQI2+nz75CBqRmNmCz6wD2tBvDmEsB8oVpAtknDf6lVU4xNKqpE
   muiGVEA1FCug3bZUQmHEZrouQddAFC842zDCogOul3Dawxev5HIyvll3k
   nnsaFtYS+RFL0A3vCE3mPPrFC8DlIvYkl1XiNwtmZYTp5wmAuTyZm84vS
   g==;
X-CSE-ConnectionGUID: /4I52mT0RC6w83VMSsTM6A==
X-CSE-MsgGUID: r+uKPPU5R26tqeogfLWrDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81129551"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81129551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 23:32:48 -0700
X-CSE-ConnectionGUID: TtA4BC7nQb6fVbU0fXLWPQ==
X-CSE-MsgGUID: 1Dfj/LrMR7+tW6xG4ql6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="267676074"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jun 2026 23:32:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUIg8-00000000Bbi-09o6;
	Tue, 02 Jun 2026 06:32:44 +0000
Date: Tue, 02 Jun 2026 14:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Subject: include/trace/events/dma_fence.h:17:1: sparse: sparse:
 dereference of noderef expression
Message-ID: <202606021430.5tyAhjfb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 21f6bcdf2be72e750dbe430b7227a66763a58466 Merge tag 'drm-misc-next-2=
026-02-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
date:   3 months ago
config: s390-randconfig-r131-20260601 (https://download.01.org/0day-ci/arch=
ive/20260602/202606021430.5tyAhjfb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 940=
9c07de6378507397ecdb6f05f628f58110112)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260602/202606021430.5tyAhjfb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 21f6bcdf2be7 ("Merge tag 'drm-misc-next-2026-02-26' of https://git=
lab.freedesktop.org/drm/misc/kernel into drm-next")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021430.5tyAhjfb-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence.c:1040:38: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected char const [noderef] =
__rcu *timeline @@     got char * @@
   drivers/dma-buf/dma-fence.c:1040:38: sparse:     expected char const [no=
deref] __rcu *timeline
   drivers/dma-buf/dma-fence.c:1040:38: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1041:36: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected char const [noderef] =
__rcu *driver @@     got char * @@
   drivers/dma-buf/dma-fence.c:1041:36: sparse:     expected char const [no=
deref] __rcu *driver
   drivers/dma-buf/dma-fence.c:1041:36: sparse:     got char *
   drivers/dma-buf/dma-fence.c: note: in included file (through include/tra=
ce/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_f=
ence.h):
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression
>> include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of no=
deref expression

vim +17 include/trace/events/dma_fence.h

e941759c74a44d6 include/trace/events/fence.h     Maarten Lankhorst 2014-07-=
01  11 =20
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  12  /*
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  13   * Safe only for call sites which are guaranteed to not race with f=
ence
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  14   * signaling,holding the fence->lock and having checked for not sig=
naled, or the
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  15   * signaling path itself.
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  16   */
62918542b7bf088 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
16 @17  DECLARE_EVENT_CLASS(dma_fence,
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  18 =20
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  19  	TP_PROTO(struct dma_fence *fence),
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  20 =20
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  21  	TP_ARGS(fence),
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  22 =20
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  23  	TP_STRUCT__entry(
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  24  		__string(driver, fence->ops->get_driver_name(fence))
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  25  		__string(timeline, fence->ops->get_timeline_name(fence))
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  26  		__field(unsigned int, context)
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  27  		__field(unsigned int, seqno)
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  28  	),
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  29 =20
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  30  	TP_fast_assign(
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  31  		__assign_str(driver);
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  32  		__assign_str(timeline);
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  33  		__entry->context =3D fence->context;
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  34  		__entry->seqno =3D fence->seqno;
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  35  	),
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  36 =20
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  37  	TP_printk("driver=3D%s timeline=3D%s context=3D%u seqno=3D%u",
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  38  		  __get_str(driver), __get_str(timeline), __entry->context,
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  39  		  __entry->seqno)
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  40  );
506aa8b02a8d689 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-=
10  41 =20

:::::: The code at line 17 was first introduced by commit
:::::: 62918542b7bf08860a60ebbde7654486e0ac0776 dma-fence: Fix sparse warni=
ngs due __rcu annotations

:::::: TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
:::::: CC: Christian K=C3=B6nig <christian.koenig@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
