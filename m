Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3921B9F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763220020; cv=none; b=eV128aeH0s1oJeESD3EdO1Zmkbsr8mDarwGfT6XCHZtgq5fsCtgpw5MSaNRIYNATYbOzOFuU/nmn0jjPian4YXlqe/6dxxRUZn5HyvjH6PtuuyTBXK2x+A5nmKDkWKrFeMaORyhimODrjC5VaS5q7dk9+ZN5SYj63MgnxGNy+YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763220020; c=relaxed/simple;
	bh=thElenw/mBSfCcN6zmE/j9xb8fYZHcmRAPmfJVWTuLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlAH/0fmgp+ubUe0nnbS2Nr3VWRkEa5M5WvA4rSVd1jphQIjD5kvMmb+5F2wlliCzk6M/MZdSsTkobms/YS8gUA434Qw6yGPHPAv1TD/Yg8GlzzfydCFZ7JOWyaTGr759FMlnW8oOC5HHqGvgfaHAGTVX7ecX2zuOLUDn5JFEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5vpWepv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5vpWepv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763220019; x=1794756019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=thElenw/mBSfCcN6zmE/j9xb8fYZHcmRAPmfJVWTuLg=;
  b=d5vpWepvdJMjI7QmCJEnq/rFAMmrBdR+z6DCr2u0fm9xi0FXTZfR4dbE
   MQUsJU9wq99XknleUg82/OdCq5swqu95LN4b2JgkuMUiM92k7g8OtxwFL
   oarYjdqCPT+Y0YeJUp1nfEojs3w94kIpjSPm7WZSleHp5bJDtZTrJus6t
   iCmR7pDP7CJn1Ez1NRIrq5n8SwmMA3y9ABcHz3RdSaHPdG2PksZRlKv2M
   vfM/djSrFnU98pc61ZFz1HK3+jzqF2BH9+Nrj/GKPrRY23cp9i/2bEHTe
   d0IbfKWYaJ+UAQswhO4gGxt23KFumQddkbiHIGwscWj7+dAFRGnL1a/Zy
   g==;
X-CSE-ConnectionGUID: DzUwiwnGTweTYatPtJYFsw==
X-CSE-MsgGUID: 5I7EviHCQGaSdgE/oJrMfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76638643"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="76638643"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 07:20:18 -0800
X-CSE-ConnectionGUID: PZwYwUZaQIGPEeGplCLG5w==
X-CSE-MsgGUID: fsvoaEsKS8y5H2u03tNYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="189351724"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Nov 2025 07:20:16 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKI4T-00083D-3D;
	Sat, 15 Nov 2025 15:20:13 +0000
Date: Sat, 15 Nov 2025 23:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, tzungbi@kernel.org
Subject: Re: [PATCH] lockdep: Add header and footer to surround warning
 reports
Message-ID: <202511152337.qCRw3LXm-lkp@intel.com>
References: <20251114062730.1828416-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114062730.1828416-1-tzungbi@kernel.org>

Hi Tzung-Bi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzung-Bi-Shih/lockdep-Add-header-and-footer-to-surround-warning-reports/20251114-143903
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20251114062730.1828416-1-tzungbi%40kernel.org
patch subject: [PATCH] lockdep: Add header and footer to surround warning reports
config: arc-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251115/202511152337.qCRw3LXm-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511152337.qCRw3LXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511152337.qCRw3LXm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/lockdep.c:62:10: fatal error: asm/bugs.h: No such file or directory
      62 | #include <asm/bugs.h>
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +62 kernel/locking/lockdep.c

    61	
  > 62	#include <asm/bugs.h>
    63	#include <asm/sections.h>
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
