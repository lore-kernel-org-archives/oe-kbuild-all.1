Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A75623111
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687522510; x=1719058510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mmYwb9PqdqZeaWq50B1w5mliKkfDvsXZPpSJpnIUTOY=;
  b=RwR8sN4sRY80r3Gi+xxrwBRbmNz2dcLLWftQuEXzTzAijHwcaEeJkOCH
   qq5sk9BzoNGlSgj2lpDDTHm3t4TZmmH8lqLRCLGhBiWCI8zREjjCMeH9l
   2R09fpguavPX9p3XuumArz+NBvv+WXDrxhikhDfu7fuW0idVGQ3QsierD
   R4mLVwRmHgUa2rCsXKCnHEKAUfq6XPTLod+ZQjrN6Wxoi+hIrqevsD0ci
   pqDRK2yU9CNCL2KFjySvBtw2SldetnZo2NDzOhQVRX41KoHy99tA5HjW4
   Yl/XL1gPTHgy/khe/2GadVxpUqdbjtPYZmRXPaY/W0+mQCTog+/HFuFkE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="390719705"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="390719705"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 05:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="828354312"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="828354312"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2023 05:15:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCfgx-0008GD-0i;
	Fri, 23 Jun 2023 12:15:07 +0000
Date: Fri, 23 Jun 2023 20:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 4/10] lib/spdm.c:1022:9: error: expected ',' or ';' before
 'if'
Message-ID: <202306232058.IDolygyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   1bd9a552e939510c9c81534603b0be7eb662ecc2
commit: 7093d39e6d4ca40c8c8f0dbda3be060951431739 [4/10] PCI/CMA: Authenticate devices on enumeration
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306232058.IDolygyo-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306232058.IDolygyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306232058.IDolygyo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/spdm.c: In function 'spdm_challenge_rsp_sz':
>> lib/spdm.c:1022:9: error: expected ',' or ';' before 'if'
    1022 |         if (rsp)
         |         ^~
>> lib/spdm.c:1025:9: error: 'else' without a previous 'if'
    1025 |         else
         |         ^~~~
   lib/spdm.c: In function 'spdm_challenge':
>> lib/spdm.c:1142:33: error: invalid type argument of unary '*' (have 'struct spdm_challenge_req')
    1142 |                 req_sz = sizeof(*req);
         |                                 ^~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/asn1_encoder.h:6,
                    from lib/spdm.c:14:
   lib/spdm.c:1144:42: error: invalid type argument of unary '*' (have 'struct spdm_challenge_req')
    1144 |                 req_sz = offsetof(typeof(*req), context);
         |                                          ^~~~
   include/linux/stddef.h:16:52: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                    ^~~~
>> lib/spdm.c:1127:16: warning: variable 'req_sz' set but not used [-Wunused-but-set-variable]
    1127 |         size_t req_sz, rsp_sz, rsp_sz_max, sig_offset;
         |                ^~~~~~


vim +1022 lib/spdm.c

