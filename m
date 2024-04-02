Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120E158AAC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 23:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712101666; cv=none; b=fQnzpHAGjJ7MXQzfEUNFhS5Y+mhBxbGdx/8OxcB2Hpnypj/jhkCOEsbw44BbWDcnf3RW1+ulQuqmf6/p4eARJW/18Ex7EMhv5O4ef9Cd5/2dqVHu58NBwYv7yofxI4wNjQejXohok6wY63KRAXnEzTiNcuydbE1zkCXYNvrVOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712101666; c=relaxed/simple;
	bh=VMfo/fzLeI1eWqzdxPAYPYV6rHmS1gKdPx3YkVNPDNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Je0NFs8gMR9BfmBk4g3a79AZk/9/d2H4Cc6hDLxDVk+3QfDbu9rcCX3JK8BbHrsPSs7DsAmfFW8EXcolBjgKhX8/bXNMzuMahYTOu9xy4965g7+H9BfWzzDpvT7yVlKFZZ1MJvVe8ISovzl6Kupa9Fe4lLBTad4qglhtclDdjm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LE8V1JUh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LE8V1JUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712101664; x=1743637664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMfo/fzLeI1eWqzdxPAYPYV6rHmS1gKdPx3YkVNPDNc=;
  b=LE8V1JUhl9dIlaisLKfn0yJZ+RpfWpZ/bQE/0C13Ir0wXHbNmVPHaQrI
   YbmUwBOf0MDKlWsd/drFepwKQKa2KI043Q2FAdPP1k0nCc1UnJ1EIFwFT
   S+frHwkiLBawnBJbLBAU9yrzJJN2vI59WwyXJFq8jhN2D9UfHF29n1XEj
   YpS0xOM6yo61CRDFJ76SgiB9SSBBfL1j6qamuJd73YXyTOpnn6nnLYyqe
   EpsdeK+nzb9WXnOgSQ7yTV3BHxRgdRMdhlL8gXPUF0BYpMGc2dIfkkui/
   n74JSo7iWyoK0I3HePexyJrOpZmcdgsICDM7M8ZykqOTf+T5HPSTGVIUw
   Q==;
X-CSE-ConnectionGUID: tVbc1liWRg2Gg6W9T/3+FQ==
X-CSE-MsgGUID: XeBtJkhCRe+nzGjFT/feSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7888101"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7888101"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 16:47:43 -0700
X-CSE-ConnectionGUID: 49pjr48SRhOccvPn7NqKug==
X-CSE-MsgGUID: Gh8VzD1qRWK+At3xrp8qog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="41383624"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Apr 2024 16:47:42 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrnqu-0001dX-0w;
	Tue, 02 Apr 2024 23:47:40 +0000
Date: Wed, 3 Apr 2024 07:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 14/23] error[E0425]: cannot find function
 `of_match_device` in crate `bindings`
Message-ID: <202404030736.XImb5kdb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   f19b63063d7ed4b6714e9c0eff7c609a536035e6
commit: cb80b6a69be141ebac4b9f0708de4f713c7ccd0f [14/23] rust: Import platform device's implementation from rust branch
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240403/202404030736.XImb5kdb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030736.XImb5kdb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030736.XImb5kdb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `of_match_device` in crate `bindings`
   --> rust/kernel/platform.rs:69:37
   |
   69 |         let id = unsafe { bindings::of_match_device(table.as_ref(), dev.raw_device()) };
   |                                     ^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
