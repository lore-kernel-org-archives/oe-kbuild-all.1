Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EBF3988E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 21:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448181; cv=none; b=HfCX4VwuFNzrO3KgqMxFTOFhcIuw09U+uj0noLLy1yVpB6PnPmYUlaJxy3STVXi8rUPo1PUL1VW4VIBcpVR5l1ZL8mZ5v0nUbsMfYJdhOQ8W1irZDozc5bvEHLGXjdz7QsXLJlQpKOxP9gVeXw3VGHyG2M/uOd7Dz87k8P2E8KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448181; c=relaxed/simple;
	bh=2zTPAOKW8fs3aKT7Hn1QcyrThzovsqQoU9T24fjUmS8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VPIWbkt4tg1+eJwDDuRaXRvsAJGhHaxOgDuWBJZJpLE+QPegMA2iIhkhOxrWIM8ammTQ3wzLRMuLhFFjRC1UbJr6Tt4VChhkH+CyXLIPoOPAS1iEzFMhyxmpdyf2mf2rmAr6Wl+Sng8KlbMJzlEOj1Qk2b4zPMGn+L2L5zVpXdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ad1ZoU+S; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ad1ZoU+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785448178; x=1816984178;
  h=date:from:to:cc:subject:message-id;
  bh=2zTPAOKW8fs3aKT7Hn1QcyrThzovsqQoU9T24fjUmS8=;
  b=Ad1ZoU+SXsPTYj14DExSdEkd7Ocr+jBqc8fuGnxW9vNv4Vl1aPYysFsT
   oTkf6QhI5Af3rlhb+oGMfrHl+Ybw4LuDCm5OjX/S24e0sZHmRKNlv6vhw
   vpYeFF7XQlRRv7ymhcCsxxse6Y+d0PmisfiOT6qmf4C7TLvSdXGvL5Q5/
   cR/4A/CyvnPD7CO1HIEnpm8mxXWnJXR8oqC1qhY9fMb9stUmPFj5ZkOfM
   C639koYFHhe3rseaT9lWzek+9yXi2QuORlqcBGhAueL+JBTHS4IKYcUwb
   uf/SbBjafo8VDMwfYAno1qbyA1S+y1OGfW5EvB1sIofl8asDBdmTUpq96
   g==;
X-CSE-ConnectionGUID: LVpWySFST/m+7jW7wxdg7A==
X-CSE-MsgGUID: 7aUvRanuQ6WxzEG65zb9fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="108868614"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="108868614"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 14:49:38 -0700
X-CSE-ConnectionGUID: hBhyhsCzS3+cW5Wj3IHHmw==
X-CSE-MsgGUID: l5pRHzVMSeGYG9qHXjSRDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="283747840"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2026 14:49:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpYd2-00000000hcL-41OQ;
	Thu, 30 Jul 2026 21:49:28 +0000
Date: Fri, 31 Jul 2026 05:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lachlan Hodges <lachlan.hodges@morsemicro.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Pope <andrew.pope@morsemicro.com>,
 Arien Judge <arien.judge@morsemicro.com>,
 Ayman Grais <ayman.grais@morsemicro.com>,
 Bassem Dawood <bassem@morsemicro.com>,
 Chetan Mistry <chetan.mistry@morsemicro.com>,
 Dan Callaghan <dan.callaghan@morsemicro.com>,
 James Herbert <james.herbert@morsemicro.com>,
 Sahand Maleki <sahand.maleki@morsemicro.com>,
 Simon Wadsworth <simon@morsemicro.com>
Subject: [linux-next:master 3244/10444] {standard input}:191: Error:
 Insn b has an instruction mpyuw with limm in its delay slot.
Message-ID: <202607310532.ggqUOCi6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   78bc8af4affb9a732504eb22eeac7d1e50883853
commit: b1906cea00b021acea22460225401d5b27bc7c36 [3244/10444] wifi: mm81x: add mm81x Wi-Fi HaLow driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607310532.ggqUOCi6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310532.ggqUOCi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310532.ggqUOCi6-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:191: Error: Insn b has an instruction mpyuw with limm in its delay slot.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
