Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D02733EAE0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 19:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767815053; cv=none; b=MUAhemjKQg0Z6OsNaARUnXA05SV2n9BrVooLKzv5YqEVjP8f6+lireK57efwK5pszq07mbHvgw1jwIJieRIBrF+XS2dG7soR9apz9gL5kY7Dih3XxKJDvHI0Pa8o2RDYO4sn8HbZvYuSjckuTVLnwNyAl60/tPEnsJ+tge+D818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767815053; c=relaxed/simple;
	bh=ecrjmWwMeICqv836gN3xD2ueXnPOAfbSEgKZWBJF9nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIApKpcpvoyeDR/L3y5qmsYORrcxKrjNr2W3akyrEhPk+WiLBBhAsT3eFyw+t8PNih6lURmTCENI4ciD3qJqdJemWxDPNUZxe19t+aexNXj0pGgut026DQxbzH/IR1qjJdFl+VA6axZkK4HpxU50ZmuzjG6y3p4YSyEDtlGUyII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkrxhdID; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkrxhdID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767815047; x=1799351047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ecrjmWwMeICqv836gN3xD2ueXnPOAfbSEgKZWBJF9nY=;
  b=RkrxhdIDCCMxm4BJKXPuNKV0vWRt2d6yCMzhLmDa73YP1BQaipjkMhj2
   56k0r1kHM+F0+/N3baHOwm/4Szfu0AjJtSlQaSIzZEDWUgnaa+143PEYs
   uyifIvM3jQ0bF5fhfc3TaIeKUEIkuT54v8bmYbufj3SaSEe8Ffhxg3xwh
   gxtCCq5mNRaF0MTrFtw6DFLiULeySBxpsqnIBQ+bagTg0NzOqLaAKIzmS
   QqFvGWsSvtiwoZt0gWoD/xtFTxI64PqRT1upqPfcvLKwH70cn0juUpdC8
   RglDOzMvAfmFzhW04Bcxm03BGA7yonSChxF/FdX9FHKeuLoUiz3qM89bi
   w==;
X-CSE-ConnectionGUID: ZRZf03bxTSSics8NMmIJ5A==
X-CSE-MsgGUID: r+1PITg6QFyW7u4hQhveHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94659885"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="94659885"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 11:44:02 -0800
X-CSE-ConnectionGUID: C6mZjKYjREyoVPPmOgjp6Q==
X-CSE-MsgGUID: H2h6R2iiRPer3D3VzttYvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="207153122"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 07 Jan 2026 11:44:00 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdZRm-000000001c0-1Ka5;
	Wed, 07 Jan 2026 19:43:58 +0000
Date: Wed, 7 Jan 2026 20:43:21 +0100
From: kernel test robot <lkp@intel.com>
To: Riwen Lu <luriwen@kylinos.cn>, rafael@kernel.org, lenb@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, Riwen Lu <luriwen@kylinos.cn>
Subject: Re: [PATCH v1] ACPI: PM: Introduce CONFIG_ACPI_S2IDLE for
 platform-independent S2Idle support
Message-ID: <202601072006.dGGykCqj-lkp@intel.com>
References: <20260107015907.1421272-1-luriwen@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107015907.1421272-1-luriwen@kylinos.cn>

Hi Riwen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.19-rc4 next-20260107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Riwen-Lu/ACPI-PM-Introduce-CONFIG_ACPI_S2IDLE-for-platform-independent-S2Idle-support/20260107-101450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260107015907.1421272-1-luriwen%40kylinos.cn
patch subject: [PATCH v1] ACPI: PM: Introduce CONFIG_ACPI_S2IDLE for platform-independent S2Idle support
config: loongarch-kismet-CONFIG_ACPI_S2IDLE-CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT-0-0 (https://download.01.org/0day-ci/archive/20260107/202601072006.dGGykCqj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260107/202601072006.dGGykCqj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601072006.dGGykCqj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_S2IDLE when selected by ACPI_SYSTEM_POWER_STATES_SUPPORT
   WARNING: unmet direct dependencies detected for ACPI_S2IDLE
     Depends on [n]: ACPI [=y] && SUSPEND [=n]
     Selected by [y]:
     - ACPI_SYSTEM_POWER_STATES_SUPPORT [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
