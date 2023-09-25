Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0405677
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695645536; x=1727181536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESezYbQMLJnhB9Pv+nXU1WpghllkEqZTtav6El+pkek=;
  b=Eh1LaTUujB/A1ffnPYnhMx8Pp9r8VsnA1JK3TZRNvGjrxUWksNAlw0n7
   YkQQY0xVnJe/BGOBIMApgJPeWdv6jImmkIYC/kvJ0tUHt9gVZzPUhNRW6
   Do8IwrGW3NtDhCw/IPaI399eZwo0qooFbfI1Hbk28/olLWdeGlyB74ihv
   ROhoxLsDXz4oY7g4jtTumUcljt/TSkyp4D/P/MTlAj5WoC4MipUo7Kbxl
   oGZPJFcR4PDntwdlVHdOBFQJnTdThUVSlLQziNohoT9hIOej9danNAA9h
   5diTLWVxoPIh0AcYknPoXKM3o8rvLgmr1g54eqSXpcfbCC6BcozVhGCCh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="447730449"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="447730449"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 05:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="891668146"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="891668146"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2023 05:37:52 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkkrT-0001Vt-2u;
	Mon, 25 Sep 2023 12:38:51 +0000
Date: Mon, 25 Sep 2023 20:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/pmu_refactor 4/9] arch/x86/kvm/pmu.c:691:2-3: Unneeded
 semicolon
Message-ID: <202309252035.BJqntPe8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/pmu_refactor
head:   e342cff1f1eff25324f3e0c498391123a7adc277
commit: 26b39f9ef2d84181c9ef2f8966dc03db130699b9 [4/9] KVM: x86/pmu: Move PMU reset logic to common x86 code
config: x86_64-randconfig-101-20230925 (https://download.01.org/0day-ci/archive/20230925/202309252035.BJqntPe8-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230925/202309252035.BJqntPe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252035.BJqntPe8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/pmu.c:691:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
