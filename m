Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F6223DC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554344; cv=none; b=qBrmYA9bJIKe5kqLiATbDqGAtXX6EM5rEm4PrOHXkbilwf2y+z/VvN9qsqfxJg8ZNGrEDUqxgCGdslkkjWEc8KsXtPU65mqvMYJOxjui7siiNb2N9goMCl6rMVIh7A1rRKqL6Ux/CR+bwXa2/dNXH7vQD8Q+7cmUQuN5gb5g51E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554344; c=relaxed/simple;
	bh=GHG+qHyPYM48pCVxWREHC3Tl7CwyTq0F7lp2EkNZzjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HFplLNTAj4HPm9Wt/fPugr/P9q0R1DeObbENGpAcW2wv7M+SRlrQNJEtTdk/vnp5EJipXfG71pJ0u6/cHP9m8hg+siulLvftL4N+oJyt9xpH+OPhmf2UrRqIvj/vQ4SLT4YTQdRcv0/IqaaVag/2ogPaLWYABFlBemUkQCaNK+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iR3hRXL5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iR3hRXL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749554342; x=1781090342;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=GHG+qHyPYM48pCVxWREHC3Tl7CwyTq0F7lp2EkNZzjA=;
  b=iR3hRXL5Er7jqZb6/ZBZLwN8KAJkJZTkA8r6Q2SzRFa03HTb4kQs/Yn5
   /tg24rsbtN1hrI9pADzAQJet2tMfUs8PzfoPel68NM4kA3ikK3f/3pgYg
   OmdhBLGwlIbyXhPqjRsQKrWC0hYR1aVIcfYGnT6oYT+Tj2SfMYxzUw1tE
   Gq6Y1GLQnpoxsN46sOsdGI+iaLSBpAqNFYLUZnbLMeCezz7GMy3bu6rCI
   0xMxBi8TaNJk5cgyVL3Mc8beraS88XCmFCqg957yPkafdQWWIExQLThXJ
   0fvpRpjkaHGMGJ1Kp9pjdP39I1wTBDt0F8EgM3l+IX24BBwNr7dupns2c
   g==;
X-CSE-ConnectionGUID: +NCLqeyaQtOSsUQJ/AiSjQ==
X-CSE-MsgGUID: ympijlIZStuqU9JmQCg8MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="63009438"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="63009438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 04:19:02 -0700
X-CSE-ConnectionGUID: znjvTX5CR9+jdOyH2YUfNw==
X-CSE-MsgGUID: 57xcdhzTSaCbmEpwUmZMoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="152062489"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2025 04:19:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOx0M-000889-0t;
	Tue, 10 Jun 2025 11:18:58 +0000
Date: Tue, 10 Jun 2025 19:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] xhci: dbctty: disable ECHO flag by default
Message-ID: <aEgUl--oB5IHZ7aE@f0aa6ae54308>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610111802.18742-1-ukaszb@chromium.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v1] xhci: dbctty: disable ECHO flag by default
Link: https://lore.kernel.org/stable/20250610111802.18742-1-ukaszb%40chromium.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



