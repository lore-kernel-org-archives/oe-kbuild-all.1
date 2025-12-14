Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C12BF015
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 22:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765752834; cv=none; b=jBIRs6AG/FNaydLzb1TW/uO4q9IZVsyPc/n4i5JT5rC905Q5hAKtxRAX8us0a+w6hgyV+6WY/PSG26icKLl2Q60YVSAfBoFMvmsU0sPsLYGcdlSQTDfZw1Xy8WcKSx+eZC+1mYG+JI3w9fvIN0H0WjLy14y+iJtxKzoVXQ/VI6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765752834; c=relaxed/simple;
	bh=+7ceb8EcYqFeE/qn2GuLuL7A6uGCr6cEiAb13ZsF/N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+MAEUKAncgGM58Lm4UQDLVfAM5NFYpVnA3fdPUkV5C4PJ6RJjQVqgAJc55ABVok8No5JziWNZsx0aCqtZS/DvUnWq/4+3E0fdEShFPLbPl/4lqx1dbO2BdGOLiBdYg3WyqgwC7dzwi/NiMGF7YLXVzdkkVzkqh3Dj6xuCO22hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mv509Az8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mv509Az8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765752832; x=1797288832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7ceb8EcYqFeE/qn2GuLuL7A6uGCr6cEiAb13ZsF/N4=;
  b=mv509Az8CX6JOzefBCv39tX26GquQqlGpQxCnOkMjFbDrId0KmNUKvww
   UbT3DCz+QAgR0qSokq6PivmwokX+ICtmpmSGPaiY62xI5kSZz0Jm94LPN
   naO7gbBiUu3veUqt1OePxYWBuPcRtxqJQYn47IcRF8NA3M4bM1bnzw/8K
   vj0+bKlO6ERmaHubZzFhRmgug4DLtA1KByPyhq3DdA3HAP4ab+0jb0Qoc
   1wBgGlQgupEmun5BDLocxzFA5p/GIqSu4aOYWqFEwO05fJX24t+iCV9Bt
   SjqpcnI3JhDiKlvch//mgumzdrWnUjrEsfDxWhhm62GN8eGkM/4r607+z
   w==;
X-CSE-ConnectionGUID: 7CDBw6NLRymNWgZy13TPvg==
X-CSE-MsgGUID: tKE25iAVRlCLOVCaJMgeFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="70238685"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="70238685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 14:53:51 -0800
X-CSE-ConnectionGUID: KdGNEnTJRE2UmZ6gol03TQ==
X-CSE-MsgGUID: 49Y6TmiDSAKtIA88Dsxb0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="196654992"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Dec 2025 14:53:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUuyJ-000000002UC-1zAi;
	Sun, 14 Dec 2025 22:53:47 +0000
Date: Sun, 14 Dec 2025 23:53:17 +0100
From: kernel test robot <lkp@intel.com>
To: Ivan Vecera <ivecera@redhat.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH RFC net-next 10/13] dpll: Add reference
 count tracking support
Message-ID: <202512142303.6pIiKWq5-lkp@intel.com>
References: <20251211194756.234043-11-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211194756.234043-11-ivecera@redhat.com>

Hi Ivan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dt-bindings-net-ethernet-controller-Add-DPLL-pin-properties/20251212-035305
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251211194756.234043-11-ivecera%40redhat.com
patch subject: [Intel-wired-lan] [PATCH RFC net-next 10/13] dpll: Add reference count tracking support
config: alpha-kismet-CONFIG_REF_TRACKER-CONFIG_DPLL_REFCNT_TRACKER-0-0 (https://download.01.org/0day-ci/archive/20251214/202512142303.6pIiKWq5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251214/202512142303.6pIiKWq5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512142303.6pIiKWq5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REF_TRACKER when selected by DPLL_REFCNT_TRACKER
   WARNING: unmet direct dependencies detected for REF_TRACKER
     Depends on [n]: STACKTRACE_SUPPORT
     Selected by [y]:
     - DPLL_REFCNT_TRACKER [=y] && DPLL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
