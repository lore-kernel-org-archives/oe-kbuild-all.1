Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5FC1EE032
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Jul 2025 02:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753412016; cv=none; b=OHfuTMiAssSL77esuyo+5QSG0q2InKzjDRTedo+WJnvTbm7UY+iNESFuJMISPBJZ+tOdlPDpPLHcd1uWLR2ZFRyQtZnhKWA1iZMYgY+Gwe1h6RS7twz5QLHKexF4tB8FBacjrr1DN4wE59UHBRQqAXiBwNTzaPBVXjRHGL6qFlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753412016; c=relaxed/simple;
	bh=ZbvmdWM01voV/RHKOHPy7qqMj3Y6NHh7aFUoYre1Zww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XIn6MEHfu7g6gHEAt4Y/r8TMbkb2qJ38i7kZN6em0G0qmQD7egqmsR7O1lZZSC7X4CO1RZf+tURJvNx0pTZcruB0CcmsMMYuNryESTY4RO+VUmdHFtf0Ii0Jgd6Ee7ni8wlr01ewr34l1GzAM4wRpib0n8/yhXm1wVdQK6odYLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZBNdGUN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZBNdGUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753412016; x=1784948016;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ZbvmdWM01voV/RHKOHPy7qqMj3Y6NHh7aFUoYre1Zww=;
  b=SZBNdGUNzUuVGlX+trKSETkx2jsJii+WBrPilTjuRxO/1ar/xP0hCP6I
   4BrY5ufpb3qVo7mVz5+GRyUwVzBf/s9pyDF2PlLa2nzZMRV0nLPi+u+2Z
   Dq4HD1lbjwl6qbmH9uW5Xs23dT0BpJI5aVgVd4MhpycbtJ04XJ5xK8K6F
   NKtgvq4SShnbANOcdrlFSp300+A/EHQkr+7DsHwquyWFoI5bef6BgIc1Q
   KKr2y8phqTtVJx88A9aIKSDNJ3GRL7A4yFismRvbG2SZceHBI+XpF/HiV
   P0fvquFLPP/ID2waJbUe5LkR1NeregcFF9m+Ottkpjeyi3vQAHrZ3mtOk
   g==;
X-CSE-ConnectionGUID: jQfS1FaDRsiqYP+gCJtv1Q==
X-CSE-MsgGUID: DD6vz+7gT+2/8t0eQq32tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67183374"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="67183374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 19:53:35 -0700
X-CSE-ConnectionGUID: WZnvsPHiSkiSCJszbXXX8Q==
X-CSE-MsgGUID: sx3DPzc+RWmeUn6Gt7vgew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="191547249"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jul 2025 19:53:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf8Yt-000KzX-2P;
	Fri, 25 Jul 2025 02:53:31 +0000
Date: Fri, 25 Jul 2025 10:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Li Qiong <liqiong@nfschina.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: slub: fix dereference invalid pointer in
 alloc_consistency_checks
Message-ID: <aILxbxcnrd5emETI@eafdfd67401a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725024854.1201926-1-liqiong@nfschina.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] mm: slub: fix dereference invalid pointer in alloc_consistency_checks
Link: https://lore.kernel.org/stable/20250725024854.1201926-1-liqiong%40nfschina.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



