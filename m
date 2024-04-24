Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0007EFC11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 01:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713921535; cv=none; b=TdrnmxvB2dA2JW5tEqAfP/qtYnr9Sjl0PsXErwPlLKsnSHBQe5f3sTZX1ZgGiI/Sp296dfKkh5dYYkINITMovNcfN7nnMLzqT5SDPpb/t+8gntB6Cdn5yWcDhPtpxeMwC/NXWvpxfQB+buaoSVL5wJeMcIfcEc1ip29kMn/HY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713921535; c=relaxed/simple;
	bh=IvTJ5D1BZfjebKKugZ2HhziZWE9LUQ1pbwpSJGmhLU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iiaJC2v70Nv5RYOYdAA9dDUCh2HwFI5CIjRipnrKI735VhYkrmQt6KnG+546NcKl6iwLKuPJGhMTBsU51IymMIVSBNrOIy6zBySoW66JT8kSpPlSXo889+y/z+9fo1Lnxmb0HyKAR1gXQqjfIf8q5pom78CWLEW4peZZWZkJWCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZhIZcLS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZhIZcLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713921534; x=1745457534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IvTJ5D1BZfjebKKugZ2HhziZWE9LUQ1pbwpSJGmhLU8=;
  b=MZhIZcLSXxI64XicBmwpfXLzvfv0Aajy7UiXENgSK31PuYzhu0wmLDTF
   zCFNcpj1VOuRq+CM5NpOTW6VBU66oPk7QbTf9Do4T0JOJTZBfmmayYY/c
   eemi66/TTR3ce6vWD5qAJ6PATiWE+ISs9SDShOmIZojwbix6V+/DCMKcQ
   NO7N/YdgCFeOZmgkPU0/c2kc8+yeV47optY36mC2Tt3dBaNUzWXkMJ0So
   NLdNEkMPCXCBH34C6pc5LspQs8TRdaC/0aQPTj+SZeKO/Zbgq61HLj8nX
   CT4yw2HSEs4a5jPW32r++EVVx4a/FbAmfr8nSoEQD3R5oaDDgLrmU5HH0
   g==;
X-CSE-ConnectionGUID: ndaHXT9QSs29gA4P9sjtDg==
X-CSE-MsgGUID: U8zeSRJnS62s6Pi2YQ5L6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20228677"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20228677"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 18:18:52 -0700
X-CSE-ConnectionGUID: sB/yoVO0R4+BN/wJLJF8Fw==
X-CSE-MsgGUID: r6tW/cASStiQgZJoTQj5tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24548317"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2024 18:18:50 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzRHc-0000i9-0k;
	Wed, 24 Apr 2024 01:18:48 +0000
Date: Wed, 24 Apr 2024 09:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 4693/7876]
 crypto/asymmetric_keys/x509_cert_parser.c:69:9-15: ERROR: allocation
 function on line 68 returns NULL not ERR_PTR on failure
Message-ID: <202404240904.Qi3nM37B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a59668a9397e7245b26e9be85d23f242ff757ae8
commit: 5c6ca9d936654a135b459c846885e08966e5e5bf [4693/7876] X.509: Introduce scope-based x509_certificate allocation
config: sparc-randconfig-r061-20240423 (https://download.01.org/0day-ci/archive/20240424/202404240904.Qi3nM37B-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240904.Qi3nM37B-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> crypto/asymmetric_keys/x509_cert_parser.c:69:9-15: ERROR: allocation function on line 68 returns NULL not ERR_PTR on failure

vim +69 crypto/asymmetric_keys/x509_cert_parser.c

    57	
    58	/*
    59	 * Parse an X.509 certificate
    60	 */
    61	struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
    62	{
    63		struct x509_certificate *cert __free(x509_free_certificate);
    64		struct x509_parse_context *ctx __free(kfree) = NULL;
    65		struct asymmetric_key_id *kid;
    66		long ret;
    67	
  > 68		cert = kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
  > 69		assume(!IS_ERR(cert)); /* Avoid gratuitous IS_ERR() check on return */
    70		if (!cert)
    71			return ERR_PTR(-ENOMEM);
    72		cert->pub = kzalloc(sizeof(struct public_key), GFP_KERNEL);
    73		if (!cert->pub)
    74			return ERR_PTR(-ENOMEM);
    75		cert->sig = kzalloc(sizeof(struct public_key_signature), GFP_KERNEL);
    76		if (!cert->sig)
    77			return ERR_PTR(-ENOMEM);
    78		ctx = kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);
    79		if (!ctx)
    80			return ERR_PTR(-ENOMEM);
    81	
    82		ctx->cert = cert;
    83		ctx->data = (unsigned long)data;
    84	
    85		/* Attempt to decode the certificate */
    86		ret = asn1_ber_decoder(&x509_decoder, ctx, data, datalen);
    87		if (ret < 0)
    88			return ERR_PTR(ret);
    89	
    90		/* Decode the AuthorityKeyIdentifier */
    91		if (ctx->raw_akid) {
    92			pr_devel("AKID: %u %*phN\n",
    93				 ctx->raw_akid_size, ctx->raw_akid_size, ctx->raw_akid);
    94			ret = asn1_ber_decoder(&x509_akid_decoder, ctx,
    95					       ctx->raw_akid, ctx->raw_akid_size);
    96			if (ret < 0) {
    97				pr_warn("Couldn't decode AuthKeyIdentifier\n");
    98				return ERR_PTR(ret);
    99			}
   100		}
   101	
   102		cert->pub->key = kmemdup(ctx->key, ctx->key_size, GFP_KERNEL);
   103		if (!cert->pub->key)
   104			return ERR_PTR(-ENOMEM);
   105	
   106		cert->pub->keylen = ctx->key_size;
   107	
   108		cert->pub->params = kmemdup(ctx->params, ctx->params_size, GFP_KERNEL);
   109		if (!cert->pub->params)
   110			return ERR_PTR(-ENOMEM);
   111	
   112		cert->pub->paramlen = ctx->params_size;
   113		cert->pub->algo = ctx->key_algo;
   114	
   115		/* Grab the signature bits */
   116		ret = x509_get_sig_params(cert);
   117		if (ret < 0)
   118			return ERR_PTR(ret);
   119	
   120		/* Generate cert issuer + serial number key ID */
   121		kid = asymmetric_key_generate_id(cert->raw_serial,
   122						 cert->raw_serial_size,
   123						 cert->raw_issuer,
   124						 cert->raw_issuer_size);
   125		if (IS_ERR(kid))
   126			return ERR_CAST(kid);
   127		cert->id = kid;
   128	
   129		/* Detect self-signed certificates */
   130		ret = x509_check_for_self_signed(cert);
   131		if (ret < 0)
   132			return ERR_PTR(ret);
   133	
   134		return_ptr(cert);
   135	}
   136	EXPORT_SYMBOL_GPL(x509_cert_parse);
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
