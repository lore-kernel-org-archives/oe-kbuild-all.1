Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF72638FB0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327350; cv=none; b=MV/hBGtY4hxG8LT7k8uKgTYw4yxqc4nb3nq5pglzQtrOxOzMJHOt8a+ssD4z5xl9kP0jBIeoSWD9t0twGdRCF4shMoPcdolcYit63eREs8qERULzOR/nXak7Oih4bo6nM6omqEouuZDIXWX6679TF1AZ3pCShxfgGu8EwGlRx54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327350; c=relaxed/simple;
	bh=Lj0SyRStK/IDKM1amE8ahX3sxSd0XaiENYpHg8OujaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJibzZ+Xd8BYfwBgh8XjtrAEDaE1jkyDbHWibMyN8pGZG+DXDiu2WtVW4USDicr7tt7XWaDBAxavep4HNZbtDn1m49kkuEHl4E0Ya+eoTySGH17M5g16yJsqTnu/M3cDUvMlF0FijcWZLAMq3aYGUl2ZlFr9CkL6Qhp6/4YiD2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=henv99M4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="henv99M4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729327348; x=1760863348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lj0SyRStK/IDKM1amE8ahX3sxSd0XaiENYpHg8OujaQ=;
  b=henv99M4yKY6ottuXteUepbG0c2K+9eVs/RFwB9aEf2eiBCktL7ueNUC
   r5aVQwa1jlFyeGvjBktoTapaYWx4gXrvvP+CkD1aeaONB0BhjRX/ZR4Jy
   wW8g+QFWK3EZkhOcYWG7gUNDWlLiXJpqmAJdWnToam6IjuIvMkcYWEQZz
   kZkBkoIi2hQ235swamubcPmbZIpBAlMyWBRwbsvK0GTqxifsHb2ryuRuU
   xiMbTZbmJ2FB4VeUEtC+UCI262VUbD1CF6VYrS9N+EfKaKN+wy7HEaR7M
   dcMap0SvQWKpajYR2VaSGe0qdXuoLRfJ30BUPH+jDPeVq+rk7YJOgqXDr
   w==;
X-CSE-ConnectionGUID: siW9EnA0QUa1Xh/crwGfew==
X-CSE-MsgGUID: CGFRlgqkTxaVGRQ9EFt3EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32546687"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32546687"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 01:42:28 -0700
X-CSE-ConnectionGUID: ObOjXqY1S/qRtOD3nEDLNQ==
X-CSE-MsgGUID: p8X0z/1URAG/BstkYGKMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="84135979"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Oct 2024 01:42:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t252W-000Oph-03;
	Sat, 19 Oct 2024 08:42:24 +0000
Date: Sat, 19 Oct 2024 16:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] tpm: Allow the TPM2 pcr_extend HMAC capability to be
 disabled on boot
Message-ID: <202410191604.NTblCQBg-lkp@intel.com>
References: <20241015193916.59964-1-zohar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015193916.59964-1-zohar@linux.ibm.com>

Hi Mimi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mimi-Zohar/tpm-Allow-the-TPM2-pcr_extend-HMAC-capability-to-be-disabled-on-boot/20241016-034118
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241015193916.59964-1-zohar%40linux.ibm.com
patch subject: [RFC PATCH] tpm: Allow the TPM2 pcr_extend HMAC capability to be disabled on boot
config: i386-buildonly-randconfig-001-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191604.NTblCQBg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191604.NTblCQBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191604.NTblCQBg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm2-cmd.c:18:19: warning: 'tpm2_pcr_extend_hmac_setup' defined but not used [-Wunused-function]
      18 | static int __init tpm2_pcr_extend_hmac_setup(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/tpm2_pcr_extend_hmac_setup +18 drivers/char/tpm/tpm2-cmd.c

    16	
    17	static int __ro_after_init tpm2_pcr_extend_hmac = 1;
  > 18	static int __init tpm2_pcr_extend_hmac_setup(char *str)
    19	{
    20		tpm2_pcr_extend_hmac = 0;
    21		return 0;
    22	}
    23	__setup("tpm2_pcr_extend_hmac_disable", tpm2_pcr_extend_hmac_setup);
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
