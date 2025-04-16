Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F8D28373
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 19:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831782; cv=none; b=YzxBhU0S67PkXYDHpjr/Ab+s/+IDmZr7GzPXMNAUZ0+LR0L1fn8qqlFJTCnP7Hc4k0dbeSZdT53D1ZE5HGsX0mfB1d/hwx5N7Z1TMOgpImNgoOEv9hrAw4gUPJQ84LVFH88TGEk+JmnG/iRtZ5PNlU5x4FUvZX4/ILoe5AWjYJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831782; c=relaxed/simple;
	bh=e0Vyg6kRieT+g60kvlHiLewn8Cn7PU7aDXa/bZYUfF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sybeYfaQbKbKRN2Y4vaNSX5C8u//Vbe+XRHvpTdoV7zgVOf1FnA/ensIgSA+2jeWa3WeeJ9KeGyFyQxjYVcanSjNBUoAVmHchrQFuI7L3uCLCC5E5Y5IVfaVslwbxWozkxk5d23/wMuvhIzYf5nw/9GKp1AfK6/OqwZd2uNELPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mjv00JHV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mjv00JHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744831781; x=1776367781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0Vyg6kRieT+g60kvlHiLewn8Cn7PU7aDXa/bZYUfF0=;
  b=Mjv00JHVMUh15/Z0KdlDa8ryicr4E5GzeN9UngBBhmt3tqbz37NLTt7M
   fxUPE1/JFz9M9ZmGKvpQJki9iXebmKGSC4FbIGg5Ud+eu2toJgJYY2tKq
   DWLLb1wmKXq9UVC5+pzTCcGYw3fmjoGKjgKOYEMSINSQAVKZJCxZ1NogK
   E14h6RkPXT3Q1sgGgX02i62Mi91aDlzk+H4eNjcDkWGYla6lS17djEsGp
   LdxAcY2i/yNdx2qIWQTjueAZ4IzDj146QduWE4YzMD51LyUxG5JrSexgJ
   9sRsBdRaVBocdXCP66tuEC95uG2XpfH+f6oEpYOEdLEex7YaVXFKAXfkq
   Q==;
X-CSE-ConnectionGUID: jc5EWsu7R/ijFb2ne+UWxQ==
X-CSE-MsgGUID: cxxXZ3CeSlOaalb5vlYOIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50046783"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50046783"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 12:29:40 -0700
X-CSE-ConnectionGUID: z3q/1dOhTU6IdHEsRJZTPg==
X-CSE-MsgGUID: G5NxWbLjS163BubXYtv56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135392667"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2025 12:29:39 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u58S1-000KFQ-1t;
	Wed, 16 Apr 2025 19:29:37 +0000
Date: Thu, 17 Apr 2025 03:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/arm64/kvm/hyp/nvhe/clock.c:38:1: warning: 'patchable_function_entry'
 attribute directive ignored
Message-ID: <202504170334.uRVJmmTP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   e341f04ac3ad1f2c8b92a82282105c82a72e48ef
commit: e77aff67170b3289f944fb39f1e81b2ff8a5e40a [1/1] ANDROID: KVM: arm64: Nop padding for ftrace support in the pKVM hyp
config: arm64-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504170334.uRVJmmTP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170334.uRVJmmTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170334.uRVJmmTP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/clock.c:38:1: warning: 'patchable_function_entry' attribute directive ignored [-Wattributes]
    {
    ^


vim +/patchable_function_entry +38 arch/arm64/kvm/hyp/nvhe/clock.c

97c14dba6f9623 Vincent Donnefort 2024-09-11  35  
97c14dba6f9623 Vincent Donnefort 2024-09-11  36  /* Using host provided data. Do not use for anything else than debugging. */
e77aff67170b32 Vincent Donnefort 2024-10-01  37  u64 __attribute__((patchable_function_entry(0, 0))) trace_clock(void)
97c14dba6f9623 Vincent Donnefort 2024-09-11 @38  {

:::::: The code at line 38 was first introduced by commit
:::::: 97c14dba6f96234c7120802f9d727a4ccfd17367 FROMLIST: KVM: arm64: Add clock support in the nVHE hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Keir Fraser <keirf@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
