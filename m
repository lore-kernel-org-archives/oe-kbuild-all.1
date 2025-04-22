Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA50E258CF7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359638; cv=none; b=M5nz+p7xtg11xh09hW5+dsyMxoRbUICGaaH7tmshxUzoNbqUp7HLF8PhkeN3eV4B3rN8c8DSz1CVQkyq0jrCmloyDNkRWGLBnnIHd5YIwVvEC1TC8Gfv2YWYcnjRQaMHBoE8c84WPWV+RpHOskK9vSmTFgfwi0fWqS/e4QENYKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359638; c=relaxed/simple;
	bh=f63M6+/4/aaEaJGaaMbh9KKDoRlGmlQ7Ey27DQuzXlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fGnXCUGAZEFtm4hFkiLRzJkX1zjHpFyeH6YoqdNSUX3RUL5+VN7n4p4RKr7wyTF4G5qOoS2IeaDVUKo1Jfx691qlTrYvnMfaWriqSgxN6CeJV6DtsDq+SE6/R4Ouww3UNh5dMFlUmP1BY3FGj9AaGPuExd9ie1OoWfz67DLIAco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7kCYWgP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7kCYWgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745359636; x=1776895636;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=f63M6+/4/aaEaJGaaMbh9KKDoRlGmlQ7Ey27DQuzXlQ=;
  b=K7kCYWgPg8O8cLYEmo0GPrJhGQ/4RGcZ8GZLdHWlWyDK1vOpIJJXdeOP
   JnHo/t41qz8lERPCFkgg2hVhBBKnB5cGNSpZTjZo5tUxUk19T5HYKAltc
   tB4SLu7fYj7xrD+BG3BMXY/C89LXKkcCm08EJF63uHyJVgEwZgHfj5WOO
   puO7M+qkw6JwnV0+Hqs5MmnR1O/ZEMkVzhMi7cO8ZZWSDMmY4yctl4rQw
   T0uYW+lqw/ogqCNQp45bEh32aupzy0IcaF6RSTRNZvkXeHC0B48Ykes15
   m0EB2YC2YqGj4B8sTpZUO1U1x4CRfVKJtnlSCDQaacm3sxEFyPnVffneg
   g==;
X-CSE-ConnectionGUID: 4B0yypTiTSWh0cr7qjHFbg==
X-CSE-MsgGUID: TFTIIDmoSpmvYMDSE6mUCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46637097"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="46637097"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 15:07:15 -0700
X-CSE-ConnectionGUID: DDSNeh61SDSYrDjjdjBZ/Q==
X-CSE-MsgGUID: 20QmJxJhSNmq3egE3RM9Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="169352279"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2025 15:07:14 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7Lln-0001M7-1h;
	Tue, 22 Apr 2025 22:07:11 +0000
Date: Wed, 23 Apr 2025 06:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Judith Mendez <jm@ti.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: mmc: sdhci-am654: Add
 ti,suppress-v1p8-ena
Message-ID: <aAgS-FHtCGY8bEs0@dabecf12a206>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422220512.297396-2-jm@ti.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH RESEND v3 1/3] dt-bindings: mmc: sdhci-am654: Add ti,suppress-v1p8-ena
Link: https://lore.kernel.org/stable/20250422220512.297396-2-jm%40ti.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



