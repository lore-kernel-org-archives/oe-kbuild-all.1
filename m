Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854D06F2F2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770293126; cv=none; b=J0lXJh17PDo0vyYgm9aJpcXxiNWh8/RLy4c/A4A2dQC/MSwNL/GPFjnamx4MV1O8wuaElEMHFEv16ouyqlnYnI+lwzzHx8wYQ0FaZdSqbHO1VLO+iHYyqsgCetYJd5IoIei3C/UsZ63ougzj3RxpriTwdMX5H8VUC5yyYK/21gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770293126; c=relaxed/simple;
	bh=PvpEIflrI3jube+dof3G46lnAM3qwdqpt5PMLsDqQqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elD3UT+skUOWiyAncSq+HZYZE/kycgbaZq+Dv+S43jyhzFnl6rs0RpTm3FyzDWNTm0BQMJ8e8yItxyogOtbZi23P5jtl18ShIP8RI0Zpsfg2yn/8KBYkiyX63Vlq3Mu59ELfLNyOAl8y6Osq8bvhS/LnWK6CX1yjSygHuJhfoOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYvcrMZo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYvcrMZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770293127; x=1801829127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PvpEIflrI3jube+dof3G46lnAM3qwdqpt5PMLsDqQqU=;
  b=BYvcrMZo4byp3G6FdBZLXocIvGXeeCuUxSVYAHGOq5VmJVvdiY56IuX0
   AQPvOGkbivmt7T0HvPIzvKxpn9SDOX38JXyh7Hrss/nLkQBb75WULQtLM
   EO+I/moyqO2pf2VvGz+omo8K9/k0+UYFs1i6oUu9t7ksUVoRzPU9kYp7x
   J7ioDP8QAwxDDpI6pJsEofK47kCBFS/COFyt76rFqSHxkOho6NM/4tDjH
   2yOaii4hnbOfzIRfR+3RxGLMVAf8fRRkX7O6I7vYtGhafvaxlfaVZfWsQ
   JlvKF5FwRj7VoRQ0GCejWbqLBBh1zVzHiwT+gy9BDhAAhheVEwxg1dDAe
   Q==;
X-CSE-ConnectionGUID: +UGnoiihTkiUUh+cjDHV1w==
X-CSE-MsgGUID: YzQDFwxxT9qIcwFG3hMfKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71217131"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71217131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 04:05:26 -0800
X-CSE-ConnectionGUID: YwZjDSiARdSewJfp1dwIrA==
X-CSE-MsgGUID: UaKJHZ5MQVCI/xGY89Dt9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="241174396"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 05 Feb 2026 04:05:23 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vny6q-00000000473-43Of;
	Thu, 05 Feb 2026 12:05:20 +0000
Date: Thu, 5 Feb 2026 13:05:12 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>, pasha.tatashin@soleen.com,
	rppt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, pratyush@kernel.org,
	linux-kernel@vger.kernel.org, surenb@google.com,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] kexec: allow KEXEC_HANDOVER to build with COMPILE_TEST
Message-ID: <202602051345.Yz2vgJHk-lkp@intel.com>
References: <20260204182816.2463931-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204182816.2463931-1-sashal@kernel.org>

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc8 next-20260204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/kexec-allow-KEXEC_HANDOVER-to-build-with-COMPILE_TEST/20260205-023202
base:   linus/master
patch link:    https://lore.kernel.org/r/20260204182816.2463931-1-sashal%40kernel.org
patch subject: [PATCH] kexec: allow KEXEC_HANDOVER to build with COMPILE_TEST
config: sh-kismet-CONFIG_CMA-CONFIG_KEXEC_HANDOVER-0-0 (https://download.01.org/0day-ci/archive/20260205/202602051345.Yz2vgJHk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602051345.Yz2vgJHk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602051345.Yz2vgJHk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CMA when selected by KEXEC_HANDOVER
   WARNING: unmet direct dependencies detected for CMA
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - KEXEC_HANDOVER [=y] && (ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE || COMPILE_TEST [=y]) && (!DEFERRED_STRUCT_PAGE_INIT [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
