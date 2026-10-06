Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2880376BF1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791313050; cv=none; b=RIQfTT2CZKsA6WNAa8y4/zdEKIYY4mpvVBO0OFey0QEgOdilQkDqmK2qB7VjnupDGfLEFB18DWyh130xqI5Tasz5bGpsEiNvkPRIccs3aeGSRg4snpiyJFsE/Z+0qYIa674xE1dgHBlms7M5TdUOIEQvHE3CpO9rqMzK4Qc7/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791313050; c=relaxed/simple;
	bh=NdVVl9VXCLzX3yOqpOXrEwf6/U+FgO7LrGwpZbmOK4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ly4+VyNAjg9m/Hz3wEyQB9w0VU2UzA/LZ3ex0ibWdrFYC6NwYNU4hirSBu4RtQVQA32gRi5GRgbfLhN5zM9d4Ytxou8mQ7w9zhO+uiyQ8tE3X/OubVlf/p4HF/w6OWsarApC+L8BmyU9DKb8mTHsdkCoNqkWvq/D69mSLa1Sek0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIcaTCmY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIcaTCmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791313049; x=1822849049;
  h=date:from:to:cc:subject:message-id;
  bh=NdVVl9VXCLzX3yOqpOXrEwf6/U+FgO7LrGwpZbmOK4g=;
  b=YIcaTCmY87ce+JHJVkCwAXt2i+n4ttKFagNLQyeglgN9Hbs1+Xg+LdR2
   KHW0Dh7jGsr6jSit7mGHwnymPMS/dTXtLVjwPOX5GZNY9+O9x7mW4eQx0
   MtEzLz2KE7fX4H1uaUzFTHpmNuX5Iks+XN70Y5f6/cYki3Mdlt9yyGe/Q
   +ur6x37jhR6xWFcPo3PcEhb6pXVQUw5TczDB01HPz42TC+hTgek//EI1n
   pvRyHiT2g+UNIkWEArNcN9Hal3lojegpJHU/eOBTApbsVcLyeHTKz6ZsT
   wMjrSarMaRkJx6Fcyh2kh1jlkWXuiwD+V43bBAQlTOrXnQaK+Hl/pjwkj
   g==;
X-CSE-ConnectionGUID: z2N9m3VVQyGoEgVKnX+CDw==
X-CSE-MsgGUID: +K4HsYF+RkCsXk/KuqqXbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="71140"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="71140"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:57:28 -0700
X-CSE-ConnectionGUID: 6V6rCkzDR/SA29Sbfqd29Q==
X-CSE-MsgGUID: EtkjYevJQ62/nDabFsvrsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="273587124"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Oct 2026 11:57:27 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEALs-000000001f9-3dLS;
	Tue, 06 Oct 2026 18:57:24 +0000
Date: Tue, 06 Oct 2026 20:56:42 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.mount.gp_on_demand.proposal 22/29]
 fs/nullfs.c:57:24: error: implicit declaration of function 'iov_iter_count'
Message-ID: <202610062038.FvRofPIG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.mount.gp_on_demand.proposal
head:   e59665003f3099d261a6dea7420c5b2a7d0ce4c1
commit: 1a5353e584154c66d8d8c520f0ae4cea9fd18195 [22/29] fixup! nullfs: add an empty immutable regular file
config: i386-randconfig-2200-20261006 (https://download.01.org/0day-ci/archive/20261006/202610062038.FvRofPIG-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610062038.FvRofPIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610062038.FvRofPIG-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nullfs.c: In function 'nullfs_file_write_iter':
>> fs/nullfs.c:57:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
      57 |         size_t count = iov_iter_count(from);
         |                        ^~~~~~~~~~~~~~
>> fs/nullfs.c:59:9: error: implicit declaration of function 'iov_iter_advance'; did you mean 'bvec_iter_advance'? [-Werror=implicit-function-declaration]
      59 |         iov_iter_advance(from, count);
         |         ^~~~~~~~~~~~~~~~
         |         bvec_iter_advance
   cc1: some warnings being treated as errors


vim +/iov_iter_count +57 fs/nullfs.c

    54	
    55	static ssize_t nullfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
    56	{
  > 57		size_t count = iov_iter_count(from);
    58	
  > 59		iov_iter_advance(from, count);
    60		return count;
    61	}
    62	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
