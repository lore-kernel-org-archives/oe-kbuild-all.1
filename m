Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C370329C48
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 21:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472978; cv=none; b=HSO+Ofz80KpI6bj/R0/I9F+djVYGdTpHr/xS0FW/r0GZJ8vM7AVtn/11UfpL3Hu8WcyF0fzf8vQMOwr+z3RfOLTTMWwKA+BTaouISkqy1vsyLte3L8xbt+E45a4bUMHb7MAK/841tNYZR1/f53CIip64rQw/O5bOTpm4Ct+hNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472978; c=relaxed/simple;
	bh=DCqcCCVWRfjJINLe8i1X/LGs46c3Az0qNMKEOUpHUY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dSswlmDyPw77oUEuMq3BIO4iAhRQl3xeSD6DTlzeo8VKhJkkGqMDxg0dBW1mZYqDc/OXJQhmSEWkPb/uhD7Ih7YNc3MhQUh3MRF5g36mVUbfH8B5PeRwi0ZdvM79vHpc6xGXzyMIUoMMixrmtQ/d65AJbBRba170Q+CGmID7yL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEBPPNGc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEBPPNGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774472976; x=1806008976;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DCqcCCVWRfjJINLe8i1X/LGs46c3Az0qNMKEOUpHUY0=;
  b=TEBPPNGcJVlvAF/gTnA/fkQfGVzZTEe5HCrstLcPCki1viq9HwniVZAb
   x1uiMAeRs6n3wENhfIcSbSRsE4dJLEsePJHuouz1T/pMzlo6oA79WiOhN
   aR3g1W9/pqUHwMGPzd4ndL7fUXFjPUsZe/tAYsBG88S2isOTlxJhSbWfo
   XthARN2/SnjtgFV2DrmMUbdYTUgVqABRz43fXjOm2D1K7T+Sd6fG3GYxk
   gKid35pie+SPptBoScgz5jRisutLQKuoF1wHksu/uFP4GOj5QyBjrXPqD
   mpBMhcOgSWYgWtd2N1kRNzKBSqdinWTVS8g52GG419Jv9uDlTmIdlIjAQ
   g==;
X-CSE-ConnectionGUID: DKh4SV/XRbC1WibSt65kwQ==
X-CSE-MsgGUID: l5g+eY9PQ66gu2ckrVibcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="63072713"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="63072713"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 14:09:36 -0700
X-CSE-ConnectionGUID: 7nkFMwa1TsuJ7kIgb1yBqg==
X-CSE-MsgGUID: 2vck+JAEQTSzaiiEu+/vpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220391260"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Mar 2026 14:09:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5VTo-000000007jJ-1Ug6;
	Wed, 25 Mar 2026 21:09:32 +0000
Date: Thu, 26 Mar 2026 05:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [linux-next:master 1904/9273]
 include/trace/events/dma_fence.h:17:1: sparse: sparse: dereference of noderef
 expression
Message-ID: <202603260524.9N9gzJgn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   66ba480978ce390e631e870b740a3406e3eb6b01
commit: 21f6bcdf2be72e750dbe430b7227a66763a58466 [1904/9273] Merge tag 'drm=
-misc-next-2026-02-26' of https://gitlab.freedesktop.org/drm/misc/kernel in=
to drm-next
config: loongarch-randconfig-r123-20260325 (https://download.01.org/0day-ci=
/archive/20260326/202603260524.9N9gzJgn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260326/202603260524.9N9gzJgn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260524.9N9gzJgn-lkp@i=
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

e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst 2014-07-0=
1  11 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  12  /*
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  13   * Safe only for call sites which are guaranteed to not race with fe=
nce
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  14   * signaling,holding the fence->lock and having checked for not sign=
aled, or the
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  15   * signaling path itself.
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  16   */
62918542b7bf08 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
6 @17  DECLARE_EVENT_CLASS(dma_fence,
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  18 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  19  	TP_PROTO(struct dma_fence *fence),
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  20 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  21  	TP_ARGS(fence),
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  22 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  23  	TP_STRUCT__entry(
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  24  		__string(driver, fence->ops->get_driver_name(fence))
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  25  		__string(timeline, fence->ops->get_timeline_name(fence))
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  26  		__field(unsigned int, context)
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  27  		__field(unsigned int, seqno)
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  28  	),
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  29 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  30  	TP_fast_assign(
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  31  		__assign_str(driver);
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  32  		__assign_str(timeline);
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  33  		__entry->context =3D fence->context;
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  34  		__entry->seqno =3D fence->seqno;
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  35  	),
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  36 =20
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  37  	TP_printk("driver=3D%s timeline=3D%s context=3D%u seqno=3D%u",
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  38  		  __get_str(driver), __get_str(timeline), __entry->context,
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  39  		  __entry->seqno)
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  40  );
506aa8b02a8d68 include/trace/events/dma_fence.h Tvrtko Ursulin    2025-06-1=
0  41 =20

:::::: The code at line 17 was first introduced by commit
:::::: 62918542b7bf08860a60ebbde7654486e0ac0776 dma-fence: Fix sparse warni=
ngs due __rcu annotations

:::::: TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
:::::: CC: Christian K=C3=B6nig <christian.koenig@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
