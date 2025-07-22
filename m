Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64972274FFC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753198267; cv=none; b=WsPZSCiXxBhXnH1odeU+VIt6MBqN+uSfirpXkOIMyuqOM5RPuTUeDr60MiCh7YAVv2BLq4P+vXFGKgIWyAqM64OVAyffC6YvHM71ZqbjEz71x0TQibSi5QMvgya6dqNCJTKFkGfedagEacpLlckpGOFY33gxAGK7471NJqfxvoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753198267; c=relaxed/simple;
	bh=aa3ZhMaIgNxLAhePgCii0l6h7fHkaAldWW3bWI0oklM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L5NFrHTMX6DcuPh5BIX/rcuJq1AnY46TXFMpwW2tQ92nVZant6me3iqbYNZGQtjESxm4APXomcX1Py1XzFxGHUhXjtjlxzZROnWe4eYXgasjX7DXWUgG8JcIo93vI9sPXyfj6W0zslgKYIYa4FL2PJMQMoabvuaKQHQr+YLBLHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaGesR0U; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaGesR0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753198265; x=1784734265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aa3ZhMaIgNxLAhePgCii0l6h7fHkaAldWW3bWI0oklM=;
  b=JaGesR0UwnIIJVrmpJM+/Cb6EuDtb4ct2ZplN/6OuPnQP853QSfuR8mc
   8F5VrZ4avogIwNyz9b2EZ8SNUUL/QyVsQtNON+RH9eD8LKOcJ2vKBTBkd
   r/96DPb+sU06DaOZh2+j7k+IaNi9S1M0vwX5bYWBdQMprb11vau7Y0y5X
   pNLgNIcWeAIpFr9Sj+vQVP+oTVd1W7ByQQNy5TIzCCtKFRLvij1QoEKMl
   Dn9baW1knmJce7VkFoQoRDbuP/2WmoituhlyK6pHx5FN6kSZ319GC+OpG
   UADGG9e1v3wfXrbb8TLaMvCN7LH5lfPfqTw/DywykXdueTS/PJlf7GdXQ
   g==;
X-CSE-ConnectionGUID: JhxaZMVnTvS1bZ0C2dzLxg==
X-CSE-MsgGUID: h23m8Hj6TEec69J2GeQstg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59255135"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="59255135"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 08:29:58 -0700
X-CSE-ConnectionGUID: jXLeoPmERoeI3/+25PMRFA==
X-CSE-MsgGUID: 3igZgPAvSF+Ps0PqVa1UeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159481697"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jul 2025 08:29:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueEwD-000ITP-0Q;
	Tue, 22 Jul 2025 15:29:53 +0000
Date: Tue, 22 Jul 2025 23:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-libcrypto-conversions 78/84] kismet: WARNING: unmet
 direct dependencies detected for X509_CERTIFICATE_PARSER when selected by
 INTEGRITY_ASYMMETRIC_KEYS
Message-ID: <202507222348.UPANa2Fn-lkp@intel.com>
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
config: alpha-kismet-CONFIG_X509_CERTIFICATE_PARSER-CONFIG_INTEGRITY_ASYMMETRIC_KEYS-0-0 (https://download.01.org/0day-ci/archive/20250722/202507222348.UPANa2Fn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507222348.UPANa2Fn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507222348.UPANa2Fn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for X509_CERTIFICATE_PARSER when selected by INTEGRITY_ASYMMETRIC_KEYS
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
