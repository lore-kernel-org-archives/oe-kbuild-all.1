Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E843168E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 20:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249378; cv=none; b=tGMOteRMrbZwFPxiTxlFhQWR9WbClOOrjFyWdLyaGUPb0xReLuTvp9/lahppSX0fUzEpWKXITSjiBDn5/sXMyzip0KQ7vnGsIyFIFsVlBsQyDt+P1HNu0R5uwlBKIUJbca0m4wJ5DQTniYunmfI4M/aJ1skUBcmtDHbFjyIzgCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249378; c=relaxed/simple;
	bh=VX8H4qGnmDGClZUERAN4gLPtS1ru+LIKvSj0B9RH+AA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qc+u8jX7ETq7xkqmuMr6LpSKTmoGT7JZOvfifDiUbTtS1K7IYL0ysE4IoVg1fFb6sB+5x3OdWlY+zW2MKubVIwjFcSQFKbZK+0M4Y7qApvYL74TE+fpITw1WeyaCQYMDiz7hto5V0Ea6H8lByeul2RpWAElh8dnznpW7dXWnUPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBklR0yr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBklR0yr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768249376; x=1799785376;
  h=date:from:to:cc:subject:message-id;
  bh=VX8H4qGnmDGClZUERAN4gLPtS1ru+LIKvSj0B9RH+AA=;
  b=MBklR0yrjWIKJ4OB3J4l26TbwoCP9X1ikames25Kg1GbKJYNoA37BdT8
   kM8hRwFeHmlS6SCT6bjlNl5UY7XouxQgqkPQ+dJm2cA6ZFRoSwd7M1HNA
   qFKPyB9IlNadc4RpO7uivyFd+xwtm2zO+ID5+lsKkf54oAymlfDuDBLUn
   3dY562A+w1eJSDhPreqcGHLVfONAd26WKWEWM0BgMAEHheG/Z9P7fAYtQ
   sbaVQsefyDyne97pHxPOwhv6rEweeptBa7U2a2boJ/zSbt8Ye1CziDRl8
   y18GmYGE+oER2gEZIf+oTF08KS3ffSQqba+oYwkocgd/48hatheuWixGg
   Q==;
X-CSE-ConnectionGUID: W7kYsijdT1Gr0LCMbzyvtQ==
X-CSE-MsgGUID: oxGgc6O4RaGgwN59bFlaVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69514985"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69514985"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:22:54 -0800
X-CSE-ConnectionGUID: fVQDvifvSOqExjKZmJARqw==
X-CSE-MsgGUID: DJd+6Rb3TPWSIdiPxbGVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="209258620"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jan 2026 12:22:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfOR7-00000000Dq0-35BC;
	Mon, 12 Jan 2026 20:22:49 +0000
Date: Tue, 13 Jan 2026 04:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 13/17] net/core/skbuff.c:7280:33:
 error: 'bvec' undeclared; did you mean 'bvecq'?
Message-ID: <202601130422.xyz7ABW0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 586e10988ec72acea43cbc695cec236fd69c57f3 [13/17] net: Perform special handling for a splice from a bvecq
config: sparc-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130422.xyz7ABW0-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130422.xyz7ABW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130422.xyz7ABW0-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/skbuff.c: In function 'iterate_one_bvec':
>> net/core/skbuff.c:7280:33: error: 'bvec' undeclared (first use in this function); did you mean 'bvecq'?
      void *kaddr = kmap_local_bvec(bvec, offset);
                                    ^~~~
                                    bvecq
   net/core/skbuff.c:7280:33: note: each undeclared identifier is reported only once for each function it appears in


vim +7280 net/core/skbuff.c

  7265	
  7266	static __always_inline
  7267	size_t iterate_one_bvec(struct bio_vec *p, size_t skip, size_t len,
  7268				void *priv, void *priv2, iov_step_f step)
  7269	{
  7270	#ifdef CONFIG_HIGHMEM
  7271		size_t progress = 0;
  7272	
  7273		if (skip >= p->bv_len)
  7274			return 0;
  7275	
  7276		len = umin(len, p->bv_len - skip);
  7277		while (len > 0) {
  7278			size_t remain, consumed;
  7279			size_t offset = p->bv_offset + skip, part;
> 7280			void *kaddr = kmap_local_bvec(bvec, offset);
  7281	
  7282			part = umin(len, PAGE_SIZE - offset % PAGE_SIZE);
  7283			remain = step(kaddr, progress, part, priv, priv2);
  7284			kunmap_local(kaddr);
  7285	
  7286			consumed = part - remain;
  7287			len -= consumed;
  7288			progress += consumed;
  7289			skip += consumed;
  7290			if (remain)
  7291				break;
  7292		}
  7293	
  7294		return progress;
  7295	#else
  7296		return len - step(bvec_virt(p) + skip, 0, len, priv, priv2);
  7297	#endif
  7298	}
  7299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
