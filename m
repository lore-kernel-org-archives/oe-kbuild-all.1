Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795849399;
	b=ETfV9KXHIg6ITmY8+sm0hqGWgcD6pYQGFWrXlpt7M4PGHFUJv1lRrHonUrZ28fZWa2/v
	 UI5gKhnmeIU4EHYVgsWjbmqJuSdgNOg3IQw3DrhIoEXLfoSC7qUDyGHZACJYFtrErdGm+
	 Wfo/KRunoIi1qSQOT8uiSmyEVgMeC0zK36r+XhCu8DahX0uf3+W7ua/JWQzl3u8Fb6SV3
	 bR/NXxiiUmLqcrmHHe32oYdXBzccg2+z361FrmR8ypELoddPYHSURCMtyGoTTrYbQiuxa
	 KYulg0gjcob4GjMZccmD0Oq37Nv/wYCgJIXuGOG6FkbIWaPpCoc0thhMgltLyFRFgAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795849399;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=z0IcGwzBa58WN+mjvAtQPjYDCQTcIbXt8tudod22UVE=;
	b=eE/UgSAYHrooQLRQs4/8cMqLjRKKatUDMncK9Alb3L96jY+E35/YMtmw/3mNgTet123z
	 zhy081kSPYmsl0yG0EdJggNKjzQ/zQYvwiWsRGSX1etzI5z0Xi8yTtiaLBsD0kzaYdd22
	 Src/eVQsnmpN2UzAd+pAXNktOJs4itBF5RAjJB1ebOQ7cQkmqZtByDZb8XkPQprRKcTPv
	 RvYMccjwXtyosaomXSouFxSXuhhk/b2jpmfuaagsdzpuXGYCx5xE3jUZ+rbnLNUsn/wej
	 XfSVfETvhPpZmbWz7padgpa+vmvUZ2UcDbpmEKJjUZk+TQsoigoF8kJaiwXKaIlmTtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gt8p6AgP;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B1B606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Nov 2026 07:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gt8p6AgP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795849398; x=1827385398;
  h=date:from:to:cc:subject:message-id;
  bh=ixn0IF+vk+F+oXghOD708l+7cin97XCgY4WJ2+Vk6VU=;
  b=Gt8p6AgPd+XgFdGK/uCtqha8CHeW2A5VyjDqR61XwEKR7SoaDDewHKti
   okVnSlZon/rjyz/i1DSAW68xah+jAU3wMza2tiq/Iy4Az3e9eh/I5yZTF
   WzDXCKVeDKz7JsByWT654gBY5JFEOv6ZfFz1fHXBUCaqmW/N2jr19+0bz
   GXZ8DdZw8PEE5gcNssK0eTEZ7ZUMeskQ5FrUIMrzHQHFe1bOF4uzvfYT4
   gQgwWMBUqvD4bMcc5LlcaaCPteNoRa2XDM0+f4wQf1U/bE4rhL+fw/9rF
   quhJLTe6bsAX11Fvhe8TvcWXgQVlKMhZcvfKxhxzkpY/s45zGBFvQwZJA
   A==;
X-CSE-ConnectionGUID: 3TtKh8BuTi+kzGZltG3Gvg==
X-CSE-MsgGUID: IyZ0yCqrRAm3Z9dvidY8Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4763029"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4763029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 23:03:17 -0800
X-CSE-ConnectionGUID: m+m37q74RfuAKUj1ufpRCg==
X-CSE-MsgGUID: 5kulUezPQh+c+4LLtuKydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="13066383"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2026 23:03:15 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXCSn-000000000X0-2Xjc;
	Sat, 28 Nov 2026 07:03:13 +0000
Date: Sat, 28 Nov 2026 08:03:12 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-aes-gcm 52/60] lib/crypto/aes.c:1757:22:
 warning: result of comparison of constant 2305843009213693951 with expression
 of type 'size_t' (aka 'unsigned int') is always false
Message-ID: <20261128080225.g1SlVxzq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes-gcm
head:   582d64ea07ba0a2bebed6eee194d7328cbad617b
commit: c3ffe11001b2e3af97b557bbbcaf54b8c08e51fe [52/60] lib/crypto: aes-gcm: Add one-shot AES-GCM arch hooks
config: powerpc-randconfig-2200-20261128 (https://download.01.org/0day-ci/archive/20261128/20261128080225.g1SlVxzq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128080225.g1SlVxzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128080225.g1SlVxzq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/crypto/aes.c:1757:22: warning: result of comparison of constant 2305843009213693951 with expression of type 'size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
    1757 |         WARN_ON_ONCE(ad_len > AES_GCM_MAX_AD_LEN);
         |                      ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   lib/crypto/aes.c:1758:24: warning: result of comparison of constant 68719476704 with expression of type 'size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
    1758 |         WARN_ON_ONCE(data_len > AES_GCM_MAX_DATA_LEN);
         |                      ~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   lib/crypto/aes.c:1799:26: warning: result of comparison of constant 2305843009213693951 with expression of type 'size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
    1799 |         if (WARN_ON_ONCE(ad_len > AES_GCM_MAX_AD_LEN) ||
         |                          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   lib/crypto/aes.c:1800:28: warning: result of comparison of constant 68719476704 with expression of type 'size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
    1800 |             WARN_ON_ONCE(data_len > AES_GCM_MAX_DATA_LEN)) {
         |                          ~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   lib/crypto/aes.c:1513:13: warning: unused function 'aes_gcm_encrypt_arch' [-Wunused-function]
    1513 | static bool aes_gcm_encrypt_arch(u8 *dst, const u8 *src, size_t data_len,
         |             ^~~~~~~~~~~~~~~~~~~~
   lib/crypto/aes.c:1522:13: warning: unused function 'aes_gcm_decrypt_arch' [-Wunused-function]
    1522 | static bool aes_gcm_decrypt_arch(u8 *dst, const u8 *src, size_t data_len,
         |             ^~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +1757 lib/crypto/aes.c

  1752	
  1753	void aes_gcm_encrypt(u8 *dst, const u8 *src, size_t data_len, u8 *authtag,
  1754			     const u8 *ad, size_t ad_len, const u8 nonce[12],
  1755			     const struct aes_gcm_key *key)
  1756	{
> 1757		WARN_ON_ONCE(ad_len > AES_GCM_MAX_AD_LEN);
  1758		WARN_ON_ONCE(data_len > AES_GCM_MAX_DATA_LEN);
  1759	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
