Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9074117B505
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770811349; cv=none; b=lphPoVvi3LWwZaLa9GoEpjQBonNYd0F67f2vu3qMzgqNkfw+8DDW5+ejngmnCmC3UpZslyIDhiAlrA+YebkIs3jObQxR03PO+q+i33sIsS/ApoExTq1wO4Ev4dRAtgFlapBkCm2hIpMruNQ8A/NftGtWkFg2OR2vKMQGeHBIZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770811349; c=relaxed/simple;
	bh=oKTcAPP1Pc+MjLzO3BVq218veH4tTln48HxWYQvxyxs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kVSakkpRocxglKYR+5tcSNlVZAbzvneOMfMLJG1m576UYvE7y/S637xsRaGaDKCEf6Foq2SjidJVFCsW67WRavBA5Xp70xiEE82Q9oTVxG34NivZG54SWOOKkokDUbWlkIK3BoZ9/r+4wzBE9linGC8xZWp67QmgS/TRv7lEVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiVXtbCu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiVXtbCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770811348; x=1802347348;
  h=date:from:to:cc:subject:message-id;
  bh=oKTcAPP1Pc+MjLzO3BVq218veH4tTln48HxWYQvxyxs=;
  b=fiVXtbCuA1PGJffd/lZPERrgyXI6ABYU19cyxiRMl7ByFv9vwERaPl09
   T5g3t5CrPNlUrEMTrC3iiQYRmPgTjcBTPkeTs+4m1G/gIrBMI48+Jru/T
   eqIsCaWgdZ51cFojyk9znfrzcY8MHKdE6mLXHS6CFYVeXBhFvkZVKdjcC
   YXtnfA1i6Pg2oAfbcQgkB333oh+uzI7RQy8YTDr5+GnWkc5jhaYDsb1jP
   KDJIvpZshZHZhKYjvaXF3vGKU/2eSG24ePD0xGzPZ859HkX5WSlMEbOgj
   n440dqpKnqFgWvaSMwAYTmOwotINnp3bI8Rg+sKNs4IyNFW+N5P+9hPtI
   w==;
X-CSE-ConnectionGUID: 4/UIOyY8SXmNUm6Rq6lE1g==
X-CSE-MsgGUID: TRftkoyKQJmJuc+s48bRmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71855285"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71855285"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 04:02:27 -0800
X-CSE-ConnectionGUID: qjpnQzp1SL66TyqDPl3MNA==
X-CSE-MsgGUID: 3yRA6/phTFyG5ljv4L1cHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212060120"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2026 04:02:26 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq8vH-0000000014f-1VxL;
	Wed, 11 Feb 2026 12:02:23 +0000
Date: Wed, 11 Feb 2026 13:02:18 +0100
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:svctcp-next 1/8] progs/hid_bpf_helpers.h:117:31: error:
 declaration of 'struct bpf_wq' will not be visible outside of this function
Message-ID: <202602111350.3ho1flBw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux svctcp-next
head:   c718461befe42db474143734b2ab32df318f9fd4
commit: bf126e1cd573edafc55b7ec7d6d23f641007d71f [1/8] sunrpc: Add XPT flags missing from SVC_XPRT_FLAG_LIST
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602111350.3ho1flBw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111350.3ho1flBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111350.3ho1flBw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:117:31: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     117 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                               ^
   progs/hid_bpf_helpers.h:118:32: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     118 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                ^
   progs/hid_bpf_helpers.h:119:44: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     119 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                            ^
>> progs/hid.c:448:16: error: field has incomplete type 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                       ^
   progs/hid.c:448:9: note: forward declaration of 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                ^
>> progs/hid.c:487:18: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     487 |         if (bpf_wq_init(wq, &hmap, 0) != 0)
         |                         ^~
   progs/hid_bpf_helpers.h:117:39: note: passing argument to parameter 'wq' here
     117 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                                       ^
   progs/hid.c:490:26: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     490 |         if (bpf_wq_set_callback(wq, wq_cb_sleepable, 0))
         |                                 ^~
   progs/hid_bpf_helpers.h:119:52: note: passing argument to parameter 'wq' here
     119 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                                    ^
   progs/hid.c:493:19: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     493 |         if (bpf_wq_start(wq, 0))
         |                          ^~
   progs/hid_bpf_helpers.h:118:40: note: passing argument to parameter 'wq' here
     118 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                        ^
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:59:9: note: forward declaration of 'struct hid_device'
      59 |         struct hid_device *hid;
         |                ^
   8 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
