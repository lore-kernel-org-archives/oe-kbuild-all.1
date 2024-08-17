Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7938143C7D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723892737; cv=none; b=iTecmPqboiVhtCLJf/oH9Srfp32zoFc3zbTJDqZCL+IistGyXvH4OdFF9+dWzsrMk1/lSUaDagcTkyZq64GhDK0m2Wcquna7OeXJlflOkzkz7YkNItLCfwD7htDN8+32cUGkoP1xlOe7Dmq3VJezlWBqOzgNrD7s63GWph03iro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723892737; c=relaxed/simple;
	bh=SdYLCkVK9vNEjpGSWHdEslOpOb4DzngLeWURTEateTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yd/vSxw38U7nLM2SQuXc3NJu2p0L4ZW48xadQX70NqmtIpMhyoOZAUOdvD+EJGje/gxiMKb4ROP3p4OVj56AkJ5d5cm4KDiE6Nm/WKQz26WNFZ8tKHc3MoViQKbbI9VK1I5zqs+9eSrM7gkDiGHuD+wSrkaOtpO2xxJMdi29XdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEKCkbWn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEKCkbWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723892736; x=1755428736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SdYLCkVK9vNEjpGSWHdEslOpOb4DzngLeWURTEateTc=;
  b=lEKCkbWnh4rYr75Q5GTnhHHBx/H85CxNP9cQab1Cizv97KAFnlWIhKoE
   9jO9IeEQDS2KIW9EysjZaDPVwBTqzqy6VKFVv3pb4stv6phT6WgAsidyB
   WU7sduYqTi9n6eyMF4a+xD2PnIiI+3n5kHHI6FxkzX8MDC7PpxC6Ao5mr
   LvuPFn9lHMU1Cu5mESmGbNE1hBCWFUZbyDmgSE7ABfjiA0UY40r+UDaM6
   ArlFNRdAyLyRyTynYxKrq9M4lrdtsSVA8a7GVpV7Wji67Rf6OtrrjR1a5
   cM+1ps5o5WOB5qU8p2dmiZZuv62kPXHtlQFzrupZeQAsgBqY+lhITAF5G
   Q==;
X-CSE-ConnectionGUID: PkRiR8VDT2uvNndoqONE0Q==
X-CSE-MsgGUID: Vr2sUbStTa+RfjJAKpP/DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21812052"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="21812052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 04:05:35 -0700
X-CSE-ConnectionGUID: dsneoMkySICZ+9/JWvsVdQ==
X-CSE-MsgGUID: weQlF7WhRl2v2JEkyzJPtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="60692199"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Aug 2024 04:05:34 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfHFT-0007Nc-1c;
	Sat, 17 Aug 2024 11:05:31 +0000
Date: Sat, 17 Aug 2024 19:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Roberto Sassu <roberto.sassu@huawei.com>
Subject: [dhowells-fs:pgplib 8/14]
 crypto/asymmetric_keys/pgp_signature.c:26:3: warning: 'pgp_pubkey_hash'
 defined but not used
Message-ID: <202408171901.k5WNZfKX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pgplib
head:   f5bc37208146cc7ce38c4ad5a403e00904c0b6d2
commit: 4687723ce751ddc2429ed0cbfb2bf1e56658ace5 [8/14] KEYS: PGP-based public key signature verification
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240817/202408171901.k5WNZfKX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171901.k5WNZfKX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171901.k5WNZfKX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/pgp_signature.c:26:3: warning: 'pgp_pubkey_hash' defined but not used [-Wunused-const-variable=]
      26 | } pgp_pubkey_hash[PGP_HASH__LAST] = {
         |   ^~~~~~~~~~~~~~~


vim +/pgp_pubkey_hash +26 crypto/asymmetric_keys/pgp_signature.c

    23	
    24	static const struct {
    25		enum hash_algo algo : 8;
  > 26	} pgp_pubkey_hash[PGP_HASH__LAST] = {
    27		[PGP_HASH_MD5].algo		= HASH_ALGO_MD5,
    28		[PGP_HASH_SHA1].algo		= HASH_ALGO_SHA1,
    29		[PGP_HASH_RIPE_MD_160].algo	= HASH_ALGO_RIPE_MD_160,
    30		[PGP_HASH_SHA256].algo		= HASH_ALGO_SHA256,
    31		[PGP_HASH_SHA384].algo		= HASH_ALGO_SHA384,
    32		[PGP_HASH_SHA512].algo		= HASH_ALGO_SHA512,
    33		[PGP_HASH_SHA224].algo		= HASH_ALGO_SHA224,
    34	};
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
