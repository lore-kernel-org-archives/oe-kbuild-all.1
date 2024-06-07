Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FEE6D1AB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792665; cv=none; b=Afxlp8YqIyrjIWrBBQfIKJyyWfYLVdfGKERDx5xJ9biZmoWdS9UTNLDejDlsZC7pd4LI/hQIjgPejGf/PTeX/vapx/fMGFjbbv7sMNxsrtU7M6HHLBQfv4Lwryrcr8J9ddtOG/jO4dn44hMOuwZCwFBiKV5/CTrhbAVfe8UKwD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792665; c=relaxed/simple;
	bh=wdB8GzWxUZlJXJkVgsdwQdu9tH/SeXHnpEoXtHeYFQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mORzDKekPAlbXuvGn5ZJ2a4tuz7kan+vSPDWblA20VAS8OIbk3WZoPGFL3EWLky4gfoeCJPLFQiG070aY7ief179WzxJoIx4yzT834G9d/nDJEOhLNBWYrzYx83L63zyvJSvqyEfGZgRmb6rEfgSeNjM1N9Z5Ri2jNfnWvJMwks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbZ5gKN+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbZ5gKN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717792663; x=1749328663;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=wdB8GzWxUZlJXJkVgsdwQdu9tH/SeXHnpEoXtHeYFQs=;
  b=YbZ5gKN+/oYB5GtrVyy/i6fuzBhTeLhqMgHkJ6XkIpCc5FNJKFrVxJmF
   OxnE9IgEi3ba1z4DfMTA+yE56DPtC9HLxyD6TKpIFZ3GppDspWgTyBv8z
   ZbTHuvK3AS0FJzKCKZmiB08Usuexis65Y6mF9phQo4OT6w1q0rdDj5DRk
   JWknVdSGyPwxJuq/k4nmewNkMiHwXJWL/K3c+71eaikPnjrdOuI4n4NnI
   GGqL/okedHf65P9R+X/2RIDSTWCdBnoQdOQ3wHIPtdncwoo6iiAAplvDO
   iuRCEVO3Np8Aoi4MDSy9ZCViHci8nQX4PxD11uIU+X4ftw0HhhiRFtwUO
   A==;
X-CSE-ConnectionGUID: lVPtXVbrS7WgTEgY9iNKKQ==
X-CSE-MsgGUID: f455KboJQp2++jauXTloGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="37063885"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="37063885"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 13:37:42 -0700
X-CSE-ConnectionGUID: t5Z+yxOUQ0qulCQgd8ryFQ==
X-CSE-MsgGUID: jkzAviqZTPavcuS9Q/WC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38290508"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jun 2024 13:37:42 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFgLD-0000Ug-14;
	Fri, 07 Jun 2024 20:37:39 +0000
Date: Sat, 8 Jun 2024 04:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: jeffxu@chromium.org
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/1] mm/memfd: add documentation for MFD_NOEXEC_SEAL
 MFD_EXEC
Message-ID: <ZmNvfZU1EgVyIeO6@242c30a86391>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607203543.2151433-2-jeffxu@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v1 1/1] mm/memfd: add documentation for MFD_NOEXEC_SEAL MFD_EXEC
Link: https://lore.kernel.org/stable/20240607203543.2151433-2-jeffxu%40google.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



