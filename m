Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531661F03D4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 02:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746842786; cv=none; b=u5KKXsoXwxXJz3g0mRcV7yikIAqxeQSdU/jmoEru6Sih+c1ql1ho147FGDaWfgXOVlgGwaMcrEeZuDjsGnF9sFgOq9UZZXiKP6gnMraHJ1f8pwsW4GVnzf8h+Y1zpyzKypmxzs/22U0AKYMiPSBitlQWtXI3YBLIUH0/jmiJBaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746842786; c=relaxed/simple;
	bh=3GI9uef+gbdOUP1K3y9Vtg3YS6z9BG6DFYSXR9Qy8Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7ItL52P++5BdG9Je0e3P3tfu4OnUEScDU29w7ddMfjcg97/SK2XvJRPOfVZHutc3yj3XNAqm9tZR9xJ8qdQVxJTR9BJ4vJbEiTrp3HKRUc82YgQhPbgrwfDxf65zX/QWcrI0VCaT+oxe+AjVLMiqrUtawqYmi1ZHIg2sn58xow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gL6HRUFz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gL6HRUFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746842784; x=1778378784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3GI9uef+gbdOUP1K3y9Vtg3YS6z9BG6DFYSXR9Qy8Kw=;
  b=gL6HRUFzfequiyF9iWM/1yKlvymhrMPfOvmof18qCwLmYRHrlj1IpP2E
   6g1vYWFHzqmFSnd0HuuWWok3JjNfi3fIox5AZvaSRzYqgUA/lpUGu8ncV
   uyDI+7bCMwXtfNzVl91j9vnGpJ1ZMmZkPgrdNKHunPffa6CPb4ZPKDgjr
   tJ1X8m49eIgoTVpLW/opS+eU72uNUjfCQmUpcWk0YUKpkQBXD6UO5S0N/
   AR3RUNmlPFJMIuZVtWd9l9MZCGU2A1/WVRAXsUnBLKBjwVsuIP2Zc8upo
   PFBKVmWZjxBtoTvWrg5tsUi2wVckRHB0BEBdtQ19B7AcwDN5ln9qtaPKO
   g==;
X-CSE-ConnectionGUID: 5RNYs7V4T2GliK51PjGbRQ==
X-CSE-MsgGUID: 5bh4mwrzRuKN71XwevCffA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48838777"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48838777"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 19:06:23 -0700
X-CSE-ConnectionGUID: s00EMUpzQymV4eTjAixdoQ==
X-CSE-MsgGUID: waqBNc2SSOeqUTjBNaY4sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141900881"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 May 2025 19:06:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDZbY-000Cgh-0Y;
	Sat, 10 May 2025 02:06:20 +0000
Date: Sat, 10 May 2025 10:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2218/2218] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by ARM64_MPAM
Message-ID: <202505101047.t5A72bmv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   eb29ec38301f3cfe72a33627aef774ac499803cb
commit: c5a4bf91167c714de74c47f5cd6d888c66e9860d [2218/2218] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-kismet-CONFIG_RESCTRL_FS-CONFIG_ARM64_MPAM-0-0 (https://download.01.org/0day-ci/archive/20250510/202505101047.t5A72bmv-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250510/202505101047.t5A72bmv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101047.t5A72bmv-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by ARM64_MPAM
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
