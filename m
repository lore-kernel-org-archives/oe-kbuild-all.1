Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3843A3191C4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 17:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757093264; cv=none; b=LT+AIlb5qp7OVcS94zwTP8RegTXCSmMS+WELWpXHaAG2FkfYHGIBV4dCRUgtGvXlsGxQ2vFnRVKq4Q5xy2R1gFjypjDco8dW1NSXj+E0iycp/9fWRD+/AnMj9zBW8McwxgUiDfhVIpLGKal13HQwk/8tvKkwH48Bm5dKNbu+W6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757093264; c=relaxed/simple;
	bh=V4+JGgdf93oucTo4BeaHpLnpKdS12eXtoGZo0KDcnjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VnixMzpQStxfIayL4RFMjkVxKlhqYA5O3Fsib9QuRP9KByio9nGDLk8ZsP5K+NMhsZDi3AlzNjZlSBG98ggpC7BVczRsaexV3I1pLcWXY6xLlqznGySawQojz0zyqpLPTFXsCd/4iDHwg1FpPza78EqF6Uyc46u23LSuMMTDKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKGalNsk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKGalNsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757093264; x=1788629264;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=V4+JGgdf93oucTo4BeaHpLnpKdS12eXtoGZo0KDcnjg=;
  b=jKGalNsk7cplqJ6fQEjtneXn9sn2bTWr2dsSxllRLrsGpL+k8SZczFtz
   DmFnVD1LePy8MbrgSrKJyLC5zI5jnEwAs0voNSFVKlgM5QfPUocpjUTrq
   nNwXpEKa/sOoUrbczm8YyF4xRkR3fKuOX+7ED5vxIY5+AaRmUpSO4a8AM
   BY0ppZ9FmBRG6WpO3+1fMjuoxoVWxrVb+N6A+0ZqaDhpKM4VeKbRDTRhh
   FFzOi9tWLIW4ynAzZJ7DMcln1CaJXlPoByRQBZPvhjaZlHTA6uJ7iU+ef
   e/UEJY4MXCzXIpf/loWF89OJI5XjmVrPWM8wQGnqSEc+98X6XnYLqbpTM
   w==;
X-CSE-ConnectionGUID: uWrOjuGwSGyznb+7/A251A==
X-CSE-MsgGUID: 4Z0r89rDTrKPk08Eo1by6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="63089676"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="63089676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 10:27:43 -0700
X-CSE-ConnectionGUID: xVNJLV2fSgq4FLezbuBzbg==
X-CSE-MsgGUID: LV0oRFEKRGWUmpebTkF6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="171778449"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Sep 2025 10:27:42 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuaDr-0000fT-2L;
	Fri, 05 Sep 2025 17:27:39 +0000
Date: Sat, 6 Sep 2025 01:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net v3 2/3] selftest: netcons: refactor target creation
Message-ID: <aLsdfeTte3sIXnbr@b7823f61de85>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-netconsole_torture-v3-2-875c7febd316@debian.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net v3 2/3] selftest: netcons: refactor target creation
Link: https://lore.kernel.org/stable/20250905-netconsole_torture-v3-2-875c7febd316%40debian.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



