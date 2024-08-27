Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B11C172A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766809; cv=none; b=Nd5YQlOKU7Y0znDx1xVSoj8aTmFR18Dsj4X2Ja/KH1zgQvgkjgBj4flhLVeUeHRBlERR1OkHtKN0GrTJ8lnuYYWAKi2rjE6gVbHaUjMLbEj3z9GsSjo+QqfXJFV86yymLRnzEKDcYqAXAx/wjZ46yjKIpxwk7vqV36Y+527W8Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766809; c=relaxed/simple;
	bh=+B6ryWA5HgMDUENMRTMg5qbbvDUwdOMS61gL2mz3TfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qoPD7yso/XvNv1Sdgi7I6qjqQgOmyaDMN+DzN3qffAWNJr3vQ+C7cIOwaTSiUU/IjoifRTfZ4qiUlx3O0Po3E2fkszyPYeWkQ21OROX/mbEPEXy1i9MQ7fU0EzkhpdSTh8cQiQHYK+OqHrm7vMQeayttfi/hDs8KI+1FbXGukeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyMEL1Yw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyMEL1Yw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724766808; x=1756302808;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=+B6ryWA5HgMDUENMRTMg5qbbvDUwdOMS61gL2mz3TfQ=;
  b=GyMEL1YwExwvtXVy+qxM85E5hkI+mnfz8FZnksgdOsyI8gETGkRUpOYU
   FgBZpjsrjL97OTeIebIMR4/HFvdlJKIsIymehfrYGVgJKeaQf99VVAa+G
   AhiDAqPSlEnVKCjbV8UUxnmtPN21Pct3W6UIdpiXTHO8YwsJNPzKBm5bR
   TMPs6S00tEqfe8XwvkcHSTGHtrWQKRRWGFj4HeAjLILzX1ObTFYao4M+y
   mlwQ9zgdrl9nFyn82tjlTSJjnO/mLpWL/w7BBOIRVAY0xuybx94azdniH
   ZOrtJm0glD40kN+Y+xF2DjQ7EqfC0uLhanoFg9DLW6Vhhd67YinDMWCGR
   g==;
X-CSE-ConnectionGUID: fHCz1gklTg2AwlWb33DdNw==
X-CSE-MsgGUID: LBh3fAnZQem5Oaviy/enSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40748509"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="40748509"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 06:53:24 -0700
X-CSE-ConnectionGUID: m/hG5f1IQqGOep2TUcUHQw==
X-CSE-MsgGUID: euviyDpqTqW/2YdqvPcfSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="67571704"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Aug 2024 06:53:23 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siwdM-000IiA-2U;
	Tue, 27 Aug 2024 13:53:20 +0000
Date: Tue, 27 Aug 2024 21:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: George Kennedy <george.kennedy@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: Backport request to fix a WARNING in input_mt_init_slots
Message-ID: <Zs3aQ8UVnR4cWaTt@be42b777ae2f>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1724766547-24435-1-git-send-email-george.kennedy@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: Backport request to fix a WARNING in input_mt_init_slots
Link: https://lore.kernel.org/stable/1724766547-24435-1-git-send-email-george.kennedy%40oracle.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



