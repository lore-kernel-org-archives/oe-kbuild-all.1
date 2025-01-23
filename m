Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD520E306
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634277; cv=none; b=fnMKrnWFKcki7EJL5GOrzdHXAbJwQkG33dsfnb0uabefJvLj2sJ0EbzC3XR0IN8vdfH1wGhQ+VnQG1rkocGAMlJRlSNInzHQwoftSKr2Uh54odg4hH1dOPbVTdQBT1DY8hPxKMp/yjicPz9hnZlZV11ZDcl4b0H+qJTzob6QXQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634277; c=relaxed/simple;
	bh=4DUbtNxlktKbBBd1hn73LeWxk9EhHpL1qrkN3nyliIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Vs305+JLeYvNiK0xUjgCl97o+DJVZij+8w+l7SFzUG7PATvooqoELI9cUKD5nk+UnGwDYq2FhK/gAtH3OXzSJIZK7/SuHI5/g9Apx2fCNI7vBHlYR4Y3EpGZAu9jXdJI4LqAwv/1N2MkYzT87e5hcJaquT6ywI5A2Ok1oPeNZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQKJVu3h; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQKJVu3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737634276; x=1769170276;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4DUbtNxlktKbBBd1hn73LeWxk9EhHpL1qrkN3nyliIw=;
  b=RQKJVu3h5Hby8/Ud+zK2YrHUQ44q4eT7Ny0tQWgTboo5Fg1ebrmjDF2O
   tsRfVN5eo5Y8xE8qP9jWCkihgqMqC8orF5SOhia2QjgiZHS8eFQge9ERt
   QI6GxU+VX0nO4s19DllhNGL/1StAD3KUcgNbHxdnYM8RYTFS6TNfFhJ5q
   PJ7of3DgFPyfiy8OBNq6QJkj05I0TKQbRBkGxHdIMW/O8mQlY07xPWyAr
   HK1EVzBLBqtgpT0A+t5k7c+viKfyC7yNMAt6TF1Ks7iAEy98gkY/tZNEZ
   duafa3gFaBJFaVUGCixy67ku1S1OXhM2MMxLOXT+cuEOcECZI6IAiu40v
   Q==;
X-CSE-ConnectionGUID: 69A0kmvQSNWlZ+H7ZBVRog==
X-CSE-MsgGUID: eB/RFtJtQoaRoyUjqwktfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41794848"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="41794848"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 04:11:15 -0800
X-CSE-ConnectionGUID: Bkf83a6GS26q5cIPsiXL3A==
X-CSE-MsgGUID: 49ZF+iQJSr6mNag5uYpiDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="138311028"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2025 04:11:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taw3E-000b9P-13;
	Thu, 23 Jan 2025 12:11:12 +0000
Date: Thu, 23 Jan 2025 20:10:42 +0800
From: kernel test robot <lkp@intel.com>
To: Shubham Pushpkar <spushpka@cisco.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/amd/display: Check link_index before accessing
 dc->links[]
Message-ID: <Z5IxwrG7d6QFi2AE@34f1432cedf0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123120822.1983325-1-spushpka@cisco.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] drm/amd/display: Check link_index before accessing dc->links[]
Link: https://lore.kernel.org/stable/20250123120822.1983325-1-spushpka%40cisco.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



