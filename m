Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0B3370D5D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783664790; cv=none; b=pqM+eOKKHxUQG/af3GbT018EaFVgTS8il63ysn+QKjDafkcF583twVA3nPzINyTyHeOn+ng90hKznnrMNv3F0VChBvs0Tr8notcJPggzAQa0KvaigxE7iG8au2jFUj2//vMKXD+cJvVnqoYAwe8R/1xTe1dJad/OqIO2l77mEm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783664790; c=relaxed/simple;
	bh=yg2t/cUaZXHqC6xw6OTUISsaoh+fSvv2wQh0C/oKvcs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BTc3FsG8i549QhIylG06B2Fz/G4/qRGsKKd5uSNetPfEUInqDZKy5S/J68n683LpAWqpVbbuHlp6HuPdmSmr2wjb+KO1m9Dt6FUI/aqmJfA6YgBzVHvKs7JjyAZrkMmmwSaI/CckHLTb7dZdDaRWf++0bwt1pd2jpsvoo88tzvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTJ1wojy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTJ1wojy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783664788; x=1815200788;
  h=date:from:to:cc:subject:message-id;
  bh=yg2t/cUaZXHqC6xw6OTUISsaoh+fSvv2wQh0C/oKvcs=;
  b=VTJ1wojyYyN+wtO3jfizYk+5tDTG9gh23I9ZpyOYN+IwaNhqOBrfqaM9
   l4c+NUAIrEb2glYedubx7N89gLtfqJvrShY03GB8vLlvO7/vqFyko9BmN
   sPowdhgt+lmXLTs4kAWWCCnb8lyhMz30uwRVNQ+Gh90Pt6nJbgdwuEBVo
   SvJNyoT6fKW2f3d5CcMERBR5v7W5GtByP+E+52VvwrcDg1d3/DLuVV83l
   1kOG0gxUfv7b0Eokc47Iw2boCg5Kc11B5jiXITGh/FfPVYCOeMYyprtTU
   V/5q6dpoOLP+Sm1e+yXzwT+ciE0sjTW7lC5MYNF7UX7Vv8hFAJ5P4gWBA
   g==;
X-CSE-ConnectionGUID: fLbK4uh7Q2ybKx8zrSMmAg==
X-CSE-MsgGUID: a2BhjMczTaC95Q76u3Oe4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94966266"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94966266"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 23:26:27 -0700
X-CSE-ConnectionGUID: eTI83gh5Rve528gFPmEduQ==
X-CSE-MsgGUID: vI2T/hZnQL6kVWAAjs9yVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278036310"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jul 2026 23:26:26 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi4gq-0000000037p-0BBz;
	Fri, 10 Jul 2026 06:26:24 +0000
Date: Fri, 10 Jul 2026 08:26:07 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/240-isp 25/56] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202607100819.OhYEmt5V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   edd1529cbf30f69240acea99fa8225683c555200
commit: 5eca30dc648f14344fe641c5664f0e4c6fe58527 [25/56] media: apple: isp: Remove ioread/iowrite and stop doing raw address translation
reproduce: (https://download.01.org/0day-ci/archive/20260710/202607100819.OhYEmt5V-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#487: FILE: drivers/media/platform/apple/isp/isp-ipc.c:252:
+		/* Only enabled in debug builds so it shouldn't matter, but
+		* the LOG surface is always the first surface requested.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
