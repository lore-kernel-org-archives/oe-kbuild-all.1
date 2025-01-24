Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2431AAA09
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 17:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737740833; cv=none; b=l1kWbABOZuDJaCIBHjFzWhhr9C39ZIv0pT+bMICA4YgLy0B4KPsP/jliODif4/6iGf4jMW/Y2wBh/MCw6ithMKC31mKG1u63LC9BBGKDnrE0DDVz6XmFKC3ygn/ksETJEbj320GtmMwAAy1gylYf6rt334cvJxTFX1mDU3hzzBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737740833; c=relaxed/simple;
	bh=6ADepMKYirpMTrxst0YLoYBUDP0tpS1pr76MEHTlNmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCYobxfa/N4k6my00gtgknOaspnyns1fJ4qdaOELHsakPu7V+U5YoKLbl2wTBZ9Xi08jdJOhbOCXz3J0wFb4gcIk121NUrQBsWzbBr1KpgV6cbD4asRsdBj0yRjV4JvpXGsthFA0iev53NyoqgUoAJa1Uw7JiuSvGblaD43AetA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dE1NFQHV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dE1NFQHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737740831; x=1769276831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ADepMKYirpMTrxst0YLoYBUDP0tpS1pr76MEHTlNmE=;
  b=dE1NFQHVw0T3jjdiFKd1UP6M4/Wlu69/za7XBSl2n5XkdP6elMHRRGdp
   Ma/LQ8JXmdAhgefJFXJDJDuxBS36AUTAqfvjPoGLL6ifckA++vFRZVfhV
   kxoTD2TZS5sZrkfmzpLhAfSRe9p4dADLcr+pX6SQgu6r6E9S8YPlSqdMh
   NBpQYom/sY/aoh8FV5dymuLMznjz9YntyE4rgPgBe3RdPDh44SPNtM3Dt
   bvO2qMmARCcXiOmc54A8wOM2vA976llIv3uPpghkF0CDHCzGuglEx2zDR
   AKNJrZHnUhj6xbgJbusFjtTyeULakSrCtD7KDwocPbweDDlJ1dYqh3BQa
   g==;
X-CSE-ConnectionGUID: L9wlWlZjTTSIX98jRFcq7A==
X-CSE-MsgGUID: ou9sWFH9T0GTbPYjO1ALmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="37981478"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="37981478"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 09:47:10 -0800
X-CSE-ConnectionGUID: cSbgqhh3RwWyPur8n2U87g==
X-CSE-MsgGUID: GC9OvXWMTY+4zUWwYlK6Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="108363947"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2025 09:47:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbNlr-000cvr-0y;
	Fri, 24 Jan 2025 17:47:07 +0000
Date: Sat, 25 Jan 2025 01:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kismet: WARNING: unmet direct
 dependencies detected for SND_PCM_IEC958 when selected by
 GKI_HIDDEN_SND_SOC_CONFIGS
Message-ID: <202501250127.eqsWFVto-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1b5d5954f95917ac926fd7cbf5b8977925b987a8
commit: b4750d3d2c2b3951d97d6b2e8c5cbd84c34eb52b [1/1] ANDROID: Kconfig.gki: Add extra audio selections
config: arm64-kismet-CONFIG_SND_PCM_IEC958-CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250125/202501250127.eqsWFVto-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250125/202501250127.eqsWFVto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250127.eqsWFVto-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_PCM_IEC958 when selected by GKI_HIDDEN_SND_SOC_CONFIGS
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
