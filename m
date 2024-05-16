Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22774282F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715842599; cv=none; b=HREEpI+49Bhvf8YkrUwz6MnH1n6f06yOyicGJ1Oi6P8YoVjt5ZvhlQQYXJdsCJ9T4PUhqDLNG71pMU2uEVFOETVYAJm/786aUD6s71q1ngzIrcdu6aReHkrg8oN6Z1KUbCHIs/F2OG0wdORk28ekp66KX+UseQH0+/c0n22ZQzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715842599; c=relaxed/simple;
	bh=J2sozI/5C1g+9SG5l4EKXY34vm3HAMqwbZQeNJlmSkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qI3iGtirZR61VlJaAL933yU1UcGiVDOvcHAMQBcJgopAIeBZl5g0x8lcd0CLBuJd+/OGRNTHKtvkI7B8/VspY/qUDy0hRBwrs9t++etnVEv7XY3wM+70+UHQS2M6oh1r/E24hLkdyzcXZIDqOzQ/fR4X+42KWVmmOZ2UpIxF2mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FI8orxAP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FI8orxAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715842598; x=1747378598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J2sozI/5C1g+9SG5l4EKXY34vm3HAMqwbZQeNJlmSkw=;
  b=FI8orxAPlsAnKWC8GS6ErILnsm5WwTuLEtryl7IXOuDRe20bo4/8QCAF
   e4UBZD3Di9Ova2JWYGWhdJ06vxi+bS84oxXsohJO9ZffSywpoKevAjqZ1
   KDbpp1xdvL23WC9J4rXUgXa74fSvIYyT3WEJ+5nLBnizCGuAOpeeXbNI6
   +X3D8LIWbq0iqR1hea+dWinQx1/C0oAhqyXqMDGmmz9ba2IYCi8vGKuIV
   aaDzOOcS+1jy9rrwg0RhnrGgBw385O8SHWIeLdUinsYtXR61Im5I7C19h
   Aa9LCMbMrVYrjCmOCEMAft7zOodVFIBFEpxpw/j5udH/xQ3mlIthB3rgE
   Q==;
X-CSE-ConnectionGUID: Dpn4yzF6RcaXui46DRgr8g==
X-CSE-MsgGUID: 316xYn7bRRCYBnn+b5Eldg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34446522"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="34446522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 23:56:37 -0700
X-CSE-ConnectionGUID: FRWmhCXLQTW8g3bmgMY7Rw==
X-CSE-MsgGUID: nWYch3FCR5mymxrs+g9kJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="68776550"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2024 23:56:35 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7V2W-000DlD-2O;
	Thu, 16 May 2024 06:56:32 +0000
Date: Thu, 16 May 2024 14:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] crypto: rsa-pkcs1pad: export rsa1_asn_lookup()
Message-ID: <202405161409.ij6nBora-lkp@intel.com>
References: <20240515150213.32491-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515150213.32491-1-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.9 next-20240515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/crypto-rsa-pkcs1pad-export-rsa1_asn_lookup/20240515-230406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240515150213.32491-1-jarkko%40kernel.org
patch subject: [PATCH v2] crypto: rsa-pkcs1pad: export rsa1_asn_lookup()
config: i386-randconfig-061-20240516 (https://download.01.org/0day-ci/archive/20240516/202405161409.ij6nBora-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405161409.ij6nBora-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405161409.ij6nBora-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/rsa-pkcs1pad.c:83:32: sparse: sparse: symbol 'rsa_asn1_templates' was not declared. Should it be static?

vim +/rsa_asn1_templates +83 crypto/rsa-pkcs1pad.c

    82	
  > 83	const struct rsa_asn1_template rsa_asn1_templates[] = {
    84	#define _(X) { #X, rsa_digest_info_##X, sizeof(rsa_digest_info_##X) }
    85		_(md5),
    86		_(sha1),
    87		_(rmd160),
    88		_(sha256),
    89		_(sha384),
    90		_(sha512),
    91		_(sha224),
    92	#undef _
    93	#define _(X) { "sha3-" #X, rsa_digest_info_sha3_##X, sizeof(rsa_digest_info_sha3_##X) }
    94		_(256),
    95		_(384),
    96		_(512),
    97	#undef _
    98		{ NULL }
    99	};
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
