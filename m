Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91ADDAD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 04:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741408435; cv=none; b=DO0Wvnzb2k0OgGb59mJnGKYSGQjkSG9YpEuGiK5Q2G2mO7Fy2ZYL4NvFo+RtlL1ANjWhdvu+X5zkHhIPM4ikW44dXUHJjaW2sNg3MGW+XpIXbTZ5WfOUXSvV489MgiSsVxNtS+KDJLhnbeOoivK01nUuNV5VaPU3HK5G4PGYk1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741408435; c=relaxed/simple;
	bh=8NEKS59jHq5Pc9q/l5AWPI9KDDqfGQmCjLs+K+JUaGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=an0Q3UE+p1jUjdlNV3rwQNtG7n369w9d44DyPW8a9SbehHFCMReH8t2XCCb/JmScGki/tP3juL9rEW6Br4j8hScQSIt8X6PRrC0PJXRJp0Quz6vy1PUqd9DV4xz6kfw8ncKwXEAJEsRIFE+v8LHUmEO8fLIlYJI8Efbfzc6ygY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYAqXV9O; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYAqXV9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741408434; x=1772944434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NEKS59jHq5Pc9q/l5AWPI9KDDqfGQmCjLs+K+JUaGw=;
  b=bYAqXV9OGQHBDF/O5csF2khJrg4QRnPR+H9wEN+C4cbi7YHcCAQG2Ne6
   d2f+91NLJK260ByqSMZCH4xXozzxt8SI83V5UmS0SEwB+slyK75a0n1UU
   WPIo/BFEs6uPfokr1pBhOT1HTEBu7M6XJDTyptUqke57+e3Q7sPfldtHU
   yS56YzqZsHIhq6XnU+PFJLxocVCoS05TQHPDQYTLlvrPFhFXqtZlWXYPZ
   5cXpWazss3DKiJAbhr0/9AzPnrNBm++c4Dug/yS5dIJFJ/7R9oxxA9r+W
   2gguY63vgHt1+9ShOxg4F38UfLcZ1pdgPVuuLksdKvy58HR7dZzJ88gCq
   Q==;
X-CSE-ConnectionGUID: BNBRNuSkQRKxriWnbb18Ig==
X-CSE-MsgGUID: FlePS2bARGWA1FlAkQOgUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="64907144"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="64907144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 20:33:52 -0800
X-CSE-ConnectionGUID: gSgRCoPzSU6SOOa/ZKbjsg==
X-CSE-MsgGUID: +RFvCIunQCGO8XKD7xwYSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="119490198"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2025 20:33:51 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqlsf-0001Uc-2Q;
	Sat, 08 Mar 2025 04:33:46 +0000
Date: Sat, 8 Mar 2025 12:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-core-experiments 244/411] warning: passing a unit value
 to a function
Message-ID: <202503081220.o54gMc7F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 78fe574211e04aacff04624c1b4c47b6b9e2ad36 [244/411] rust/pci: add sriov related PCI APIs.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250308/202503081220.o54gMc7F-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081220.o54gMc7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081220.o54gMc7F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: passing a unit value to a function
   --> rust/kernel/pci.rs:425:2
   |
   425 |     Ok(unsafe { bindings::pci_disable_sriov(self.as_raw()) })
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unit_arg
   = note: `-W clippy::unit-arg` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unit_arg)]`
   help: move the expression in front of the call and replace it with the unit literal `()`
   |
   425 ~     unsafe { bindings::pci_disable_sriov(self.as_raw()) };
   426 +  Ok(())
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
