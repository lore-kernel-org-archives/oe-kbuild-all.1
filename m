Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461FF13B784
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706219305; cv=none; b=kJJ9lcrHEjeL6VaGpgd4c+u5n/4N4Tm8zw9lBlXQTVomkSTrON9+qUO3hga71bK3G5oSl82drC3ikj4O+SkFsBrgVhou9rkaBamqzhk1HNekf6zO14KZf8c6BCVOgAF3nYsLO91shEN0JrpEJoLFD33yaSTI75l7BO877Rr8y24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706219305; c=relaxed/simple;
	bh=SWP/i+gyDZ6+yCAWQeWXiWJmfN+HxYyNo1KqdRK8C6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hbf4ay8bEuGkhCe+qY+TrvqrnGTJomMwOacA+TD9/Mz6dOs9+dkJDUi75vhvJXJvAM7pRlbOHzgLmqJmKNTxVDo9SA8j8DilwZ1BdJy4zwSmO/MoP9hekX+U2gY0zhufkZXrH4MbF4SUDKur0X4DBvb1QncMV+GSVNB/eHEQtnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c08N9wBU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c08N9wBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706219304; x=1737755304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SWP/i+gyDZ6+yCAWQeWXiWJmfN+HxYyNo1KqdRK8C6o=;
  b=c08N9wBU5tJYiZ4fqvLgJPdfVoEOMBol6hragyCEfGI6SeysJ0fRMJuv
   Q7jMM2IZV4bhfG8paQIuOwbHTlMPPaSY03Oj3if5eMxo/f1f79B8TcMxu
   /2h4g9+ls9v49oBAtL1AE0a+7RDmGKtZx2eNxUpAN+Vg/lAckkb0sv970
   UdhSus+TtsjRkGikZbwQExrpBXkHWGeao4T4xYtZLBfZEjSVsUTUP7tmB
   BO9Il2pD88I1Y+vPMqmCQigUB7FbwNQF3AW9HT6XMkZkq7TUEJixlSxhK
   a90FV9TcwVLe0a1QUUWSUC3Hori478YVt2qwMKgcNORH5kZurbwgdm8E6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="8960848"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8960848"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 13:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2567821"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Jan 2024 13:48:21 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT7a6-0000Qi-1A;
	Thu, 25 Jan 2024 21:48:18 +0000
Date: Fri, 26 Jan 2024 05:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 160/175]
 arch/arm64/kvm/hyp_trace.c:763:37: warning: 'hyp_trace_fops' defined but not
 used
Message-ID: <202401260517.EnEPGnaq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   cf80ba81b4a8ce09dedef870ff471f13b56cded3
commit: c5c554823f2b582cf6a0a1e2b37297f623392483 [160/175] ANDROID: KVM: arm64: Add trace_clock for nVHE tracing
config: arm64-randconfig-002-20240123 (https://download.01.org/0day-ci/archive/20240126/202401260517.EnEPGnaq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260517.EnEPGnaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260517.EnEPGnaq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:763:37: warning: 'hyp_trace_fops' defined but not used [-Wunused-const-variable=]
     763 | static const struct file_operations hyp_trace_fops = {
         |                                     ^~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c:719:37: warning: 'hyp_trace_raw_fops' defined but not used [-Wunused-const-variable=]
     719 | static const struct file_operations hyp_trace_raw_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_init_tracefs':
   arch/arm64/kvm/hyp_trace.c:807:66: warning: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Wformat-truncation=]
     807 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                                  ^~~
   arch/arm64/kvm/hyp_trace.c:807:62: note: directive argument in the range [-9223372036854775808, 4294967294]
     807 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                              ^~~~~~~~
   arch/arm64/kvm/hyp_trace.c:807:17: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
     807 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_trace_fops +763 arch/arm64/kvm/hyp_trace.c

c24ca55000da34 Vincent Donnefort 2023-06-13  762  
c24ca55000da34 Vincent Donnefort 2023-06-13 @763  static const struct file_operations hyp_trace_fops = {
c24ca55000da34 Vincent Donnefort 2023-06-13  764  	.open           = hyp_trace_open,
c24ca55000da34 Vincent Donnefort 2023-06-13  765  	.read           = hyp_trace_read,
c24ca55000da34 Vincent Donnefort 2023-06-13  766  	.write          = hyp_trace_write,
c24ca55000da34 Vincent Donnefort 2023-06-13  767  	.release        = NULL,
c24ca55000da34 Vincent Donnefort 2023-06-13  768  };
c24ca55000da34 Vincent Donnefort 2023-06-13  769  

:::::: The code at line 763 was first introduced by commit
:::::: c24ca55000da3492aacf4e383634f060faeb5050 ANDROID: KVM: arm64: Add nVHE hyp tracing to tracefs

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
