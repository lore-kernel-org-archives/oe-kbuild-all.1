Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967E38FA8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711646360; cv=none; b=BMy33yO/wFyVlix8vVwl7iFFfE1HsgBHawq4xCjHzCYslbGalhNKros3NrCtuT7qwP+YZCeXiS8v2P3lstuTg7ufIAmaTj+iVcuBrt6c11SqG2YzSPXpV3acC14VjYkoQo5ZtZaBVFTsDSAAl6Zj3fPf120YdtHhMPeWBQsH4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711646360; c=relaxed/simple;
	bh=+XRwnl/fVciyr9cBePfoNdVEXtd8mqN49ZTXT4fTDuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVbfBr0eN/pkNBNgJh0h0P5c9necxqgmi5PvD+R+Hfkr/qRFyMmYw+AGX1oNM+fW2kILCYm9iuHgUL1DAZIfTZurrebhCMZA2FZ9vm6hWgcc044e/7itOEnv18XxOEvuN1eNdvlcMn2Xfu43lmHNw/BL2xtQTu1m8FK9G7Woy9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyvWGFf1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyvWGFf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711646360; x=1743182360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XRwnl/fVciyr9cBePfoNdVEXtd8mqN49ZTXT4fTDuY=;
  b=AyvWGFf1SmwvweZuj10DmwEECkfHWJP1LX6ZGdBwL1EdWUV+6EOvQS5+
   i+8n6u8r5ErS3PaVuejWWhznkIfnnU5FsHh/QwiZSTSVtk7HiX3W2/Krn
   8Ls/HhGURb49k7ogZ+uO9uJowgeTYmwi0Af2/bn/hJ1UuzlwWhG0YvJ2Q
   fca0UTWQdERIve/9fQ22o1aq5HjViKIe8qQ/GiE5t7iqToS9o7+JZETlv
   fMTXeNsUSm9zeMyHPDCuFAj8/Y8Tk1Drz/7cEcaOizwWBEcXyz0q1mSQF
   TrXcPNJOkS8OOVLIi9igVIWrKQ5z7mTuQTe623Oz6nHlrDT/qTIUTG/IC
   A==;
X-CSE-ConnectionGUID: kFJ1E5vYSsyXJUrKbLxylw==
X-CSE-MsgGUID: rwpDUUKgRlig+4L9Qw1q8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6945124"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6945124"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 10:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21178158"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Mar 2024 10:19:17 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rptPH-0002NW-0C;
	Thu, 28 Mar 2024 17:19:15 +0000
Date: Fri, 29 Mar 2024 01:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:sgx-cgroups-v9 20/21] riscv64-linux-ld:
 kernel/kprobes.o:(.data.kprobe_insn_slots+0xa0): undefined reference to
 `kprobes_alloc_insn_page'
Message-ID: <202403290100.7EFsIlgp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git sgx-cgroups-v9
head:   c9feec6d07a914300bfbb5eab86ad3222945f631
commit: 0627bb042118062c119bd3304a036acc7a021bdd [20/21] kprobes/treewide: Explicitly override alloc/free functions
config: riscv-randconfig-001-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290100.7EFsIlgp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290100.7EFsIlgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290100.7EFsIlgp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv64-linux-ld: kernel/kprobes.o:(.data.kprobe_insn_slots+0xa0): undefined reference to `kprobes_alloc_insn_page'
>> riscv64-linux-ld: kernel/kprobes.o:(.data.kprobe_insn_slots+0xa8): undefined reference to `kprobes_free_insn_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
