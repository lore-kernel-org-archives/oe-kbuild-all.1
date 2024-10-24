Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7AA482EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 03:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729739199; cv=none; b=kXqUnbvxrAapocjToEqDALYCyVYWxk5bCVch01Ml/FvBe3RC/FzAQ2Yj14rTjrL0kY45w6n3Ig3sLoAMcqoILKbWB5fK4IfZWMkXAeyNrevMsPMya+85yW47Jkl/fRCQrKuyHahSysLfXmiOtpkMZ69QzSwTC1LbhNLGVL9PDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729739199; c=relaxed/simple;
	bh=H/XbPENrp3XKnGQwtH7rV/x/OG1X2oBfHhMNHl/uYMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aG31AYcjhWg8GNX8h6jfq8+gjiMyJnNQIgJxAga5mPw6OVHEUyLp6DCsMmLA39hAGF5eyW3d8wyTBR+pzDDOwt3LjSSfqE2N3DRKKh0zfOdmk0R9lTvHkkWTzeBxbBlTgJGLWJW7Lw2ltKAPkWY6EU8pkpkV+VRfs+1N4cpQfAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahGRZJ+3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahGRZJ+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729739196; x=1761275196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H/XbPENrp3XKnGQwtH7rV/x/OG1X2oBfHhMNHl/uYMY=;
  b=ahGRZJ+3lqCPMdawB5U3b4KHtmUY9+XnVput8FuyRAOIpnSF9gV2C71f
   ek4LtpAOjUrpHG7jC+rIO5TlooF6LlsBHd2bkBy3yCDuc9Awr7E4RoBEJ
   tFo4SryXam8zmYHUUi7z16NRNM2tehWTK1pzBww49EmaWfTjGW3V/Y+iG
   gHPWrjCSOnFR9ReCgrwg5O3ln8LkhgjE8bPvIU6eDRU0GEhBgGoSr4Y3F
   QYE7WPkPp+FuUD10IxjxBbkByuI0ogJTQlYH3bS2jS1NcI9Jt6HQbgYQ2
   VwQ0M93R8DX2lCcXSTyaFMh1jj13QBsAxqYuuYz4Su6Tlc0SBN2q947tw
   g==;
X-CSE-ConnectionGUID: rayQSfc7RyK7riNq5/kTww==
X-CSE-MsgGUID: pNxEav7FQJGHzam+PNnD3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29477073"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29477073"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 20:06:35 -0700
X-CSE-ConnectionGUID: VRA0uOx+Q+e+9g0JlIwk7A==
X-CSE-MsgGUID: V9vuZ9CuSD29NSKc/PZssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80461897"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2024 20:06:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3oBA-000Vrk-37;
	Thu, 24 Oct 2024 03:06:28 +0000
Date: Thu, 24 Oct 2024 11:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6277/13046] arch/x86/crypto/sm3-zhaoxin-gmi.o:
 warning: objtool: zx_sm3_final+0x9a: call without frame pointer save/setup
Message-ID: <202410241032.R9J18q1g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: bdcfdbe076c8b6d621c9f38b5e08f96887a10dba [6277/13046] Add support for Zhaoxin GMI SM3 Secure Hash algorithm
config: x86_64-buildonly-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241032.R9J18q1g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241032.R9J18q1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241032.R9J18q1g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/crypto/sm3-zhaoxin-gmi.c:61:6: warning: no previous prototype for 'sm3_generic_block_fn' [-Wmissing-prototypes]
      61 | void sm3_generic_block_fn(struct sm3_state *sst, const u8 *inp, int blockcnt)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/x86/crypto/sm3-zhaoxin-gmi.c:140:5: warning: no previous prototype for 'zx_sm3_update' [-Wmissing-prototypes]
     140 | int zx_sm3_update(struct shash_desc *desc, const u8 *data, unsigned int len)
         |     ^~~~~~~~~~~~~
   arch/x86/crypto/sm3-zhaoxin-gmi.c:153:5: warning: no previous prototype for 'zx_sm3_finup' [-Wmissing-prototypes]
     153 | int zx_sm3_finup(struct shash_desc *desc, const u8 *data, unsigned int len, u8 *hash)
         |     ^~~~~~~~~~~~
>> arch/x86/crypto/sm3-zhaoxin-gmi.o: warning: objtool: zx_sm3_final+0x9a: call without frame pointer save/setup
>> arch/x86/crypto/sm3-zhaoxin-gmi.o: warning: objtool: zx_sm3_finup+0xb7: call without frame pointer save/setup
>> arch/x86/crypto/sm3-zhaoxin-gmi.o: warning: objtool: zx_sm3_update+0x9d: call without frame pointer save/setup
   arch/x86/crypto/sm3-zhaoxin-gmi.o: warning: objtool: sm3_generic_block_fn+0x2a: stack state mismatch: cfa1=5+16 cfa2=4+8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
