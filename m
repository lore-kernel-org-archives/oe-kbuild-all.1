Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE317BA6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 02:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758940309; cv=none; b=oaLV6GsweJgOtzVRHHTYM+v0pkLNGrR/ZbfpJd4x0gOZqja3XlgQY3Wj6ietZAGhH0Ujl5EKj4o5y6xFxfj4bUCgDLqAYlBVS7a8jVcMexcIdpd9UyyrlBNMYtNJ+l2I7Gf+DYUIQg7CuXGNzYJOHFiTasw7y7o/aDmrJuyhARw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758940309; c=relaxed/simple;
	bh=CFP8RCYP76k1ZwNhRvBrhFf1ZGaWFS19DpI2vwkvosc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=pHyFM3dpj5IK1L4N/LaALSlcJ5GNTX5W9WyUrHQRn230KeyPhJaYR0m9YfD8BdPockXAcS0m3dVMUlGZwGwNWQEmdj2v87OiWlmIbUewYfrJ4XW/odyXAZ46A0O3G9dZ9t3odpVnnIyvvTeVwNrFbnMv0e31xD2Iqu4WGJP0E2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9drGIpZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9drGIpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758940306; x=1790476306;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=CFP8RCYP76k1ZwNhRvBrhFf1ZGaWFS19DpI2vwkvosc=;
  b=b9drGIpZ4rcZRLeVMzbJhqhp/rsP1IFe7fRW1HrmirmRCojndp7Ll0gX
   jEvDA6TGAn2F5VqHq1+NPd7/Nx+cmSh9wIJnpVMMTuHWpIu0wV/LiIZtp
   eYcg5dRwF7GBLyucLsozXu5GZatZ1ccGLj12cTwG/HLyu5iXXlx+1uWM1
   u6e86sSDGS4Mx/pOObRzI4l1RydHqxARg40qkWjF5vIbRkL6v3ae6Lmys
   WSOTZsUgHAGw0KP8wW/I5kUmjFjAWHHfYJCfFFQz5pevu8v8ef9Lj/yeT
   wxgEYyIm8NUUeNKj4TyJP8O9vnCNS0y0cmcPHaU2VJ1VRQDJ/dumLvSOp
   w==;
X-CSE-ConnectionGUID: QC/+TFXCSXS3VhDz3ZFWOw==
X-CSE-MsgGUID: bZibwPOvT5SAh+hLV8zxLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="71520249"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="71520249"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 19:31:46 -0700
X-CSE-ConnectionGUID: 4fKnMWVpQPi/bAxGRIh66Q==
X-CSE-MsgGUID: 5aN65N1qT9qL2GB46X4cfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="177316999"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2025 19:31:44 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Kis-0006jn-16;
	Sat, 27 Sep 2025 02:31:42 +0000
Date: Sat, 27 Sep 2025 10:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: Levi Zim via B4 Relay <devnull+rsworktech.outlook.com@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Bluetooth: btusb: Add one more ID 0x13d3:0x3612 for
 Realtek 8852CE
Message-ID: <aNdMfeel0qGmgWjB@c9c1bd7d5eb8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927-ble-13d3-3612-v1-1-c62bbb0bc77c@outlook.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] Bluetooth: btusb: Add one more ID 0x13d3:0x3612 for Realtek 8852CE
Link: https://lore.kernel.org/stable/20250927-ble-13d3-3612-v1-1-c62bbb0bc77c%40outlook.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



