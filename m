Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A448125B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942035; cv=none; b=XXIUcu2ajaaIp+e63qW/V98ocL1Pw6ZDRdT04bcTU9zJcDlWdwAFMUOsLS8aHfAMuavsY7COnYIjpq9sHjMbf1fNAavCa54aAb8B4hze0tQos8zQYeI5e6Uu9VmWkV6NEB+Pw7AkENNKlCjaFrvB18M49vSTHmPVoDiSNqgLb0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942035; c=relaxed/simple;
	bh=mZAgjJ1R3ZPf0SFGUDOixcZAKxpcJWkCd1/zff1kivc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AX4ZAIZVwqzG9VlMpxSOBYr7nT6Yovo4PrX5blgjKaRpYv0Kvfq8/TwzBGwnBxoCg1RF+AjRM6kpBmEkblAlQMegA4R4QBfIjMg74DT3apY5gQ1mGh1GWnvWGVEf4cO1505Lix4jAgMI/5VGxbIqUUNCQ7qDX+v6ZXjMXsZgCMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVG62qJE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVG62qJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790942033; x=1822478033;
  h=date:from:to:cc:subject:message-id;
  bh=mZAgjJ1R3ZPf0SFGUDOixcZAKxpcJWkCd1/zff1kivc=;
  b=HVG62qJEX0QcD18m8PhzUlvD1oFilihszrh5fhnOZSeAiO6YH++L+rh6
   b2WUjRXx/F3tKc/9j+aVNJwob4pbUjznw1DRWooIzM4cqk30/nfIuGIs6
   aOfbSlO4uSgwfgYmogu/CiAFVkfXNk5VzQbFGQ1K+pytbMUXLGeqVaKiS
   utFyRo4xNnEdS+6BjswSJh1fN8EQRqp/GayMf5CrCYsza5A0Iv81hF4+f
   BtHT+VkNwmCUgQ4S8xKs77J9idw9yLgaJrqznduVxYPVhgOo06ScWDM5i
   tn2d+H7/lKMdK7CBg6KKn8UygcXiJ1DkwH+y1O8wnbh6xfOqDcTctOe8g
   Q==;
X-CSE-ConnectionGUID: pJP4fcy+QZ+JCvM3IsI9PA==
X-CSE-MsgGUID: U/9TKiFsTW6c+rcIARIAjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="79265095"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="79265095"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 04:53:52 -0700
X-CSE-ConnectionGUID: PhGqkEURTmqgNZZLQfq+bA==
X-CSE-MsgGUID: sWlJ0t+SRB6x8rAhiYsB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="259552"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 02 Oct 2026 04:53:52 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCbpk-000000000WN-2J6Y;
	Fri, 02 Oct 2026 11:53:48 +0000
Date: Fri, 02 Oct 2026 13:52:51 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:dev/selfref 36/49] warning: you should consider
 adding a `Default` implementation for `NotVisible<T>`
Message-ID: <202610021356.Au5GtiZL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux dev/selfref
head:   63b01fa5c495532c8f631cce076471a89c78001e
commit: 0b06c6cecb24305a7bac358158f38319ca489406 [36/49] rust: pin-init: internal: pin_data: project self-referential fields
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610021356.Au5GtiZL-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021356.Au5GtiZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021356.Au5GtiZL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: you should consider adding a `Default` implementation for `NotVisible<T>`
   --> rust/pin-init/src/__internal.rs:684:5
   |
   684 | /     pub fn new() -> Self {
   685 | |         Self(PhantomData)
   686 | |     }
   | |_____^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#new_without_default
   = note: `-W clippy::new-without-default` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::new_without_default)]`
   help: try adding this
   |
   682 + impl<T: ?Sized> Default for NotVisible<T> {
   683 +     fn default() -> Self {
   684 +         Self::new()
   685 +     }
   686 + }
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
