Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C492E543B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 22:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762466927; cv=none; b=IofF9JSZqLD0unW49BGOLB2Ii27YwVm36LA74MtgQ82EaB6R0bsF2ZF4/rAlUsTxjmdaoQ9oiScFoCnIHd7EmWbHKAyDB9aUOSLVFqMk40x6GTngHskFYtvCmgP+eJXOJnwx4T3EOHbgS5rRfa/s6znPbdSOEDnyXGnq/iIK9w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762466927; c=relaxed/simple;
	bh=h9q7tUoiO4KH3BtEiymr4GhzARhR41W3qFR50RhtBwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VCpausGQaF9ZnLMwawgtmJEf7OjAeZOWagSks3i+nA+O81LDRgydhvX72qvRaXszEk4zM3Ykfc5RyQDIR4ZOjyUSj11UUKCtvNZhGaPn5wvTr/ZbEMUR5Chzih2DgWhdWew8p7pzkHk1JTm+avDN9vovWTiAwC1hH8dmJUCS42I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jY28I+g7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jY28I+g7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762466925; x=1794002925;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=h9q7tUoiO4KH3BtEiymr4GhzARhR41W3qFR50RhtBwk=;
  b=jY28I+g7iZcEmYVf67t+6YKF6mNxp+kjRrc90dR+Qacod+zBy7+VzqMd
   fGbbcCu1TZO5rL+EnLaQJJAYc4qr7ESnLEsTF7DRH6UAZsNECSPsNpFmx
   bHh0o143fddfFa6fGz3D4gRd4iJP3w+Cep+gJAe0GrfJ0HLEH1YWYGycX
   kaHsoK6QqpsUw6DX9R4r0jqBAoeilQi4ZP2W8ECo0ymuhBAe2THRJB+qe
   IS8Q9I+S0MrQ5u+uv5CpqDG1VYCBm2U91oNod1fQr/IvUaZ3wQAbeQmc+
   bz0sG4zFEg8HoQBa507cqH0bDE+W3jh13mhW4EqHxp9h7IEwx63GY6om8
   g==;
X-CSE-ConnectionGUID: 3RLhKoSeSeipYuxQvh0PIg==
X-CSE-MsgGUID: HyCR88uNTd+krfmbQLKI1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68478122"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="68478122"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 14:08:45 -0800
X-CSE-ConnectionGUID: /OM+rSEzSbibsAUWLmz42Q==
X-CSE-MsgGUID: fzW2ZLJdRnKpQlrcxFXE9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="192147060"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2025 14:08:44 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH89q-000UOG-0C;
	Thu, 06 Nov 2025 22:08:42 +0000
Date: Fri, 7 Nov 2025 06:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH cgroup/for-6.18-fixes] cgroup: Skip showing PID 0 in
 cgroup.procs and cgroup.threads
Message-ID: <aQ0cYUIgN0oEMNOa@4b976af397a4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2016aece61b4da7ad86c6eca2dbcfd16@kernel.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH cgroup/for-6.18-fixes] cgroup: Skip showing PID 0 in cgroup.procs and cgroup.threads
Link: https://lore.kernel.org/stable/2016aece61b4da7ad86c6eca2dbcfd16%40kernel.org

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



