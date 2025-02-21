Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBB41BC09A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740173436; cv=none; b=ryGG1O9W3BYZ44881fTEeZUrjEiP0mU6VzdTQoUOnt0g9WTXQ3tIXFjGiP+ZvyGnVHPBgXC+REexlC263xJNUQLI5n50s3SVVNvs4FaPe6+wUSe3qQS/zqGPwRGyVWn22/4Yajk46k1JcGpPyGtvth+otLnlc64CQU8zxkV/P0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740173436; c=relaxed/simple;
	bh=XN1ox8EIMKsf74qc8c6zwiUCOddxBsVcpOY1MDYANPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GU1LOpPMTwrCdKzdvjKu0QkMlh3hpdmpBTfKJpwa24ar5IhvH8gEp92rGeOD4p1uuJbRY7SOK+tJ5AzfXaCdXlH74Iv71scHyiwYVQfKx7bzaOlkw+96KOI0/RfdqzkZIt8xL/OoLEVL7KNJgMD66cBrDR42/42Osjc4wqIz9pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRO5YKbM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRO5YKbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740173434; x=1771709434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XN1ox8EIMKsf74qc8c6zwiUCOddxBsVcpOY1MDYANPc=;
  b=gRO5YKbMwmZGvFAaHl1Z0bVfuFDM+Z3aJ5N06SpP4HRKuJGfdg75WSrq
   KEqUMZDMEstp+nJxQpi/7tg11vTgbtkF8gPbvckI4/ErjvIY6vjxMhDEI
   CfiTzS/pn1HARFgiDR3BNmydhsTXNW29sKsnpPyCumY5fW6Kz16CL5+Do
   Fk0lf1HB/IzahLSaZN/vpxgQq5gJLwbwj8E4PwZGcreLMsHtrwIp+peXS
   AyrFAPCCbd5QcW4iZh2Ixe8QuyWy0orCecwrUypK8QMjiviGKO4C5jzfI
   YlylQYIQPxjsPB4eK/FDThlg6ksBHISf2FhhGMOUTKyzpz2lxj+CnelbH
   g==;
X-CSE-ConnectionGUID: UqVUJkOAQuSla1BkMvou2A==
X-CSE-MsgGUID: DbYWxtYUQZe0IpbUnj9GDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44655198"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="44655198"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 13:30:34 -0800
X-CSE-ConnectionGUID: EqIL2QWVQhK0+ikXpATiqw==
X-CSE-MsgGUID: W0LixcomQbyPQKpRBaZgBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115491359"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Feb 2025 13:30:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlabN-00062R-2J;
	Fri, 21 Feb 2025 21:30:29 +0000
Date: Sat, 22 Feb 2025 05:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 4334/5524] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by
 SND_SOC_SOF_AMD_RENOIR
Message-ID: <202502220509.fiQs2qN2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: f120cf33d2325fd95d063eccbff2e86ffc7f493a [4334/5524] ASoC: SOF: amd: Use AMD_NODE
config: um-kismet-CONFIG_SND_SOC_SOF_AMD_COMMON-CONFIG_SND_SOC_SOF_AMD_RENOIR-0-0 (https://download.01.org/0day-ci/archive/20250222/202502220509.fiQs2qN2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250222/202502220509.fiQs2qN2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220509.fiQs2qN2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by SND_SOC_SOF_AMD_RENOIR
   WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && AMD_NODE
     Selected by [y]:
     - SND_SOC_SOF_AMD_RENOIR [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]
     - SND_SOC_SOF_AMD_ACP63 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
