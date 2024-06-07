Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1BB3FEC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 03:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717731625; cv=none; b=nitCzJXjthQmVHdbNkAjme+7LJshpszN6wIf40hIFUfPlRjcyeJhGEKph6qoJkW7+FDmayWnkmjHbwyQebXMmLFv5kbOH9ZXRxRGWn0gqLgUjrXqQV/TIOTQsXbsOuKz+nunoFH6RsbRuEqpAVQ8Ln83NvCMcqePiRMaryWCNQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717731625; c=relaxed/simple;
	bh=rPJ5ufAViNYhCGjh+ZuXBltquKOKg7geswHuJeUpgpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Bv8gr89KQK7iWmjb2RmyrbapqhmfxEps5SKE5bp1pdxM7f9yaSycMXe7itKV9QCXeI+g5N836wU+sSsbMq/zxjrYw+nUPfcfv0j+pP3L70cvOuoxtXoHxGJfpma9JLwwYtmoJ2vZcXnKvDi2WvdpQ7vj1SzHDzYV2PWodvwm2YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4ows6Lz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4ows6Lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717731623; x=1749267623;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=rPJ5ufAViNYhCGjh+ZuXBltquKOKg7geswHuJeUpgpY=;
  b=E4ows6Lz6PP7iYfUGRLVa9nmgFhzcefjY17SRO3Xbk8CK/ikID6GSQbk
   NnyayZpv7aDsszOY2BxScO0hV4nLsApZTb+vV/KR3mJydF5CpYrTShk6J
   QLGFA5leOistqwqSBGiR35I73NOxDWq9GAqhcqF4UGBxA1MDJE9YCggmB
   NcXS8Yspsz3VmeLDRJfMoipWIsn6CKsP/9Ovmv8b/h9t5EOW2xzWvXjJ/
   2bOqMeJCimV0mo4tU6nF6UhzojgYxF+EewiEtS0EE49CqxYTZsyPF3ecu
   TevRjtX6sZAcDcmFGbRrnqqbmBvWKXiRdZcMm0zGvavZjYfME7T6J2tt0
   Q==;
X-CSE-ConnectionGUID: GIdyoe1yQ1GbjleIjXt+2w==
X-CSE-MsgGUID: SY7wcRVkQ2e5LU92ETALZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="31981897"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="31981897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 20:40:07 -0700
X-CSE-ConnectionGUID: V+Y5JIl2Rp2SBL9aKz9Azg==
X-CSE-MsgGUID: 1WaOr71cQROGxp4tEIjeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38123056"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2024 20:40:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFQSS-0003zD-2Z;
	Fri, 07 Jun 2024 03:40:04 +0000
Date: Fri, 7 Jun 2024 11:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [Resend PATCHv4 1/1] mm: fix incorrect vbq reference in
 purge_fragmented_block
Message-ID: <ZmKAez4QQawL3dSg@242c30a86391>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607023116.1720640-1-zhaoyang.huang@unisoc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [Resend PATCHv4 1/1] mm: fix incorrect vbq reference in purge_fragmented_block
Link: https://lore.kernel.org/stable/20240607023116.1720640-1-zhaoyang.huang%40unisoc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



