Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1619318B09
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710597172; cv=none; b=VtkZrrl1qXuT6RFHXuMbArmAS0/atIJxEuVZ5n1ypcOEONfYYJa7MFDF27RJiQ7hhJ+iAfhHju4C14PVbzD5tg6SH7I+gxM6Zqndzsn3xuKkAmAeXjQ6Meezu0BANeN7rLEboUrcq5tsujtVwDKiz9HbOjshtAg0C2YAI/KReyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710597172; c=relaxed/simple;
	bh=QlMcrOg7R3ErwXXR8iMdvVx2TO1jzewNYv1IeuKqoTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ubH4Hpxk4VZU6jfe1EFP6e60CStas3X3gO6CZOTNbd5gvh9tvYQq+7fR9H4kvc1m/muXItmPnJ1ZN9ePo4wqSWU+7R33OQjpktsENZchb9Cr2NqPbhVuw081fKVH2pCzwYYecTDUQVVvv2te77exQDqf/1HsO1kPv46cZBWdsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0I4+fyw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0I4+fyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710597170; x=1742133170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QlMcrOg7R3ErwXXR8iMdvVx2TO1jzewNYv1IeuKqoTQ=;
  b=X0I4+fywRNn1vhiKhFuV2Xocqyy94GMbn4Gxn/ibJKXNJjGJOiwaouEp
   Fk8W378kpdSO+xh6EElenBuVSxh1JeptHfAntEN0dsqNJ6ZAGGLn9vCyW
   p7PDaFSMBuz8LpH4qHgSJn+cHh9pOIUvKLglcgzN1wMCqSxRRovgUaqjV
   EJaqXeCl1OOx4DYvyOX//tOc+bKtcywNFUJKgDuPm5V4B8cSXisDREbKZ
   sA8l22OUstyOMCTYsMa/efSGGRe1Mq98iKvnoGwFxaGhWh+yoS5xUPk+s
   IZYQdvtrVWQRJeOCKnhb34JUOoIVNMu6CMQ/SSS5oPxmIwb7EceR/9sbU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="9292927"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="9292927"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 06:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="12882033"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Mar 2024 06:52:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlUSs-000FSj-0G;
	Sat, 16 Mar 2024 13:52:46 +0000
Date: Sat, 16 Mar 2024 21:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 23/43] error[E0425]: cannot find function
 `pci_alloc_irq_vectors_affinity` in crate `bindings`
Message-ID: <202403162126.XLSQamh9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   55e41b4e7955d261d26d167a0e9a847553a8ef55
commit: 1fe369c9aa669f8079cb16703cad8e1dbce90fd4 [23/43] Revert "rust: upgrade to Rust 1.77.0"
config: x86_64-randconfig-071-20240316 (https://download.01.org/0day-ci/archive/20240316/202403162126.XLSQamh9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403162126.XLSQamh9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403162126.XLSQamh9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `pci_alloc_irq_vectors_affinity` in crate `bindings`
   --> rust/kernel/pci.rs:286:23
   |
   286 |             bindings::pci_alloc_irq_vectors_affinity(
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `pci_alloc_irq_vectors_affinity` in crate `bindings`
   --> rust/kernel/pci.rs:316:23
   |
   316 |             bindings::pci_alloc_irq_vectors_affinity(
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `pci_free_irq_vectors` in crate `bindings`
   --> rust/kernel/pci.rs:332:28
   |
   332 |         unsafe { bindings::pci_free_irq_vectors(self.ptr) };
   |                            ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `pci_irq_vector` in crate `bindings`
   --> rust/kernel/pci.rs:341:38
   |
   341 |         let ret = unsafe { bindings::pci_irq_vector(self.ptr, index) };
   |                                      ^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
