Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0EF1C2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 00:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712707754; cv=none; b=f/yNKaDUW6AkcSwO/Hz+ITgfQsl43J/zFi97yi+dCKHhwCwBF4A/g4ApI/L1hp+vYpd6vgQD8ajn1Xka4S1s00IPBpCqG2HBFDrO3Ix5H+pCneLyNd8O70R8XWu8wLik4XgDCsXIutxEB6KFrm6NMS6ROBcqJE0llQFRkfDhdJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712707754; c=relaxed/simple;
	bh=nczofmNAk3M9ACe6glDsBHu0pNToBJO7nw0o9r9/weo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lc/IJwCurjmM7lzeJy6NsrfTbAA6M+dgGTwCkACgiF5lVX8/Z5npisjVQQVPI4GivAOaCao0muzfy3EPG+yiEnd5AXpTrluk0ScoZBp4VM2syPiJwOZ4XRPYR1ngA/rO+QpV/Ne5V1z0tqWibXHeL/CsEdWgBEm0QYcRRQ3uvsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvLwCS4i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvLwCS4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712707753; x=1744243753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nczofmNAk3M9ACe6glDsBHu0pNToBJO7nw0o9r9/weo=;
  b=SvLwCS4iAd5tOWtAxZQ0z6xwNKP7tnORhaoZFypgGr9UFd+re2k984QV
   FigQGb85WHrMB695DgqX4ha+3XxTIdrkMXJshirh+gQjFzOj1Mi58i7rB
   /lC3E1hhKkjMYMmMfQu33WssEond021nhrd5chcua5ngsmULENE1F/D3U
   /OMQdhneHFxdVyJQPSP3UQojxHbt+HkcNYrZj6UO1Fi5qIIbV0QepN9Hn
   Wu5sQicfnQiiswe05Sg63PF/lJ5xpb0i0mlmSI4rR2CkLonO2WM04QVC1
   QUkZjOPKPpTJ8OHHP0JzrspF+hZPcYgxMRtvAeDx3wHVCcdPjxfXh9Qam
   g==;
X-CSE-ConnectionGUID: cx9Fx7hqSgK3v3WwnKj/NQ==
X-CSE-MsgGUID: UgtNUeViQKe943fTYmDHiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18765931"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="18765931"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 17:09:12 -0700
X-CSE-ConnectionGUID: ESumer9XQXCFG91qehl2SQ==
X-CSE-MsgGUID: E279ALtZTqyShOB0dq6RyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25143226"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Apr 2024 17:09:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruLWW-0006di-0q;
	Wed, 10 Apr 2024 00:09:08 +0000
Date: Wed, 10 Apr 2024 08:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3341/7334] include/linux/pgplib.h:36:30: error:
 field 'version' has incomplete type
Message-ID: <202404100812.aMXYkpUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   830c644d6e307456c2e77e6ce8bd6f1cf1ddc351
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3341/7334] KEYS: Provide a function to load keys from a PGP keyring blob
config: loongarch-randconfig-r123-20240410 (https://download.01.org/0day-ci/archive/20240410/202404100812.aMXYkpUQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240410/202404100812.aMXYkpUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100812.aMXYkpUQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/pgp_preload.c:19:
>> include/linux/pgplib.h:26:36: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                               enum pgp_packet_tag type,
         |                                    ^~~~~~~~~~~~~~
>> include/linux/pgplib.h:36:30: warning: 'version' is narrower than values of its type
      36 |         enum pgp_key_version version : 8;
         |                              ^~~~~~~
>> include/linux/pgplib.h:36:30: error: field 'version' has incomplete type
>> include/linux/pgplib.h:37:30: warning: 'pubkey_algo' is narrower than values of its type
      37 |         enum pgp_pubkey_algo pubkey_algo : 8;
         |                              ^~~~~~~~~~~
>> include/linux/pgplib.h:37:30: error: field 'pubkey_algo' has incomplete type
>> crypto/asymmetric_keys/pgp_preload.c:63:38: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                      ^~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_preload.c:63:53: error: parameter 2 ('type') has incomplete type
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                 ~~~~~~~~~~~~~~~~~~~~^~~~
>> crypto/asymmetric_keys/pgp_preload.c:62:19: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      62 | static int __init found_pgp_key(struct pgp_parse_context *context,
         |                   ^~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_preload.c:101:12: warning: no previous prototype for 'preload_pgp_keys' [-Wmissing-prototypes]
     101 | int __init preload_pgp_keys(const u8 *pgpdata, size_t pgpdatalen,
         |            ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c: In function 'preload_pgp_keys':
>> crypto/asymmetric_keys/pgp_preload.c:107:43: error: 'PGP_PKT_PUBLIC_KEY' undeclared (first use in this function)
     107 |         ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY);
         |                                           ^~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c:107:43: note: each undeclared identifier is reported only once for each function it appears in
>> crypto/asymmetric_keys/pgp_preload.c:108:32: error: assignment to 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag,  u8,  const u8 *, size_t)' {aka 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag,  unsigned char,  const unsigned char *, long unsigned int)'} from incompatible pointer type 'int (*)()' [-Werror=incompatible-pointer-types]
     108 |         ctx.pgp.process_packet = found_pgp_key;
         |                                ^
   cc1: some warnings being treated as errors
--
   In file included from crypto/asymmetric_keys/pgp_public_key.c:20:
>> include/linux/pgplib.h:26:36: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                               enum pgp_packet_tag type,
         |                                    ^~~~~~~~~~~~~~
>> include/linux/pgplib.h:36:30: warning: 'version' is narrower than values of its type
      36 |         enum pgp_key_version version : 8;
         |                              ^~~~~~~
