Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49CB1D5893
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452598; cv=none; b=gvgeOppk6e1ydCeNyGSSize8MfUdYZ03vJSl/4OIWnGA0gL/zgNj57EfJ7kz67nyxFPWWxvMAsIstgvKCTduavpLra9DKN5xt+vPBXd8NEOgDbfM8HdYE7TM3iNUfkm+4zTLAxKIySjrn2mVc2j3nbP58u/E+KIi047+8cNroms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452598; c=relaxed/simple;
	bh=IUdSlEMBMojYAGKyXkfH9VR//PA6pfTuHW/iFtdm16I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PSFb6MSraZKJzlat276OigTAwgzUkDYDmLrC39FYBkZhXsidcjy/Lkv8Ch6Sbz3cDRz6dMz79f4CnOxf/DkuJQaQWudiwHu+ilTOals4Ray5Ve0slnfBmgHmBTLPlqK1HcitBs9zaM8mxjJn47mnLA0XpcvX9hlMQ7csLkqOcuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+UOGhVn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+UOGhVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725452597; x=1756988597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUdSlEMBMojYAGKyXkfH9VR//PA6pfTuHW/iFtdm16I=;
  b=j+UOGhVnMN2nWKavjhDPVosJ27FVRtKO4+5fsgtAkrLOhbhgnE5ZaJeu
   IflXYh4CA6FkPYlzj1NVdnG93st8PBy2gu7dLZJJA/tMpmaDIMDE+HBzH
   oUaf0k7X2sSO/NrbuQIvQURLSx+ZRgvDkqDjjHsniEl2GeWkTXbaxs6Bj
   fcK1HTidyQLulbtpTL+VHx/vUl9BZHkm4a7fnkealGo9YCNJaHWm0WAjp
   ufvQPxuxwsLrwjVKKY59In2B8jw23ZOS4hJy/dtl8PNlSZ+yCiH+NIVd0
   oSStw3BxGPzeXw6MtcNgM+Lp+/ggnXuwXQP23ntw0lS6Tc2VNUegNteNB
   A==;
X-CSE-ConnectionGUID: Lx7jvI+FTaamdTNY3jHcLA==
X-CSE-MsgGUID: 6SxvYyD9TaegmqGcA6JWFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27871258"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="27871258"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 05:23:16 -0700
X-CSE-ConnectionGUID: gnleR+6XTPabdBIEg0TtKw==
X-CSE-MsgGUID: xWEW2gIFSoKuwMbtFha/fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65493950"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Sep 2024 05:23:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slp2W-00082F-2z;
	Wed, 04 Sep 2024 12:23:12 +0000
Date: Wed, 4 Sep 2024 20:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5413/9291] otx_cptvf_algs.c:undefined reference
 to `crypto_authenc_extractkeys'
Message-ID: <202409042013.gT2ZI4wR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fdadd93817f124fd0ea6ef251d4a1068b7feceba
commit: 311eea7e37c4c0b44b557d0c100860a03b4eab65 [5413/9291] crypto: octeontx - Fix authenc setkey
config: s390-randconfig-c004-20220327 (https://download.01.org/0day-ci/archive/20240904/202409042013.gT2ZI4wR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409042013.gT2ZI4wR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409042013.gT2ZI4wR-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/crypto/marvell/octeontx/otx_cptvf_algs.o: in function `otx_cpt_aead_cbc_aes_sha_setkey':
>> otx_cptvf_algs.c:(.text+0x1daa): undefined reference to `crypto_authenc_extractkeys'
   s390-linux-ld: drivers/crypto/marvell/octeontx/otx_cptvf_algs.o: in function `otx_cpt_aead_ecb_null_sha_setkey':
   otx_cptvf_algs.c:(.text+0x1e12): undefined reference to `crypto_authenc_extractkeys'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
