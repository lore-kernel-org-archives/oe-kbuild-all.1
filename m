Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBC04C6D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 05:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710567219; cv=none; b=JiqmZMvNLMSTbVbW8jR4A/O//zBhB0Gcc0DdCAwCQk9x+n/hz3bYAJ9n1SVTXPL6u2iWGXJe15aCZ/5N4pYL1/cUecD97shh8v9bvnAE1Hmx8D8NqkMxp32JwmnbcrC1bFc0Vw/lDKho8txA5sk/BYmbtViK7EbqDZatimuuiQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710567219; c=relaxed/simple;
	bh=xOb4rbxPT/SP0GIyN/AxNv0rIJYCjGOa+UifWzwsra8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7MCMeoRQwKuWPAc9ZDh0WoE1tZWH3lpdvRgeIofwonimbSZ21FUWgb1pW8slImAzhbu9hbZG4Zh+DPg4+1or/bNfMaADem7o0GiidZGQKnncSmwd+h8DomeRpy2cFYZUIUn4ohqH2druyRSFSXamj1MpcwNuVle8FzeWhT6vMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7t5z4Pb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7t5z4Pb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710567217; x=1742103217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOb4rbxPT/SP0GIyN/AxNv0rIJYCjGOa+UifWzwsra8=;
  b=E7t5z4PbMIZ+5lRtib9xQiCQYJJJtd0DDRg+N0Gw8ISC7wThUnkpKdy8
   durfiS3jDyENKnD/BorDAFp1eoTvmmTSIZkSBC6IQq5Kx92zarbbJdUur
   EzLg53MdW3Xe7mUwkbU9DRT/7ES6zKAiqgQF9J2w02C1qWSlojBkBnRhq
   sLwJxWetafO4gOMwYAmnLet3//q6UHoX+o61G7NlRyQSpX6ClO/en4NyM
   ExEMeWLxA6cKWPWeM1O7U0yRFW0Q/XGT/sBxpzf9upJ3nagiBwj+wmK2K
   s6SfD4vrkowDOm0qqgcmr79PC0+NFxrTIx6ECEuNHiSqXunIXf09PsLsA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5311237"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5311237"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 22:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="12825585"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Mar 2024 22:33:35 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlMfk-000F5d-1j;
	Sat, 16 Mar 2024 05:33:32 +0000
Date: Sat, 16 Mar 2024 13:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 34/43] error[E0425]: cannot find function
 `of_match_device` in crate `bindings`
Message-ID: <202403161359.oPuY7X0r-lkp@intel.com>
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
commit: b057b978ce26ef56acf3c5a73c36619cc8645dfa [34/43] rust: Import platform device's implementation from rust branch
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240316/202403161359.oPuY7X0r-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161359.oPuY7X0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161359.oPuY7X0r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `of_match_device` in crate `bindings`
   --> rust/kernel/platform.rs:69:37
   |
   69 |         let id = unsafe { bindings::of_match_device(table.as_ref(), dev.raw_device()) };
   |                                     ^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
