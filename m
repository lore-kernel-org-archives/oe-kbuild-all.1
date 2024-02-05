Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9E8F51
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 04:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707107715; cv=none; b=IEAPsjWASYdKXNgF3ZSEn6l+YKnejYFTU7/20Cw9Oe7ciWQaqB9mBOWMvFLtufJQIQeoBHoRAkQ5rrd1G0bjYxoPWYawukUX9ZAnCG5PSuOwxroj+PYmRrk0Zqg68+71/pZuuTWE8Qd+EizVo8brGdVrrQzh3Z5znTn9C6K2Y6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707107715; c=relaxed/simple;
	bh=dVH4jGK3HdHz6Edkh9DxENjFC3RE5z/SwOCwqLJSRZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnsPrsT4nyTLWZBG9I7u1NbxYpsmsz+JMgaoQhuiqWM8tuCCaZdTc63WoZJCEhSsejhx9AqWW7sd5N3i2/L1xlkQSnR0Pf2oYACoAsl2AI8/0Zti6+eLCnWKB2PatVXog5pw3k4GaeAviWSRPCcB5TnVj8L41QSGlSUoFocq7mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzPj08YP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzPj08YP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707107714; x=1738643714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVH4jGK3HdHz6Edkh9DxENjFC3RE5z/SwOCwqLJSRZY=;
  b=AzPj08YPrevs+ORHOO8udz/FwLQYIbNuaDXdrpXEU7XH+1yTroaYEKAb
   Q0cXMseeT3G2/Xd7FU879B6G0fdmCkfaWjiaWLroxeSACz1Lz6lwrEtFl
   rqsJyn6lcelxfmua/+0C3Y61RjJ7p4366A9k7cDpK0ieYwDxlfcfQBOWg
   bNHLviN0gN1x+NksP+UfKRQ9YINP7p/Keyykr7b12GkLgUf79Dk/ccPge
   UQTCZpLAGsOeBes+v9qZhxMUFK/jvk8/5ZX0bbkjVMurtr4Ic9JuxAjPE
   8+yeN17bmnQMawpZRomv3fbdmncrwxBOHA3xSEHQ4Zj/R9RYAH9ZRW/kC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="610849"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="610849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 20:35:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5235678"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2024 20:35:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWqhJ-00008i-0n;
	Mon, 05 Feb 2024 04:35:09 +0000
Date: Mon, 5 Feb 2024 12:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 3/20]
 crypto/asymmetric_keys/x509_cert_parser.c:69:9-15: ERROR: allocation
 function on line 68 returns NULL not ERR_PTR on failure
Message-ID: <202402051223.S6XPhd9p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   1fb81bcc677e77ad9a1ec593249d490f56ca273c
commit: 5dfefb92d3e5a488a2b9e6df8d87840066eb336d [3/20] X.509: Introduce scope-based x509_certificate allocation
config: i386-randconfig-051-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051223.S6XPhd9p-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051223.S6XPhd9p-lkp@intel.com/

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
