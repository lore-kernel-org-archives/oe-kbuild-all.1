Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4AE3A1E72
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 03:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766200721; cv=none; b=Ysmnb79qmJZDJ71ZtSn9vTbKRER1HmgxMFS3gM2r3sumouLDWWpuEj69wWnKQ56IQohK7G6u7PEgRiyF680ZsOzNwq9qzLsexv887/e3vtGcNKjQG06LHM9CIgROc/dWTQRb0S+oxsdPnAkrPUqmDumoU3zcKetbyLtU9QEU00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766200721; c=relaxed/simple;
	bh=ZQ7A92sfV4vGxOV2Y7cFE+dK3ecbFgTJ38FmUyk1QiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncMjarjRaGk8+d1pYeNvo+75g/yzt/YMtOrkvUp9F7MwyNa+LhCwgW3VawxDHJTfbPY1TXDYRsmlx5U8YVo4u7TrLVNokShL6FEWM61daH+8l5FfoPWYt48+2E9Uup0M8PjMrn4U7QRUdkYjiNjn2CgU9qbJaKDgak7ofnwfSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/UmpdN4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/UmpdN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766200719; x=1797736719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZQ7A92sfV4vGxOV2Y7cFE+dK3ecbFgTJ38FmUyk1QiY=;
  b=J/UmpdN4LMAR33kggagKA4stI2OXIKPQheHbEk7/AMPj6qKMcXXE426h
   qQSZjGTv410zDs15GAj1NOIjnVRBi1rbPfoUe7/H6dX8ok5+uhYX3o3dF
   FDMjCYbNX0A0m3Xg96R61k1gEgJOCpmdtSHspt9+aaNpcwU9XFR8WzFEz
   QiHW6vdgbboMFasV23T9PB1tQgg2oKj9lfsDKYBKtat+Y5w9szEEFhgJa
   R07dx1+RIx4jhvf9KsHpN3B76fWub8+0EAdV8W9Yv6xJPVvuyR7cqBK7a
   RRVSUDPq9VccjJ14ATKjcLPJTwhzAXf/k5nNvEqtjrfJ/HUHbDcetjfvB
   Q==;
X-CSE-ConnectionGUID: 9EUPCkpZSu+DB4laGo7kTA==
X-CSE-MsgGUID: UZl5vgRZShqIFCSTTD1kIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78875750"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="78875750"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 19:18:38 -0800
X-CSE-ConnectionGUID: NOFnou7KSwmG9Uo17PlGHw==
X-CSE-MsgGUID: WqO4dfbDTN+ub0ZvjvCP+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198272491"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Dec 2025 19:18:37 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWnUI-000000004I9-0qed;
	Sat, 20 Dec 2025 03:18:34 +0000
Date: Sat, 20 Dec 2025 11:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:kerne-unload 6/6] include/uapi/linux/bpf.h:13:10: fatal
 error: linux/trace_pritk.h: No such file or directory
Message-ID: <202512201109.MTzVY3dm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux kerne-unload
head:   04bdfeb9b9df4788222284b4c6ca893be2634104
commit: 04bdfeb9b9df4788222284b4c6ca893be2634104 [6/6] drop trace_printk.h
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512201109.MTzVY3dm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201109.MTzVY3dm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201109.MTzVY3dm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bpf.h:7,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:96,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/rq-offsets.c:5:
>> include/uapi/linux/bpf.h:13:10: fatal error: linux/trace_pritk.h: No such file or directory
      13 | #include <linux/trace_pritk.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +13 include/uapi/linux/bpf.h

    10	
    11	#include <linux/types.h>
    12	#include <linux/bpf_common.h>
  > 13	#include <linux/trace_pritk.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
