Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E7421660D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 19:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608971; cv=none; b=JmojwffESNsM2+nYrSb+sKHhkrbwrXUqYkOOWwyZhRTDnStY75qS1RWVAa1pqBXfry1jvPKuNCcxM/ZhfqXZmVOLb7spScfIjBqdm+NixP+J8i5QHocmWnhAHmAdG6RM44UUdrbnYwArJHbCc/yKP8/CCauGybq6Zfql6wz+GJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608971; c=relaxed/simple;
	bh=9BvFmVp8DmeeJl6201aZQJYIzF67zLXNEaTgcZq/U2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TUG5FK5yWZzNwG85dpg3JvjTXNnN86VrO3ft9ivBVt5oLtwlOoRGQ19PKBZVezamtlRrcoM3rulGeng2qI+Roq1pe5/TpATjSySptT5ASEttXIDH1d24BnmxV7jPqNOXKUfX5qPDKs0WqHltLie0+2qpNj7z0ZTakrfw1qRR8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2wjDky8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2wjDky8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745608969; x=1777144969;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=9BvFmVp8DmeeJl6201aZQJYIzF67zLXNEaTgcZq/U2g=;
  b=I2wjDky8q8Vuyel4LknqB7jMpmdrn1GIhd5Hy6O5QSf2HItWqVVMt3Q3
   bhMaDF9TJCRabpveqvHqZPvK5f9bzzyv3R6bqrFW41rNIX2C1aqKYiDtm
   rPYXQ/o20QBi+AB2wq4sX6SXWdCMXG2PLvSPTODtw7o4sTHMUC4glPDu1
   AD34cUGJmx8JDcSvLoeJZVutvcQwJTyDM2zkq3t+a0ZWJHyTOt4AvSpdc
   5LwOO0gf/kyDIPjQTER/bWCKJJ/UHZehpRvSq581vl60gEu46HnZO7Ad2
   rZGIWt2mIKR6hW3hhh1IIFkjkc9kdFqD1YzIxPkWgLmD2dAvFOJqV19vY
   A==;
X-CSE-ConnectionGUID: 33YLHkr6T8K0/sFnp8pAcg==
X-CSE-MsgGUID: 0XmBPEdDQsqLGDcoGBJncA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="58264540"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="58264540"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 12:22:49 -0700
X-CSE-ConnectionGUID: TUc8kGz+SsWIBDVo4Y/2NQ==
X-CSE-MsgGUID: Y2X6qhiiRyynf3vY2++RjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133505399"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Apr 2025 12:22:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8OdJ-0005Sb-16;
	Fri, 25 Apr 2025 19:22:45 +0000
Date: Sat, 26 Apr 2025 03:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Da Xue <da@libre.computer>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using
 internal phy
Message-ID: <aAvg4E047o0fFgUh@5d75f5d2dfb3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425192009.1439508-1-da@libre.computer>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using internal phy
Link: https://lore.kernel.org/stable/20250425192009.1439508-1-da%40libre.computer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