a13d5c10362f0d Jonathan Cameron 2022-09-06  1014  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1015  static size_t spdm_challenge_rsp_sz(struct spdm_state *spdm_state,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1016  				    struct spdm_challenge_rsp *rsp)
a13d5c10362f0d Jonathan Cameron 2022-09-06  1017  {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1018  	size_t  size  = sizeof(*rsp)		/* Header */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1019  		      + spdm_state->h		/* CertChainHash */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1020  		      + 32			/* Nonce */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1021  
a13d5c10362f0d Jonathan Cameron 2022-09-06 @1022  	if (rsp)
a13d5c10362f0d Jonathan Cameron 2022-09-06  1023  		/* May be unaligned if hash algorithm has unusual length. */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1024  		size += get_unaligned_le16((u8 *)rsp + size);
a13d5c10362f0d Jonathan Cameron 2022-09-06 @1025  	else
a13d5c10362f0d Jonathan Cameron 2022-09-06  1026  		size += 1024;			/* OpaqueData */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1027  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1028  		size += 2;			/* OpaqueDataLength */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1029  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1030  	if (spdm_state->version >= 0x13)
a13d5c10362f0d Jonathan Cameron 2022-09-06  1031  		size += 8;			/* RequesterContext */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1032  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1033  	return  size += spdm_state->s;		/* Signature */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1034  }
a13d5c10362f0d Jonathan Cameron 2022-09-06  1035  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1036  static int spdm_verify_signature(struct spdm_state *spdm_state, u8 *sig_ptr,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1037  				 u8 *digest, unsigned int digest_size)
a13d5c10362f0d Jonathan Cameron 2022-09-06  1038  {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1039  	const struct asymmetric_key_ids *ids;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1040  	struct public_key_signature sig = {};
a13d5c10362f0d Jonathan Cameron 2022-09-06  1041  	/* Large enough for an ASN1 encoding of supported ECC signatures */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1042  	unsigned char buffer2[128] = {};
a13d5c10362f0d Jonathan Cameron 2022-09-06  1043  	int rc;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1044  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1045  	/*
a13d5c10362f0d Jonathan Cameron 2022-09-06  1046  	 * The ecdsa signatures are raw concatentation of the two values.
a13d5c10362f0d Jonathan Cameron 2022-09-06  1047  	 * SPDM 1.2.1 section 2.2.3.4.1 refers to FIPS PUB 186-4 defining this
a13d5c10362f0d Jonathan Cameron 2022-09-06  1048  	 * ordering.
a13d5c10362f0d Jonathan Cameron 2022-09-06  1049  	 * In order to use verify_signature we need to reformat them into ASN1.
a13d5c10362f0d Jonathan Cameron 2022-09-06  1050  	 */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1051  	switch (spdm_state->base_asym_alg) {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1052  	case SPDM_ASYM_ECDSA_ECC_NIST_P256:
a13d5c10362f0d Jonathan Cameron 2022-09-06  1053  	case SPDM_ASYM_ECDSA_ECC_NIST_P384:
a13d5c10362f0d Jonathan Cameron 2022-09-06  1054  	{
a13d5c10362f0d Jonathan Cameron 2022-09-06  1055  		unsigned char buffer[128] = {};
a13d5c10362f0d Jonathan Cameron 2022-09-06  1056  		unsigned char *p = buffer;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1057  		unsigned char *p2;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1058  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1059  		//TODO: test the ASN1 function rather more extensively.
a13d5c10362f0d Jonathan Cameron 2022-09-06  1060  		/* First pack the two large integer values */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1061  		p = asn1_encode_integer_large_positive(p, buffer + sizeof(buffer),
a13d5c10362f0d Jonathan Cameron 2022-09-06  1062  						       ASN1_INT, sig_ptr,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1063  						       spdm_state->s / 2);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1064  		p = asn1_encode_integer_large_positive(p, buffer + sizeof(buffer),
a13d5c10362f0d Jonathan Cameron 2022-09-06  1065  						       ASN1_INT,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1066  						       sig_ptr + spdm_state->s  / 2,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1067  						       spdm_state->s / 2);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1068  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1069  		/* In turn pack those two large integer values into a sequence */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1070  		p2 = asn1_encode_sequence(buffer2, buffer2 + sizeof(buffer2),
a13d5c10362f0d Jonathan Cameron 2022-09-06  1071  					  buffer, p - buffer);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1072  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1073  		sig.s = buffer2;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1074  		sig.s_size = p2 - buffer2;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1075  		sig.encoding = "x962";
a13d5c10362f0d Jonathan Cameron 2022-09-06  1076  		break;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1077  	}
a13d5c10362f0d Jonathan Cameron 2022-09-06  1078  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1079  	case SPDM_ASYM_RSASSA_3072:
a13d5c10362f0d Jonathan Cameron 2022-09-06  1080  		sig.s = sig_ptr;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1081  		sig.s_size = spdm_state->s;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1082  		sig.encoding = "pkcs1";
a13d5c10362f0d Jonathan Cameron 2022-09-06  1083  		break;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1084  	default:
a13d5c10362f0d Jonathan Cameron 2022-09-06  1085  		dev_err(spdm_state->dev,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1086  			"Signature algorithm not yet supported\n");
a13d5c10362f0d Jonathan Cameron 2022-09-06  1087  		return -EINVAL;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1088  	}
a13d5c10362f0d Jonathan Cameron 2022-09-06  1089  	sig.digest = digest;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1090  	sig.digest_size = digest_size;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1091  	ids = asymmetric_key_ids(spdm_state->leaf_key);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1092  	sig.auth_ids[0] = ids->id[0];
a13d5c10362f0d Jonathan Cameron 2022-09-06  1093  	sig.auth_ids[1] = ids->id[1];
a13d5c10362f0d Jonathan Cameron 2022-09-06  1094  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1095  	switch (spdm_state->base_hash_alg) {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1096  	case SPDM_HASH_SHA_384:
a13d5c10362f0d Jonathan Cameron 2022-09-06  1097  		sig.hash_algo = "sha384";
a13d5c10362f0d Jonathan Cameron 2022-09-06  1098  		break;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1099  	case SPDM_HASH_SHA_256:
a13d5c10362f0d Jonathan Cameron 2022-09-06  1100  		sig.hash_algo = "sha256";
a13d5c10362f0d Jonathan Cameron 2022-09-06  1101  		break;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1102  	default:
a13d5c10362f0d Jonathan Cameron 2022-09-06  1103  		return -EINVAL;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1104  	}
a13d5c10362f0d Jonathan Cameron 2022-09-06  1105  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1106  	rc = verify_signature(spdm_state->leaf_key, &sig);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1107  	if (rc) {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1108  		dev_err(spdm_state->dev,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1109  			"Failed to verify challenge_auth signature %d\n", rc);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1110  		return rc;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1111  	}
a13d5c10362f0d Jonathan Cameron 2022-09-06  1112  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1113  	return 0;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1114  }
a13d5c10362f0d Jonathan Cameron 2022-09-06  1115  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1116  static int spdm_challenge(struct spdm_state *spdm_state, u8 slot)
a13d5c10362f0d Jonathan Cameron 2022-09-06  1117  {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1118  	const char spdm_prefix[] = {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1119  		'd', 'm', 't', 'f', '-', 's', 'p', 'd', 'm', '-', 'v', '1', '.', '2', '.', '*',
a13d5c10362f0d Jonathan Cameron 2022-09-06  1120  		'd', 'm', 't', 'f', '-', 's', 'p', 'd', 'm', '-', 'v', '1', '.', '2', '.', '*',
a13d5c10362f0d Jonathan Cameron 2022-09-06  1121  		'd', 'm', 't', 'f', '-', 's', 'p', 'd', 'm', '-', 'v', '1', '.', '2', '.', '*',
a13d5c10362f0d Jonathan Cameron 2022-09-06  1122  		'd', 'm', 't', 'f', '-', 's', 'p', 'd', 'm', '-', 'v', '1', '.', '2', '.', '*',
a13d5c10362f0d Jonathan Cameron 2022-09-06  1123  		0, 0, 0, 0, /* pad here so length 100 */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1124  		'r', 'e', 's', 'p', 'o', 'n', 'd', 'e', 'r', '-',
a13d5c10362f0d Jonathan Cameron 2022-09-06  1125  		'c', 'h', 'a', 'l', 'l', 'e', 'n', 'g', 'e', '_', 'a', 'u', 't', 'h', ' ',
a13d5c10362f0d Jonathan Cameron 2022-09-06  1126  		's', 'i', 'g', 'n', 'i', 'n', 'g' };
a13d5c10362f0d Jonathan Cameron 2022-09-06 @1127  	size_t req_sz, rsp_sz, rsp_sz_max, sig_offset;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1128  	struct spdm_challenge_req req = {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1129  		.code = SPDM_CHALLENGE,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1130  		.param1 = slot,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1131  		.param2 = 0, /* no measurement summary hash */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1132  	};
a13d5c10362f0d Jonathan Cameron 2022-09-06  1133  	struct spdm_challenge_rsp *rsp;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1134  	u8 *digest, *message;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1135  	int rc, length;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1136  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1137  	BUILD_BUG_ON(sizeof(spdm_prefix) != 100);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1138  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1139  	get_random_bytes(&req.nonce, sizeof(req.nonce));
a13d5c10362f0d Jonathan Cameron 2022-09-06  1140  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1141  	if (spdm_state->version >= 0x13)
a13d5c10362f0d Jonathan Cameron 2022-09-06 @1142  		req_sz = sizeof(*req);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1143  	else
a13d5c10362f0d Jonathan Cameron 2022-09-06  1144  		req_sz = offsetof(typeof(*req), context);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1145  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1146  	rsp_sz_max = spdm_challenge_rsp_sz(spdm_state, NULL);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1147  	rsp = kzalloc(rsp_sz_max, GFP_KERNEL);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1148  	if (!rsp)
a13d5c10362f0d Jonathan Cameron 2022-09-06  1149  		return -ENOMEM;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1150  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1151  	rc = spdm_exchange(spdm_state, &req, sizeof(req), rsp, rsp_sz_max);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1152  	if (rc < 0)
a13d5c10362f0d Jonathan Cameron 2022-09-06  1153  		goto err_free_rsp;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1154  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1155  	length = rc;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1156  	rsp_sz = spdm_challenge_rsp_sz(spdm_state, rsp);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1157  	if (length < rsp_sz) {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1158  			dev_err(spdm_state->dev,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1159  				"Truncated challenge response\n");
a13d5c10362f0d Jonathan Cameron 2022-09-06  1160  			rc = -EIO;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1161  			goto err_free_rsp;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1162  	}
a13d5c10362f0d Jonathan Cameron 2022-09-06  1163  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1164  	/* Last step of building the digest */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1165  	rc = crypto_shash_update(spdm_state->desc, (u8 *)&req, sizeof(req));
a13d5c10362f0d Jonathan Cameron 2022-09-06  1166  	if (rc)
a13d5c10362f0d Jonathan Cameron 2022-09-06  1167  		goto err_free_rsp;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1168  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1169  	/* The hash is complete + signature received; verify against leaf key */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1170  	sig_offset = rsp_sz - spdm_state->s;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1171  	rc = crypto_shash_update(spdm_state->desc, (u8 *)rsp, sig_offset);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1172  	if (rc)
a13d5c10362f0d Jonathan Cameron 2022-09-06  1173  		goto err_free_rsp;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1174  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1175  	digest = kmalloc(spdm_state->h, GFP_KERNEL);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1176  	if (!digest) {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1177  		rc = -ENOMEM;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1178  		goto err_free_rsp;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1179  	}
a13d5c10362f0d Jonathan Cameron 2022-09-06  1180  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1181  	crypto_shash_final(spdm_state->desc, digest);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1182  	if (spdm_state->version >= 0x12) {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1183  		message = kmalloc(spdm_state->h + sizeof(spdm_prefix), GFP_KERNEL);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1184  		memcpy(message, spdm_prefix, sizeof(spdm_prefix));
a13d5c10362f0d Jonathan Cameron 2022-09-06  1185  		memcpy(message + sizeof(spdm_prefix), digest, spdm_state->h);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1186  		/*
a13d5c10362f0d Jonathan Cameron 2022-09-06  1187  		 * Not all 1.2 supported Asymmetric functions need this hashed
a13d5c10362f0d Jonathan Cameron 2022-09-06  1188  		 * but all the ones supported here do.
a13d5c10362f0d Jonathan Cameron 2022-09-06  1189  		 */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1190  		rc = crypto_shash_digest(spdm_state->desc, message,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1191  					 spdm_state->h + sizeof(spdm_prefix), digest);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1192  		if (rc) {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1193  			dev_err(spdm_state->dev, "Could not digest prefix + message\n");
a13d5c10362f0d Jonathan Cameron 2022-09-06  1194  			kfree(message);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1195  			goto err_free_digest;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1196  		}
a13d5c10362f0d Jonathan Cameron 2022-09-06  1197  	}
a13d5c10362f0d Jonathan Cameron 2022-09-06  1198  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1199  	rc = spdm_verify_signature(spdm_state, (u8 *)rsp + sig_offset, digest,
a13d5c10362f0d Jonathan Cameron 2022-09-06  1200  				   spdm_state->h);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1201  	if (rc) {
a13d5c10362f0d Jonathan Cameron 2022-09-06  1202  		dev_err(spdm_state->dev, "Failed to verify SPDM challenge auth signature\n");
a13d5c10362f0d Jonathan Cameron 2022-09-06  1203  		goto err_free_digest;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1204  	}
a13d5c10362f0d Jonathan Cameron 2022-09-06  1205  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1206  	kfree(spdm_state->desc);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1207  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1208  	/* Clear to give a simple way to detect out of order */
a13d5c10362f0d Jonathan Cameron 2022-09-06  1209  	spdm_state->desc = NULL;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1210  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1211  err_free_digest:
a13d5c10362f0d Jonathan Cameron 2022-09-06  1212  	kfree(digest);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1213  
a13d5c10362f0d Jonathan Cameron 2022-09-06  1214  err_free_rsp:
a13d5c10362f0d Jonathan Cameron 2022-09-06  1215  	kfree(rsp);
a13d5c10362f0d Jonathan Cameron 2022-09-06  1216  	return rc;
a13d5c10362f0d Jonathan Cameron 2022-09-06  1217  }
a13d5c10362f0d Jonathan Cameron 2022-09-06  1218  

:::::: The code at line 1022 was first introduced by commit
:::::: a13d5c10362f0d3d93897ac33a66aa2c8baa3709 spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
