Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F3EA59
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 00:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786925250; cv=none; b=JV+7v1UZix1C82UuKbr4VMKMuvRHObHKTevTAJDyb4Jnn8Sh6OIMZ5U2yGVwJbkLzmMj9NdxLCp+GyCTIp73BHi/0fFn5hvadrk65mf3EvgGlM9Ijj1Rnl2TRE2dVqtI3oDjAPRCWXnQMzpr8KNtcG/QRbkbp3GA9Y9LsMxaexw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786925250; c=relaxed/simple;
	bh=ycFMrWk7eGgwfc3vb9zOL9IthfFO+tx+IMOx92BQ7Ag=;
	h=Date:From:Cc:Subject:Message-ID; b=NjDRufobxfvoMn7xUQV1E55IN9kGd2HxIQZiVZZCVrsolPEpL/1lgErGfDa6xxojH9sOh768ZLLp6wKII37IL3gxBl4DPXGKABnf4hMdslnxALHGtshBlcu/Gl+Tu0Hujv1m362Dcre3iKlIphIUNF2RWmPsXmUbxGMudMfSeyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEdd3E1Z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEdd3E1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786925248; x=1818461248;
  h=date:from:cc:subject:message-id;
  bh=ycFMrWk7eGgwfc3vb9zOL9IthfFO+tx+IMOx92BQ7Ag=;
  b=XEdd3E1Z58oa/xERgyZFIgfNFt50lSWF+DHSc6TPXhngz9HiTXvLe3Sm
   l5HegMLlpOikWmLdVYG/u6TWDJN7T3mk4nnAFrNBIGLQc+qRa3GSe4PY7
   Do6KLIZueAZh48CcVrqXfaQcNv5SgkNRDAXX9FUp14QxUM2r0h8ykN172
   RMRsClnLK37HBBLADvBFNou9k7gjkQZD+dkb9HCW7MVjDMAEfiwRyb1Rc
   yARL5DRtrLWXLbJ4v3UXaVhigXR7nbcYVTpt8JtaJAhcGkkNHLjVfChHO
   mGlWmB/HXAOEc+p7YtLiutZO9blc/pw8EyiCGdDXlkdhadmQfrY944SKd
   Q==;
X-CSE-ConnectionGUID: UPqmS9meQCC4QL1yIFYa3Q==
X-CSE-MsgGUID: 6NHInwXgRXGj4/9LXzTlGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91215380"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="91215380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 17:07:27 -0700
X-CSE-ConnectionGUID: 1qvCdId5Qcql/2Scz+TFKQ==
X-CSE-MsgGUID: rgHEoWyXTHerW7i80oURCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="266747506"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2026 17:07:26 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvksu-000000006iL-18bs;
	Mon, 17 Aug 2026 00:07:24 +0000
Date: Mon, 17 Aug 2026 02:07:16 +0200
From: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Xu Yilun <yilun.xu@linux.intel.com>
Subject: kismet: WARNING: unmet direct dependencies detected for TSM
 when selected by PCI_TSM
Message-ID: <202608170247.HsTtAMWO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/coco-tsm-Introduce-a-core-device-for-TEE-Security-Managers/20260813-170714
head:   fe8bfb73028f5690fcc09736b72362b7fb59aff4
commit: a6a746938b4209da48b3071dd125845e6396b970 PCI/TSM: Authenticate devices via platform TSM
date:   4 days ago
config: sh-kismet-CONFIG_TSM-CONFIG_PCI_TSM-0-0 (https://download.01.org/0day-ci/archive/20260817/202608170247.HsTtAMWO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260817/202608170247.HsTtAMWO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170247.HsTtAMWO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TSM when selected by PCI_TSM
   WARNING: unmet direct dependencies detected for TSM
     Depends on [n]: VIRT_DRIVERS [=n]
     Selected by [y]:
     - PCI_TSM [=y] && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
