Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B6249F5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725853766; cv=none; b=cCdwAJIM2FVXex9lQ+uzEY2t1nbUqm5D/71rWo2dcxhthemieY0fGP+OrmS1XV1gwS879ZyJG+iY/ED3+PPj67FiWdZVDoUY6rSuFetlRUVs52gNj27J+KHbvd+5hATf0d6uDG3UpyanC2vngIUU+P6BI0kM/aIYTNXC2TUwgKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725853766; c=relaxed/simple;
	bh=cD0woQq3pNV3hFwgwazRlipAT2fmXYeGHRJIYddGnn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ehyNP9kH3gbsXvcVI3FusH4s7PLVXdjL3uBeJKzQ68uKywHiqt85DJcAiMcNPnmEy3DIV0pB1tPxvUuOk2CwtmLiKb9CfexiNiT+00wQy6VfGdA/aqWKD30KFpni21XBc7T9Upy0x3xXu3AdnVUOblb/48l+x0hQCeQMsy196qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuiG80h5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuiG80h5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725853763; x=1757389763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cD0woQq3pNV3hFwgwazRlipAT2fmXYeGHRJIYddGnn8=;
  b=SuiG80h5qO+e5sW9ftvoHrlDP4t9Uv084iPOablMCQb4hUUkiV54dbk/
   iO3tH9bQEw3jXLBNQ/yqf+m/3RF+M7iPq1NcYhmsmy2VcbMh8V8rcC3Ib
   zi9YWN5M5YaR/R9o59CuxI/2JzrGqzT1YIR8o4UH93CyTsj9TQGDSnsC8
   nkizCLo65U2BB6OqCQPFnfW1/aA16N4XHsNnT9FuGF9FYHAvvdxvwSzuC
   M0iDmllIma96M0wgginPW4PZq8fwTts+R5io9Hf79OLSxR1BV52ru4PBe
   NTnp4I7IPgR9iSBbr4JecZ4dq8A4L1vr3ATST/djaJrLOutLdTVKsNKJr
   Q==;
X-CSE-ConnectionGUID: yUHPYtW4RJS0tJ3RFzd3JA==
X-CSE-MsgGUID: 2/6zAkSfR266CXOpLK3yag==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24026708"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24026708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 20:49:22 -0700
X-CSE-ConnectionGUID: ngg4Brt4QoqLoe1GR+Q2dA==
X-CSE-MsgGUID: UmL8b3ilTzCjK6jbcv4UBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66852742"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2024 20:49:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snVOx-000EG3-0T;
	Mon, 09 Sep 2024 03:49:19 +0000
Date: Mon, 9 Sep 2024 11:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 18/46] crypto/ecdsa-x962.c:133:16: error: implicit
 declaration of function 'crypto_digest_size'; did you mean
 'crypto_sig_maxsize'?
Message-ID: <202409091106.Zn1dPy5q-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091106.Zn1dPy5q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091106.Zn1dPy5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091106.Zn1dPy5q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   crypto/ecdsa-x962.c: In function 'ecdsa_x962_digest_size':
>> crypto/ecdsa-x962.c:133:16: error: implicit declaration of function 'crypto_digest_size'; did you mean 'crypto_sig_maxsize'? [-Werror=implicit-function-declaration]
     133 |         return crypto_digest_size(ctx->child);
         |                ^~~~~~~~~~~~~~~~~~
         |                crypto_sig_maxsize
   cc1: some warnings being treated as errors
--
   crypto/ecdsa.c: In function 'ecdsa_digest_size':
>> crypto/ecdsa.c:180:16: error: 'SHA512_DIGEST_SIZE' undeclared (first use in this function)
     180 |         return SHA512_DIGEST_SIZE;
         |                ^~~~~~~~~~~~~~~~~~
   crypto/ecdsa.c:180:16: note: each undeclared identifier is reported only once for each function it appears in
>> crypto/ecdsa.c:181:1: warning: control reaches end of non-void function [-Wreturn-type]
     181 | }
         | ^


vim +133 crypto/ecdsa-x962.c

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
