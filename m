Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285D9157472
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724053125; cv=none; b=h4xqJvcJyuQlZqnfh+zZG9PAaInSBwLi/ydvu9ece5ogsWpTRhBp8NhYP8U0LozneK7NrxBiL/Yk+fjuISPIDtKsGiUQiSvMbuHmSIZaLTbd/vsErYL+zvRD+1/6ZWCiXFS4MzqDTcAjNVMocQuY0xK1OlLQFEgsEHKXvCKTA8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724053125; c=relaxed/simple;
	bh=GHNlXChSEZLHEgtaa029sUkYmjK/+ufE2Y4TCO3ph2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GvDdg+M2CLhYVsL4NSKHxmvJFv7WgR4DkftEg59bqHTmGfgLQWMi6GhWvLaHlNAVXoXr6dunFDXbHcq4sj3Y1IuoYAdqNEozrZy7ksg5qcCfpqVvHXWVG/NR3j13h2Q1Tt8Id9usSAdzH0AsOtjZihR4T6hIpwRt2CH39HqVKBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRXcBFif; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRXcBFif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724053123; x=1755589123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GHNlXChSEZLHEgtaa029sUkYmjK/+ufE2Y4TCO3ph2I=;
  b=nRXcBFifj7sentBvJes8JokgjO1ToMAB0VnpaOCU+YnonsOkYN07hHmW
   MH59MJqR50OIwNOpzSd38NdlgGxfPLF1s3TIQuqrR+voZ5NzL7fN3YOYs
   lcMOU4rxroXyYLao/C2zGKf/He3CxCbBDHButSm2qE3D3jrisHz9vYW9x
   kcxBgoHEExfWmjByBL3QajmUVhMHZqXYhxGhI9SSS2OUUoM7N3RcefI2J
   Jo0T08o7GH/2nVrI+gY47YIiPPkCWccKpdQ9boM/zoBsToXvvazF01kGE
   Sf7IK9S8XGflueXVC+M9zgHSvyycx7YyaV/0dIIV5UZIhDrsMBC3CZdyk
   A==;
X-CSE-ConnectionGUID: 7ZNSyRynQ1CJI01TXWGZzw==
X-CSE-MsgGUID: y17B9iQQTvSSDWDkEIVqXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="39746993"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="39746993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 00:38:32 -0700
X-CSE-ConnectionGUID: BafQaHQ8QBSPT2Rjue77HQ==
X-CSE-MsgGUID: xlPMBOrrQ/mZU3b67HBEWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="60341090"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Aug 2024 00:38:31 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfwyC-0008kE-2L;
	Mon, 19 Aug 2024 07:38:28 +0000
Date: Mon, 19 Aug 2024 15:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-6.11 3/8] fabrics.c:undefined reference to
 `nvme_tls_key_lookup'
Message-ID: <202408191523.ZNkulRyq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.11
head:   e219e08d3a1f14dd34d6a9903de744173faadd53
commit: 05b4eed6f7c3162d877a6ab325b88951575a47a6 [3/8] nvme-tcp: check for invalidated or revoked key
config: sparc64-randconfig-r112-20240818 (https://download.01.org/0day-ci/archive/20240819/202408191523.ZNkulRyq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240819/202408191523.ZNkulRyq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408191523.ZNkulRyq-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/nvme/host/fabrics.o: in function `nvmf_parse_key':
>> fabrics.c:(.text+0xb9c): undefined reference to `nvme_tls_key_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
