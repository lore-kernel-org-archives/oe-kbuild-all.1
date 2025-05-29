Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227921CC52
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 01:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748483191; cv=none; b=BF3dzPGMOXvxj8CURHET9/JmS/V8P2GVCXpRhfCbc3VqQFll96oJc0NndaO9uFxRsBMzKvoPCnVSZyKtnz7hjCzXbET3eTU/CYloFtXCTPsk3qhWtwar/IQz97u6cs19R7PkrsKn7rAhAU/5+iHQVN9LN5TPetRs+vqBfodBSsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748483191; c=relaxed/simple;
	bh=wffocwkHPCAJ8i51ohkJWseF7GJ2jZKI/kVRt/RI6r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruIzApHKAcxOcng8TQBFEKjy5AT0lqrlKcZAehf8DRFSC/mlSCcfzU4eglBAa+be+PuOSjEEzFF/AYPBelWyIC1ZvePR/o5/M7OaR4h/Kw8tyAIuXOckoSWRCbYu2d4atlEqMfIEdx1oth1Yv85q4B/BRtsoovjrFZaFGGb1wS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xp0Z4Bec; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xp0Z4Bec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748483188; x=1780019188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wffocwkHPCAJ8i51ohkJWseF7GJ2jZKI/kVRt/RI6r8=;
  b=Xp0Z4Bec3QNt8JtOOdCSFBFxl63rp/yBLIBY2IJ1n01SdMVc7NGDr1CU
   O0YZuEZsvCXsuiYd9amT4dBP3Ln2l+nzP4blVn99YSffXnUrcmgz+ZxIY
   KW3VzWoAEVoDWp3irSsvMBz//Sn8VjTihaTklaxsS8wTSYqPaRob035Wk
   ALCwVzrZJufbC1U0hSlzWP8KcoQ8g2nBP5h5kHbYdqbkTLM3SECwBqJJx
   PqLbgi3h8LnFyPIns32WVe3BwixRz9Hl41zzESnFB9B2WdpmL5J7z03Tj
   UqhTAQPOmGmui0o11KJWdJok0k0Nb7A8C/qpab23RpcIJ4w7alGUcbNJB
   g==;
X-CSE-ConnectionGUID: 12AcWyNSRDSAMgwmPJOn6A==
X-CSE-MsgGUID: VTGq1NCpQUqrEqpfA2g0hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54336241"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="54336241"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 18:46:27 -0700
X-CSE-ConnectionGUID: OoiBJyxpS8+jApZdAl8ItQ==
X-CSE-MsgGUID: QParBWCcRHCAboPKy+vw7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148270367"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2025 18:45:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKSKV-000WDU-0b;
	Thu, 29 May 2025 01:45:11 +0000
Date: Thu, 29 May 2025 09:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Kayode via B4 Relay <devnull+samuel.kayode.savoirfairelinux.com@kernel.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Samuel Kayode <samuel.kayode@savoirfairelinux.com>,
	eballetbo@gmail.com, abelvesa@linux.com, b38343@freescale.com,
	yibin.gong@nxp.com, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 3/6] regulator: pf1550: add support for regulator
Message-ID: <202505290947.V64gMrRB-lkp@intel.com>
References: <20250527-pf1550-v3-3-45f69453cd51@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-pf1550-v3-3-45f69453cd51@savoirfairelinux.com>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0a4b866d08c6adaea2f4592d31edac6deeb4dcbd]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Kayode-via-B4-Relay/dt-bindings-mfd-add-pf1550/20250528-062840
base:   0a4b866d08c6adaea2f4592d31edac6deeb4dcbd
patch link:    https://lore.kernel.org/r/20250527-pf1550-v3-3-45f69453cd51%40savoirfairelinux.com
patch subject: [PATCH v3 3/6] regulator: pf1550: add support for regulator
config: i386-randconfig-017-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290947.V64gMrRB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290947.V64gMrRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290947.V64gMrRB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pf1550_read_otp" [drivers/regulator/pf1550-regulator.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
