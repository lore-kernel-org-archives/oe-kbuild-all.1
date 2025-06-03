Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A864268C6B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934644; cv=none; b=XLmwXMxeCsUBtiYRl9zBXVvri9nhKSWzdE0dUtMGHyEibb1a6Aqge5EWPM+9dqFG/k3G4HdA4ULjAJ0ERPVi51IBgOtaMwR+cGlBahTzo9rytI5amltHw3QoKY0VUvmIsC0wlAhmOLKKSrZMSgVWY75CZq4Oo6HU8aPtiE0g2F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934644; c=relaxed/simple;
	bh=mSh0bQC/TTjdmEb4rzRSIzwYqXECMH+ltAC/FjASkZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gezdn9u/Z87EhIyIZPgkOFwFJyVfcutHL0Ke3dUoISHACHP6NzJSWJ+dY0x10jBYky1HREtJmT/cgaUvpzbuHa0vmMvnGQlxythAz1G0RXFV8FMric80FjEYAZYaVXEEXUhKh4TImyWvzIPs0kowzDfxoSULxddnK+iGYP1vIt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6kKYJMW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6kKYJMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748934642; x=1780470642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mSh0bQC/TTjdmEb4rzRSIzwYqXECMH+ltAC/FjASkZQ=;
  b=Y6kKYJMWdmQ1IFNbSM6+SJ8R4059LYJXnIZnrW32gSsLMgBTEqD0tZVr
   TVFt464K6SwDnGXLXBFb4Bo9KyJOwtGJYZR5Utbtk0U5xZdEGAAmObYCM
   aRKqdilgS4oz3DhUkmmauSRb+4AwZODOWcylPOaKvZ7I0YXDMgYW4sre0
   TsYbGyZmQDSha6P/ybSv5XF+Gq+jaXouav00AduHXBTBYq4bAir6qw4Je
   E6E5oST7qzsWcHkjW46vczsl5f9HjMlwGVKYhuxJmoHV2+FeTArE5Dtdp
   QFluUcrs53dJmbVJjJR0fKo9/Mpx0zJSVTaP+oO2mMVa9L9pDiec1hrl7
   Q==;
X-CSE-ConnectionGUID: x4qFwZlgT4qj1FPhs3P71g==
X-CSE-MsgGUID: V7F00JboRvm36YIaFaByxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="73493722"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="73493722"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:10:42 -0700
X-CSE-ConnectionGUID: 4OtcpwJxReqXmCuehO/RdQ==
X-CSE-MsgGUID: YfcRCWb/RJiEMGJVz4MKEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="175726078"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jun 2025 00:10:41 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMLnC-0001Rm-2b;
	Tue, 03 Jun 2025 07:10:38 +0000
Date: Tue, 3 Jun 2025 15:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Gu Bowen <gubowen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] security/integrity/ima/ima_main.c:645:
 warning: Function parameter or member 'bprm' not described in
 'ima_bprm_creds_for_exec'
Message-ID: <202506031526.ih0vsefi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97c2d1a4aa1430a6305c949fa1f72efe454c946d
commit: b89997c5e3ffa58c43c4cb3547eb0c11b75d0634 [2195/2195] IMA support script execution check
config: x86_64-buildonly-randconfig-2001-20250502 (https://download.01.org/0day-ci/archive/20250603/202506031526.ih0vsefi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506031526.ih0vsefi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506031526.ih0vsefi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_main.c:645: warning: Function parameter or member 'bprm' not described in 'ima_bprm_creds_for_exec'


vim +645 security/integrity/ima/ima_main.c

   640	
   641	/**
   642	 * ima_bprm_creds_for_exec - ima support exec check.
   643	 */
   644	int ima_bprm_creds_for_exec(struct linux_binprm *bprm)
 > 645	{
   646		if (!bprm->is_check)
   647			return 0;
   648	
   649		return ima_bprm_check(bprm);
   650	}
   651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
