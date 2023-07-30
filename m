Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BBD65A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690694070; x=1722230070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jTn//pl/Kmo/86PAslhjdWAvZVwFaSOZH9twl8oUjPE=;
  b=Qbdnm8WVgJP6XfbNvHoYRSUAhp/yqGA5QRVWgKOv/03+SsLGImOOc2LZ
   PP+KlR4FvhLMNE5TVr+fUAfmDcAitSD3wQv6i3auo5rC1eUUrgOvx0ZU9
   PIJdRDk+ZejpT4GxF9A+8Zi2TaXnBuf00ArB/s06Vt/LX0bT4WJIGrSDA
   LwpvV0fuitKMSnsi51YhfmtZ+kcKWITOgqkShwSKMPH6ipqiSsHIKpE0e
   gU0t+VPY5fxiqZ22xQp2tyjjxpVr3WDmLFUsATm8XubJtmMI57kuWaLnR
   cLqrbIU3a0cQqyk3XAyF2hGe5GCRlNG2wCLegA3AiHgTfypYI0S2ff2Df
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="368823769"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="368823769"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 22:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="974516014"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="974516014"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jul 2023 22:14:28 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPylA-0004SK-0c;
	Sun, 30 Jul 2023 05:14:28 +0000
Date: Sun, 30 Jul 2023 13:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-workaround 202/343] htmldocs:
 Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected
 indentation.
Message-ID: <202307301332.fjpyAgLh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   76c1c9e7f4012a2878b2fdf292245aa685c34b2d
commit: eb1fe4ffa27db84b0a70aff775c4823d76e3c2ba [202/343] x86/virt/tdx: Export TD config params of TDX module via sysfs
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301332.fjpyAgLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301332.fjpyAgLh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected indentation.

vim +2 Documentation/ABI/testing/sysfs-firmware-tdx

   > 2	Date:           March 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
