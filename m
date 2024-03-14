Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A5F621
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 22:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710456950; cv=none; b=p5WKczS/7nakyNpsWF2IjO5dVHsmekdyh2/Fc7Oi0h/05HUaQIdLpG9Cssy5TuFDZ6+VKjGrXn0SMKazELmkxTh3A030SsNIzDunjKIGVvQ1Ux7PPCoaXaG/yz+72QaYuduu63FX/XqXLhX0pYHoY6h1TQ9e0sfsDclyAYuhvQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710456950; c=relaxed/simple;
	bh=PwoIL4OJenZ5+AqNnzMMF0L2583f1k2RbFMePNrynkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0KOLTbuySsKm7zDFrPBnaysLAw66bl3k8Ih2KK5P3OoY35dkAiC2lN5sZDWRd6qZLpZEvtk0W90JlC+o+FoVXO/QJmRVwfR6Ji3Q93j6JYJzJJnHtNowe7F+QCpbXpTf0hp/gwm2GnVFL0rDpz0GgIP/GlHZ0QqZc8TMLtbcNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbVOz+bk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbVOz+bk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710456947; x=1741992947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwoIL4OJenZ5+AqNnzMMF0L2583f1k2RbFMePNrynkU=;
  b=PbVOz+bkKAJh+T3tNWBOnPy+iICaOraJuWf0ijHca4fxHNNacAp/3njb
   2ekFBwBIYrf51NxF7uNu+wndS9VpELFzx8lmOyGF2y9aOmo2lmEILukyb
   OJD7TvR7A4wOcILjiEyWtBED0/fmCx6saygaxQf8JkGZsQAGY8wc64Cd1
   YDpyVoL16EWht00xQpzF9El6QniLHi4httAN5Io9ymF0ECCoWv8EoCF4J
   VJvEr7EMsuzIReEArenOaQ7HtdloJbF98uBZvtI/Dk9fvgSOiMJ+QrSfo
   ZwpmKGB19S2ZWFaGipEzii5TokJ2rqHyztekl2L4L7Yd1PGUi0OIc3UBu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5437793"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5437793"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 15:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="43489647"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2024 15:55:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rktzE-000DrV-0t;
	Thu, 14 Mar 2024 22:55:44 +0000
Date: Fri, 15 Mar 2024 06:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 8322/29228] kismet: WARNING: unmet
 direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by
 GKI_HIDDEN_SND_SOC_CONFIGS
Message-ID: <202403150639.t5N09Ui2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d24801ee88749d3bff9f942f228c42a76d4edc48
commit: dd17237d7284a4f7a881bd3c746e299f5b4675da [8322/29228] ANDROID: gki: build-in DMA_VIRTUAL_CHANNELS
config: i386-kismet-CONFIG_DMA_VIRTUAL_CHANNELS-CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20240315/202403150639.t5N09Ui2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240315/202403150639.t5N09Ui2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150639.t5N09Ui2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by GKI_HIDDEN_SND_SOC_CONFIGS
   
   WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
