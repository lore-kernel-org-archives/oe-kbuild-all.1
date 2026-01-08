Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D8833B6FD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 06:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767855488; cv=none; b=TYmaXy14R+NrkO6T0QwjvIU+6ALzc1CaPopzOFgcm1lvEAf9NLmVx0gSCYaPOVyFNTUHVzvbLUaUrOQ1N7to22GX+1ud9zsfml4B/mQ1dMb6EZjsICywwGXPbV6gG98R0vBc9mUIs0amndn5i1v4Yu6KS3JFyUyRwawJ33RmLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767855488; c=relaxed/simple;
	bh=7vFgoLWAIgPIHGT5KFTdk5F+YCFrFK5R4kdyOoHIsg0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oU2ZfmQQNGNp0PSK7PC5JcqzY64RxFnxtvcLHIclz4BM3BYj49PAY1MZab87h2L2gaGnZq7UcP5TBmELgnlmz8VED1VOt4HE8/j7rvZsjVMOJpyPahUVljh7HP92fPXCQ0XxNN2Bfl+3SezBX7eTs1aEt/EmHCBxAbX4NvK6SfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRQnnJQH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRQnnJQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767855487; x=1799391487;
  h=date:from:to:cc:subject:message-id;
  bh=7vFgoLWAIgPIHGT5KFTdk5F+YCFrFK5R4kdyOoHIsg0=;
  b=mRQnnJQH4L8rbX63uXzkaGu6u+lRhY1lJ2b39mE91QQRKb4YQwnf+QyI
   xaf2bEnOeH4ELnFHpcLlEG/1dXdxeObcbus4gWPz9ejLMHekL02sTaSzP
   0GlI59PDp/9VJXeNylSr7sIWM/rVsEfgVqy6fpCqbPismo/ZlCzXhU5ZB
   fv4bKXKUuwpN02KAQPa9SZB96CtFkERIZXpJygY4Yyu2YLM4DISCYuXfH
   U9M2PAKZf2sbFb4TJvgc7KEheeQ1HmUHldQkEd9702h+CVWx8AhU1WvzE
   r4tJJ7/8pEKCEq63BcTv7k+xP6V1Nd6eDcCj0dah1vcSpeF5ZnpCF5gUX
   A==;
X-CSE-ConnectionGUID: tYbUZcCZSYSdprsBjatroQ==
X-CSE-MsgGUID: HGLFMo/QS0+TIGRWfYrmHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73078708"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="73078708"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 22:58:06 -0800
X-CSE-ConnectionGUID: MlQFhX/UQmSFs7uym55/IA==
X-CSE-MsgGUID: dp3cdwsmTbG9nZEgApakqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203034053"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jan 2026 22:58:05 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdjy7-000000001i1-1tRO;
	Thu, 08 Jan 2026 06:58:03 +0000
Date: Thu, 08 Jan 2026 07:57:40 +0100
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap_print_to_pagebuf 1/11]
 progs/hid_bpf_helpers.h:117:31: error: declaration of 'struct bpf_wq' will
 not be visible outside of this function
Message-ID: <202601080713.0nlkw29x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux bitmap_print_to_pagebuf
head:   968801bfd953b7e957910242c3072477e530a90f
commit: b0a848143ae37cdb8a3986a901d29a94dfc23616 [1/11] mm: add tail_in_page() macro
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260108/202601080713.0nlkw29x-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080713.0nlkw29x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080713.0nlkw29x-lkp@intel.com/

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
