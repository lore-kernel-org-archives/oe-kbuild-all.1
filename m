Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2B39B978
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649015; cv=none; b=ZE7rFOqKEkwDCUTC5XluC1JFmI0QfRc7+0DXDE+d4vZs16VCt/GB1ISG5si0oNcv/ktR1Qurw2lfnJcWZ8j8DUiFe7nrJcBym+wnc3gs3cNKPdQqv9kHLUSkxMHdRn70v3KIuzK+C1mzStSFKc1lfm0PyH/cL/bj471SJsmgLF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649015; c=relaxed/simple;
	bh=ktRHaeyMzoL5dfm6sBhgY0ozEPRUe9w9y8EUUD4aSS0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hAWTlPuCx2DcZeb/RmhOJX/TrUPL5jvHHDGtajCH1ncCzGZHgvZIG9PFWolwNeN59yvTLbQda3GK6hOZb/VjpR+CCog5ybokyF2QQ5OTi4Q6LElbYxZuOGAe/Nz8fF//z9MDXfDwnWEFL3TOuiRmNUkw2BmdoYN+hQQeW/aP7NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWBn8nmO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWBn8nmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774649013; x=1806185013;
  h=date:from:to:cc:subject:message-id;
  bh=ktRHaeyMzoL5dfm6sBhgY0ozEPRUe9w9y8EUUD4aSS0=;
  b=lWBn8nmOSha0w7LGRcbgJfIcyTxaBXnX1GWKyLSjEOfsi0/WmufPkDl4
   0hNmEMQsOmzmvpKHiqHsbdpkjJLApv3j70KGyPbEWCjFrYK2YbT1dBdL2
   0BtDsYruVRCY5u2pSIKq6+KLXe0DcENMkWpDZoNbPAYn1Bd3bsHa/USk9
   tb+DKYKUURcAvaPr8/ifR1R+ZcWZXi6RxDUswzROjMjIUOHbZS7+2Fvpk
   ycJSjgVgjpcBX113ORF6qak7+XpvO/bLtI0vt1Ag+i5QazUF9ADqABS/W
   L+pm99mAEp+Wfo76t5WBlln6gKuACi/3S3oy4ochFEO5RzFOW2Oj9ZeDJ
   A==;
X-CSE-ConnectionGUID: zIL5x+S+TP6nlp/TsgISOw==
X-CSE-MsgGUID: TNrhu00DQJ+N8GQtkwkwaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75610224"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75610224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 15:03:32 -0700
X-CSE-ConnectionGUID: TRsOO1oWTJ2a+T9qWAFU0w==
X-CSE-MsgGUID: actZ20tXRU28Z6RLc6iINg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248473039"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2026 15:03:31 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6FH6-00000000Ao1-1FOE;
	Fri, 27 Mar 2026 22:03:28 +0000
Date: Sat, 28 Mar 2026 06:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crypto-pending 14/17]
 crypto/crypto_user.c:370:undefined reference to `crypto_del_default_rng'
Message-ID: <202603280530.WF9vWC8A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crypto-pending
head:   43db047ef6a205fcfd7e4461bf7b7dadcbb9830b
commit: e4af28798c82aaaa1c17dc116e3ec2192ae6b642 [14/17] crypto: rng - Don't pull in DRBG when CRYPTO_FIPS=n
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260328/202603280530.WF9vWC8A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280530.WF9vWC8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280530.WF9vWC8A-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: crypto/crypto_user.o: in function `crypto_del_rng':
>> crypto/crypto_user.c:370:(.text+0x158): undefined reference to `crypto_del_default_rng'


vim +370 crypto/crypto_user.c

a38f7907b926e4c Steffen Klassert 2011-09-27  364  
9aa867e46565d61 Herbert Xu       2015-06-21  365  static int crypto_del_rng(struct sk_buff *skb, struct nlmsghdr *nlh,
9aa867e46565d61 Herbert Xu       2015-06-21  366  			  struct nlattr **attrs)
9aa867e46565d61 Herbert Xu       2015-06-21  367  {
9aa867e46565d61 Herbert Xu       2015-06-21  368  	if (!netlink_capable(skb, CAP_NET_ADMIN))
9aa867e46565d61 Herbert Xu       2015-06-21  369  		return -EPERM;
9aa867e46565d61 Herbert Xu       2015-06-21 @370  	return crypto_del_default_rng();
9aa867e46565d61 Herbert Xu       2015-06-21  371  }
9aa867e46565d61 Herbert Xu       2015-06-21  372  

:::::: The code at line 370 was first introduced by commit
:::::: 9aa867e46565d61491f884c793e4988678fbffa3 crypto: user - Add CRYPTO_MSG_DELRNG

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
