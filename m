Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A540DFAF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239461; cv=none; b=VbOafrYH9zTqoSLzdXpGXNfwD/zvB4OFronXVzMPZWYWw651cjDNp6alMMSgkkXMqguYAUMgeWwpPNmMHtrvsxVCNYsgt5oUOKW9S3xvWaBm+lrk6At4NBz0w3ZOoQtHLZCHhScv9hLYcNrmBFjPzqwogdIfO3dC2ZFytc6PxW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239461; c=relaxed/simple;
	bh=H2TqX30y9vpOAhZ8eh3EQrQ9jSU3Ii6FVLIvswGNRkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l6u8i0E1pMOubr5kVUhrH6yr5rDfCVjR9+E+BRunQYp2mBo0qknjk8Cuy99u+YQBb1TIdcZTxEqS29P0ib0wpLgP6u6JErKSNsRy0J/P2XJbaDreGEUw0ft/BcQYwtgo19dmpIJmZ0cX0ZIb2AMQmZ7bIDPkcb1hykxjQtPxo9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8kCI6DT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8kCI6DT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773239457; x=1804775457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2TqX30y9vpOAhZ8eh3EQrQ9jSU3Ii6FVLIvswGNRkM=;
  b=n8kCI6DTAOCZ4/03Hf1W54FORGZRiuRbYX3t+OJC8FcIT4NZfcW6kcXz
   tPRVnh8HSmt+oRhxSV5PkOgg70ATTGulyJQOn+MiNlwepuow2r8RAbKFL
   y4O8u7vQ3njh2MDGh+crzYWFAUIHdB0W7z01J0weipBSfGdji5sopxkNX
   h56e/9edhzq9bWEkOOmu34XKdNgG1LdWvlyoUah4yz8G3ha1yjkFAT3gv
   zCxgqskCEW+RadAeCjJUgFutfBA+XQIA9O+pneR530dHIXq3XHJxmBfd1
   QS52Z4+gZhgVo708Uq0+Kh5DjEOyWsqz4x7B0Fl0qmXeIk3DmVzRwiTbU
   g==;
X-CSE-ConnectionGUID: tYJNFV5kSE2w/+vHGSHyFA==
X-CSE-MsgGUID: xabRcwOXRnKRHN7uht0kXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="61886237"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="61886237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 07:30:56 -0700
X-CSE-ConnectionGUID: 0Qt2V8VgT4emQhxPKVSnaw==
X-CSE-MsgGUID: ZPaIANH0T9W41xjGxXHwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="246045808"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 07:30:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0KaK-000000003L7-32ET;
	Wed, 11 Mar 2026 14:30:52 +0000
Date: Wed, 11 Mar 2026 15:29:54 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/vdso 37/45] progs/hid_bpf_helpers.h:117:31:
 error: declaration of 'struct bpf_wq' will not be visible outside of this
 function
Message-ID: <202603111558.KLCIxsZB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   f7178f159b2a36d070fd43b0d751e4e4415ec39e
commit: 912632a7fd4cc1eac2778828d92e8fe46939d6bd [37/45] vdso/datapage: Trim down unnecessary includes
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260311/202603111558.KLCIxsZB-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111558.KLCIxsZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111558.KLCIxsZB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:117:31: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     117 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                               ^
   progs/hid_bpf_helpers.h:118:32: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     118 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                ^
   progs/hid_bpf_helpers.h:119:39: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     119 | extern int bpf_wq_set_callback(struct bpf_wq *wq,
         |                                       ^
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
   progs/hid_bpf_helpers.h:119:47: note: passing argument to parameter 'wq' here
     119 | extern int bpf_wq_set_callback(struct bpf_wq *wq,
         |                                               ^
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
