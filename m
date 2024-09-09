Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF412E4A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 04:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725856890; cv=none; b=N758kPT8GXrvwXuk0T0FxsjNm5EW9ZIaGIj94/Cngk4rVWTFwsLSvQjUFNr14WamogUdNjAF0UVQqKQM4n9Mo4d2ngR7w25J5z1HfypAbTZBsqBAvMfmiNuvUDc/Rm7zgfJ/Vo1A1fNrJ60pFsFDKfOt1EyvJetV/vvj5pZsbtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725856890; c=relaxed/simple;
	bh=kSql61imH4ItNmAyJL2TSNFdd8i4N/kWL+WVPjgTNYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ov7ayBMN4X4eNAtvCTudwkKYaTDzsc91iAc9++uuMVic7FVzRIjmAU5ja/4KKhszA56NXEL7HGMH3xPsBQEaLgPEr9Nqz5ZonyLbsprdyj/k7avFr5OJzQdOEvCPCzY1I8bnTy5C2okNYyR5QkO7n3HhyLXQJWAsdC3+vdFzBQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfObyxAE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfObyxAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725856888; x=1757392888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kSql61imH4ItNmAyJL2TSNFdd8i4N/kWL+WVPjgTNYg=;
  b=DfObyxAEnQOZ0H/1dk8eR4h8KDufz2PZG+QM/zwK9V/hFqo1c+6wHhWH
   g///I5i40hDKfUz+Z6LsCTLf0atJRP4kIiu/IEWkQU0ZyzAfvHZ+ohfmh
   mJZTn/8VwuAHuf+2fFzDvxJT6i6FgyTajA+K9eu7c96x4A//+hUYhiYmt
   Qn2oJ7/aBx4oOnC4+BKX9omgCATQQv/MFqB/IWiuyYIhHZ1qHuIyJx916
   jI69op/fVvTaoYrdSMXfNccDA+SB4sBxXwQyZN/O82aEZ61qYVXYQQau4
   ek+aRTQ5o25K0ddnN4amimgTDx6aY7QxwDmTGLT63TPmR0f6rpiCjtPCD
   Q==;
X-CSE-ConnectionGUID: 6CtN6PIWQ++zQPWYFL1ECA==
X-CSE-MsgGUID: 7WqeYScHR/Wxbpo+2HLJOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="13434248"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="13434248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 21:41:27 -0700
X-CSE-ConnectionGUID: aqH3LjdpTwmdXfcW734KlQ==
X-CSE-MsgGUID: dZzRYSVTT1G8RXSuehtEkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="71493167"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2024 21:41:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snWDM-000EIl-0s;
	Mon, 09 Sep 2024 04:41:24 +0000
Date: Mon, 9 Sep 2024 12:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 19/46] crypto/ecdsa-p1363.c:55:16: error: implicit
 declaration of function 'crypto_digest_size'; did you mean
 'crypto_sig_maxsize'?
Message-ID: <202409091204.R2m5ushU-lkp@intel.com>
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
commit: 2ef1ba27967c53d6d87d0d8f29ba943453510418 [19/46] crypto: ecdsa - Support P1363 signature decoding
config: i386-buildonly-randconfig-002-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091204.R2m5ushU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091204.R2m5ushU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091204.R2m5ushU-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/ecdsa-p1363.c: In function 'ecdsa_p1363_digest_size':
>> crypto/ecdsa-p1363.c:55:16: error: implicit declaration of function 'crypto_digest_size'; did you mean 'crypto_sig_maxsize'? [-Werror=implicit-function-declaration]
      55 |         return crypto_digest_size(ctx->child);
         |                ^~~~~~~~~~~~~~~~~~
         |                crypto_sig_maxsize
   cc1: some warnings being treated as errors


vim +55 crypto/ecdsa-p1363.c

    50	
    51	static unsigned int ecdsa_p1363_digest_size(struct crypto_sig *tfm)
    52	{
    53		struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
    54	
  > 55		return crypto_digest_size(ctx->child);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
