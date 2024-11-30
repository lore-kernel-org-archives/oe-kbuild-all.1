Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1DD78289
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 21:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733003373; cv=none; b=IcYX8w/GDf2cWDN4D/bG7PpJHv/N9jFkcQlp351sN9p5iQO2bJO6YdF/Sy1oQagAs4oUbbEdpKfKfTVpCURNdHwctzUx0DQDTO8DoU+LztP+0CnmA+THCp/njMMivfjcgfMDKJeEBdLSQ8hHoUZqXnmVEjqL6z41vzd4wB9QukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733003373; c=relaxed/simple;
	bh=QXJQUSp2pj/NjNHdCsdsQCu+T9ISeGM1/Uv5xnaWaeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZN+zORkzgolJKIHJ1Jy0jhQ7FrbvT2naX5ENeFEl5crFHWa5lRV071lXUfvFfaDK+FnodMxJPpuVE0vOR//loxYhUZ6mmAc9EUIl176fMeBVfNpBfPHBgQbRoHRuRxEU083XFdP0NV64BzQdOTv2sEimtC9hOHml2VjbvRUB+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEpSfbav; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEpSfbav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733003373; x=1764539373;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=QXJQUSp2pj/NjNHdCsdsQCu+T9ISeGM1/Uv5xnaWaeU=;
  b=SEpSfbavYIMSXJMd53aQMlLt1CR5msmqAFx9RTSQQLc5ruy/9jDhqzi0
   seI+YVOu7xCP0X5vZsdMpfJPeO8VnNNljQnN3ieaRBe3YOoTf3teTSzNm
   NjKJC085TxMFr5/Hk9gDVJVNzPZqazmfdVwgyn8U9KdhpiY1m5Hu5Ji98
   7l7ygRtaBrH49D1bkEHjGunhlDTVs74O0QbKNs0JXEl3JYD0/0zOxG0j/
   ZFg5/+RBG5K8k+k3Cy0ziL7egiboCkD0r6pPqxa8CJatTysNHmf81QVjD
   H0Yx8OcOYF4L6PXD2u7dWii1EbmpofA7ryEVWYv/S2IWZOoiCUiIPRpql
   A==;
X-CSE-ConnectionGUID: F1R8MsC1QJqvgcjUptkyOw==
X-CSE-MsgGUID: aOcJSgviTN6wtHKVyhopRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44574181"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="44574181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 13:49:32 -0800
X-CSE-ConnectionGUID: rjZxXkS6Tc6Ke5V1olRBOg==
X-CSE-MsgGUID: q0ZWNx95TWyE0k2DLUJaNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="97858379"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Nov 2024 13:49:31 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHVKn-0000zd-0b;
	Sat, 30 Nov 2024 21:49:22 +0000
Date: Sun, 1 Dec 2024 05:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] riscv/ptrace: add new regset to get original a0 register
Message-ID: <Z0uIQYqvZUfYwcHM@ff21b5d8d570>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] riscv/ptrace: add new regset to get original a0 register
Link: https://lore.kernel.org/stable/20241201-riscv-new-regset-v1-1-c83c58abcc7b%40coelacanthus.name

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