>> include/linux/pgplib.h:36:30: error: field 'version' has incomplete type
>> include/linux/pgplib.h:37:30: warning: 'pubkey_algo' is narrower than values of its type
      37 |         enum pgp_pubkey_algo pubkey_algo : 8;
         |                              ^~~~~~~~~~~
>> include/linux/pgplib.h:37:30: error: field 'pubkey_algo' has incomplete type
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_calc_pkey_keyid':
>> crypto/asymmetric_keys/pgp_public_key.c:63:9: error: implicit declaration of function 'kenter' [-Werror=implicit-function-declaration]
      63 |         kenter("");
         |         ^~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:65:29: error: 'PGP_KEY_VERSION_4' undeclared (first use in this function)
      65 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |                             ^~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:65:29: note: each undeclared identifier is reported only once for each function it appears in
>> crypto/asymmetric_keys/pgp_public_key.c:67:23: error: implicit declaration of function 'mpi_key_length' [-Werror=implicit-function-declaration]
      67 |                 ret = mpi_key_length(key_ptr, keylen, nb + i, nn + i);
         |                       ^~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:115:9: error: implicit declaration of function 'kleave' [-Werror=implicit-function-declaration]
     115 |         kleave(" = %d", ret);
         |         ^~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_generate_fingerprint':
   crypto/asymmetric_keys/pgp_public_key.c:134:49: error: 'PGP_KEY_VERSION_4' undeclared (first use in this function)
     134 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                                 ^~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: At top level:
>> crypto/asymmetric_keys/pgp_public_key.c:199:40: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
     199 |                                   enum pgp_packet_tag type,
         |                                        ^~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:199:55: error: parameter 2 ('type') has incomplete type
     199 |                                   enum pgp_packet_tag type,
         |                                   ~~~~~~~~~~~~~~~~~~~~^~~~
>> crypto/asymmetric_keys/pgp_public_key.c:198:12: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     198 | static int pgp_process_public_key(struct pgp_parse_context *context,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_process_public_key':
>> crypto/asymmetric_keys/pgp_public_key.c:213:21: error: 'PGP_PKT_USER_ID' undeclared (first use in this function)
     213 |         if (type == PGP_PKT_USER_ID) {
         |                     ^~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:234:32: error: 'PGP_PUBKEY__LAST' undeclared (first use in this function)
     234 |         if (pgp.pubkey_algo >= PGP_PUBKEY__LAST)
         |                                ^~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:236:16: error: 'pgp_to_public_key_algo' undeclared (first use in this function); did you mean 'pgp_pubkey_algo'?
     236 |         algo = pgp_to_public_key_algo[pgp.pubkey_algo];
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                pgp_pubkey_algo
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_key_parse':
>> crypto/asymmetric_keys/pgp_public_key.c:313:43: error: 'PGP_PKT_PUBLIC_KEY' undeclared (first use in this function)
     313 |         ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY) |
         |                                           ^~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:314:43: error: 'PGP_PKT_USER_ID' undeclared (first use in this function)
     314 |                                     (1 << PGP_PKT_USER_ID);
         |                                           ^~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:315:32: error: assignment to 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag,  u8,  const u8 *, size_t)' {aka 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag,  unsigned char,  const unsigned char *, long unsigned int)'} from incompatible pointer type 'int (*)()' [-Werror=incompatible-pointer-types]
     315 |         ctx.pgp.process_packet = pgp_process_public_key;
         |                                ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/version +36 include/linux/pgplib.h

b78af6579e15dcd David Howells 2023-09-12  19  
b78af6579e15dcd David Howells 2023-09-12  20  /*
b78af6579e15dcd David Howells 2023-09-12  21   * PGP library packet parser
b78af6579e15dcd David Howells 2023-09-12  22   */
b78af6579e15dcd David Howells 2023-09-12  23  struct pgp_parse_context {
b78af6579e15dcd David Howells 2023-09-12  24  	u64 types_of_interest;
b78af6579e15dcd David Howells 2023-09-12  25  	int (*process_packet)(struct pgp_parse_context *context,
b78af6579e15dcd David Howells 2023-09-12 @26  			      enum pgp_packet_tag type,
b78af6579e15dcd David Howells 2023-09-12  27  			      u8 headerlen,
b78af6579e15dcd David Howells 2023-09-12  28  			      const u8 *data,
b78af6579e15dcd David Howells 2023-09-12  29  			      size_t datalen);
b78af6579e15dcd David Howells 2023-09-12  30  };
b78af6579e15dcd David Howells 2023-09-12  31  
b78af6579e15dcd David Howells 2023-09-12  32  extern int pgp_parse_packets(const u8 *data, size_t datalen,
b78af6579e15dcd David Howells 2023-09-12  33  			     struct pgp_parse_context *ctx);
b78af6579e15dcd David Howells 2023-09-12  34  
b78af6579e15dcd David Howells 2023-09-12  35  struct pgp_parse_pubkey {
b78af6579e15dcd David Howells 2023-09-12 @36  	enum pgp_key_version version : 8;
b78af6579e15dcd David Howells 2023-09-12 @37  	enum pgp_pubkey_algo pubkey_algo : 8;
b78af6579e15dcd David Howells 2023-09-12  38  	__kernel_old_time_t creation_time;
b78af6579e15dcd David Howells 2023-09-12  39  	__kernel_old_time_t expires_at;
b78af6579e15dcd David Howells 2023-09-12  40  };
b78af6579e15dcd David Howells 2023-09-12  41  

:::::: The code at line 36 was first introduced by commit
:::::: b78af6579e15dcdff86504da90af77f3e890270e PGPLIB: Basic packet parser

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: zgzxx <zhangguangzhi3@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
