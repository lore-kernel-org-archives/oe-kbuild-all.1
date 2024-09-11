Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783B14287
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 04:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726030232; cv=none; b=d0JVc/CEBr+Bxm0yEn0CCQp37UrDims4F/ud1m1xMNflKRyvauGp0tMDzIPvBh/RZGt9NYMOwnQmF92IOnJF1u6UsxbmpiDl8gBD1+dnjZcaQ5QQIaJ5L4otazMHfbQ7PHpbB00w6i4buQOSIXDU/p9a10n+tW1lkJu3U8S33c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726030232; c=relaxed/simple;
	bh=LzCc+uZAhoQ+eKovQbCMKK1aSoTlRq7MF7pjuK8bwp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kPqvNJ1RCsRrSMyci4S9mO3yJcZCh7CPLvKnZ+3nvAg2vXingw9gs+JVl0x31vuZP2uSTJ7nypWT3FINc1zc/vTAiYvt4NEaOlCPlqJOG0raMhdY3GmkiAsTFmb/MmG2g6XPnTnqmsjZdHky0DOtoAM7f8Y9H3Jp0cf9t8hAtZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzPpsIeJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzPpsIeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726030231; x=1757566231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzCc+uZAhoQ+eKovQbCMKK1aSoTlRq7MF7pjuK8bwp4=;
  b=EzPpsIeJ8TOjPQvlihEOYwC7KnwLqFheCq3AyYaivXmOCGs2TUZrUiQE
   ENMSVfUJQj06nCZmoFy1nhPNM/uYjoD1Z0mG26fR8mmNXImXIgoxTavpE
   Ybx/lW0m3vv9bpUefsvN+KmmRnB4Qn3v2xR40GY9iUv8MYfVO8/wbz7ml
   9ecB4s7ND4Bd6yI6O2N7RzB5Oq5Bup0pzQ2yCzVF1SqmjfCn9PwhEV/vQ
   0F3kkWh/3u6O4J9KzcYSNDLpOugv9ZtiHM3YpgF5XAViMZOBXr7wPOb27
   BY46cG/CUK0SZ8jKNBZzMks0Gq8CU9rV4i5Ijtg4DaF7IemSUtyfuFBaW
   Q==;
X-CSE-ConnectionGUID: x0PTJ3u7SHylTuF1+KnWyg==
X-CSE-MsgGUID: PRngRW0nTfK/3DWDkgY1BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36163019"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="36163019"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 21:50:30 -0700
X-CSE-ConnectionGUID: ReNuySiGQnSt10xf2mXHJw==
X-CSE-MsgGUID: CFMYSRa+QwGNtkmEqjxxzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="72010806"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2024 21:50:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soFJD-00033M-28;
	Wed, 11 Sep 2024 04:50:27 +0000
Date: Wed, 11 Sep 2024 12:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 7/11] crypto/rsa-pkcs1pad.c:108: warning:
 Function parameter or struct member 'name' not described in
 'rsa_lookup_asn1'
Message-ID: <202409111211.J48WpGvJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   79e909153c0a5ac21c2c5c0d4eac9229b3408178
commit: 55d2a2d370d348a8d9bab768dd2b92c6b16e741d [7/11] crypto: rsa-pkcs1pad: export rsa1_asn_lookup()
config: i386-buildonly-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111211.J48WpGvJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111211.J48WpGvJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111211.J48WpGvJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/rsa-pkcs1pad.c:108: warning: Function parameter or struct member 'name' not described in 'rsa_lookup_asn1'


vim +108 crypto/rsa-pkcs1pad.c

a49de377e051ea Tadeusz Struk   2016-03-03  100  
55d2a2d370d348 Jarkko Sakkinen 2024-05-15  101  /**
55d2a2d370d348 Jarkko Sakkinen 2024-05-15  102   * rsa_lookup_asn1() - Lookup the ASN.1 digest info given the hash
55d2a2d370d348 Jarkko Sakkinen 2024-05-15  103   * name:	hash algorithm name
55d2a2d370d348 Jarkko Sakkinen 2024-05-15  104   *
55d2a2d370d348 Jarkko Sakkinen 2024-05-15  105   * Returns the ASN.1 digest info on success, and NULL on failure.
55d2a2d370d348 Jarkko Sakkinen 2024-05-15  106   */
55d2a2d370d348 Jarkko Sakkinen 2024-05-15  107  const struct rsa_asn1_template *rsa_lookup_asn1(const char *name)
a49de377e051ea Tadeusz Struk   2016-03-03 @108  {
a49de377e051ea Tadeusz Struk   2016-03-03  109  	const struct rsa_asn1_template *p;
a49de377e051ea Tadeusz Struk   2016-03-03  110  
a49de377e051ea Tadeusz Struk   2016-03-03  111  	for (p = rsa_asn1_templates; p->name; p++)
a49de377e051ea Tadeusz Struk   2016-03-03  112  		if (strcmp(name, p->name) == 0)
a49de377e051ea Tadeusz Struk   2016-03-03  113  			return p;
a49de377e051ea Tadeusz Struk   2016-03-03  114  	return NULL;
a49de377e051ea Tadeusz Struk   2016-03-03  115  }
55d2a2d370d348 Jarkko Sakkinen 2024-05-15  116  EXPORT_SYMBOL_GPL(rsa_lookup_asn1);
a49de377e051ea Tadeusz Struk   2016-03-03  117  

:::::: The code at line 108 was first introduced by commit
:::::: a49de377e051eac5bc50a3b838614a05671da4e7 crypto: Add hash param to pkcs1pad

:::::: TO: Tadeusz Struk <tadeusz.struk@intel.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
