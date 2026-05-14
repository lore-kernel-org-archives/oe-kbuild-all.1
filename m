Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40C53A7198
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 19:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786848; cv=none; b=D5cbOaAKqkj7v9wXbZQMLF5obzA+LkioUjAErQo+PUyviCR01k2Z0as3Kp7xbPRKBEpM/llFNhPVaOHr4zOL51QwUzaz6uLSzozF0dVeS6e6EoErDPTjB5wJA22bFrw7YL6gLyj0HSHvfCjS9E1//JHia9lsrRXPsZWPCN4TlZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786848; c=relaxed/simple;
	bh=zavMxde8v/5AyoZZufyrjSq7qfE56a0wzDeYUjD1YSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GykI+7q3rjBmExiJTjUGlK0th7DgYKZba8ZlqPvZa9XRb6zBpo6oTaFeY6ipAlarmTQ14KiOcG1UT3Q4mOXfXpuhxIeVBlf5iAU8F3WXZgSW4YQ19zWLd/rup7clnOGRUsuRc+5DTsFpcGE6fy7JjEAcNUtP/uU1gpyo3maLqwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBCbQf7O; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBCbQf7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778786847; x=1810322847;
  h=date:from:to:cc:subject:message-id;
  bh=zavMxde8v/5AyoZZufyrjSq7qfE56a0wzDeYUjD1YSo=;
  b=EBCbQf7OmCA0KBS61X2YmQpZUtPOv/LXcUpcCVThgeF9CAw2cBHEhBfZ
   rt5BHsa/1ayMiOL75Ufb8IVP185T4gYDbwS3R9GLm/57HMHmvV0M4OW4Y
   tEMOA63BYRruRl0UacFyKfQCFCiXPjBpk2lCzy1qlX13SuRaey/UZ472M
   5sskmelTOWc042szSqQ1fNbNW5uWbtqATrorTxIDs9QcHx45q6tZaaJP6
   nC45rFUQmOqVLlHuDs/iFzW9arCZy1DtfQbGtBdo+ZxIKLOlMEy08RHHl
   AfKiF8TeCz5PtAx8R6J7jlytwP7iZaG9DCnOcBDRhN5KqZ682Yz8JiGI9
   Q==;
X-CSE-ConnectionGUID: ytMNTdI8R4qICqoxdBn4EA==
X-CSE-MsgGUID: hQaaib7rShqOtUyddOxOSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91124357"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="91124357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:27:24 -0700
X-CSE-ConnectionGUID: HE938PvRRNKKezyGC5zvGQ==
X-CSE-MsgGUID: o9d3LFjVQfWoGwGfgAweqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238352917"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2026 12:27:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNbiK-00000000701-2dkL;
	Thu, 14 May 2026 19:27:20 +0000
Date: Fri, 15 May 2026 03:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 1/870]
 .github/pull_request_template.md: warning: ignored by one of the .gitignore
 files
Message-ID: <202605150359.TblWPtSq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   fb979987d554f0c8fd045b114a27a6359c9265cf
commit: aaffa6079b8ed74da5e1d6b0642a7795dc3c1692 [1/870] xilinx: Add a github template telling people to not use pull requests there
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260515/202605150359.TblWPtSq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150359.TblWPtSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150359.TblWPtSq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/pull_request_template.md: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
