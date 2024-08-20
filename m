Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA518E377
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 22:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724191378; cv=none; b=Heg6aNA8wYdz4n4K80n4QVqD8HUiP4oRTdfXp4eBcYxGvWeA+LPfybQLVILa1uQ5ubTgaianwfZtrKXD+VJyyb6prPUBbsqTUEV8+UjWINLKJxKP6uwft3CxetnDx9k1L1s3WUyB9ropJ4C1xpmchVFuP9g9Uv0dQykowe3ROGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724191378; c=relaxed/simple;
	bh=YiSCjLqes6eo/Pz/pGGXUq/QsJXn6+P4MeML03LCUI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NhnF2R34OvjlX8lW3i14ErPbW1gNFplCgJ20/5RvaIE6Re8dG+iNO9uAAwDXQSN4+hVC8s62MuYiMk5ecr12s7qRMVdCQ29NNPidFD2ZulLPdx1sz6t8yFS8N28dkf2H1PIRVPkrlyoHEVL9uWiuvGcAJU5Pv6XpwAeKY7Ta88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bR/G+kzG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bR/G+kzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724191377; x=1755727377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YiSCjLqes6eo/Pz/pGGXUq/QsJXn6+P4MeML03LCUI4=;
  b=bR/G+kzGYsRJ3HQJpktUTbAZ8gMVCAk5cJ8CikQRjrhrajH2fkY9ZY4g
   2TfMO1Zmw/fQGQOPE47FG0YBGC8ikmOM2mmcrGP58nc/yqoi2KMc1maLe
   lae7oX71VHjDH/SxTLvY8JLDFnEvK/9UPxTICa9A1Rmp+dv8c7XnzH+Ds
   ooEvQDhR1Pjp69Y4Aq4ttPMglAk1MmAH9rIw3GLfX/Et9Zfbouh2WNMX6
   zkyqc4fsGaD8mDB/wsKvVTpmDqSfhhVRSbwxLf2Aa1fDKulgDVcxQZGhT
   Yv0KxMsg/HDYEPU9QVKU1O9kLUwdNPJ6BvHPPDoOvuEyWl/wUAkACSqg5
   A==;
X-CSE-ConnectionGUID: Po9l2xWlTOiTgHiJf5CbeA==
X-CSE-MsgGUID: tdkTJtk2SSuCo48Io0eeyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33143283"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="33143283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:02:56 -0700
X-CSE-ConnectionGUID: sXuFHE0BSbi/uGd0RieN0g==
X-CSE-MsgGUID: fHff0mJ1SlKd6uv5B8NmLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="65074455"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2024 15:02:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgWwH-000Ady-0S;
	Tue, 20 Aug 2024 22:02:53 +0000
