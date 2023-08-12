Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D21C3C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691856560; x=1723392560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DtSrpRsoCFPfC8Ih8A7uwo460RSlS2Av/iTVJK3V9ZU=;
  b=SnlOSL+mUGLSd4QablqUXp86JQ/R2qLi179d45lJDHXYT1qLPoElAAMB
   TTrnuUadfb2tnqiTorn0RUMZMH12Fukq5QVGKmRpEsXeZUFtR7KPXCEOC
   3+H1RqQoL4xhEaIIipVcpfGQhAmuco20qZF+xlbZqFX4HMTnkkwL3GUDL
   mWA0LdJewsa0G50dA50iM7CwHUNnwt6wn5WNYSSR/Il+oiBWMmiOSEwLH
   RoV3POSJ6lDxnoGKDZ+aTm3bQNVoCCxYfzPfTxeGK79UE12Re8ojUN2px
   WO9LH+XrpKsNlwUSffnJVYjtefYbKIXXGjjwvDLmgb+r7zO5ySxt31Jlj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="351441940"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="351441940"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 09:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="1063598074"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="1063598074"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Aug 2023 09:09:18 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUrAz-0008fE-0Y;
	Sat, 12 Aug 2023 16:09:17 +0000
Date: Sun, 13 Aug 2023 00:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 9/20] ERROR: modpost: "check_hv_pending_irq_enable"
 [fs/nfs/nfsv4.ko] undefined!
Message-ID: <202308130012.RFkULc2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   a8a44aa58e6c9eac7cdbb142e11b3ac894404756
commit: 3f81719fdb04fa8e82e1a6341cbbd92620655158 [9/20] x86/sev: Add Check of #HV event in path
config: x86_64-randconfig-x012-20230812 (https://download.01.org/0day-ci/archive/20230813/202308130012.RFkULc2t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130012.RFkULc2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130012.RFkULc2t-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
>> ERROR: modpost: "check_hv_pending_irq_enable" [fs/nfs/nfsv4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
