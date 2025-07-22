Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E462EA15D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753193928; cv=none; b=s2uXQ/0Oi1lyqyWJ5LB+4hS3sqdLILJqwinG1UFPVhPN6RVyNMfkCTFbaaUFuRZzFRZq854jF3pFR+MkKSQNOPtTPm/+C78i9rVrH9FUryCx0wKsO/beesPVIik+NUDog8Feww9rHXBF+XOcMMNVBc0jO9W6H+9Ylrqwg9gmzPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753193928; c=relaxed/simple;
	bh=RgizjobqgZ+Z6w8PDAlpibfvoCUj1dm33XljR0UWj14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IZppREM5VZCiPZMUL7ieoIJhpE/+IkKvDMzkMmLuXkrGHl7UTjU7QANX4OUyziISihG5jWtU5LC7F4BBFbqiETakVfHpP0rBWPd2ir8UwnCNqPhYhTJbqsTF5sbdNPDxtg6jCHQ5xIxiN1zdlYCRx47DgHXTW8p1FnJmWZBYnbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHKRiI+G; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHKRiI+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753193927; x=1784729927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RgizjobqgZ+Z6w8PDAlpibfvoCUj1dm33XljR0UWj14=;
  b=gHKRiI+GFDquCvMiqBi4wJd8Gc00Q8A010ndG41rU+ovrxatzb4EKX35
   XL3n2oL+wQmuT7rQP3pVwOqjScozrxzrLkjJbxlpUgzATEZ5n6gM5dtoj
   wiM/f5SL0UZKhou5fxlmvc9d3Ap+PjdCcIuCJFf9RNukR5+myRu0CNf3p
   VFU3z2HVJFp29NPHYOJMsJ3bIuGVd8Hcejku3nS+//RAO5GVVhcREnNqb
   YZwS5XzpAOmAQX4UEwc+f0jLPIDmCJTTLTUYPq4HCxZiTsRfQ123GhUrU
   L4kHCPfKzzRpY3NGNHV9K7vaK0xcyo7ql2vT1rVQ5kBYqIIXWAdbagHUc
   g==;
X-CSE-ConnectionGUID: 3om6QedERSaLiNXm0e+Dlw==
X-CSE-MsgGUID: J1J2qKwmTwKQB+RiHPopiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55535979"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55535979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 07:18:44 -0700
X-CSE-ConnectionGUID: AUgvb43ORVa7igadbJo/Iw==
X-CSE-MsgGUID: MoqbEv0ISOCFI5nP7QeYUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159471499"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jul 2025 07:18:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueDpJ-000IJH-0R;
	Tue, 22 Jul 2025 14:18:41 +0000
Date: Tue, 22 Jul 2025 22:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-libcrypto-conversions 78/84] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_RSA when selected by
 INTEGRITY_ASYMMETRIC_KEYS
Message-ID: <202507222244.omiQNYY4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-libcrypto-conversions
head:   60f592d9fe4e26c4e98273c0275ac1f1f87fab3e
commit: 2a8926c5c8560e0188a237145b9e95146e1d112f [78/84] lib/digsig: Use SHA-1 library instead of crypto_shash
config: alpha-kismet-CONFIG_CRYPTO_RSA-CONFIG_INTEGRITY_ASYMMETRIC_KEYS-0-0 (https://download.01.org/0day-ci/archive/20250722/202507222244.omiQNYY4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507222244.omiQNYY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507222244.omiQNYY4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_RSA when selected by INTEGRITY_ASYMMETRIC_KEYS
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=n] && KEYS [=y]
     Selected by [y]:
     - INTEGRITY_ASYMMETRIC_KEYS [=y] && INTEGRITY [=y] && INTEGRITY_SIGNATURE [=y]
   
   WARNING: unmet direct dependencies detected for ASYMMETRIC_PUBLIC_KEY_SUBTYPE
     Depends on [n]: CRYPTO [=n] && ASYMMETRIC_KEY_TYPE [=y]
     Selected by [y]:
     - INTEGRITY_ASYMMETRIC_KEYS [=y] && INTEGRITY [=y] && INTEGRITY_SIGNATURE [=y]
   
   WARNING: unmet direct dependencies detected for X509_CERTIFICATE_PARSER
     Depends on [n]: CRYPTO [=n] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=y]
     Selected by [y]:
     - INTEGRITY_ASYMMETRIC_KEYS [=y] && INTEGRITY [=y] && INTEGRITY_SIGNATURE [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_RSA
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INTEGRITY_ASYMMETRIC_KEYS [=y] && INTEGRITY [=y] && INTEGRITY_SIGNATURE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
