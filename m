Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4B51C9849
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725365407; cv=none; b=dphFqExNVBC23fbwqJZ2eRFCBWQhdNL4RStV492r4hIqdfJHVoRcbMUjn5wfCckP8z7IdOFDqOaaDnf5dk0hnhzdPX7R8gND/cgEO30H/4l4Qf5dHuRyzPjgb4d9zhr1p0ZQ7XMdBeqm4NKURBYSgdanUtcDG0mZQ5eDQrVldKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725365407; c=relaxed/simple;
	bh=hlRlczCx4KAKGqc523VqJzYKf+XDB9KULoiILvI0T4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Br9MgTvY/BsqcGPrN3qpLVKFyffoYgVO/i+HnoeAjKEK9Qg8yPTFBHIUoPcmN0wnlGHcWtsqXaGtQ3PktRpWcf0Wi+RoiVK4aA1ZDwlG2jERwrR0DhNKw025T6Kdcg+SFboKpBFGRkydk8jgmxMc3agQfTov111aioYhtnKYJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAW7MOpM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAW7MOpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725365405; x=1756901405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hlRlczCx4KAKGqc523VqJzYKf+XDB9KULoiILvI0T4E=;
  b=iAW7MOpMNSisnKWuxoX5Y0rpUIJdE64IFaD1A1Ouq+gtb/Wd9/3uknwO
   GH+eteqAIfRi9e81puzbMtu77bG22AhBW5s4aZjNGxeSceawd7xdkRd4H
   uOXAuWWz2z0B3Skop6ub96W55uyh/f6xjrdH52bTcPFkhIZCSddnQ7yMG
   7vm1rl/CGoHF55vlbYnjnrEAuehkgeIyYy2JvCgCFooxbmJCFrZgl+YXw
   ofM/LxMwypMQp+W1k3qLLi69ssLO4tW5f+AMIkvia5xpuW0Zm4Xmevc/p
   LBcUhCiF9K7WQl3aNdUeq0cWSL8IB7ZeoZxcat43GAMjYxBvlOlpbdX0+
   g==;
X-CSE-ConnectionGUID: GSsfaHPfQeyp3UtCpZQJfQ==
X-CSE-MsgGUID: CxhbORinSZGxaYYJLEx/ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="49363266"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="49363266"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 05:10:05 -0700
X-CSE-ConnectionGUID: zdJV217qQneCadSowuTysA==
X-CSE-MsgGUID: ljryug6tQ7uEqnIFJI9v9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="64912202"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2024 05:10:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slSMD-0006c9-1N;
	Tue, 03 Sep 2024 12:10:01 +0000
Date: Tue, 3 Sep 2024 20:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Fabien Parent <fabien.parent@linaro.org>,
	Philipp Stanner <pstanner@redhat.com>
Subject: [rust:pr/1040 9/23] error[E0425]: cannot find function `iounmap` in
 crate `bindings`
Message-ID: <202409032055.fbngUk9k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1040
head:   0abbabb92bb1a91f0e007fac2ab22c4817aea760
commit: 179b3369bc25bb84ee74213e2b4fc5e3c1815375 [9/23] rust: add `io::Io` base type
config: um-randconfig-r052-20240903 (https://download.01.org/0day-ci/archive/20240903/202409032055.fbngUk9k-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032055.fbngUk9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032055.fbngUk9k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `iounmap` in crate `bindings`
   --> rust/doctests_kernel_generated.rs:2535:28
   |
   2535 |         unsafe { bindings::iounmap(self.0.base_addr() as _); };
   |                            ^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
