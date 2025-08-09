Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71622E36F1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 18:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754764713; cv=none; b=bHya7OLmaRdKzOkaqyvGly32puj0RQf7QfQCDKc/rvL3isX5BjigzFEaiZUevVt7D/YHcIl4YpzUFavdForsm4zyuTJ2Ms2E8VCsZZ5TZdmdMlrorg5JERvq/E5QMf5+JyyMTWZH61uld9PHAaWCZfRAShB0gceVW+04Lb81rmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754764713; c=relaxed/simple;
	bh=Pg7cw1XLjS2Nh21PSgWKG2Aoc3IYRQzlw5Lbmzk0rk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=d3APo+j8PGZCHA/KwR9Fxa3sU2TlYjtmG61ZMEDHMi7dtZ+8Ob7rUkFomYh2HFIyau5lE/gKG1/j5dSi8GgYeqsUroep7kz3nfvjVa8uaxX8O+3TkOxznzw9sp2MTHgfcScytao5ZT9KqY4Jv+9g9QXPld0ECDkAal/GNYBuOJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZSbJMZM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZSbJMZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754764712; x=1786300712;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Pg7cw1XLjS2Nh21PSgWKG2Aoc3IYRQzlw5Lbmzk0rk8=;
  b=WZSbJMZMlyr1IMqpgTRMgANCQv+AoCceW0D0spKgXQI+pRzk5Ic/kjWo
   wvW+J4FYjurI1IqzbhyuTdligG0U4XOLlO7hZyv93P0gcYD3k/JxZXCWX
   IvPZ1NSQU9szqJ+IGe1FPKyApD8Q7JU6ueBYArTphxoOxXmIXiNKHbom7
   JNhLl6EmV2rR4Vq3eTyVpbcYFYoUU6zZhAmxXLXFeVBS/G8gI6Gw3RMrh
   oofsyp08N0/DfPy/eJ3TI+5Z4eK6ex/cD4scVz6DJadJRoJ3Odt1WGuF6
   7iGclP0i/HNxV1OP8WK7RKNags/X7M0QJlb/diOMW3c1UHqAk9m2UXk+Q
   w==;
X-CSE-ConnectionGUID: gzbwxRIPRjySXesXBRTp0A==
X-CSE-MsgGUID: zSRd9JQZQEeKFm55WhcKLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="59689588"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="59689588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 11:38:31 -0700
X-CSE-ConnectionGUID: HXBgOSi2TNm7IFMA8+T9Vw==
X-CSE-MsgGUID: Tazj4xElRxCxo0NCE676tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165463994"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Aug 2025 11:38:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukoSa-00050K-1Q;
	Sat, 09 Aug 2025 18:38:28 +0000
Date: Sun, 10 Aug 2025 02:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6.6] io_uring/rw: ensure reissue path is correctly
 handled for IOPOLL
Message-ID: <aJeVj4yXt4F01nPb@f5c43a121a53>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809182636.209767-1-sumanth.gavini@yahoo.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 6.6] io_uring/rw: ensure reissue path is correctly handled for IOPOLL
Link: https://lore.kernel.org/stable/20250809182636.209767-1-sumanth.gavini%40yahoo.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



