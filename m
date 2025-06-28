Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3613BAE3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 04:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751085444; cv=none; b=G4E7Fivoyv9JTfl4Y4f54nW9+SmmRNHkqRHl7WftPNv1d80wknq7ynbYZ2eojy/WvdvVDP4lEc2Z5Bv5pkSDTs2+5Bsu91TUmnKICttJBgB6u6C1Z6cTsxtsPEXh2z8v1BGLR3GWzlP6URw8x2gKBYIKqtIqWiXWTuvyhOSmcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751085444; c=relaxed/simple;
	bh=tBu0xhIwqTQD0cwB+Uh9LUvSG+aHSJ9T1OAW42ZjdZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ov7raAlA8I8jxRpVUjd1a9/1oe8nMBg1ipfHVFFX+xbxD5s8UJ6qBy9YbNuCrX9O/cqQOmGYxpg1vGf9oMwbEBp4qs+mawapEGgLDZ7zRJlEHokZJQgzTRSg0ANFEri9bEMuc0i6zaC6WLPSNzZVkQgYZALar/SZwzmplCedH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0p80LaE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0p80LaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751085443; x=1782621443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBu0xhIwqTQD0cwB+Uh9LUvSG+aHSJ9T1OAW42ZjdZ0=;
  b=V0p80LaEUhgBgyyAOHI9R/Wd52mSqLovR6BLVNO7ubp3iAreCl3oqOrQ
   g7ynpvZXvRow76IABGnbv8r7e2lXbug+S/VJ7WhH+9to0pjJCDAYMBGK0
   glveKCNOwz8kwrLMJgfXPmchbCfeGg4ZsTl8AagDRCCHXm45B9T2I06Xb
   ovZ+TulWI1YG5auZPPzgiNGK2B1So6KLrLFQhYh08Yr6WLni1moF6VHv4
   Mcqo2sh/i/qed8vAt16yRUYNjG971piqAiuHDiL3zau4YJp39A7toB+9w
   skIY/ydHJIpLKekb7c62qyYTPVGWFuQawtNn/8r4AbeT5J2gYcNncpaC/
   A==;
X-CSE-ConnectionGUID: LsOzDkuFS6yyxWxmHVG87g==
X-CSE-MsgGUID: w5Zr4TCqTia8sOVXeYXWhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53493472"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="53493472"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 21:37:22 -0700
X-CSE-ConnectionGUID: C940xo23SZyYWHYfuQkqjA==
X-CSE-MsgGUID: CTU3VyhmQ5+Ksc/b8/dQdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="158693309"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jun 2025 21:37:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVNJW-000Wn0-2Y;
	Sat, 28 Jun 2025 04:37:18 +0000
Date: Sat, 28 Jun 2025 12:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-rsassa-pkcs1 12/12]
 crypto/asymmetric_keys/tpm2_key_rsa.c:507:15: error: use of undeclared
 identifier 'user_describe'
Message-ID: <202506281226.9ePuUSRR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-rsassa-pkcs1
head:   bd01127d32d6a2c16a76eff972f88d9a9784baca
commit: bd01127d32d6a2c16a76eff972f88d9a9784baca [12/12] KEYS: asymmetric: TPM2 RSA key
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250628/202506281226.9ePuUSRR-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281226.9ePuUSRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281226.9ePuUSRR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/asymmetric_keys/tpm2_key_rsa.c:507:15: error: use of undeclared identifier 'user_describe'
     507 |         .describe               = user_describe,
         |                                   ^
   1 error generated.


vim +/user_describe +507 crypto/asymmetric_keys/tpm2_key_rsa.c

   502	
   503	struct asymmetric_key_subtype tpm2_key_rsa_subtype = {
   504		.owner			= THIS_MODULE,
   505		.name			= "tpm2_key_rsa",
   506		.name_len		= sizeof("tpm2_key_rsa") - 1,
 > 507		.describe		= user_describe,
   508		.destroy		= tpm2_key_rsa_destroy,
   509		.query			= tpm2_key_rsa_query,
   510		.eds_op			= tpm2_key_rsa_eds_op,
   511		.verify_signature	= tpm2_key_rsa_verify,
   512	};
   513	EXPORT_SYMBOL_GPL(tpm2_key_rsa_subtype);
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
