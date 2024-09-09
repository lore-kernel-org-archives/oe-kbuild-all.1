Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DCAD2D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 04:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725855627; cv=none; b=J51DYi2tbAObxSJEI2rq8c31wClieCp/qkFCh7ErrNgS+iVgoOpTGINMKxG9/AfAK+TeGHQAx8CzmZ6R9y6mk+LEZ4T7ZWq5ORiUilX59nK1Qmgat9kHj/HtXvsWmi7d20JSFdHaxnXeisJDjE2WfztnlUWOjKHxCOOTFMwEC1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725855627; c=relaxed/simple;
	bh=iOT9VrK42uUOoEjxnHxH8yMuOAs6gJcMPHLA32kQpI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o3s/GUtO/BZ12e6q14IPRRe1XDOZH0ys0oGDPRykUgdEnvtN1OevFvCqqa9bJPH+3aHQW2hMkJqHocyTOytJDJqQ4/yVn/cUn3qt2mpMZvbIETsurkN7T28oO5DhcOvkJGS+m8ug0B/W/YDqtxBfpjczvyz7+pVJ1wAaDIHLxa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcVXgleK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcVXgleK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725855625; x=1757391625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iOT9VrK42uUOoEjxnHxH8yMuOAs6gJcMPHLA32kQpI4=;
  b=dcVXgleKlMz7Fq284GYv1SQlJJgvwSOo0GteDEONXKNzab07BAbNJVmb
   +ZcJ+yxdtq5z4uAe7O/TspvUX4qOUjUV5hcwenn1MQtak/8/JTTNJWxfK
   O7E/l6VO99DzgIdtOcFfq0H67qNuuUcN1pdqvuKA1yHGcRhnUyr8PYOyf
   aHv+Rq0xzPql52L8vVsr6qFq2jykF3YT5Yi1Pi48kgcFiIvFxkexxCVsM
   5HNcQjsZZ03Xcj+ZQNrzQEn6IhF4vZakwsmbewftEio0pr4+sCfJZSIL9
   ycChVPBikUZd71OXRw43bzasDNzaXVaoFaVAWJSbPARIcWFf3ImLCHgUH
   w==;
X-CSE-ConnectionGUID: 6OmANPu4RVOk1QLn6FIrbg==
X-CSE-MsgGUID: /Kd0NSbPSvir9S3BmBIiXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24470003"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24470003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 21:20:24 -0700
X-CSE-ConnectionGUID: hjj3x+8BREaxXUu4+rLnxg==
X-CSE-MsgGUID: N60r46HwS8iUG4i2DZ3evg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66763710"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2024 21:20:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snVsy-000EHX-1c;
	Mon, 09 Sep 2024 04:20:20 +0000
Date: Mon, 9 Sep 2024 12:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 18/46] crypto/ecdsa-x962.c:133:9: error: call to
 undeclared function 'crypto_digest_size'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202409091230.da2DgHxt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   fc9f4270fb1c1618a497f5bc1cf9eef4ac9032d2
commit: 4bea63ccdf35da2dfec51745eff4aedc115296a8 [18/46] crypto: ecdsa - Move X9.62 signature size calculation into template
config: i386-buildonly-randconfig-001-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091230.da2DgHxt-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091230.da2DgHxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091230.da2DgHxt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/ecdsa-x962.c:133:9: error: call to undeclared function 'crypto_digest_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     133 |         return crypto_digest_size(ctx->child);
         |                ^
   1 error generated.
--
>> crypto/ecdsa.c:180:9: error: use of undeclared identifier 'SHA512_DIGEST_SIZE'
     180 |         return SHA512_DIGEST_SIZE;
         |                ^
   1 error generated.


vim +/crypto_digest_size +133 crypto/ecdsa-x962.c

   128	
   129	static unsigned int ecdsa_x962_digest_size(struct crypto_sig *tfm)
   130	{
   131		struct ecdsa_x962_ctx *ctx = crypto_sig_ctx(tfm);
   132	
 > 133		return crypto_digest_size(ctx->child);
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
