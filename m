Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BC6610C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 05:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716267679; cv=none; b=Q6kd5O0cPrRdYuhiDGllZh26X/9v2tTTWW5X5FD9txWLUvQgbLsNr+MUX6ZncFbwblcclayZepcmBBxdDNJnFjok73MALuwhNwIrDrJzQnDxG9apq6RhguRwRfGMdED50y/VT6SYTVfPhouvAyxIhKo3ykqe+rbXyGj/PjV1Kmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716267679; c=relaxed/simple;
	bh=u9DvsKC7OHqLi1GVega3LGffLWELMfJW1Tr0WYqsy8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qYt0DkJeUTXm/rsAqWACHXoqk0QaHktP9iFx024cEl8dd2p89Ubup20LCoh3+UF+O/h9N1qVASzBvlxWxmuciXGmYp7FCs1xAfXhv8DrifM2X0fYgEJgksqa9AJ26xctsjHAGxYAV9Fiseh4JzicB6huzTSgDKz/XeZD+Fkj+Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcctXwcN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcctXwcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716267678; x=1747803678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9DvsKC7OHqLi1GVega3LGffLWELMfJW1Tr0WYqsy8Q=;
  b=JcctXwcNw/zcGWf+9K+tzRKWPwcr9dKatEMzCtkJ91nt12+A6MosGyVy
   2pkjFYwrb7H3vEv1nEDoCqzwkB2JCbbwRtinthjmYU5boz/EP8tOEtYZD
   Zpx637yR2QkqEmkK7yg2rjA46cZwGK2zvEqZ5z2ZmE77Ex75eKDpyed0L
   W61CIz1/eJVKBRcwtQLLnxFV/JD167aw5hHTFSC/JwplmUUMUQ9qXuoxm
   otmsdn+f3t5Av1iJSzR5kd1WiWKkZmuOHixkUdfu9aq8bfOU+/vLy4qQF
   AT8aOaNlsFh+izv92ifFbPnM1rJ3gSao6wCDatMfC5HWRjVBT9mvsjdeU
   w==;
X-CSE-ConnectionGUID: Xh1jRrXjSXaTc5DssWz3aA==
X-CSE-MsgGUID: ioUJ7AWYT12gswkomTBwPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12552517"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12552517"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 22:01:18 -0700
X-CSE-ConnectionGUID: 0CpUlVN/Ryaw5H7cpI3I7g==
X-CSE-MsgGUID: zIZYzhrfSU2/5fEYBh69dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="70189069"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 May 2024 22:01:17 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9Hcc-0005sv-0y;
	Tue, 21 May 2024 05:01:11 +0000
Date: Tue, 21 May 2024 12:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20629/22450]
 drivers/crypto/zhaoxin-gmi-sm4.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202405211248.9n4OIoTz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5708160127a606e51a136509cfe0a9448a09849a
commit: 358c7df96d1cc7a30096129ccedbeaa21d7eee44 [20629/22450] crypto: Driver for Zhaoxin GMI SM4 Block Cipher Algorithm
config: x86_64-buildonly-randconfig-004-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211248.9n4OIoTz-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211248.9n4OIoTz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211248.9n4OIoTz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/zhaoxin-gmi-sm4.c:164:5: warning: no previous prototype for function 'gmi_sm4_set_key' [-Wmissing-prototypes]
     164 | int gmi_sm4_set_key(struct crypto_skcipher  *tfm, const u8 *in_key,
         |     ^
   drivers/crypto/zhaoxin-gmi-sm4.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     164 | int gmi_sm4_set_key(struct crypto_skcipher  *tfm, const u8 *in_key,
         | ^
         | static 
   drivers/crypto/zhaoxin-gmi-sm4.c:189:6: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     189 |         u8 *iv;
         |             ^
   drivers/crypto/zhaoxin-gmi-sm4.c:292:6: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     292 |         u8 *iv;
         |             ^
   drivers/crypto/zhaoxin-gmi-sm4.c:359:6: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     359 |         u8 *iv = NULL;
         |             ^
   drivers/crypto/zhaoxin-gmi-sm4.c:468:6: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     468 |         u8 *iv = NULL;
         |             ^
   drivers/crypto/zhaoxin-gmi-sm4.c:572:6: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     572 |         u8 *iv = NULL;
         |             ^
   6 warnings generated.
>> drivers/crypto/zhaoxin-gmi-sm4.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
