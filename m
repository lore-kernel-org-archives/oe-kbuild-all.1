Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9043F142E86
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 19:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558422; cv=none; b=OS1I9yMnlmu4dYyuZkI2oTW/csBpeb5X/Fdp54KJdVM2uOAMQv0qe+Vuldy/xxOjkYDYsx5OPvF65NSu+DomfeEXubunDbABPLN4z8+ulh6LolbCjsFxWbdp1THKc+fsN/MgFkZkJTCMCKXvLxfZADibx7NW2TILtpAG023RM4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558422; c=relaxed/simple;
	bh=DPnie/e85BkU+664bz6+UI2xSHKuplAbP2Bf2INWOvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIo4L7BQUDIRZlhSDls2PqP7KkUQMelao3h534ya0dYjQxbyd3ND26w/XD0/26BSkhK9ToaEv8QAweTtaxK9cK6SQ1XSUzRC62fupSaKEa8xJDTlS+t9BboRKqo6KOvfcQF5xeGjzCMFlff767ZnlPWTuOxhHyVA0jbFIABbO1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Idpu+CJ1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Idpu+CJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746558421; x=1778094421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPnie/e85BkU+664bz6+UI2xSHKuplAbP2Bf2INWOvk=;
  b=Idpu+CJ1yVMoOU4T/cyNRp6Qq+aDc36mEIM7uL7laiHfwxILB7R98XDe
   j+5Zp18BjJsowjtWA1a/eNFFtOR1xr3hg1/QLyr4xZLpeOiSbjTfu8ETL
   3p85up2KfMx6eRTPh4EWWejbfe7mDfB78gWndz6h6GetS7dl/GuiazRvc
   K4eSkjZvvzYjC9GDora/EsJicTRRWtEldNnSBTvBrRvBYnAg810uBSw0e
   6nY8FKYp+7DnCu3gq3wEGcrDaHH8laqOrMOyq+f9N9sT9q2CEHrWA49TM
   XKjydTXbT90/l+EALyjyuaVFiqfa2E0KLQ2ziOoGhW7xMZ3Xm6CxvPgok
   g==;
X-CSE-ConnectionGUID: KTZbI0pFQTuzYfHzACJl7Q==
X-CSE-MsgGUID: cVQCMfLNQreEFP916Qwdjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="51900199"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="51900199"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 12:07:00 -0700
X-CSE-ConnectionGUID: aNUZ/QAcTte65Ks0wzIx2Q==
X-CSE-MsgGUID: AFmmdDnyTl+Yu+Gb7ty0qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="140563365"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 May 2025 12:06:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCNd2-0006oT-31;
	Tue, 06 May 2025 19:06:56 +0000
Date: Wed, 7 May 2025 03:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for BALLOON_COMPACTION when selected by
 GKI_HIDDEN_MM_CONFIGS
Message-ID: <202505070240.vee73fDn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e20c2e5ba70ac5fd2f1157f57a8ee53e07b671b5
commit: 0041f84975dcf2f25a9b508fe299a017fe0f4da2 [2/2] ANDROID: Add GKI_HIDDEN_MM_CONFIGS to support ballooning.
config: i386-kismet-CONFIG_BALLOON_COMPACTION-CONFIG_GKI_HIDDEN_MM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250507/202505070240.vee73fDn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505070240.vee73fDn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070240.vee73fDn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BALLOON_COMPACTION when selected by GKI_HIDDEN_MM_CONFIGS
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
     Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
     Selected by [y]:
     - GKI_HIDDEN_MM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
