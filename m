Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B507630C604
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758820436; cv=none; b=ad/cCXdbpVkH3IBkL5LY67a2aYmu1I//L/nIddcEDu3fW2bejCIVl5kqvbSOaTaa7+PRQ10iD8pgm7/C8YFVwtdzP8Gu9cqc6CuW+VPkpkdpBd41QKhOrFtBVbeIt/OBp3O6mhc/x+f6L4TubGg3LMia2MduP15cXXTjWeLxlpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758820436; c=relaxed/simple;
	bh=0peyXK0Sd3aeNl/OTr7UrqA/lKV0PGomLIAC6U+2FAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRcfO7zXw8e1D7iZyVk6Q7nxEU5FvF7JjGsuoHGTZgT3dMLcMmNIr8yENOpmCM0823N1kqIAkdtMdyQpF1Q0GZS6a+hTWVrjY81xBgjFlsVHIE/JAXmMf6glWpdgYT+a5KirNkQ+tgwxiBTqsvc6AuqlnH/x5mZJrfkIfq74Jw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGeiXblm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGeiXblm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758820435; x=1790356435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0peyXK0Sd3aeNl/OTr7UrqA/lKV0PGomLIAC6U+2FAA=;
  b=WGeiXblmFFffwR9unRy4qWIfOYmlRHn1XzQiVJAGDqTq7qOkclQiBvBW
   iojFRAd6ZDLs6I58qPU+301OG0T05Nh6erMrb5TxKZtXK+xAD1XNh1tMY
   V1AiNTz3TZPVx502/h4EKSzQ00xm+rd2Bv3cKpGBzSOxdGMhqkGw7PGIo
   OU63IsX4vxR/nUIwhDrk5lrniqKmHX3cZmS/uWpYy7ZUOUYzzBYtr7BOH
   sIXhNpM4G7FdKz7JRYB8B/jNDh45u5q71u4D8H9LnqVQEl+mFGcYGRioo
   FSeP5NQAEir3skioXHzVyut9refDzAkQRg2FH4SFylaqDKdFax2Crm5Pj
   w==;
X-CSE-ConnectionGUID: hokkGgb/QjSP4DgtsquXAA==
X-CSE-MsgGUID: BHTkPjUDSJGk6ONpUe82hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71396894"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="71396894"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 10:13:48 -0700
X-CSE-ConnectionGUID: DBBkWSYSTNyahXNeQeScHQ==
X-CSE-MsgGUID: oNIh8UzpQ7C/RvvSyTCpjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="182654557"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2025 10:13:46 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1pX5-0005Rh-0G;
	Thu, 25 Sep 2025 17:13:34 +0000
Date: Fri, 26 Sep 2025 01:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 4/4] net/sched: sch_cake: share shaper state
 across sub-instances of cake_mq
Message-ID: <202509260111.MNw6sbtR-lkp@intel.com>
References: <20250924-mq-cake-sub-qdisc-v1-4-43a060d1112a@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-mq-cake-sub-qdisc-v1-4-43a060d1112a@redhat.com>

Hi Toke,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on dc1dea796b197aba2c3cae25bfef45f4b3ad46fe]

url:    https://github.com/intel-lab-lkp/linux/commits/Toke-H-iland-J-rgensen/net-sched-sch_cake-Factor-out-config-variables-into-separate-struct/20250924-201842
base:   dc1dea796b197aba2c3cae25bfef45f4b3ad46fe
patch link:    https://lore.kernel.org/r/20250924-mq-cake-sub-qdisc-v1-4-43a060d1112a%40redhat.com
patch subject: [PATCH RFC net-next 4/4] net/sched: sch_cake: share shaper state across sub-instances of cake_mq
config: powerpc-randconfig-003-20250925 (https://download.01.org/0day-ci/archive/20250926/202509260111.MNw6sbtR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260111.MNw6sbtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509260111.MNw6sbtR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [net/sched/sch_cake.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
