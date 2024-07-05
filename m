Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BECE148837
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720178257; cv=none; b=mBVh8FkVjkm/kE+RpXBdBCTJ/5Flyu/qS0OICVuItPPy+7yC2v/S3nUJ4FwZvWn1kGU8uQ7HKxH70oYHvQujLzJi7rmv62Hi9GaW3ixhmFIeYZ29Ash0yE777DGuu+a8zyfHgmFiN0twYvXPgDUQKTgEoMzOd8oEnm2jEnZHsCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720178257; c=relaxed/simple;
	bh=63SeTpnYkVAy/v/QcDUUyDWbTR7HCjMnarKJMdli+HU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V6w59XyYs+itO1AxKmFexJ5FVThFglDK2chWP/ByD17ntwPNapK2btLfZbn3XEnS4merB6La5g0Xb2b1r3iswa0xDzjgZMA420ECUb9LWejtnKLFd79xQktCDBxY04cx+ytea0Vomz+S9+BmDj/qY9prkOu4YY1V9fumkLFJx4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jo0v64pu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jo0v64pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720178255; x=1751714255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63SeTpnYkVAy/v/QcDUUyDWbTR7HCjMnarKJMdli+HU=;
  b=Jo0v64pug9twMRGZINeg/Q0iFH8x5uGgPJm/vbCySmbbynt+XI+R/y63
   yy8AKKr3KUYAmxL+3WaTi7kG27zSC9An/0/zi8nvWOJ8RsFu4wAZI0Qxv
   gFUKBPCc6cTowTtqaDl78tfMWdGlgLA5YkwnAEWnnm1SKL/QYzOWvUP+X
   SKX+7fCZWRrWGEyjX4Ijfw43pHeuzRVwozYjjVGCuItERvqaWWNEEL98C
   /mJ+lGv57LnSwZ3gNrXGGHd46YwLz9dWhmb6FpgLHSoDho43dI8M/qjyW
   sXb3fzzajQcOiP5Ucvnx9k8emkWy+vS9kMOYtfSin4wOq1T8c5yWW666D
   Q==;
X-CSE-ConnectionGUID: aY3WEhi/QaGiOuZRwchzRA==
X-CSE-MsgGUID: waXjhpUKRi2dEwgMXGOKwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17188940"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17188940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 04:17:33 -0700
X-CSE-ConnectionGUID: Q2u45SwLSxmm7+090QMPUQ==
X-CSE-MsgGUID: jqXSb75RT9yXTEc4gcuASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="46825815"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2024 04:17:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPgwT-000SJE-2d;
	Fri, 05 Jul 2024 11:17:29 +0000
Date: Fri, 5 Jul 2024 19:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3342/10589]
 crypto/asymmetric_keys/pgp_public_key.c:359:undefined reference to
 `public_key_subtype'
Message-ID: <202407051911.Va4emssv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   17b5ba51d6bc20767e5e5c03df0acf15609b6d11
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3342/10589] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-randconfig-014-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051911.Va4emssv-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051911.Va4emssv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051911.Va4emssv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `pgp_key_parse':
>> crypto/asymmetric_keys/pgp_public_key.c:359:(.text+0x1b11e1c): undefined reference to `public_key_subtype'
>> ld: crypto/asymmetric_keys/pgp_public_key.c:359:(.text+0x1b11e3b): undefined reference to `public_key_subtype'
   ld: crypto/asymmetric_keys/pgp_public_key.c:360:(.text+0x1b11e67): undefined reference to `public_key_subtype'
>> ld: crypto/asymmetric_keys/pgp_public_key.c:369:(.text+0x1b11f38): undefined reference to `public_key_free'
   ld: crypto/asymmetric_keys/pgp_public_key.c:359:(.text+0x1b11fbf): undefined reference to `public_key_subtype'

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