Date: Wed, 21 Aug 2024 06:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3342/13457]
 crypto/asymmetric_keys/pgp_public_key.c:359: undefined reference to
 `public_key_subtype'
Message-ID: <202408210612.lVpJWy3E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a768b922343d9cab29e2e0aaef1d4bdee47cfbb5
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3342/13457] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-randconfig-006-20240821 (https://download.01.org/0day-ci/archive/20240821/202408210612.lVpJWy3E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408210612.lVpJWy3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408210612.lVpJWy3E-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `pgp_key_parse':
>> crypto/asymmetric_keys/pgp_public_key.c:359: undefined reference to `public_key_subtype'
>> ld: crypto/asymmetric_keys/pgp_public_key.c:359: undefined reference to `public_key_subtype'
   ld: crypto/asymmetric_keys/pgp_public_key.c:360: undefined reference to `public_key_subtype'
>> ld: crypto/asymmetric_keys/pgp_public_key.c:369: undefined reference to `public_key_free'
>> ld: crypto/asymmetric_keys/pgp_public_key.c:359: undefined reference to `public_key_subtype'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +359 crypto/asymmetric_keys/pgp_public_key.c

4e59d757dc3f7f Roberto Sassu 2023-09-12  300  
4e59d757dc3f7f Roberto Sassu 2023-09-12  301  /*
4e59d757dc3f7f Roberto Sassu 2023-09-12  302   * Attempt to parse the instantiation data blob for a key as a PGP packet
4e59d757dc3f7f Roberto Sassu 2023-09-12  303   * message holding a key.
4e59d757dc3f7f Roberto Sassu 2023-09-12  304   */
4e59d757dc3f7f Roberto Sassu 2023-09-12  305  static int pgp_key_parse(struct key_preparsed_payload *prep)
4e59d757dc3f7f Roberto Sassu 2023-09-12  306  {
4e59d757dc3f7f Roberto Sassu 2023-09-12  307  	struct pgp_key_data_parse_context ctx;
4e59d757dc3f7f Roberto Sassu 2023-09-12  308  	int ret;
4e59d757dc3f7f Roberto Sassu 2023-09-12  309  
4e59d757dc3f7f Roberto Sassu 2023-09-12  310  	kenter("");
4e59d757dc3f7f Roberto Sassu 2023-09-12  311  
4e59d757dc3f7f Roberto Sassu 2023-09-12  312  	memset(&ctx, 0, sizeof(ctx));
e8c01f299ab793 David Howells 2023-09-12  313  	ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY) |
e8c01f299ab793 David Howells 2023-09-12  314  				    (1 << PGP_PKT_USER_ID);
4e59d757dc3f7f Roberto Sassu 2023-09-12  315  	ctx.pgp.process_packet = pgp_process_public_key;
4e59d757dc3f7f Roberto Sassu 2023-09-12  316  
4e59d757dc3f7f Roberto Sassu 2023-09-12  317  	ret = pgp_parse_packets(prep->data, prep->datalen, &ctx.pgp);
4e59d757dc3f7f Roberto Sassu 2023-09-12  318  	if (ret < 0)
4e59d757dc3f7f Roberto Sassu 2023-09-12  319  		goto error;
4e59d757dc3f7f Roberto Sassu 2023-09-12  320  
e8c01f299ab793 David Howells 2023-09-12  321  	if (!ctx.fingerprint) {
e8c01f299ab793 David Howells 2023-09-12  322  		ret = -EINVAL;
e8c01f299ab793 David Howells 2023-09-12  323  		goto error;
e8c01f299ab793 David Howells 2023-09-12  324  	}
e8c01f299ab793 David Howells 2023-09-12  325  
e8c01f299ab793 David Howells 2023-09-12  326  	if (ctx.user_id && ctx.user_id_len > 0) {
e8c01f299ab793 David Howells 2023-09-12  327  		/* Propose a description for the key
e8c01f299ab793 David Howells 2023-09-12  328  		 * (user ID without the comment)
e8c01f299ab793 David Howells 2023-09-12  329  		 */
e8c01f299ab793 David Howells 2023-09-12  330  		size_t ulen = ctx.user_id_len, flen = ctx.fingerprint_len;
e8c01f299ab793 David Howells 2023-09-12  331  		const char *p;
e8c01f299ab793 David Howells 2023-09-12  332  
e8c01f299ab793 David Howells 2023-09-12  333  		p = memchr(ctx.user_id, '(', ulen);
e8c01f299ab793 David Howells 2023-09-12  334  		if (p) {
e8c01f299ab793 David Howells 2023-09-12  335  			/* Remove the comment */
e8c01f299ab793 David Howells 2023-09-12  336  			do {
e8c01f299ab793 David Howells 2023-09-12  337  				p--;
e8c01f299ab793 David Howells 2023-09-12  338  			} while (*p == ' ' && p > ctx.user_id);
e8c01f299ab793 David Howells 2023-09-12  339  			if (*p != ' ')
e8c01f299ab793 David Howells 2023-09-12  340  				p++;
e8c01f299ab793 David Howells 2023-09-12  341  			ulen = p - ctx.user_id;
e8c01f299ab793 David Howells 2023-09-12  342  		}
e8c01f299ab793 David Howells 2023-09-12  343  
e8c01f299ab793 David Howells 2023-09-12  344  		if (ulen > 255 - 9)
e8c01f299ab793 David Howells 2023-09-12  345  			ulen = 255 - 9;
e8c01f299ab793 David Howells 2023-09-12  346  		prep->description = kmalloc(ulen + 1 + 8 + 1, GFP_KERNEL);
e8c01f299ab793 David Howells 2023-09-12  347  		ret = -ENOMEM;
e8c01f299ab793 David Howells 2023-09-12  348  		if (!prep->description)
e8c01f299ab793 David Howells 2023-09-12  349  			goto error;
e8c01f299ab793 David Howells 2023-09-12  350  		memcpy(prep->description, ctx.user_id, ulen);
e8c01f299ab793 David Howells 2023-09-12  351  		prep->description[ulen] = ' ';
e8c01f299ab793 David Howells 2023-09-12  352  		memcpy(prep->description + ulen + 1,
e8c01f299ab793 David Howells 2023-09-12  353  		       ctx.fingerprint + flen - 8, 8);
e8c01f299ab793 David Howells 2023-09-12  354  		prep->description[ulen + 9] = 0;
e8c01f299ab793 David Howells 2023-09-12  355  		pr_debug("desc '%s'\n", prep->description);
e8c01f299ab793 David Howells 2023-09-12  356  	}
e8c01f299ab793 David Howells 2023-09-12  357  
4e59d757dc3f7f Roberto Sassu 2023-09-12  358  	/* We're pinning the module by being linked against it */
4e59d757dc3f7f Roberto Sassu 2023-09-12 @359  	__module_get(public_key_subtype.owner);
4e59d757dc3f7f Roberto Sassu 2023-09-12  360  	prep->payload.data[asym_subtype] = &public_key_subtype;
4e59d757dc3f7f Roberto Sassu 2023-09-12  361  	prep->payload.data[asym_key_ids] = pgp_key_generate_id(&ctx);
4e59d757dc3f7f Roberto Sassu 2023-09-12  362  	prep->payload.data[asym_crypto] = ctx.pub;
4e59d757dc3f7f Roberto Sassu 2023-09-12  363  	prep->quotalen = 100;
4e59d757dc3f7f Roberto Sassu 2023-09-12  364  	kfree(ctx.fingerprint);
4e59d757dc3f7f Roberto Sassu 2023-09-12  365  	kfree(ctx.raw_fingerprint);
4e59d757dc3f7f Roberto Sassu 2023-09-12  366  	return 0;
4e59d757dc3f7f Roberto Sassu 2023-09-12  367  
4e59d757dc3f7f Roberto Sassu 2023-09-12  368  error:
4e59d757dc3f7f Roberto Sassu 2023-09-12 @369  	public_key_free(ctx.pub);
4e59d757dc3f7f Roberto Sassu 2023-09-12  370  	kfree(ctx.fingerprint);
4e59d757dc3f7f Roberto Sassu 2023-09-12  371  	kfree(ctx.raw_fingerprint);
4e59d757dc3f7f Roberto Sassu 2023-09-12  372  	return ret;
4e59d757dc3f7f Roberto Sassu 2023-09-12  373  }
4e59d757dc3f7f Roberto Sassu 2023-09-12  374  

:::::: The code at line 359 was first introduced by commit
:::::: 4e59d757dc3f7f2e2a646a2e3f0f271ae4599eeb KEYS: PGP data parser

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: zgzxx <zhangguangzhi3@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
