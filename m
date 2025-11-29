Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86611A9FAA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 01:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764379967; cv=none; b=WxQU6Rpc3ZFigkNugVa01IsgZMT064Z02SZsXwmFAYkhtJlbdEZIfav6HMcOk2u9h1TNnvmu+ROJuSvPUWDziOGZM2WBzAfw36df8x8Bmp42+oygPVlQMjuZEtPIObuRo9wTkcxRBBcGlLSjnfnjNO6w0UnBT2TWb3gjjsbuHdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764379967; c=relaxed/simple;
	bh=+O3yh0ZGPmSHADmnZjcNSTwCC5QVtqkzT+V2y+V4hcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbixHp03Gbr5515eO7djsm0MaiHMgznZ20Z58KUj73NfQHMlV2JwMYD5+9eynuaD8xsQ+8xfu5bULUgrc2B6Kquzz2ffXZQW/A2psT+emOtUv0hIaT7sZb4c1+nOh1EXzOufEfmCsm9eU2iWRriRKD879dIYne8k2gUyyDQSHPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXHEYkgg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXHEYkgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764379965; x=1795915965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+O3yh0ZGPmSHADmnZjcNSTwCC5QVtqkzT+V2y+V4hcU=;
  b=mXHEYkgg+M9p1LA4GbEb81otl2JAOcl9vQxQPosBrRi/SsfvqUOhtQC5
   cnvJQ3ePuFBQ/isGJBvbRLsKYu9z4BRI0XPenUMA8ASpA3tuB7xBH0UZt
   uHOhYrzWSOM4db8lAa1F6FHLmtb9Qvz3bLSdaHS0xoc91QL8sr4lo6/pk
   ROzm9O/yzHdjP/a26ex+ba/fyImx2R1SGHNEAdr+gLZ/QXarNFS2zmeJM
   Nd+AnZi7JOCu4dQ2uk/N+ycdq6T4Dyq4fkBXCxzT3P67K5Vca17ssrSCK
   ArSRqA8tdrQqbW7g1aJAhOXLq8a5tpzl2TV4mqKb4MO48NiwVTOCSPA2F
   g==;
X-CSE-ConnectionGUID: yrr7TxXHTyWsl7oY3v4lAw==
X-CSE-MsgGUID: iea8HAqcRcy0OdyfBAwWbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66291703"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66291703"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 17:32:44 -0800
X-CSE-ConnectionGUID: RYNF2qVDQ3GwvuYSQhqhKA==
X-CSE-MsgGUID: a0ow/vkBTEeg/T37dVIzmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="193776465"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Nov 2025 17:32:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP9pI-000000006sD-3MMy;
	Sat, 29 Nov 2025 01:32:40 +0000
Date: Sat, 29 Nov 2025 09:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/4] erofs: enable error reporting for
 z_erofs_fixup_insize()
Message-ID: <202511290903.UE7BHh4Q-lkp@intel.com>
References: <20251127073122.2542542-4-hsiangkao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127073122.2542542-4-hsiangkao@linux.alibaba.com>

Hi Gao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/fixes linus/master v6.18-rc7 next-20251128]
[cannot apply to xiang-erofs/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gao-Xiang/erofs-improve-Zstd-LZMA-and-DEFLATE-error-strings/20251127-153426
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20251127073122.2542542-4-hsiangkao%40linux.alibaba.com
patch subject: [PATCH 4/4] erofs: enable error reporting for z_erofs_fixup_insize()
config: x86_64-randconfig-123-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290903.UE7BHh4Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290903.UE7BHh4Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511290903.UE7BHh4Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/erofs/decompressor.c:195:16: sparse: sparse: Using plain integer as NULL pointer

vim +195 fs/erofs/decompressor.c

7fc45dbc938a2e drivers/staging/erofs/decompressor.c Gao Xiang 2019-06-24  179  
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  180  /*
c06acfa83138b7 fs/erofs/decompressor.c              Gao Xiang 2025-11-27  181   * Get the exact on-disk size of the compressed data:
c06acfa83138b7 fs/erofs/decompressor.c              Gao Xiang 2025-11-27  182   *  - For LZ4, it should apply if the zero_padding feature is on (5.3+);
c06acfa83138b7 fs/erofs/decompressor.c              Gao Xiang 2025-11-27  183   *  - For others, zero_padding is enabled all the time.
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  184   */
c06acfa83138b7 fs/erofs/decompressor.c              Gao Xiang 2025-11-27  185  const char *z_erofs_fixup_insize(struct z_erofs_decompress_req *rq,
c06acfa83138b7 fs/erofs/decompressor.c              Gao Xiang 2025-11-27  186  				 const char *padbuf, unsigned int padbufsize)
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  187  {
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  188  	const char *padend;
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  189  
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  190  	padend = memchr_inv(padbuf, 0, padbufsize);
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  191  	if (!padend)
c06acfa83138b7 fs/erofs/decompressor.c              Gao Xiang 2025-11-27  192  		return "compressed data start not found";
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  193  	rq->inputsize -= padend - padbuf;
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  194  	rq->pageofs_in += padend - padbuf;
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28 @195  	return 0;
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  196  }
10e5f6e482e18d fs/erofs/decompressor.c              Gao Xiang 2021-12-28  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
