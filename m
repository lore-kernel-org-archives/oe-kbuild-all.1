Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19E62FD1D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 04:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768277136; cv=none; b=t2IdG85xMPjscQ5Eb7gw22DO9DxVMK0yC7m4FMoSEOhglhBXOsU6y7phdKnPWgwr6WqiAghGNa8sgKjzbNyoURda8SLcwyyIiW9Eihrs0LfgCPnhBIv3UWAqfP6RVHirJCQ+OweGuWziGWniJmK19BTJ615oA9VFgAN/u81pgZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768277136; c=relaxed/simple;
	bh=6Qj+yLfZPmjELIecfIm6PnhyEtFflIj0bqBwLp2WbuE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h+ObchmEX4YzPbeDrQoTCYqT31L+RobGPZsx2WOx04+ZlSUFqPExNyrawc8Jg1/k8QRBqdxlYpRfpeLN/1kLbOK4Fsd4ddsvq4afNgL///l+1vnjeregpHwXDcT2L3qkXheJ6yHO0Nh/u7aYOJUYtUt22+lPFkZAedG6ONpJKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYvpN8Zm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYvpN8Zm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768277136; x=1799813136;
  h=date:from:to:cc:subject:message-id;
  bh=6Qj+yLfZPmjELIecfIm6PnhyEtFflIj0bqBwLp2WbuE=;
  b=IYvpN8ZmxEgYmGY6Fya3YHLPmrs+a2ibEASYtOfO8+5PgRzF1pVdG5gw
   MAdIEa5c3Io4yKeSMzE5hc5mu7QWYzAb06uhKHnm9tNy8MCGUFqTL5XP4
   j20WCv5tiiseStNaDjUhPUJxfXezoN2llFhDNSecdaUiHcM+oAG0+HOq4
   ZO/2kDGh2xQ+wyk5WYG32k9TsylreBursh+jHsuz94WnmV1/IVE31q0k3
   i7Fvm1mNmwMWeKWLDy+ysLNYivbOocpPPi+txI8yVUamaXSBYsBrzq9Kb
   8iqkCTn6BKgp1DS7ZctvBiRpYhIbpsNaHrWROQ9T98McEouThDaO7WgcO
   w==;
X-CSE-ConnectionGUID: NMn82kB4SgyoZKn963HmcA==
X-CSE-MsgGUID: s4yHVMheQPu87VbLQFCugQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80201918"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80201918"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 20:05:35 -0800
X-CSE-ConnectionGUID: tmNQuEX2S2izOYlMOKIzbg==
X-CSE-MsgGUID: uvz4FOWIRHiX6Ntmx408lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204173417"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jan 2026 20:05:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVet-00000000EC7-2xNF;
	Tue, 13 Jan 2026 04:05:31 +0000
Date: Tue, 13 Jan 2026 12:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 13/17] net/core/skbuff.c:7315:67:
 sparse: sparse: incorrect type in argument 6 (incompatible argument 1
 (different address spaces))
Message-ID: <202601131258.tZZqH37j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 586e10988ec72acea43cbc695cec236fd69c57f3 [13/17] net: Perform special handling for a splice from a bvecq
config: x86_64-randconfig-123-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131258.tZZqH37j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131258.tZZqH37j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131258.tZZqH37j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/skbuff.c:7315:67: sparse: sparse: incorrect type in argument 6 (incompatible argument 1 (different address spaces)) @@     expected unsigned long ( *[usertype] step )( ... ) @@     got unsigned long ( * )( ... ) @@
   net/core/skbuff.c:7315:67: sparse:     expected unsigned long ( *[usertype] step )( ... )
   net/core/skbuff.c:7315:67: sparse:     got unsigned long ( * )( ... )
>> net/core/skbuff.c:7306:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *buff @@     got void [noderef] __user *iter_from @@
   net/core/skbuff.c:7306:30: sparse:     expected void const *buff
   net/core/skbuff.c:7306:30: sparse:     got void [noderef] __user *iter_from
   net/core/skbuff.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int

vim +7315 net/core/skbuff.c

  7299	
  7300	static __always_inline
  7301	size_t csum_one(void __user *iter_from, size_t progress,
  7302			size_t len, void *priv, void *priv2)
  7303	{
  7304		__wsum *csum = priv;
  7305	
> 7306		*csum = csum_partial(iter_from, len, *csum);
  7307		return 0;
  7308	}
  7309	
  7310	static void skb_splice_csum_bv(struct sk_buff *skb, struct bio_vec *bv,
  7311				       size_t skip, size_t len)
  7312	{
  7313		__wsum csum = 0;
  7314	
> 7315		size_t did = iterate_one_bvec(bv, skip, len, &csum, NULL, csum_one);
  7316	
  7317		WARN_ON_ONCE(did != len);
  7318		skb->csum = csum_block_add(skb->csum, csum, len);
  7319	}
  7320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
