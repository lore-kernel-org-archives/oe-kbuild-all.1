Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12891E230E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175077; cv=none; b=dwUfPDMG2tQf4jfFy84y5IqT43WABUyqSyrZMHe0CVZK1n31SgJlllbOvJiErkohHgFvUWDdWYCLvX0fCS2tGIxhj7OIxSaoZ9zFPYabCKsbkWiqKzhWB1TW2frJE8x4wzzbnz2gH9AM36Wi9HPhdAN+QGRTGmbMHp2CyKi+MSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175077; c=relaxed/simple;
	bh=JpkPI9mnSMZRp/ieWoTSDHx7uz14hhwXf3B9mAUUoV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KbHg3xdrI25e2Q9yTscg94D/LSMR6zT1yRNhouGgXMNksLWQvuXgyYTLVCLxLrpQ1n4tazi3zwnsC/dQKF6bkpXIOJD3oeRot7UNePc8oK3N23ql34QRIRt9zlCGIM8NpvmGi7QjsKMpvslWkMf60as+Sa/zmbs3iMSzoxBcej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2Oas4xF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2Oas4xF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738175076; x=1769711076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JpkPI9mnSMZRp/ieWoTSDHx7uz14hhwXf3B9mAUUoV0=;
  b=N2Oas4xFWsjapau4zVAaQMhj4JtxkANU3sbx0ZCqfcp4WeQqhmDYA6rc
   elenHAVuMIkCUysueGgSfwvjBfRcwvqr4xWAE7j/QQDWJkk4sQNnuVq57
   jI2qirmptapyyvg1i919MFOXnWjkRL5wjPpE5yiSNlHbu6XcbAdH0U1X6
   fUCP0Lr5quEOditp2HELlcyP9Jr/Qx4mfn3NgMG5cS/HQugqxJfnivvAM
   5P/FDgQaYXr7ug6tc5RbcN3jAbxcWRX6IUb753lX4Gh+MfgVD6ShNBLX1
   ASCALwcHow7JCoIfT1hjd9GS6AK+AOvt2cvJl3wCY0Azg93aTL0/yvA7U
   Q==;
X-CSE-ConnectionGUID: rIGMYnqaR6etM4K8zDimxA==
X-CSE-MsgGUID: DXmkotZ1QR6bDyc0TjOldA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38735102"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38735102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 10:24:33 -0800
X-CSE-ConnectionGUID: QRDLmKXAT2+g87mQG+i36g==
X-CSE-MsgGUID: VhpkfDggSkazuF1q3fO4rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108962067"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2025 10:24:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdCjl-000jER-2v;
	Wed, 29 Jan 2025 18:24:29 +0000
Date: Thu, 30 Jan 2025 02:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Noah Goldstein <goldstein.w.n@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: WARNING: modpost: "csum_partial" [lib/checksum_kunit.ko] has no CRC!
Message-ID: <202501300227.R4RBs60S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Noah,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
commit: 688eb8191b475db5acfd48634600b04fd3dda9ad x86/csum: Improve performance of `csum_partial`
date:   1 year, 8 months ago
config: um-randconfig-002-20240321 (https://download.01.org/0day-ci/archive/20250130/202501300227.R4RBs60S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300227.R4RBs60S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300227.R4RBs60S-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version generation failed, symbol will not be versioned.
Is "cmpxchg8b_emu" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "csum_partial" [fs/nfsd/nfsd.ko] has no CRC!
>> WARNING: modpost: "csum_partial" [lib/checksum_kunit.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv4/netfilter/nf_reject_ipv4.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv6/ip6_tunnel.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/dsa/tag_lan9303.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/wireless/cfg80211.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/sunrpc/sunrpc.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/openvswitch/openvswitch.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
