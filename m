Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6610149E16
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730622804; cv=none; b=pdWS5lpYdOj/VNo+NI9UntcJRcKT32F7o20oMrA/kCVltpjHP2KPDiDPHbCapGLJ09ORwQc8xV8VElkxKw7ABxG+4NPzpNjPluWZNQfIPEaVtnpSxmnYOfpZjRRCCZCuN7Y+GGd9qoga8cQEPepvzGn/akMoSuqix+2zHd972sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730622804; c=relaxed/simple;
	bh=k62OPz4p2ZfQDMIJDED05S3CNPh4FHsn/CRcmDktOXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sSZ8h7H+3hdYcXyIj7thYyyp9zfeald8D+6ncu+CjHUYsVKTWedasjuRDn/BFUkx0W3pHKQ09gJS2jVaPq9XG5pnWucFkH9o33iF1/x8lU/801EB32ugFiazc31AHGBIWZPzwh/cAMKE6t2bselmoYalJPtMOzLPzpYJZ4KXiIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYyxbYno; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYyxbYno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730622802; x=1762158802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k62OPz4p2ZfQDMIJDED05S3CNPh4FHsn/CRcmDktOXM=;
  b=eYyxbYnooE3Z7dSNXo2xdNVNcxgkaLgpfPttjDOvYka/4BFTcJhiPXZL
   Nqb3jMxBo9AgtbH3wEWuYXtA1Qo/s16JATUQIt4lpvZE2IjK3fWot+EX3
   /XgArEeUsl5SLVL3XYGqSw3tOTod9YXQbj/ce+m4fBXo1USY5/0QlMfB/
   IuXfmteiPlaUkMHCWQWVSZ3qXnGyJWsmMrXNljk81oFQJGi5EltQOQbl4
   dcM4Yixzyk2K6dRR3qKd0n0/ndh0oaBf42KPtJNHf0dw7uPD/VGL06flG
   PViKxUjDpXOnVLczsuHjhTcLlu/sBBlMiSP3G3Ucyt7z4fhemSM5m0sYT
   Q==;
X-CSE-ConnectionGUID: h4rLhtdBTB+Yk6Blddv5GA==
X-CSE-MsgGUID: BJkTnnoDT2KfCGHsYGTG9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="30445032"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="30445032"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 01:33:19 -0700
X-CSE-ConnectionGUID: dUxLp70kRdG/3S63qTsCdQ==
X-CSE-MsgGUID: vS5CSiqySaOksYt9ISGQdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="87953812"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Nov 2024 01:33:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7W2v-000joh-0C;
	Sun, 03 Nov 2024 08:33:17 +0000
Date: Sun, 3 Nov 2024 16:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 8/12] crypto/rsa-pkcs1pad.c:108: warning:
 Function parameter or struct member 'name' not described in
 'rsa_lookup_asn1'
Message-ID: <202411031635.UxsrysZS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   b637d35eb650ccca25c1ca557582940da3e82c9e
commit: f1ec4f1092d24523fc0ca348b60548957e93a85a [8/12] crypto: rsa-pkcs1pad: export rsa1_asn_lookup()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241103/202411031635.UxsrysZS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031635.UxsrysZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031635.UxsrysZS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/rsa-pkcs1pad.c:108: warning: Function parameter or struct member 'name' not described in 'rsa_lookup_asn1'


vim +108 crypto/rsa-pkcs1pad.c

a49de377e051ea Tadeusz Struk   2016-03-03  100  
f1ec4f1092d245 Jarkko Sakkinen 2024-05-15  101  /**
f1ec4f1092d245 Jarkko Sakkinen 2024-05-15  102   * rsa_lookup_asn1() - Lookup the ASN.1 digest info given the hash
f1ec4f1092d245 Jarkko Sakkinen 2024-05-15  103   * name:	hash algorithm name
f1ec4f1092d245 Jarkko Sakkinen 2024-05-15  104   *
f1ec4f1092d245 Jarkko Sakkinen 2024-05-15  105   * Returns the ASN.1 digest info on success, and NULL on failure.
f1ec4f1092d245 Jarkko Sakkinen 2024-05-15  106   */
f1ec4f1092d245 Jarkko Sakkinen 2024-05-15  107  const struct rsa_asn1_template *rsa_lookup_asn1(const char *name)
a49de377e051ea Tadeusz Struk   2016-03-03 @108  {
a49de377e051ea Tadeusz Struk   2016-03-03  109  	const struct rsa_asn1_template *p;
a49de377e051ea Tadeusz Struk   2016-03-03  110  
a49de377e051ea Tadeusz Struk   2016-03-03  111  	for (p = rsa_asn1_templates; p->name; p++)
a49de377e051ea Tadeusz Struk   2016-03-03  112  		if (strcmp(name, p->name) == 0)
a49de377e051ea Tadeusz Struk   2016-03-03  113  			return p;
a49de377e051ea Tadeusz Struk   2016-03-03  114  	return NULL;
a49de377e051ea Tadeusz Struk   2016-03-03  115  }
f1ec4f1092d245 Jarkko Sakkinen 2024-05-15  116  EXPORT_SYMBOL_GPL(rsa_lookup_asn1);
a49de377e051ea Tadeusz Struk   2016-03-03  117  

:::::: The code at line 108 was first introduced by commit
:::::: a49de377e051eac5bc50a3b838614a05671da4e7 crypto: Add hash param to pkcs1pad

:::::: TO: Tadeusz Struk <tadeusz.struk@intel.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
