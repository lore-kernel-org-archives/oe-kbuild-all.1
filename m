Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7717A3EAC79
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 20:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174146; cv=none; b=p+ZmuMfUUN5kGaAzhkCO+k7GBKOq3H6A4Zf4aGsnWupPGy7rG97IqHDHO6aie+zpmAxVzKVIEqBgePbESISf137zGaXneJ0FftihU+9k6zSlLJpZrD2G5RvSa7cFv44lMGDCUumRinWrhqcHVgKmOzPSppNPvfN/plMpLf4+Lqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174146; c=relaxed/simple;
	bh=PMkXFNkNV+Amu/MmJHelepozqduhcpCJ9xFUO5KFsGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQFYYazs3PI8ZrYqoK5hFOGKpMPaLq7dgmBM4STUciH3+dIiLAuO51yOq9nee3AtmHVZL7VEl5/BkQOVu8bmh9yyzHnAEyk7zEj2YU2qY5RNmZZESnen671/m1HpxLul+43YB8NszqTgfABbXIsqogdqKQW8cQTskFgnnRluPrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmyIFTr/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmyIFTr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773174144; x=1804710144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PMkXFNkNV+Amu/MmJHelepozqduhcpCJ9xFUO5KFsGo=;
  b=NmyIFTr/S8eml2CufQ03I3Ue4Qw6teQ91Xa7uWowl94P0GxfymM1L5rW
   PCaKTAy1u9qNS+NRgeO0NyrTRXRUAWvzENrHY+06ySt3ZX0TBTGqVkl4O
   w2sBLkoWdbefOWqqQzciWFvW6VOCIJ1Q+F9HRe7e19LZiBXncfZk2NTcO
   KCBH2D82h9cSrIAgPWgdDY5WwDouC/hlUGoePyaMRXqjCwnrX4Ycw2PS0
   2whFf1Zv2peat2lUUMIWv4xh7MQRq1/1ZthLh7j0cR4wRwbIYjwiPGwdv
   G9vf1fdOx+zGyTrYYzdV3ZLwebaHFvUU3kEPsT0pXqn3NM6x0BQH7nUMJ
   Q==;
X-CSE-ConnectionGUID: JXFLjHuWTGaCOjNLhl2fMA==
X-CSE-MsgGUID: lomhfy1FRO+8CeXrhtRWig==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74149280"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74149280"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 13:22:23 -0700
X-CSE-ConnectionGUID: LO42DsZbRwCd5l0mnq/mbg==
X-CSE-MsgGUID: jvhGnfGMSuqPb7fZI3DogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225193909"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2026 13:22:19 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w03aq-000000000Fq-2wxt;
	Tue, 10 Mar 2026 20:22:16 +0000
Date: Wed, 11 Mar 2026 04:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com,
	lakshay.piplani@nxp.com
Subject: Re: [PATCH v6 6/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <202603110450.w8GEwjjv-lkp@intel.com>
References: <20260310065727.3759342-6-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-6-lakshay.piplani@nxp.com>

Hi Lakshay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on i3c/i3c/next]
[also build test WARNING on lee-mfd/for-mfd-next broonie-regulator/for-next linus/master v7.0-rc3 next-20260309]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/i3c-master-Add-the-APIs-to-support-I3C-hub/20260310-150040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260310065727.3759342-6-lakshay.piplani%40nxp.com
patch subject: [PATCH v6 6/7] i3c: hub: Add support for the I3C interface in the I3C hub
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260311/202603110450.w8GEwjjv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110450.w8GEwjjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110450.w8GEwjjv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/i3c/hub.c:120 function parameter 'mode' not described in 'i3c_hub_master_priv_xfers'
>> Warning: drivers/i3c/hub.c:120 function parameter 'mode' not described in 'i3c_hub_master_priv_xfers'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
