Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAE626ED43
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 20:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761424736; cv=none; b=f9AwVL3tIl1WeV3xLQSjXBd48a8/x8H9kahETJfH28kFu41YXhN/XbNG5IVlAHtZEFr6PSrMLJJOe9s6/HyOJvfVXhlJIbyINcVh3jQCl3B5xiFWhQN08dbefcV8F+tDPHomWthGwa2ITFWU+ZBEuiex5MeKeNhdjKxPBBHRxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761424736; c=relaxed/simple;
	bh=MJDlof7cUoibv5+Mf0zZkAyysMtBve613Gbu5leud7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rl3htcDDlfCQqGpb0393y8+KqjbLZLYhNuko0hNRea0/4JY+1GcTyHm8PBrGrg6HtTg6lQxgdUcPXb6xwUuJRzkLC6PDyfS8a4KQejMfEEHTyDHm4DwFC2he3WEmrgY2E2lfIgzRTJfOAGRWBpajiQdtTDCkHXX3HxTmRGizDZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYAbwYGm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYAbwYGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761424733; x=1792960733;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=MJDlof7cUoibv5+Mf0zZkAyysMtBve613Gbu5leud7M=;
  b=FYAbwYGm5T5lINw61fPPVxYOjkG3uDBDvn2pLpj33fUNyK9jZSeIW/jb
   CSfkPb8Ti79uIWWlM4w7Ht9jixBoPUqJyRsy2LtbWoCLHOJXdT4CSwaOg
   MM5s5mWOGL16t114wfofNmNKEHjCIclaIMvmaLgSGtKTk1tjkX9ZFJY+x
   dEjQuTocnqYQug/sdLtJUjTbtD/Z/a/iXIqRe4OXEVngUiZ4H/Aa0nI0x
   oNIdCEs1azbziEzEO9N7qSJf5h2lNx9ByYFEd91ML+JEHK6o+CleKHA+Z
   ePZs9K18XOg9YttYONGSyaO+zoXklkE86at/zH2iMk8XsIv8q417+zv5C
   Q==;
X-CSE-ConnectionGUID: SXMihE5xQvCgRMgYTPeUSg==
X-CSE-MsgGUID: L+bG5tPkREqnrT8p9Gm1zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81190915"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="81190915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 13:38:53 -0700
X-CSE-ConnectionGUID: VWCsBFQvS4eUnj9Nss6LXA==
X-CSE-MsgGUID: p4dUXTJvTwqI55htG1zn3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185179382"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Oct 2025 13:38:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCl2H-000FZx-2h;
	Sat, 25 Oct 2025 20:38:49 +0000
Date: Sun, 26 Oct 2025 04:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the X3568 v4
Message-ID: <aP01WP4gzxAaTyFi@2863c40af373>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025203711.3859240-1-coiaprant@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] arm64: dts: rockchip: Add devicetree for the X3568 v4
Link: https://lore.kernel.org/stable/20251025203711.3859240-1-coiaprant%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



