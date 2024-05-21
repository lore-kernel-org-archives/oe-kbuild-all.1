Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429B14291B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 20:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716324776; cv=none; b=W3Pc6X5/F+E4QxnQLCOPKAg2tkcC+AsBv4Ce9L24JicpQZaHe+s1aZUl/y1bRg+FdhW71jlgTH82bWJXcBnAgYB7LuA/exVyXPtuSLgb5ElJ5L7jevWdqh40KqfKbvX/1FUBqI58rCfuGgm6BWjL8hLyJ4ST34SGUTHoQU/sro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716324776; c=relaxed/simple;
	bh=tmm8qTbuOaJ7HZR+cYs2Hf74sVROqgIDf3lgc42evQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dEaQiTm+ihg0pJArF8mGwnvLXf9jpkxHntyRVHtqVkrs5QAoD7inWpYfMxYlWSOht9CoTUsKSX9wehCxXxWkMs7u48uNcJ8TxTUB2MQAsN/EcMl1CG+7BjyWi3nMPFAszbsQ6E9jR8xgiJcjKGfs/FQJJLSl1rfQrv07m8aNwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxoKj9hU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxoKj9hU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716324774; x=1747860774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmm8qTbuOaJ7HZR+cYs2Hf74sVROqgIDf3lgc42evQ0=;
  b=MxoKj9hUhs+gSWcW7X9YfGhNWMLYVc5ec6ElvwCKVYkTzgifaLwIA0gn
   cL0aR9R6fK7BhEv9o/ObUuW8OeSnTtJmoGk0xPHqQGF4x9bINXaXAxPFB
   YvTv/Yo64nfzfFPusIOQ7YdHmW2Y/MfOitwJCPQzpEohru+f7wk5i+6ZT
   1HugvhRYr9IiwE7nSUml/t8ws+AAvTr7VckrjuDSblX0apEpijpTkRh2X
   WgVZCCbbFYkJLp4sEE6r4Rflby9cLetXmY+nyOn7GX8dQRr0Ai9tLe9u2
   ye8kPgqoUZao7v2uXIg+6yx0CnwPif5JpAnLlGkX/84IYMz2mygqkxgUs
   A==;
X-CSE-ConnectionGUID: ISq8g0SsT1eCi93nqkgirg==
X-CSE-MsgGUID: iy84WKkoSE+99TYDD/5nZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30069534"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="30069534"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 13:52:54 -0700
X-CSE-ConnectionGUID: peh7FmwxQAW4yigGAzV7dw==
X-CSE-MsgGUID: rW6d0V4UThC7uDNhjJV9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="37816314"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2024 13:52:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9WSW-0000id-2s;
	Tue, 21 May 2024 20:52:06 +0000
Date: Wed, 22 May 2024 04:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v2 4/8]
 security/keys/trusted-keys/trusted_tpm2.c:81:20: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202405220427.Cq8KfS3J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v2
head:   58801dd5ac1fcc4f2397f7a86b36efa71e583033
commit: 1e68ee3b565e1c6e00451c1de265254d6537f13b [4/8] lib: Expand asn1_encode_integer() to variable size integers
config: i386-randconfig-062-20240522 (https://download.01.org/0day-ci/archive/20240522/202405220427.Cq8KfS3J-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220427.Cq8KfS3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220427.Cq8KfS3J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/keys/trusted-keys/trusted_tpm2.c:81:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] key_handle @@     got restricted __be32 [usertype] @@
   security/keys/trusted-keys/trusted_tpm2.c:81:20: sparse:     expected unsigned int [usertype] key_handle
   security/keys/trusted-keys/trusted_tpm2.c:81:20: sparse:     got restricted __be32 [usertype]

vim +81 security/keys/trusted-keys/trusted_tpm2.c

    30	
    31	static int tpm2_key_encode(struct trusted_key_payload *payload,
    32				   struct trusted_key_options *options,
    33				   u8 *src, u32 len)
    34	{
    35		const int SCRATCH_SIZE = PAGE_SIZE;
    36		u8 *scratch = kmalloc(SCRATCH_SIZE, GFP_KERNEL);
    37		u8 *work = scratch, *work1;
    38		u8 *end_work = scratch + SCRATCH_SIZE;
    39		u8 *priv, *pub;
    40		u16 priv_len, pub_len;
    41		u32 key_handle;
    42		int ret;
    43	
    44		priv_len = get_unaligned_be16(src) + 2;
    45		priv = src;
    46	
    47		src += priv_len;
    48	
    49		pub_len = get_unaligned_be16(src) + 2;
    50		pub = src;
    51	
    52		if (!scratch)
    53			return -ENOMEM;
    54	
    55		work = asn1_encode_oid(work, end_work, tpm2key_oid,
    56				       asn1_oid_len(tpm2key_oid));
    57	
    58		if (options->blobauth_len == 0) {
    59			unsigned char bool[3], *w = bool;
    60			/* tag 0 is emptyAuth */
    61			w = asn1_encode_boolean(w, w + sizeof(bool), true);
    62			if (WARN(IS_ERR(w), "BUG: Boolean failed to encode")) {
    63				ret = PTR_ERR(w);
    64				goto err;
    65			}
    66			work = asn1_encode_tag(work, end_work, 0, bool, w - bool);
    67		}
    68	
    69		/*
    70		 * Assume both octet strings will encode to a 2 byte definite length
    71		 *
    72		 * Note: For a well behaved TPM, this warning should never
    73		 * trigger, so if it does there's something nefarious going on
    74		 */
    75		if (WARN(work - scratch + pub_len + priv_len + 14 > SCRATCH_SIZE,
    76			 "BUG: scratch buffer is too small")) {
    77			ret = -EINVAL;
    78			goto err;
    79		}
    80	
  > 81		key_handle = cpu_to_be32(options->keyhandle);
    82		work = asn1_encode_integer(work, end_work, (u8 *)&key_handle, 4);
    83		work = asn1_encode_octet_string(work, end_work, pub, pub_len);
    84		work = asn1_encode_octet_string(work, end_work, priv, priv_len);
    85	
    86		work1 = payload->blob;
    87		work1 = asn1_encode_sequence(work1, work1 + sizeof(payload->blob),
    88					     scratch, work - scratch);
    89		if (IS_ERR(work1)) {
    90			ret = PTR_ERR(work1);
    91			pr_err("BUG: ASN.1 encoder failed with %d\n", ret);
    92			goto err;
    93		}
    94	
    95		kfree(scratch);
    96		return work1 - payload->blob;
    97	
    98	err:
    99		kfree(scratch);
   100		return ret;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
