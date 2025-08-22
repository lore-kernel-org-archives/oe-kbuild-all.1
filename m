Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB615285C8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 17:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882824; cv=none; b=FWLRHfw0glWuTDFLUjDUl4RQs3IOgUaHN30gts7eWnmNNSBsp53WvlB43YhKKkDGWu0LNQ/L2VxIglRtSE9Ln6wsWXqgAUI3dVgUtYjdp/PigVqh8FuuCLRF5u8xwnSP4RIHWEUxb0tiQQlvHuShga9RJ1T08TRsg/JiZK654UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882824; c=relaxed/simple;
	bh=HPqKsz+uzAD0wPhKZXiDBnIyFszDyW0R/TOA2JgYe2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UU/ZqYU756+4v6cgvsX6YGDPcbghDZjmULRsbCb+17bueSOZ22yRJLmXcxLQb03X+r6n+zubrdoAl2SjsKyw0CGocV9xB1WnNL8GN+QVt3HuBevnr4HrMVYfQSmo2IR9O+BKYQX6ssyKWx9liigMxNrfyVazAryw/kOW/zKsjQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bowK2rx1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bowK2rx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755882822; x=1787418822;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=HPqKsz+uzAD0wPhKZXiDBnIyFszDyW0R/TOA2JgYe2A=;
  b=bowK2rx128S6hI61zN6VzWkhS6zfVP7vD3Z9khCg/fAGGVWGIbq/XyuL
   LC6kXSQ7oh9mxrs3V+OGlzpsibQIzDbHvNBxrkMgahb5z3F4QBwmoo8A7
   Ur4g/vTuEO8lwCT5UQMs9ogVJpFY9Vb+tyQVNKvgdi92vV99QklkKHtcu
   Z6/E1nsIUL6D1gzenLsMcgX60hebPjpVPDUF7Cl4WDtzD544LP+QrF0IF
   qIIDriamB1OmDDvSvSX0vQkiehNkhlH9XhJKpu5O70j62iIROqlT5Ji8r
   4Ww3Macc7SWxYDu5k7Ngypod5MAvwESpy7ALXC4WlK5LEVwoO1vGOxeWU
   w==;
X-CSE-ConnectionGUID: gccGAKDfQe2pKYuFENM/pQ==
X-CSE-MsgGUID: sPsYRlx9ReeLYS4s12KPFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58146066"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58146066"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 10:13:42 -0700
X-CSE-ConnectionGUID: U6pdOetoRpeYSwyYr+Lzxg==
X-CSE-MsgGUID: +jKg9a4hSFi4HmyRDyVsSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173025214"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Aug 2025 10:13:40 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upVJs-000LZf-09;
	Fri, 22 Aug 2025 17:13:01 +0000
Date: Sat, 23 Aug 2025 01:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Brett A C Sheffield <bacs@librecast.net>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED][PATCH] net: ipv4: fix regression in
 broadcast routes
Message-ID: <aKik1iCFR7fwZC2I@425d0687250b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822165231.4353-4-bacs@librecast.net>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [REGRESSION][BISECTED][PATCH] net: ipv4: fix regression in broadcast routes
Link: https://lore.kernel.org/stable/20250822165231.4353-4-bacs%40librecast.net

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



