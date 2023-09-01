Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CF8180
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 00:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693526716; x=1725062716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KDYhfCIQxGINYE/imu1aXKL2iojeCQ+R5QfboP5A/s0=;
  b=nROz15kPzwyWFmSkddGZqd4CIArXRDrtVGUD363aP8zzhJ1mkZlcLowF
   j80OboCzywxyDZSEH/hKnNMn3foiMH4S4aJ+GPyJtye3AcIRe/y1dw0PK
   578dotRy5rsQutw998598dSBNkFR7SJ0T/noPoE7M6cleZ8WIpySiJyAr
   5NuA8ChJCAG1u0goWVgM8JoRU971YSYFemHme8daf8vqN1R1R45Wdm9JL
   cDyRy1I5uGMCrAq/qkpffLfzub3tkcrD8twBETnU+KGdeXxepB1Nn3JAw
   HZDvLqVCRueW84cvTL85ULK0jh/GSqoC9g7ozpVIcHnCBMOz0iCSQU5iE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375000995"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="375000995"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 17:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913485389"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="913485389"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Aug 2023 17:05:13 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbrex-0000fn-0G;
	Fri, 01 Sep 2023 00:05:11 +0000
Date: Fri, 1 Sep 2023 08:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	linux-doc@vger.kernel.org
Subject: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
Message-ID: <202309010804.G3MpXo59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add description for CO-RE relocations
reproduce: (https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/bpf/btf.rst references a file that doesn't exist: Documentation/bpf/llvm_reloc
>> Warning: Documentation/bpf/llvm_reloc.rst references a file that doesn't exist: Documentation/bpf/btf

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
