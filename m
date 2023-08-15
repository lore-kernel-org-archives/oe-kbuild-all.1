Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B13259A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 06:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692080078; x=1723616078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dcY0gEucxjLT9emwVtt0ZSsfk3aKX64dK5309Dd7aPM=;
  b=XvHJKy0hwE+zreIb0ABTdpxHOwdMATcgm9QYvAe0+dKwZ+w9YsCrz88q
   /7YATBOYWA3e2hSHBqYtOdy+ziSiETjY8TqoOGrHHCkBzsl5yY5eg6Mps
   pBFiAnIbuxBjeczc9836STbZXZmUZPMOg5+EQiUuwiAf7nRxQhy1dueZy
   KCxkpdmftYynnXN/aQIhlnw+nkW3YkO5sRDMYCh37mSZYa/97dhNmACca
   R+4i8z1VB5nXCq+1tj1b16lP6dN01vOcA7RFEt+3IxTMDqR/PC6uY+v/3
   5Pa/P9goD+n+NoLA7cI4ibRa6+xRk+CmKxaThcvUja90xOVqTd/CIl24N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="371118147"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="371118147"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 23:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="857328804"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="857328804"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Aug 2023 23:14:35 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVnK6-0000hx-2t;
	Tue, 15 Aug 2023 06:14:34 +0000
Date: Tue, 15 Aug 2023 14:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [rust:rust-next 23/25] make[3]: *** No rule to make target 'rustdoc'.
Message-ID: <202308151409.tqK1jSIb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux rust-next
head:   08ab786556ff177086ce93b26daf2a58edd10968
commit: 89eed1ab1161e7d60595917e3b982e03dfcc0f8d [23/25] rust: upgrade to Rust 1.71.1
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230815/202308151409.tqK1jSIb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151409.tqK1jSIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151409.tqK1jSIb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'rustdoc'.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
