Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC01A2F5E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 00:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740874775; cv=none; b=QMM+BUUDhXWH8qRgjCVxxcTi9MDqPqfotBmdm6Bzoa4zkMTYr2YCcJxRmli7ZIg3tA5dFCV2521o/sCZU4yI2R2OhNI87eKOwO/ysQaknuFbXz4C5ltY2uTrxHUhp+lsdFZxQpqMJX1mZt81nQNIuVuiryMEvPRd56177/dlBYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740874775; c=relaxed/simple;
	bh=khxyrezO8nqpahVCf2/lhhvkGXHI3BhLhV+p1m2HVaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhWTlm1xcTxuCS4hVGRlQyRATZCkNhB/kzK74sf33jspMg/880QtTbAE8OYlHWzg6odUyeTBn37ycsmZKIn9IBaIa8Z8Vsz8gHevTam85kKbkmiYkHhti7nbo06PBHGfWUWRKwlb0NKZwFeBwNpXymKZ003rMn3vLV/FYFT4ibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MH3ovFPw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MH3ovFPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740874774; x=1772410774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=khxyrezO8nqpahVCf2/lhhvkGXHI3BhLhV+p1m2HVaI=;
  b=MH3ovFPw7R47pl1SXCQsK2vsTpLYdYR1XZoz6UQj3txqmV6qXVNDs6tK
   OPlPfFlB7Jmc9aoCRaAC9wg75Je1iAoLfXNtTBjTJ8Pg/V1BeybXSd8l9
   OhxYQ3whGxv0cN4l8WNATZJcvsAC3ztwIU/73naMFV/cP7Z+0gwwKcrSJ
   CKCIGZ6NlXK9zHLBSw7+7pBQ6fGJy1SVJ0e62jL3+j4ZAFPfhdg1NfR/i
   7A5hYEKa5VSusxz+E9NQDouH8GdZq178OLjPKkyKEP9qcCIcJykAuFKr5
   TMs/1OXZjfa0dwLOFNnAytAE48J+SiWzWbntgA1D2fXsvOsRXp1hVcsmf
   g==;
X-CSE-ConnectionGUID: vdvsO6b6RqmIBGysfQgT+g==
X-CSE-MsgGUID: DhpiejOUSWuPNsqu7d74wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="64235871"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="64235871"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 16:19:33 -0800
X-CSE-ConnectionGUID: p2FK93+VSIijHawX5PVPOA==
X-CSE-MsgGUID: 3ty0ZCIKTwK7J3o3Wjg+YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="122271516"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Mar 2025 16:19:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toX3K-000GsI-0N;
	Sun, 02 Mar 2025 00:19:30 +0000
Date: Sun, 2 Mar 2025 08:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-02-27 38/38]
 sound/soc/soc-core.c:2788:56: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202503020819.stIyVqgS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-02-27
head:   de2c73a6f02d8227a64b30dfd730a6596ebde13c
commit: de2c73a6f02d8227a64b30dfd730a6596ebde13c [38/38] ASoC: remove component->id
config: microblaze-randconfig-r123-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020819.stIyVqgS-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250302/202503020819.stIyVqgS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020819.stIyVqgS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/soc-core.c:2788:56: sparse: sparse: Using plain integer as NULL pointer

vim +2788 sound/soc/soc-core.c

  2776	
  2777	int snd_soc_component_initialize(struct snd_soc_component *component,
  2778					 const struct snd_soc_component_driver *driver,
  2779					 struct device *dev)
  2780	{
  2781		INIT_LIST_HEAD(&component->dai_list);
  2782		INIT_LIST_HEAD(&component->dobj_list);
  2783		INIT_LIST_HEAD(&component->card_list);
  2784		INIT_LIST_HEAD(&component->list);
  2785		mutex_init(&component->io_mutex);
  2786	
  2787		if (!component->name) {
> 2788			component->name = fmt_single_name(dev, 0);
  2789			if (!component->name) {
  2790				dev_err(dev, "ASoC: Failed to allocate name\n");
  2791				return -ENOMEM;
  2792			}
  2793		}
  2794	
  2795		component->dev		= dev;
  2796		component->driver	= driver;
  2797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
