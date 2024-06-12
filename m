Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971116C84B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718180081; cv=none; b=CfF3vKWHC05DQoY8DbP6mTJmsWhHNBy5evUqFOqNbBRlXXmr7cCn6zOF5vXmpMgsMEzz3+ctxgvIhlFAN0WtxkD5Q/+v3D+HkTkkU8db8U91UZs5wkK1lTqd+II3orFYJiVx8tiAJ+gbojyT4zP6lnY+Gq2sV4ikYjCQI/6qr1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718180081; c=relaxed/simple;
	bh=XgyhUDybcnkYh0iBLprCh2BW9GItJXI/hsKW3h3kYus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=l9ApFvJKYSHx59xbsglUcXXrKzPEZpbIsnkJXaSjnBMHCSTNdS1YIk3BarNJd86cNC7pV+tZSBKtPbxY+mit6iikhepDmPWjGyf3EYFZTe1Cvx/cWUO8FDZGiwkfHQQG6U8S+tB6mNzuE+Vazkm9b8Y0+OgcDdO9hvhiA2Jh3bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAVtSuZ1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAVtSuZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718180080; x=1749716080;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=XgyhUDybcnkYh0iBLprCh2BW9GItJXI/hsKW3h3kYus=;
  b=dAVtSuZ1S/CNJOCh4xH0R91KdOghxs2NlUnUse63L47fBd8qVnw59MUz
   HcA3L5dfTqFBy1azngjSWQ2n0+mEV1Co1GtPWK5Z4f+HCLtU0ZJ0THN/7
   rVFDjw0pbLi7K59sFz/Z11yLAztFvxNoPyloXbIpCITlb9vorhQgfiQrT
   Fv+5aYHVzFJMaQz9xXIeEO+8VneuwcVoAstyKpD26IHz/Pry4MIeOyB/l
   zATRFBgRWhsY2NQQTmQFv2DBINgUukQP5ViWGzS59gqXFJzpidlJ90hyg
   tMemfTMik3QXCiU+fcvyuH+EugOPJSr3D/4L4yWpFc0hU28SF8c3AXIiu
   w==;
X-CSE-ConnectionGUID: PsNBx2cmRrqD+Yl8jWrfag==
X-CSE-MsgGUID: jDMhB5EVRYOns54bErxHdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26336515"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="26336515"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 01:14:40 -0700
X-CSE-ConnectionGUID: S8/7EQHhSM6Xm8fg7z+E8Q==
X-CSE-MsgGUID: ijB6AWyvQZSdijXudgHTZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="44652888"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jun 2024 01:14:38 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHJ7s-0001M6-1K;
	Wed, 12 Jun 2024 08:14:36 +0000
Date: Wed, 12 Jun 2024 16:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: "zhai.he" <zhai.he@nxp.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] Supports to use the default CMA when the
 device-specified CMA memory is not enough.
Message-ID: <ZmlYx-gf4dpqQLOY@67627e7c46f4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612081216.1319089-1-zhai.he@nxp.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] Supports to use the default CMA when the device-specified CMA memory is not enough.
Link: https://lore.kernel.org/stable/20240612081216.1319089-1-zhai.he%40nxp.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



