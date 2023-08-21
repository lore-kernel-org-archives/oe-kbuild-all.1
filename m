Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8323C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692629963; x=1724165963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKawEwck+d/iIl0wgoGfXbsS/tQ4RU+7U3GHo4VuW6k=;
  b=dFc9IdHvdCc4rZ3n9nUlkG+9R8lLwgjM86jazMQyqOyljJ1PZlwjWQK8
   6L34s4EQ6jqdTsi5EpyKb1UAye79iHnv2LqQ4iFwbFhzsv/jUQk8Bh+7o
   tnfz84Qw4txo9Z+Y/GDgx2U6PzfHWZkgZ5UoqOahRVXb7ZaJxRUjCZJ36
   Iht9y64zP7fSJqvZ5x/Cc6KlRYjBocCe8p0QgYFoiX8eKqDeMmQ8eTXBt
   l3Ym+Xh+/11szgGL1hKkDws1LDhtTfazj5PP3NX6G5es3v349K0xrBWbS
   EAby04D2WtW22HUePjBkp30gwGOx3DuqISLtkOPtYd2PsvpTQGLuU3ZgT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376359234"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="376359234"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 07:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712821532"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="712821532"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 07:59:21 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY6NF-0000bm-0q;
	Mon, 21 Aug 2023 14:59:21 +0000
Date: Mon, 21 Aug 2023 22:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 2/14] crypto/asymmetric_keys/pkcs7_parser.c:526:10: error:
 call to undeclared function 'x509_decode_time'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202308212259.u23eaMjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lukas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/l1k/linux doe
