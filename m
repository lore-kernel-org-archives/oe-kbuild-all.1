Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE45143754
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715853715; cv=none; b=hzNqHXw/z/cN00s1K6wSN7J6krnWvafyoeKdKm2gGS7MPqwJBU+RMUSl3Rzzek1+u+e8vNKjj6D0GO+7J46jkNvV6ZPPMib/VfM7wVUp8eoUxLeXtyfe/308PiYepGl21Zzpxl2Yh89dS4lAz2Z7k1trU8q/rb8vBXGJVBDsUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715853715; c=relaxed/simple;
	bh=a+3hVEotkOgFeqAkfZmcR+UowMBiTMjwXvppYB9ueEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg5hQ+579mGMhLGrnbf56HEliGkPFOI1UiEyzE7Xt5nc+R3a7gn4lPcTJi5cIZM+Vs4oT/1tTeRKasI5xtVRGqWmUzEuvPjg2jt7tGzS823hLMUYpSk1umDjZgOnr29ALHGdFkX77idZojPA+pDyoKjl5nkki9FL0Fjnn42M/lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRy7FMML; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRy7FMML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715853714; x=1747389714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+3hVEotkOgFeqAkfZmcR+UowMBiTMjwXvppYB9ueEQ=;
  b=hRy7FMMLhQ9IRZL8f5wemJH0eD5eX0uFOpZm9oIboM1udPBnPW8hEp1P
   SAYxNHwehMSsXCeHdSrNJUNUZ+FXiXsJjub1eE3uqsmXzLtOYDKbAlS9g
   XeUxnGx48B1kFtQpp100KBjLLJ1lmwW1pwMiz5nfWiFgQYEmVKYUa54zN
   umKIWo0nucjwrlR1lka11Saw+9iiGYPtVFxcOWgk0SOnpcQbg9lqvdt7p
   wgWfRo+jcTyrc+Iy/Tj7OstMJY1ojIUP3ntHahilkOkt9dSzvyo63kR3B
   M+xH8Pqp90DKzCNUCwebk0oMfPsPBrzH8TlMZOZqsLswaVQqNMVXtAA30
   g==;
X-CSE-ConnectionGUID: XL4mkdxKTXqLZoBtlEYo6A==
X-CSE-MsgGUID: IdHfPSq8QJ+Z+XZSfnNS5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12136760"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="12136760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:01:53 -0700
X-CSE-ConnectionGUID: JJLF0bmxQeKYaw5uEnib2g==
X-CSE-MsgGUID: +XuKEP/HQjOsm70CICwQUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31305273"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 May 2024 03:01:52 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7Xvp-000E8F-2h;
	Thu, 16 May 2024 10:01:49 +0000
Date: Thu, 16 May 2024 18:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] crypto: rsa-pkcs1pad: export rsa1_asn_lookup()
Message-ID: <202405161744.nLqphdgo-lkp@intel.com>
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
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/crypto-rsa-pkcs1pad-export-rsa1_asn_lookup/20240515-230406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240515150213.32491-1-jarkko%40kernel.org
patch subject: [PATCH v2] crypto: rsa-pkcs1pad: export rsa1_asn_lookup()
config: i386-randconfig-061-20240516 (https://download.01.org/0day-ci/archive/20240516/202405161744.nLqphdgo-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405161744.nLqphdgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405161744.nLqphdgo-lkp@intel.com/

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
