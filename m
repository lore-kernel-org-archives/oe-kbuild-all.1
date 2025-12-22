Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F619992C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 03:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766373857; cv=none; b=cKWHcymBkObZMRgdjJPUusfcRjUzIGCLtLzMu7pTJVRWrvaFiddC3szaMgUW6S4j1tyQ0IBN+NIyCR1KrAbYe7vzZD4o5XkfyiA/utrOj25fnW6UtFZ9VoLxdGtme8ErOoES2e986zepyELiZHXl/MSBiTzUWJtu/C5t1NhpMdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766373857; c=relaxed/simple;
	bh=g2XnjvWSlW6OJ207kcad+L/RygDjpZD1DEu/ieX389o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZD6/CYZki8I75Vkv8Wok4Nb/++t1HxCAsoxo3K0olmv8heAVOCxyvHeDfduoZ9EAIQoSSfXWFlVItt1dNv2q44eH8Z7kZ5JjAo+VE4Fu/C8G+39ZAn133ycivPlyOeRe/HQFdFtyJR/S2s5t8vHFhsmC/ckk95lpP+H3KodAhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYSi4/u2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYSi4/u2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766373854; x=1797909854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2XnjvWSlW6OJ207kcad+L/RygDjpZD1DEu/ieX389o=;
  b=gYSi4/u2Jv4mWb3v5AnKnfared9pfYc36+/Tz54WHyg/Qwjyi2SjmR33
   XWZGGSmY0xYsbtSL6+EMGFZtjpZUNdbzlLO+5z2bFyS7CzhVAM87ieG8w
   oePszGf5xOmnIu46C0yq719XIKMbpJHUugM6bDtmlQwCsnulTGKkkLZnB
   7CexPaaXmeoUk3k8oJ+H4T/Opgs5JoLa2pJ+5K4Cr/zRaqhrGeSKbKp+P
   2HpYA6119SjzcmbTcVIYYjXV+jZKlC1xChBeSgoYaXHYbpLEVES6NTyLr
   modjZCoBOB136rqSR+lVbmXFVzJCSctBsv7SJ+PSkagFP2d6Bw0bYaPdp
   A==;
X-CSE-ConnectionGUID: CVkYIvZ5TGmSVDvmmHps5A==
X-CSE-MsgGUID: vB9chS2nThS6+32f/3hCNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="70808261"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="70808261"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 19:24:14 -0800
X-CSE-ConnectionGUID: kd+ZqHbATaimPkMAZC5Ghg==
X-CSE-MsgGUID: bD6aB3bDRqOidGUL2ORbEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198570264"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 19:24:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXWWo-000000005Li-3RCN;
	Mon, 22 Dec 2025 03:24:10 +0000
Date: Mon, 22 Dec 2025 04:23:41 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for HVC_DRIVER when selected by
 GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202512220403.lceGIkKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 180e8150bde1627efa62910f16ff32d2e4fa85db [12/12] ANDROID: GKI: build in HVC_DRIVER
config: x86_64-kismet-CONFIG_HVC_DRIVER-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220403.lceGIkKI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220403.lceGIkKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220403.lceGIkKI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HVC_DRIVER when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