head:   458668ded748cd2c1cab9fe959e99d8853df6f37
commit: 0cb668f620f0cee4a12651f0438e582e09030247 [2/14] X.509: Make certificate parser public
config: i386-buildonly-randconfig-006-20230821 (https://download.01.org/0day-ci/archive/20230821/202308212259.u23eaMjs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212259.u23eaMjs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212259.u23eaMjs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/asymmetric_keys/pkcs7_parser.c:526:10: error: call to undeclared function 'x509_decode_time'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return x509_decode_time(&sinfo->signing_time,
                          ^
   1 error generated.


vim +/x509_decode_time +526 crypto/asymmetric_keys/pkcs7_parser.c

2e3fadbf730fd0 David Howells 2014-07-01  493  
2e3fadbf730fd0 David Howells 2014-07-01  494  /*
99db44350672c8 David Howells 2015-08-05  495   * Parse authenticated attributes.
2e3fadbf730fd0 David Howells 2014-07-01  496   */
2e3fadbf730fd0 David Howells 2014-07-01  497  int pkcs7_sig_note_authenticated_attr(void *context, size_t hdrlen,
2e3fadbf730fd0 David Howells 2014-07-01  498  				      unsigned char tag,
2e3fadbf730fd0 David Howells 2014-07-01  499  				      const void *value, size_t vlen)
2e3fadbf730fd0 David Howells 2014-07-01  500  {
2e3fadbf730fd0 David Howells 2014-07-01  501  	struct pkcs7_parse_context *ctx = context;
99db44350672c8 David Howells 2015-08-05  502  	struct pkcs7_signed_info *sinfo = ctx->sinfo;
99db44350672c8 David Howells 2015-08-05  503  	enum OID content_type;
2e3fadbf730fd0 David Howells 2014-07-01  504  
2e3fadbf730fd0 David Howells 2014-07-01  505  	pr_devel("AuthAttr: %02x %zu [%*ph]\n", tag, vlen, (unsigned)vlen, value);
2e3fadbf730fd0 David Howells 2014-07-01  506  
2e3fadbf730fd0 David Howells 2014-07-01  507  	switch (ctx->last_oid) {
99db44350672c8 David Howells 2015-08-05  508  	case OID_contentType:
99db44350672c8 David Howells 2015-08-05  509  		if (__test_and_set_bit(sinfo_has_content_type, &sinfo->aa_set))
99db44350672c8 David Howells 2015-08-05  510  			goto repeated;
99db44350672c8 David Howells 2015-08-05  511  		content_type = look_up_OID(value, vlen);
99db44350672c8 David Howells 2015-08-05  512  		if (content_type != ctx->msg->data_type) {
99db44350672c8 David Howells 2015-08-05  513  			pr_warn("Mismatch between global data type (%d) and sinfo %u (%d)\n",
99db44350672c8 David Howells 2015-08-05  514  				ctx->msg->data_type, sinfo->index,
99db44350672c8 David Howells 2015-08-05  515  				content_type);
99db44350672c8 David Howells 2015-08-05  516  			return -EBADMSG;
99db44350672c8 David Howells 2015-08-05  517  		}
99db44350672c8 David Howells 2015-08-05  518  		return 0;
99db44350672c8 David Howells 2015-08-05  519  
99db44350672c8 David Howells 2015-08-05  520  	case OID_signingTime:
99db44350672c8 David Howells 2015-08-05  521  		if (__test_and_set_bit(sinfo_has_signing_time, &sinfo->aa_set))
99db44350672c8 David Howells 2015-08-05  522  			goto repeated;
99db44350672c8 David Howells 2015-08-05  523  		/* Should we check that the signing time is consistent
99db44350672c8 David Howells 2015-08-05  524  		 * with the signer's X.509 cert?
99db44350672c8 David Howells 2015-08-05  525  		 */
99db44350672c8 David Howells 2015-08-05 @526  		return x509_decode_time(&sinfo->signing_time,
99db44350672c8 David Howells 2015-08-05  527  					hdrlen, tag, value, vlen);
99db44350672c8 David Howells 2015-08-05  528  
2e3fadbf730fd0 David Howells 2014-07-01  529  	case OID_messageDigest:
99db44350672c8 David Howells 2015-08-05  530  		if (__test_and_set_bit(sinfo_has_message_digest, &sinfo->aa_set))
99db44350672c8 David Howells 2015-08-05  531  			goto repeated;
2e3fadbf730fd0 David Howells 2014-07-01  532  		if (tag != ASN1_OTS)
2e3fadbf730fd0 David Howells 2014-07-01  533  			return -EBADMSG;
99db44350672c8 David Howells 2015-08-05  534  		sinfo->msgdigest = value;
99db44350672c8 David Howells 2015-08-05  535  		sinfo->msgdigest_len = vlen;
99db44350672c8 David Howells 2015-08-05  536  		return 0;
99db44350672c8 David Howells 2015-08-05  537  
99db44350672c8 David Howells 2015-08-05  538  	case OID_smimeCapabilites:
99db44350672c8 David Howells 2015-08-05  539  		if (__test_and_set_bit(sinfo_has_smime_caps, &sinfo->aa_set))
99db44350672c8 David Howells 2015-08-05  540  			goto repeated;
99db44350672c8 David Howells 2015-08-05  541  		if (ctx->msg->data_type != OID_msIndirectData) {
99db44350672c8 David Howells 2015-08-05  542  			pr_warn("S/MIME Caps only allowed with Authenticode\n");
99db44350672c8 David Howells 2015-08-05  543  			return -EKEYREJECTED;
99db44350672c8 David Howells 2015-08-05  544  		}
99db44350672c8 David Howells 2015-08-05  545  		return 0;
99db44350672c8 David Howells 2015-08-05  546  
99db44350672c8 David Howells 2015-08-05  547  		/* Microsoft SpOpusInfo seems to be contain cont[0] 16-bit BE
99db44350672c8 David Howells 2015-08-05  548  		 * char URLs and cont[1] 8-bit char URLs.
99db44350672c8 David Howells 2015-08-05  549  		 *
99db44350672c8 David Howells 2015-08-05  550  		 * Microsoft StatementType seems to contain a list of OIDs that
99db44350672c8 David Howells 2015-08-05  551  		 * are also used as extendedKeyUsage types in X.509 certs.
99db44350672c8 David Howells 2015-08-05  552  		 */
99db44350672c8 David Howells 2015-08-05  553  	case OID_msSpOpusInfo:
99db44350672c8 David Howells 2015-08-05  554  		if (__test_and_set_bit(sinfo_has_ms_opus_info, &sinfo->aa_set))
99db44350672c8 David Howells 2015-08-05  555  			goto repeated;
99db44350672c8 David Howells 2015-08-05  556  		goto authenticode_check;
99db44350672c8 David Howells 2015-08-05  557  	case OID_msStatementType:
99db44350672c8 David Howells 2015-08-05  558  		if (__test_and_set_bit(sinfo_has_ms_statement_type, &sinfo->aa_set))
99db44350672c8 David Howells 2015-08-05  559  			goto repeated;
99db44350672c8 David Howells 2015-08-05  560  	authenticode_check:
99db44350672c8 David Howells 2015-08-05  561  		if (ctx->msg->data_type != OID_msIndirectData) {
99db44350672c8 David Howells 2015-08-05  562  			pr_warn("Authenticode AuthAttrs only allowed with Authenticode\n");
99db44350672c8 David Howells 2015-08-05  563  			return -EKEYREJECTED;
99db44350672c8 David Howells 2015-08-05  564  		}
99db44350672c8 David Howells 2015-08-05  565  		/* I'm not sure how to validate these */
2e3fadbf730fd0 David Howells 2014-07-01  566  		return 0;
2e3fadbf730fd0 David Howells 2014-07-01  567  	default:
2e3fadbf730fd0 David Howells 2014-07-01  568  		return 0;
2e3fadbf730fd0 David Howells 2014-07-01  569  	}
99db44350672c8 David Howells 2015-08-05  570  
99db44350672c8 David Howells 2015-08-05  571  repeated:
99db44350672c8 David Howells 2015-08-05  572  	/* We permit max one item per AuthenticatedAttribute and no repeats */
99db44350672c8 David Howells 2015-08-05  573  	pr_warn("Repeated/multivalue AuthAttrs not permitted\n");
99db44350672c8 David Howells 2015-08-05  574  	return -EKEYREJECTED;
2e3fadbf730fd0 David Howells 2014-07-01  575  }
2e3fadbf730fd0 David Howells 2014-07-01  576  

:::::: The code at line 526 was first introduced by commit
:::::: 99db44350672c8a5ee9a7b0a6f4cd6ff10136065 PKCS#7: Appropriately restrict authenticated attributes and content type

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
