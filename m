Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65373596B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 21:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756934181; cv=none; b=K1NQQillODo3bKvPSZi4kkOq2T8W0cNL82Y5/DcYtVQCBXVQbaZyGxsT0tPRETihtL7H7ZZDUDvnHxYsER2+K6ujit/kEZCV9ndhjHkEZhQy4G8WdX9uGclGlqAsi5X3DAc4ejLAItYoamGeVFBXHHRJlUcrpIwZNWoQhdPycI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756934181; c=relaxed/simple;
	bh=UzDezVzqcx6neVGBx5JVwLNDCCuoPPE1J56Dg3JVFxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Og4Sd7qLD3CN2lhPTbnQrxnxT6cFT6uvptPu/MOk1c06lvrZz7rvg/yaBHuFCHwuR+NPtK3ker/rrNxfJh+g9m+J1ivVivRn3WV8BOcj7EZDh8di2396gRXBcgyS/YHkD+QAVqAjql7tSXvtgm865/GKx+FyUng1F1BNjXfgEJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g0AvJSnm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0AvJSnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756934179; x=1788470179;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=UzDezVzqcx6neVGBx5JVwLNDCCuoPPE1J56Dg3JVFxM=;
  b=g0AvJSnmre5SN8QKZUIICTFPpCRnmsf5+ti0rudDK6IBa6syWUnydVnJ
   5Cgn5W5i4WxEEynIXk32TYu+ZyFwEA7r4a9cnMIHfEi4deneKCcRqRtKh
   VKfXOnweVhZV8/BlLCJGHyb/jA0y0yb+fKF3y5C9tJTWdIhv4rtOq7kIb
   n63fcifZgI8n2UCa4VtTxl9rQmykUAjCuhZItiO3Xgxw8JQf+gJvo0pA9
   KaOlbel50PSGANEAJrCWcDNXiZpnz2RsxQzupxYpr3l4UcGwSNv/76hN9
   PotG+v+Di0iQf7OPXtJWMJkUBihYOhjAZH9aI2bOmcOm7EDA8NcexGi/5
   Q==;
X-CSE-ConnectionGUID: /AkBm6/KQXKB/e9DDG+6Zw==
X-CSE-MsgGUID: o499VVe8TWWn0i8xDcnyEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63095422"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63095422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 14:16:06 -0700
X-CSE-ConnectionGUID: dS1Gzh/KS+OUVFXNRSXBng==
X-CSE-MsgGUID: 97zVp05vSj2b7ur3Z9T9Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171257036"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2025 14:16:04 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utuoi-0004Qv-0X;
	Wed, 03 Sep 2025 21:15:41 +0000
Date: Thu, 4 Sep 2025 05:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.4 only v2] powerpc: boot: Remove leading zero in label
 in udelay()
Message-ID: <aLivXntAMi0RN47F@c0d94d4ed04f>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903211158.2844032-1-nathan@kernel.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.4 only v2] powerpc: boot: Remove leading zero in label in udelay()
Link: https://lore.kernel.org/stable/20250903211158.2844032-1-nathan%40kernel.org

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



