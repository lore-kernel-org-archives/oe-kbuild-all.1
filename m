Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4202D39022B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257526; cv=none; b=FWb6INUwUIhg6BJpdZVzJCqgNzcym7ZojotWsCl2YjFfsOau14LIVkXmnm5Ywya2RxfsXtBP1z0/fy+/aV2xE6iKU49K03Ib39VHhXnmkZ9qU/MjboKSkC7zdDylARa0yXmffbBD2uj2tLibGUnw2qkb1bV9Xmo0oS0u8oHDbd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257526; c=relaxed/simple;
	bh=AlTAOA15zjPnPHUwaJB1gXeG68mi7eNd9qFecOoAkCc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CkfUdrBHWiiiAGw2DCu3N0OvbpqIYSwnqrsl5Ros9jIFBNHIi7pEdEQv5snAsAYaCxCE88LWf/GxJeRfgjMDjte4rQ1nVQoycUFFRuqG//+V5UuvQUIT8VvoalqRtHlJqgZYLA1Z2Xbo3Xr225ZOzhKnj7/PWgtO0a20EtugdDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YurdGNSV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YurdGNSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785257523; x=1816793523;
  h=date:from:to:cc:subject:message-id;
  bh=AlTAOA15zjPnPHUwaJB1gXeG68mi7eNd9qFecOoAkCc=;
  b=YurdGNSV7EbvCylqhr8Og1yx535sVTzDBhp1pPPU5MFWOIUSB69aZtp/
   3MK9+OYPplEoO1+7JTrPG4zZLNN6rv7EBoPGhNiY01qN6HjtwnlG5VlaL
   ZGrzP53Sa2iW5aZx01SbtTlZS3cv4fqgZJ9cfZN8No3xELK8cZxLv0LyM
   EMCIrzGFRnyo91I4rDGJL7OdekE4e+GSDk8+ix7ikgfip8Bpuug1RAl0E
   SuPDXqAeH9PxYlIS5mL69BehKvT6weT2eD6fNcD7vaMcJFoP1DveEgvzj
   L7julwyJHRJv2sqWsFwjSeLID9R4bHZYdlcusWIlEMxoSba2dNPqSkFro
   Q==;
X-CSE-ConnectionGUID: EwD9wBWzQU6IyVWM9ECmkQ==
X-CSE-MsgGUID: Zf/+qJ8XQJmoVN3pTYsMdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103390291"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="103390291"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 09:51:52 -0700
X-CSE-ConnectionGUID: Jotp+YOxSaKSeEO+YlFeWQ==
X-CSE-MsgGUID: 6eCAlDdGTxGlTr4TF2AX9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="257085730"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jul 2026 09:51:51 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wol1w-000000001yo-2sRs;
	Tue, 28 Jul 2026 16:51:48 +0000
Date: Tue, 28 Jul 2026 18:51:36 +0200
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 52/62] ERROR: modpost: "crc64_nvme"
 [fs/xfs/xfs.ko] undefined!
Message-ID: <202607281848.3HP49ShT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   18cbb272aa91aeb23eb1284cb2ea278e932a5272
commit: 1319f7ba751b3fc086d1e1e9b81aca6ceb2b4bfc [52/62] xfs: core RT data checksum support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260728/202607281848.3HP49ShT-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281848.3HP49ShT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281848.3HP49ShT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "crc64_nvme" [fs/xfs/xfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
