Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3202C1587
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099942; cv=none; b=OTQx4YxUkITwjSWPyJfljBr5/4IG0ITS+K2LozCdvFSXhMujsHTRXQpduBdA0gHoqD4/F55MfGHopwX7x+DCHQkgM7IJ2MqCJMiTF8hq2IgyqU4/CNLta0ZH212Kr8TPwJn+U/cgCQFB3VRqBVkTrzrnRYrmanTpFAIM/brRh58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099942; c=relaxed/simple;
	bh=BLCCDq3VYe80wu+LgmFowllv5bwNHhdl+unOsxzP2zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jpCyDr3enfxM/hZizHmWzsshFOuDY739w2o9JXV1SVsGw1ZfFdjFarqsmF7qVHkCbLBjaFejCShB4qhOwv+p6d1qdfkGZ/Nxwd+TEPkfJPV7GlgvCYXjlAhGTlnwOeFSXzTybXH7Oe8D9lG7ZcOKb8If603c0jELDQHe9DRh5i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PelF+fFJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PelF+fFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753099940; x=1784635940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BLCCDq3VYe80wu+LgmFowllv5bwNHhdl+unOsxzP2zs=;
  b=PelF+fFJ1+E2cw5uR6GCRsi1RGgX03OauvPlIGGiBMwMo53QwA5GS5TS
   1HjmVr4UHrpi3Wixn7kkdY4gmLJ3GaKLree5oypq6/QM7nHwl4nQTpoWg
   MuuDtK02AoI6GCgeT9nVRMet4uFdDDqgyR120d59kBL9BToYdBcZs1NWJ
   UTbWFXw6rYml1+XocJDtu68Ti/pgnKBJnitR4vm5qPOFN6uzeVbw+TYD+
   JSxxp7yGjMYRYFX25m4yR8r8V3+PMCF4u6IN0XD3J58jkKX7/bmN92yxm
   nLR1bDIG2idzbzjsQzpg31yPd08ei9BDzt33ZjBpbE6k5M0TDe2CwEo+K
   w==;
X-CSE-ConnectionGUID: 774bBf22Qa2zsxRCgyz36w==
X-CSE-MsgGUID: 2LSzenhDR0m1LDHPcgOkMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55407618"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55407618"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:12:19 -0700
X-CSE-ConnectionGUID: +hE4hYtSSgudeg5S9OB5CA==
X-CSE-MsgGUID: 66Q5HrM4TZW6bGSQofCdtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="159253222"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jul 2025 05:12:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpNO-000Gmg-2v;
	Mon, 21 Jul 2025 12:12:14 +0000
Date: Mon, 21 Jul 2025 20:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 1684/11398]
 include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202507212020.72nw9OIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: 506aa8b02a8d6898c64cc095d233fbae1cef8b8a [1684/11398] dma-fence: Add safe access helpers and document the rules
config: x86_64-randconfig-122-20250721 (https://download.01.org/0day-ci/archive/20250721/202507212020.72nw9OIi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507212020.72nw9OIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507212020.72nw9OIi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence.c:1112:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1112:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1112:51: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1114:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1114:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1114:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1144:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1144:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1144:51: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1146:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1146:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1146:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_fence.h):
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
>> include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *

vim +12 include/trace/events/dma_fence.h

e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  11  
f54d1867005c33 include/trace/events/dma_fence.h Chris Wilson            2016-10-25 @12  DECLARE_EVENT_CLASS(dma_fence,
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  13  
f54d1867005c33 include/trace/events/dma_fence.h Chris Wilson            2016-10-25  14  	TP_PROTO(struct dma_fence *fence),
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  15  
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  16  	TP_ARGS(fence),
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  17  
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  18  	TP_STRUCT__entry(
ecec875a6c3379 include/trace/events/dma_fence.h Tvrtko Ursulin          2025-05-15  19  		__string(driver, dma_fence_driver_name(fence))
ecec875a6c3379 include/trace/events/dma_fence.h Tvrtko Ursulin          2025-05-15  20  		__string(timeline, dma_fence_timeline_name(fence))
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  21  		__field(unsigned int, context)
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  22  		__field(unsigned int, seqno)
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  23  	),
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  24  
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  25  	TP_fast_assign(
2c92ca849fcc6e include/trace/events/dma_fence.h Steven Rostedt (Google  2024-05-16  26) 		__assign_str(driver);
2c92ca849fcc6e include/trace/events/dma_fence.h Steven Rostedt (Google  2024-05-16  27) 		__assign_str(timeline);
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  28  		__entry->context = fence->context;
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  29  		__entry->seqno = fence->seqno;
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  30  	),
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  31  
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  32  	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  33  		  __get_str(driver), __get_str(timeline), __entry->context,
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  34  		  __entry->seqno)
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  35  );
e941759c74a44d include/trace/events/fence.h     Maarten Lankhorst       2014-07-01  36  

:::::: The code at line 12 was first introduced by commit
:::::: f54d1867005c3323f5d8ad83eed823e84226c429 dma-buf: Rename struct fence to dma_fence

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
