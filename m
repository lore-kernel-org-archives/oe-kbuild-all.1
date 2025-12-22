Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69AB3043C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387598; cv=none; b=Ms/fjmdU4kvbr8PWfX36gKql1bw7Tam8mXnk8Lbeng77scezN4rhaIhjTQcIFFyGIT2ctK7cF7yzFOvLAmDivFhjMRAGew7SYljxmIGyLmYt9mLLdl4ZV6w6X+o7fxXqChq/2CUArKSFcb0YeUTiiwzIRso3+1kOIYl0I1XG2qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387598; c=relaxed/simple;
	bh=5PRAxuyaQ3qfs3Br8yDEAYXRrW6MmfugQR3ifEqu6VY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkX/smwi6qN9LAH63jXiwU4GO6N0V+GxSRIAnYFV4F1cfcgzuAk1deOJimJei8hDqafYOaz9Fcp1kKu08vgsPeQ7Gp8aoD2Bmk9wSSL3OS5FgKZVQEDO3Q4mP8t28BsCoktCeqS7OFDQuXc+ZmiiFEHVZkcfRz3yoVI0lm7cZ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRIXLAZw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRIXLAZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766387596; x=1797923596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5PRAxuyaQ3qfs3Br8yDEAYXRrW6MmfugQR3ifEqu6VY=;
  b=RRIXLAZw0cQ+KF96QFlAYzXYuMaM3wPV6kOZtCFpZHIIyDUpkzOi330T
   sJPT7kdfsdN54UUBg/kIiU337zkFLNzuUG681/d/Jo7hmgi5pAuw+6le7
   M/jWgi7F1ZqYImhbDESQaousuG1aE1HnLW+LmiebzqWYzwSrJcX2kusBx
   SoP7PcmBmkBF2S+1pxFapQr8M73zvxwv0Lf99cLwo2xF/58o4lJjNoicN
   ysnlzpfL+hY70ztV5M1fsEtgGf9ymP00UeettXG+7cEV3OlJkYdK6WbhW
   j9iliO6I4I/0LyoOVxM3hd+Q2i3T+r83FXl0Qaf4VJSuFzdyVE+zmFOXg
   w==;
X-CSE-ConnectionGUID: 9XS+bsDnReuINhPSdFsmCw==
X-CSE-MsgGUID: J/5HzapwS7OUFaaMC9IWfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78959995"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="78959995"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:13:16 -0800
X-CSE-ConnectionGUID: r5QRPOU4RdmK7gqx5gleDQ==
X-CSE-MsgGUID: YH9xmQf6QrGSgvCBZNPlhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198612186"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 23:13:15 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXa6T-000000005OW-0JCa;
	Mon, 22 Dec 2025 07:13:13 +0000
Date: Mon, 22 Dec 2025 08:12:55 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 18/40] arch/x86/kernel/tsc.c:992:1:
 warning: 'inline' is not at beginning of declaration
Message-ID: <202512220830.FpjjQxV4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   4dfb74d29d6000337e365500598a903406bdc106
commit: a78dcf986454c519879bc57b91a3d676436f3574 [18/40] x86/tsc: WARN if TSC sched_clock save/restore used with PV sched_clock
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251222/202512220830.FpjjQxV4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220830.FpjjQxV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220830.FpjjQxV4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/tsc.c:992:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     992 | static bool __always_inline tsc_is_save_restore_needed(void)
         | ^~~~~~


vim +/inline +992 arch/x86/kernel/tsc.c

   991	
 > 992	static bool __always_inline tsc_is_save_restore_needed(void)
   993	{
   994		if (WARN_ON_ONCE(!using_native_sched_clock()))
   995			return false;
   996	
   997		return static_branch_likely(&__use_tsc) || sched_clock_stable();
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
