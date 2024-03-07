Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D101CA8A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 21:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709848108; cv=none; b=oRzLuhT6a3RFap4d7qowucReOhVOgNQ/PSN1qxJ+8h/VgyJgA93vi/I15rgLsOGjE4N9fy/OGRE0UzwI3iZKo3ETdPW55EA7l6m5NKx4SFnY58bYB2AVcY8Iajcspwa0eOHnb1Jg14MgQso98FQdAjFpRFKmIncgilWgE7LdCIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709848108; c=relaxed/simple;
	bh=wDISFApxMu44+3cbxItk4cELp9kpESCVMdI35/37q34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVLse95K10++Fy+DF9oJBm4U1dSOrG18ES8JvA/TseaJot50Ut02eDvGxSz2urIeyyR/MXsMiZeNuPuoIeBrhIzotQDqK1lRFDMQb8VBqNqJQGCJIxQxZUNQR+IeC0vw02HKHdG4VfSr0PxtsxHimOgyz/qwJXF8LM+MUSZz5/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ilv+LFCC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ilv+LFCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709848106; x=1741384106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDISFApxMu44+3cbxItk4cELp9kpESCVMdI35/37q34=;
  b=Ilv+LFCCTyU+yfG2mGr/wBmhY1/vlymUQDx8rseTqEI/H/OBD0TCTNtn
   sfDZ5lqS2MdCDZDWBuRbl7XhTHNeuDMnosKgP8o8LPzOgzskEqmxRumge
   ySCIypU+l2G5n2Wyo06qGkxf0FJ9VtlJ2qAKVPpGTeWaq44g3fzhmzBP/
   Y3BpSxXTs2i5u+TY0KlhZZDxyLLzTdomQZVbw0L10IVu/0oAw0SOFibTq
   mZLg25xXQOnEeAZcf3ZoEca1mrhTzVrJK1sG7dbWrq7L3b47Zf8tpCDa4
   5q4c1uduaRRvd7XJCdyiC4TynIufNCH6fNSOf1goC5bnDhGicQ2T5tkMv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4718649"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4718649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 13:48:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="14916319"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2024 13:48:24 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riLb9-0005jV-32;
	Thu, 07 Mar 2024 21:48:19 +0000
Date: Fri, 8 Mar 2024 05:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 16/34] include/crypto/internal/ecc.h:74:34: sparse:
 sparse: cast to restricted __be64
Message-ID: <202403080559.b0unHTFI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   fde830bd8ee973e5acff536fac518cf4bdb59714
commit: 27df155f5889562ed6dad1352b9c84b4006907e1 [16/34] crypto: ecdsa - Convert byte arrays with key coordinates to digits
config: x86_64-randconfig-121-20240305 (https://download.01.org/0day-ci/archive/20240308/202403080559.b0unHTFI-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080559.b0unHTFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080559.b0unHTFI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   crypto/ecdsa.c: note: in included file:
>> include/crypto/internal/ecc.h:74:34: sparse: sparse: cast to restricted __be64
>> include/crypto/internal/ecc.h:74:34: sparse: sparse: cast to restricted __be64

vim +74 include/crypto/internal/ecc.h

    58	
    59	/**
    60	 * ecc_digits_from_bytes() - Create ndigits-sized digits array from byte array
    61	 * @in:       Input byte array
    62	 * @nbytes    Size of input byte array
    63	 * @out       Output digits array
    64	 * @ndigits:  Number of digits to create from byte array
    65	 */
    66	static inline void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
    67						 u64 *out, unsigned int ndigits)
    68	{
    69		unsigned int o = nbytes & 7;
    70		u64 msd = 0;
    71	
    72		if (o) {
    73			memcpy((u8 *)&msd + sizeof(msd) - o, in, o);
  > 74			out[--ndigits] = be64_to_cpu(msd);
    75			in += o;
    76		}
    77		ecc_swap_digits(in, out, ndigits);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
