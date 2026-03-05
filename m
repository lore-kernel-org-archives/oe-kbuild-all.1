Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BE03CF667
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 20:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772741345; cv=none; b=lRJAcx5yj/Q9M1dyN0GbTZWVfDGHp7ASpulp1zbBLE+f3OVnBJYIbAtb7yC+H53X7+D8+l/a2hawDGUO27Q8ru5tpfi/M4xsVCrtOncm92Cm7Y9PMlVLCZyM9pKzvbjHmzgSDeYBENT+F7ICWwF/4PgBMYwzj6SbvsisNYrouhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772741345; c=relaxed/simple;
	bh=XWId1iWSKS5ZpJXleva0howi1nXDLrGLwYPXvAQxBvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uamw4287YMAHzk+5ClE6nDndTjZOt5yI5IKrDfjk/pmceg5Dysgol+Hi+LxHewxoLil37DvNZk5pzSpU/07JWZtm+PvKtotLsLb1lat31MGrAPqXvHbhSbxqtF7Yp+B8hrk4jxmgzxCj7V9LhfUhwFmhMgz8odfdSFB2oQLrP9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0+5OfFz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0+5OfFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772741344; x=1804277344;
  h=date:from:to:cc:subject:message-id;
  bh=XWId1iWSKS5ZpJXleva0howi1nXDLrGLwYPXvAQxBvc=;
  b=Z0+5OfFzAYXe3ueYMHlUmGi27yGYeT2kwC7a1Xc2eVhKhhGc1lzFL5EZ
   g3l8DEm24mxBhf7ZOziAJtVTevzm0Am4ErhQ3VJuUmzZzMD/ZqdnETcpj
   I5at3R660aRgNp/IiIQj1CsJzpoIaV2hPhuxAiSA4n0a4gee/P385cCbq
   R0AnOjr1X2EcqbnME5VxkpddAAPmjo4Cw2AoGVhkNKS2t/ggzcoMHegjL
   puJIYpeCzRWGIizPU7tQn6Nm4bihD+3/TGjPSFk6zGpXaN3jIZV7Uggg2
   Ex7sGxVnbnZEnMfkAldIQUc/G1jWbp0tD1Ky5gj4VOhmfWF+SScToYvkh
   A==;
X-CSE-ConnectionGUID: vXB2I+UhTPSFpVaPuzeG8A==
X-CSE-MsgGUID: I7YqKKhQRoKzH9m/VTjH7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91417911"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="91417911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 12:09:01 -0800
X-CSE-ConnectionGUID: 4o4RxbP3TZ65N9jBwHHgeQ==
X-CSE-MsgGUID: xLR/lNY2ShqPtz/+E8/3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="256689323"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 12:08:59 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyF0C-000000001B6-2mAd;
	Thu, 05 Mar 2026 20:08:56 +0000
Date: Fri, 06 Mar 2026 04:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 212/467] Warning: drivers/misc/ibmvmc.c:903
 function parameter 'iocb' not described in 'ibmvmc_read'
Message-ID: <202603060438.rQlYLfXs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: f1d151d9d3cded0802aa778f979a5ec32aec45f4 [212/467] misc: ibmvmc: convert to read/write iterators
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260306/202603060438.rQlYLfXs-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060438.rQlYLfXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060438.rQlYLfXs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/misc/ibmvmc.c:903 function parameter 'iocb' not described in 'ibmvmc_read'
>> Warning: drivers/misc/ibmvmc.c:903 function parameter 'to' not described in 'ibmvmc_read'
>> Warning: drivers/misc/ibmvmc.c:903 function parameter 'iocb' not described in 'ibmvmc_read'
>> Warning: drivers/misc/ibmvmc.c:903 function parameter 'to' not described in 'ibmvmc_read'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
