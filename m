Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5601E32D6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 01:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791335250; cv=none; b=OubuXeASYseh89RGKS/cyxTXr2NkGyCyZBMHWVqrTbeMP3pQu7Ra+OfgMx/kJaF0Ol6CXkNuLIQ8zEGtwgrSJrib4e3sfcv0OiHyBDc4thQHbDjSkxBdrx2T3swdApTUh7C1BnmflB/EMh+ZRNJpWuW/81aWnNUeujrPI8KflLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791335250; c=relaxed/simple;
	bh=5uzuN1QMndZLqN6fJQx1FbpweM6QWAlhVFI6T13C3HQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nfMlG5Nchw+roWGvXOk3HpqNHHdhv7TG3aMW1YpGuUIwC4OTGG4MAowlQCFPcYtHtNNl0HM3G4f/NBt1GwB+xlo4pVC7/qsF1nqk+PHcGmpTGn8Khxsa5be0JpUS5RR5NWx9wwAfLXQLoo0ifsGPRUp7cjz1zTvuYahAwG4Oqo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6ZvFEyN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6ZvFEyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791335249; x=1822871249;
  h=date:from:to:cc:subject:message-id;
  bh=5uzuN1QMndZLqN6fJQx1FbpweM6QWAlhVFI6T13C3HQ=;
  b=Z6ZvFEyNTuC+7nvQaeK2+J8QOc+akkTKdSS9txe7ScUm3QJjW4sNJJGL
   zEshmx4Q6Q9nzsGgYNtZkJ8nrCDEuiS5Z7JhPEjDA+HWF3NLyQvga1deV
   kyU3vVH5AuAugkpFEqSW0+WIrTM9YqtA0frJCe5lk3QGslkt8XQG5FB9u
   xyp0HT9KqdApmB8+vh/VmgwFZ92PNZjXrTluidER83xINyTdHmmn0xtIi
   6GvHMblnSlqvN4QIkvIZ2+Nm0AoB3fesYLeNGzEPBgePMLLtNK1j02GlE
   6qHbiEODtZzrTu4xNL+6iaBaLfMbRpo7PDVM3TvHQdO09YF1jhRC3sTaz
   g==;
X-CSE-ConnectionGUID: 8hSE2mRlQjij4LDpq5QWTQ==
X-CSE-MsgGUID: OZMLh9QiRkqlEVvg2dGpPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="95854756"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="95854756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 18:07:28 -0700
X-CSE-ConnectionGUID: 3kQLOmphR0y++NBXN5Na4A==
X-CSE-MsgGUID: 6zyADaHKS7WoUzwc8frb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="306771188"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Oct 2026 18:07:28 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEG7x-000000002MS-0a6b;
	Wed, 07 Oct 2026 01:07:25 +0000
Date: Wed, 07 Oct 2026 09:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.mount.gp_on_demand.proposal 22/29]
 fs/nullfs.c:57:24: error: implicit declaration of function 'iov_iter_count'
Message-ID: <202610070955.0JSZ6M3P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.mount.gp_on_demand.proposal
head:   e59665003f3099d261a6dea7420c5b2a7d0ce4c1
commit: 1a5353e584154c66d8d8c520f0ae4cea9fd18195 [22/29] fixup! nullfs: add an empty immutable regular file
config: nios2-randconfig-1001-20261007 (https://download.01.org/0day-ci/archive/20261007/202610070955.0JSZ6M3P-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070955.0JSZ6M3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070955.0JSZ6M3P-lkp@intel.com/

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
