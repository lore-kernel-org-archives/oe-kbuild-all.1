Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C397A2915
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686650329; x=1718186329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bfPhP/d5gR7f11qRZn4OYZnqUovRaO+AsuTOwuUIWc=;
  b=WvXCz6LnDlgTnt5WaSl4Li2yAALGdk/0Eor7mjJdbkhz+ETe3K51c1IZ
   m9vuyVZGGISMJ8CIHtFkSvXkbid2N5agzyIx9a7tWV1ZnYLuxa8lTErGc
   9pkqbxvGspeCqtP7KJyloYKtNnhNroRBCnJpi89LI2EbZrjg9FDAXqatM
   FPmOKNN8Ttb2Vop8hX/ym1F8rSKt1rUMuMA2rB/xcrvik6VUcI2mSBh5m
   gRHO/JGuEiRnemKAVQlglXYy7LwR0l8qt5p01FEXzHStq86CD9VUjBIlx
   QwktiGKyf9RUgX/r0EanrcMbJkSxHmSz9wdu68kbmvWjUGviOD1uWX2p+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="355783086"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="355783086"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 02:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="835819338"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="835819338"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Jun 2023 02:58:47 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q90nW-0001D2-2k;
	Tue, 13 Jun 2023 09:58:46 +0000
Date: Tue, 13 Jun 2023 17:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 52/74] htmldocs: Documentation/gpu/i915:546:
 ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:28: WARNING: Unexpected
 indentation.
Message-ID: <202306131730.0DnQAUCK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   34529b2095bf4ac258f7a7cafd06d2103fa7505d
commit: 88101e7da7c7eb143f6f18834c408d5d25676d5e [52/74] FROMGIT: drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
reproduce:
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 88101e7da7c7eb143f6f18834c408d5d25676d5e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131730.0DnQAUCK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:28: WARNING: Unexpected indentation.
>> Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:29: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:34: WARNING: Bullet list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
