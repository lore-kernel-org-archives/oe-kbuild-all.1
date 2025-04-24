Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A172253EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745537051; cv=none; b=Q2ufk52pCBBJ9C1hUORWcoh8ZeulRy0p3xKkJ3GEkYMod8cfmblf9fSRyexIagK8XRGiuePOWthUV2krLz1eibDT40m6DjX++f//IM0z9E0CPX36YSS+2J7mBwDKgDPt4sqD/4fu2n9Wt9M152PbiSPQB3PaPYF/Kda20bjxY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745537051; c=relaxed/simple;
	bh=7RR1q+A6axDWNgFe64Y63QcUVejET4z8/XCWay2dSJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gdkvEN98oAjCpc0LkW+eG4Gs+NUQzerwlPqW1x9KdQIdn/K0ip4zKVes5ckGISkMj2wb7l7HR2UMughxtJGHbDFIjs5K04mqpgn5IJ1dffR6S9rluXwjnmf8OsKeXBNXwPmjmeRB/13qJFjUj+59rGi+haNlS6D9JJB9Q+uprK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQ1hcy8X; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQ1hcy8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745537050; x=1777073050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7RR1q+A6axDWNgFe64Y63QcUVejET4z8/XCWay2dSJ8=;
  b=BQ1hcy8X+YBpsl5lpfSfXNRiniTQ6Iq1P07uP30wUde+uEvnumkIF2pj
   cplXZg4NZj+GedfYp8u+c/fplguqj3n6DICt/I2eZZKOF6LycQwyjEZlM
   1WutTWDpxqJUZ3qAIMfJpmniSLcI8kGLSU8Yv323ISY+vySJVLbLykF+v
   UfhxN1+J8PQRrIO61xeaXsZtBbC1KTxrr7oR7f1kQNVCtPCoolwQiTN0t
   ixV0+teI0imjSd2+gOBVs55nt2y5KPw5zPlWn6XpPqGVFanSdnVvMwJ2H
   4JnZW9cUL5Ke0SPIEuF12i7r/IgrVNDoApZ8ocyXOzNN8DQ+FO8ZiIaq6
   Q==;
X-CSE-ConnectionGUID: fydgHNBwTsSVyMUSqXnVsQ==
X-CSE-MsgGUID: Os+yMTJsSe2uZDPmF3Q1Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47364835"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="47364835"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 16:24:05 -0700
X-CSE-ConnectionGUID: 7+TF2cm0RzOxKTDDT8v9ig==
X-CSE-MsgGUID: Azwli/JtQI+55zAoBiSXnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="132672451"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Apr 2025 16:24:04 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u85vF-0004fB-2I;
	Thu, 24 Apr 2025 23:24:01 +0000
Date: Fri, 25 Apr 2025 07:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3678/6092] include/linux/crypto.h:507:12:
 warning: '*(struct crypto_async_request *)(&__req_req[0]).flags' is used
 uninitialized
Message-ID: <202504250751.mdy28Ibr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   393d0c54cae31317deaa9043320c5fd9454deabc
commit: 04bfa4c7d5119ca38f8133bfdae7957a60c8b221 [3678/6092] crypto: hash - Add HASH_REQUEST_ON_STACK
config: um-randconfig-r063-20250425 (https://download.01.org/0day-ci/archive/20250425/202504250751.mdy28Ibr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250751.mdy28Ibr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250751.mdy28Ibr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/crypto/algapi.h:13,
                    from include/crypto/scatterwalk.h:14,
                    from crypto/ahash.c:15:
   In function 'crypto_request_set_tfm',
       inlined from 'ahash_request_set_tfm' at include/crypto/hash.h:566:2,
       inlined from 'ahash_request_on_stack_init' at include/crypto/hash.h:1009:2,
       inlined from 'crypto_hash_digest' at crypto/ahash.c:1039:2:
>> include/linux/crypto.h:507:12: warning: '*(struct crypto_async_request *)(&__req_req[0]).flags' is used uninitialized [-Wuninitialized]
     507 |         req->flags &= ~CRYPTO_TFM_REQ_ON_STACK;
         |         ~~~^~~~~~~
   In file included from include/crypto/internal/hash.h:12,
                    from crypto/hash.h:10,
                    from crypto/ahash.c:28:
   crypto/ahash.c: In function 'crypto_hash_digest':
   include/crypto/hash.h:181:14: note: '__req_req' declared here
     181 |         char __##name##_req[sizeof(struct ahash_request) + \
         |              ^~
   crypto/ahash.c:1039:9: note: in expansion of macro 'HASH_REQUEST_ON_STACK'
    1039 |         HASH_REQUEST_ON_STACK(req, tfm->fb);
         |         ^~~~~~~~~~~~~~~~~~~~~


vim +507 include/linux/crypto.h

1451e3e561be9f Herbert Xu 2025-04-07  502  
1451e3e561be9f Herbert Xu 2025-04-07  503  static inline void crypto_request_set_tfm(struct crypto_async_request *req,
1451e3e561be9f Herbert Xu 2025-04-07  504  					  struct crypto_tfm *tfm)
1451e3e561be9f Herbert Xu 2025-04-07  505  {
1451e3e561be9f Herbert Xu 2025-04-07  506  	req->tfm = tfm;
1451e3e561be9f Herbert Xu 2025-04-07 @507  	req->flags &= ~CRYPTO_TFM_REQ_ON_STACK;
1451e3e561be9f Herbert Xu 2025-04-07  508  }
1451e3e561be9f Herbert Xu 2025-04-07  509  

:::::: The code at line 507 was first introduced by commit
:::::: 1451e3e561be9ff4e86b911b9367a2223275d16f crypto: api - Add helpers to manage request flags

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
