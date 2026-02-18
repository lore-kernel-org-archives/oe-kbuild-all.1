Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683232B984
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 21:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771450034; cv=none; b=WqmLySSTKWE4KOE7seMZI1+FKEhWS2DN7vE238MkB02CyaKqJlMX9VZkIA91/9MTXk3UmI92SsTzf3Sq9WuHsfGU3Qcf0FazmapCa6GVUX1S1TunmQuvbfnFed4F6QkX3dPq4qze81/Ri2t4zgxD7vD27KwljKzmQ0i8YXdEDTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771450034; c=relaxed/simple;
	bh=GK94aTcxXGIIdIfKNAAsSzWRLy3n7gl0sz2++NU4OCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r1gQfabuh1eeozqbwrA/5nniYZVtzwOG27odHOKhsV+dLA0rMers24dRgwOfCSijdU58FPAAJpxyaYwzvrCJTIXKCCmpDVeUqMSOPa+J68biNBZawvApqLhYFaW672RDOrG6v6vzvN6nuB9qqgmtgMbJx1we27pR6FFNj6pTnwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zrs5sBlx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zrs5sBlx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771450032; x=1802986032;
  h=date:from:to:cc:subject:message-id;
  bh=GK94aTcxXGIIdIfKNAAsSzWRLy3n7gl0sz2++NU4OCs=;
  b=Zrs5sBlxbCwyqC6PXN+THHxpZoe74q1pedaa7r1hT90aiCyKpmUIiobH
   WHDYJsBiR3HZ3XsEe359JflQdvvcaXRlGzmX7xK58gLKmc6WH+5v0FVDg
   fvXFL+2/9w1yZyTdMvVG334+mu2n7RekfmII6kve0MOQFRNvzDbhwbGNF
   x1kyrhVzVovTZ7H4EM8Vek9tTivxtpYdLkZBRmbMJsgVf1nIWLv8T1Hga
   V6XLlMxe+jpT/I0JQMAWrhe87omsxrud0lWuGxAWVbd3LHGJoM9zjusF9
   +qqsYWUfrcg3+2GLm9LEw0BW5GuJm83jXY2bVF/MX5Cf92n4BfkTtuZDP
   w==;
X-CSE-ConnectionGUID: XA0Yv61nSBmVen2U1rjQwA==
X-CSE-MsgGUID: hNvrHECOQ/2MuVJ6pFxWxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72436948"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72436948"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 13:27:11 -0800
X-CSE-ConnectionGUID: Bg5IuGJNSoGymqnYr4USeg==
X-CSE-MsgGUID: PGFOi3SQRPmlnkhj3kj0dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212972370"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2026 13:27:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsp4d-000000012kU-3i9b;
	Wed, 18 Feb 2026 21:27:07 +0000
Date: Thu, 19 Feb 2026 05:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova/mm 1/31] find: 'lib': No such file or directory
Message-ID: <202602190533.Uxle0CA2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   26f0eeaf8779ffc8b97f03f9aa9d84df9db3bcb4
commit: b733233d9f9a528a8ae44099ac0b86baa4a272af [1/31] gpu: Move DRM buddy allocator one level up (part one)
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260219/202602190533.Uxle0CA2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190533.Uxle0CA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190533.Uxle0CA2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> find: 'lib': No such file or directory
--
>> find: 'lib': No such file or directory
--
>> find: 'lib': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
