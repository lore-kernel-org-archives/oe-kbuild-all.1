Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EAE31064B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 06:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026502; cv=none; b=pzQGHLZUgKHH62tAlqcJc9et/jomYciR8EDArz9nzJ4UcsIJXjcyJP7ZaavmH1mssmef3gYWHcRtpSMbvgymLetOCBsxw3E484WGzf/7sPAezHtv4vTVRIEhvbPsAm3vbChTE+CeCn35KbSq9UdBnMLqnT0idoMFS8pHsuq/OiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026502; c=relaxed/simple;
	bh=V9R1fzdZfibq3LLFN0x3bhfzLj6b0KnrwZelp+kvpSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HSuWnYxrcM3Q1+J7Joz1ulgj6u6zb/W5HtVE82vVjZOU6zevaAkFwSNOR/xtJ86FipvaQOY6lCsFcfyUfkvgtXgTUZ1xNmcW2Q2Sbhh1heJqngk3MggswM2YmaEqY7PteO0d4dkWcE8e4fdTZBpoOaYivg3lFG/TsOx4QZwpjmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgonKiVi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgonKiVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775026500; x=1806562500;
  h=date:from:to:cc:subject:message-id;
  bh=V9R1fzdZfibq3LLFN0x3bhfzLj6b0KnrwZelp+kvpSA=;
  b=BgonKiVidJtzJgQcyCgqyfqazcpSw9kXDkUc4o+aK2/t/P+iQcxaF4uL
   zGw0Gpu4JE7vSX3oidnUmp2Lu3bezt2oaT2Xh5JFdrqjpGDkghDVMMWg9
   w0n52SC1Bz9By0WH5mV2RAyLUXhDuialV0KffI6/KnnUM/k8hehUQc5ln
   ah07SQz8EOzMWNGmCggQ4j3IcBVk5v/N33IaL4TDn6QECnZNZKVdqbFuX
   +3jse9dx37QwW4XhV+1CqOTvVO/csjMB1ZbLvBdTtbUB5prOuPeiXRxoN
   NPtSg852CCDEANn2dCmb8oBFCwFCJKyhD1N8zCUeTGvJCKzfbX2rlH5Y+
   g==;
X-CSE-ConnectionGUID: dbHo5cI6TF+tUD+87OkBTw==
X-CSE-MsgGUID: FOWWMMKhSn61lPYFaxno8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76168862"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76168862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:55:00 -0700
X-CSE-ConnectionGUID: Y3+jCZClSSiZoqBQdzJ7DA==
X-CSE-MsgGUID: u1a5GDsiS4ivX/ybz2EDAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="231524010"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 31 Mar 2026 23:54:58 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7pTb-000000008en-48cP;
	Wed, 01 Apr 2026 06:54:55 +0000
Date: Wed, 01 Apr 2026 08:54:49 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu 1/1]
 progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
Message-ID: <202604010802.rFcMfdXd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu
head:   9cbd7eeda1fe517f9ce3451fb3d7b4663df71429
commit: b1ac27dd8a57803034f8361d820e3f2580714031 [1/1] ANDROID: ABI: refresh, CRC fixups and allowed breaks
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260401/202604010802.rFcMfdXd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010802.rFcMfdXd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010802.rFcMfdXd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
   progs/hid_bpf_helpers.h:114:31: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     114 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                               ^
   progs/hid_bpf_helpers.h:115:32: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     115 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                ^
   progs/hid_bpf_helpers.h:116:44: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     116 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                            ^
   progs/hid.c:448:16: error: field has incomplete type 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                       ^
   progs/hid.c:448:9: note: forward declaration of 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                ^
   progs/hid.c:487:18: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     487 |         if (bpf_wq_init(wq, &hmap, 0) != 0)
         |                         ^~
   progs/hid_bpf_helpers.h:114:39: note: passing argument to parameter 'wq' here
     114 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                                       ^
   progs/hid.c:490:26: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     490 |         if (bpf_wq_set_callback(wq, wq_cb_sleepable, 0))
         |                                 ^~
   progs/hid_bpf_helpers.h:116:52: note: passing argument to parameter 'wq' here
     116 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                                    ^
   progs/hid.c:493:19: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Wincompatible-pointer-types]
     493 |         if (bpf_wq_start(wq, 0))
         |                          ^~
   progs/hid_bpf_helpers.h:115:40: note: passing argument to parameter 'wq' here
     115 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                        ^
>> progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:56:9: note: forward declaration of 'struct hid_device'
      56 |         struct hid_device *hid;
         |                ^
   8 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
