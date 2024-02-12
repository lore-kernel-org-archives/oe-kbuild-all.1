Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD4653803
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743713; cv=none; b=lWiKtnK71ro5MUQMruGHIhyO2IIPKrsCT+vVPVHwqvahkG6VXmrrTrMzg0LB1ZBzluJ0xcH9iw9TTvpliwvnrSOfzFCv+fQ+R0RcJcKH5LooUn3NSG9nZShIkfAhmHS5QpCvBjKFjr9zrAx9VSUzEtQ9l1t1jl6M4Y1mycobPbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743713; c=relaxed/simple;
	bh=PCwAcpDE8LW4aWbwTzrIg3IM5Kfmm1SFqmbJ397AFSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NuwH6fFn6o1efbJAqpzzY0ZQw3UTUpkqyzzilcPfTYiYlkmrOSabF6vCAstMtQyIJ4p2Xcqtmm/e0Cfh81jTwltkt2bH4NU/Y5yUIJuoo7tqndltCzgDwXnkMmnTkp3yGF+JffN+idCfNlXyHulEoVC7C4W+SSXzcxYpauuj5q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLGWN6lw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLGWN6lw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707743711; x=1739279711;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=PCwAcpDE8LW4aWbwTzrIg3IM5Kfmm1SFqmbJ397AFSQ=;
  b=nLGWN6lwA2wTyXJQFWEx/Fl2duFulZ8wyj7loZB0Ab117B7aPHLZkYic
   yeVcl59biGpfO1uUYaub0iDDMTJ0jdDpdYtdXoWMwMe5SFlMI1gtGBBcd
   rtLFYpLgShjZwSFP9QiGOn8DtMdd7nl2liexA21iVSm9y6bRopaKxAsSH
   ZcHnVmlolMD17C3tfAHiPDt3IfdTvUATJAir1JQxkT6ZPI63tm5tLgCSI
   LLMGA7vNjURLDxZLUx4Ae/KjIkLqMF+huYhyTQpCrFdKpGJ+S7Art25nr
   WD0fRa4te4i9+ei0Cvx/T0vssD1cIUSQTOYmX2b67pbYJZuWcHoaKlMlw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1840882"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="1840882"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 05:15:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="2978034"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Feb 2024 05:15:09 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZW9L-00078o-0Z;
	Mon, 12 Feb 2024 13:15:07 +0000
Date: Mon, 12 Feb 2024 21:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: oficerovas@altlinux.org
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] Bluetooth: SCO: Fix possible circular locking
 dependency on sco_connect_cfm
Message-ID: <ZcoZpWle5nE7upcG@2fb80f39de5f>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212130933.3856081-2-oficerovas@altlinux.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/2] Bluetooth: SCO: Fix possible circular locking dependency on sco_connect_cfm
Link: https://lore.kernel.org/stable/20240212130933.3856081-2-oficerovas%40altlinux.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



