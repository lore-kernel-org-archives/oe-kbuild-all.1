Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A442A1B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 01:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766624555; cv=none; b=TrxqxBf06NIUvprYQNvjTTUwW+3ZsmDk392u5C/QToU5nrG0EQUI20xlWz1WZO4Kn+3PSCWgGqngMYnJhJYqF79g8Ua2XToaqe/OvwtRaj74G2CHMZYlCy2y6OIcMZ+3TUVXIscQi7n5ZRAo7hx7hIsPF1YubFmPFt7awu/l2Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766624555; c=relaxed/simple;
	bh=RQTWspxDM3bQxRIP+tysG9dW/IxdFQpMZa1N4w8xr+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FmqyHMopgoLNuNjcDBv/lDnCE9DQU/J8eLx1rJ/6kUWbIW0/8G1MGQSDke1N2/Q2bCaq3lYApvLTtm8cepXFsaAzbF+qoG18vl/pxGw+S1wzckD7tTAISdZK7jGrvNgMT170eDOgNco2sLaq0m55n0ylClOuad6yBFUJIg6hUIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zx6GJSnI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zx6GJSnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766624554; x=1798160554;
  h=date:from:to:cc:subject:message-id;
  bh=RQTWspxDM3bQxRIP+tysG9dW/IxdFQpMZa1N4w8xr+o=;
  b=Zx6GJSnIE3nz8jBRdHU5h7UQMJ9nDjsc8sNVSww3kjE5+2qZO7WW0aZ2
   SqqR3l6E1Uqwll/hoQqqxnMWT5OFbzOHY+ZhLFi7c694i3s9GKoyn6mp2
   n60mErGsnlRR0lAW0PGl6bzvI/B90+08oj1qzASoEgdPkT66Zqasv/DOy
   0lRy6U6Veb7snD3xKPln3bQ9pbIgfgGJpLqdO0cfkRo5HgPG0UcETgg4W
   EO/SluZn3Qp/JGrgNCHVxXx8sYRvvyCZquDosGdr/86WIaiW6MklS53GN
   /vKTm5RatqKQg5GJQgY6OhyNIFqlaPxHr237/trkm4UZXvF33tRIJbR9C
   w==;
X-CSE-ConnectionGUID: 5uVg7lcgSS6oNvWqAsYFUg==
X-CSE-MsgGUID: nzKswKIJRE69LeOZZQRWsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68521228"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68521228"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 17:02:34 -0800
X-CSE-ConnectionGUID: YlTt4fLsTpGHt2lswpQF+A==
X-CSE-MsgGUID: 6Lihi1RvR6epF11EW4pubQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="230782666"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2025 17:02:32 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYZkF-000000003at-19Oa;
	Thu, 25 Dec 2025 01:02:25 +0000
Date: Thu, 25 Dec 2025 09:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>
Subject: [bpf-next:master 8/9] FAILED: load BTF from
 .tmp_vmlinux1.BTF.1: No such file or directory
Message-ID: <202512250932.X7mdviuH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   f14cdb1367b947d373215e36cfe9c69768dbafc9
commit: 522397d05e7d4a7c30b91841492360336b24f833 [8/9] resolve_btfids: Change in-place update with raw binary output
config: nios2-randconfig-001-20251224 (https://download.01.org/0day-ci/archive/20251225/202512250932.X7mdviuH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250932.X7mdviuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250932.X7mdviuH-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   Error while encoding BTF.
>> FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
