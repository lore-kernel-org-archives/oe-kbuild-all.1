Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485169;
	b=xfmzVMf77fJ4rPVOIFQrJXio5YwmZWwJqSb8Yb53WxL9VcolIgX53SC+OIr2HqDDDbIw
	 jIlwXkX0aVfWZMJyKvg7izZmvE32ACUErjpnPoYe6nFFA+J2QEVTYIy5B8Zgfb1FBJNlu
	 zidecf/C8HFNhlzIqZkctKEXa90P7aPjyEP2z+0T4AccKTXUq9fCR938YMnpO8sl0i8hH
	 7hM2TmhtQsO8dY0Duyib6cCAp2IMLmKUL4s7gIvWnEf5ow/1Uu7V+G+CWnVbrdUfu9qxh
	 NAqs4LVJb8t2axJeq9LzhLAixnwB5XTNf4A45EZq8xUY4SIVp/ENFjiPCMzpLEen2XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485169;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/hA34P15q1oxVHRSjXvNvkQ68TJynXGDuNUUxf5uJkc=;
	b=WJd6sNo8U1gTdaTkvO9viENi+Ia2zcc3SUljc/Wz4u4JLQ17WTjPAjgaso/067xUvrqg
	 otnuUvCAWPFXSLA64ZWmd/NeEGeAg1W5mQWQs78OjfYmCEzIT6xSORfNBf+5aSQLn03ji
	 ftgL76fSR9HbLuMvJG/NEcoi7EwUqNQxco7l7Q/80odnDLEKL9/1ucS5K98rHp7jRXZcu
	 rMxQqRoGf6LdXH/5WM8YUxrMjEio5+64Im6r2bBgQyUfZxKPoR4D8v84pqFGfIj6DQK0p
	 H9+fSf8X2zruoXphRe/L0xOZlP3Ba6j9NOq68AM/F7U2NyyLFmXuk+DJ29fFNsC5utg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dp8VFOxe;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6188F606A31D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 08:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6188F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dp8VFOxe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792485167; x=1824021167;
  h=date:from:to:cc:subject:message-id;
  bh=ZUKD6ieSECuV+YPGYjPpaEVpyTy1JTloXqOkVi7zdro=;
  b=Dp8VFOxeQ7ZTLokm2NYRhI/9UakT+h/xu/Ls1ks1U9cnoPj8f8M+f4qj
   3dkM+mREMa7AiA0kNL3lSrSvWjtyLlal8IQhI/MqKKzfxKkxLNtWS6znh
   ueAUksWJgmk1GB8pehXaDDjGHgMn4a9hMfHsIeKIhBjMRuthWoEm9DB1h
   9Y6ijdgWnA4X0CA/B/CXuw+uh52R3/QoYiA3xivP1rOiOzGFlcLociFbn
   qcolGFBnH/lN9S3LW9GqkXqUCeNavREiaLRtf7fg1+ZHgItXR81CopSXc
   MGxvsvucx7wD/KjX5yR26L8zYZ7M6rm78mSymrKoMzx/jvNDATxSZza0x
   w==;
X-CSE-ConnectionGUID: 1Tq+65DRS5+FKI3/px9znw==
X-CSE-MsgGUID: LI3VcwQrSzeMMihv7JCBjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1083718"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1083718"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:32:45 -0700
X-CSE-ConnectionGUID: zN4InyR+RaCRJUI7yf2uUA==
X-CSE-MsgGUID: bLNKlF4PQFmFlX7TWP6P1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2652947"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 01:32:45 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ5H0-000000006Bp-02Pf;
	Tue, 20 Oct 2026 08:32:42 +0000
Date: Tue, 20 Oct 2026 10:32:38 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: crypto/aes.c:12:1: sparse: sparse: static assertion failed:
 "__alignof__(struct aes_key) <= CRYPTO_MINALIGN"
Message-ID: <202610201027.iEuDB4e6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f47d223627f80cb7a1eb14c585fe6cb35de5e984
commit: 0892c91b81cc889c95dc03b095b9f4a6fdf93106 lib/crypto: powerpc/aes: Migrate SPE optimized code into library
date:   9 months ago
config: powerpc-randconfig-r2310-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201027.iEuDB4e6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201027.iEuDB4e6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0892c91b81cc ("lib/crypto: powerpc/aes: Migrate SPE optimized code into library")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201027.iEuDB4e6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/aes.c:12:1: sparse: sparse: static assertion failed: "__alignof__(struct aes_key) <= CRYPTO_MINALIGN"

vim +12 crypto/aes.c

a2484474272ef9 Eric Biggers 2026-01-12  11  
a2484474272ef9 Eric Biggers 2026-01-12 @12  static_assert(__alignof__(struct aes_key) <= CRYPTO_MINALIGN);
a2484474272ef9 Eric Biggers 2026-01-12  13  

:::::: The code at line 12 was first introduced by commit
:::::: a2484474272ef98d9580d8c610b0f7c6ed2f146c crypto: aes - Replace aes-generic with wrapper around lib

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
