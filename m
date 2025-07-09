Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C7A194A44
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056595; cv=none; b=LynYRRiB8KFuBcBP6Ae94d5BoalfPhzwaUU7IJXelgvo0SAvHKif/2sfOyfPOB/rkcHc7vtNZyqRlM2efsY3RCgbxCh7IMoPoOdtg263OvDlTqf5tJZwALPWbBAXT0wThAfb1fpv0jkGhRwNeEtsCVkiE+RiBW4lY5c6E3B9ZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056595; c=relaxed/simple;
	bh=PoO8FUAlA+bUzFcqNRxAYY8KxdqJ+Nb/122WFYluDsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nn5eU66NcG8rsjVr0xMt8pOfCs5PPe5hcipn8lRokxxO6h9mkVloHAEsW5xlcF09u8L7rJlWTJcYJzdGvliJpmpV1BHplG2mLHrQ0iT7w/yvIBVfFrE77unJHdmkZejZi3Abo6Q9xpiAXd2Ntdsv3e/nC3brurOYg+rYyxM0xcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHgAjIJ9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHgAjIJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752056594; x=1783592594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PoO8FUAlA+bUzFcqNRxAYY8KxdqJ+Nb/122WFYluDsc=;
  b=YHgAjIJ9oWot8tMxpkQ+iVkvlB2YF6Q+swt0/LB6nWOZKEhhOYSsHQuS
   T2pMPPQnk2p+VtEQHJdHugYY0m/Li0mUenp57NF9+L9Sq2Xqiq4HXSd8L
   XHIsfeXfPRYkjgpStUwKDIl7LJnb1v2StjMdufHIcNAXjFGk9ePce+168
   tFy+jxFFqkxWIXgO7+hEolmI2PGVfqB5t/lDmjqmrL/jGDWDaQ4NAb6wM
   jmf4COZezCvKhjCZvwTad1tnfMgoQxUU6GAmGS+863BjsiK0O6NG+me5x
   7YI37UHPgO0J+1PDUAulNaYZ747agH9941RRbfPx71kQQqU6VLmRY/iez
   A==;
X-CSE-ConnectionGUID: nip+S+aHTbiTSi8Ik2WgJQ==
X-CSE-MsgGUID: hYgkA8jCRl25o1RQjoVZvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76860262"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="76860262"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:23:13 -0700
X-CSE-ConnectionGUID: M4WzYp5dT0eTjxWXd9cycw==
X-CSE-MsgGUID: iFeiVBw3RXmiddnFFKuofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156221518"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2025 03:23:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZRxG-0003OX-0h;
	Wed, 09 Jul 2025 10:23:10 +0000
Date: Wed, 9 Jul 2025 18:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-v2 13/14] ERROR: modpost: "__swiotlb_find_pool"
 [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!
Message-ID: <202507091831.cezold3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-v2
head:   df1fe935748aeebd8765f3bfa08ccb455c11888d
commit: d15655c1f2045e8b5646c16e5ce2b0d8458f7e31 [13/14] virtio-msg: ffa: Add reserved mem support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250709/202507091831.cezold3Z-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091831.cezold3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091831.cezold3Z-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__swiotlb_find_pool" [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
