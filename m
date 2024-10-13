Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEDC804
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728812081; cv=none; b=UnyxuLizXttibf2TNXPIDXHIfI83NY+zx2pvEs+ig89oXEllrUeDDV+tBKX/HOXAXJuyd7kEw8uTftoC4Nshu6SKzMkfaWc73mV+fd/1BQMKpazYnSt/hjcQ20FGceA303jKETQoinOLwcQL2aqKpULAUZCOTt0gtkvXRmf81wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728812081; c=relaxed/simple;
	bh=TvRe0p+R4F6JC1nlGixYt6XWsUHWTSYpAlJw747vm4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4i81guhWypPx/oD4932rH0Rp1Pjq0x7NKc7yS8jeCQ/jq02HaNFPkqcmKIW+MRRDYRrs6jj2Jgl+nzMZhWi1rvLxw/HP7f1wBR6bglXi8NGEfXEAJyX5tMH5A3dOw5vTo5fA98ezYiS2JmE3qzkl2tXxanrY49fwYaVfRpR1x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCqH3+3v; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCqH3+3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728812079; x=1760348079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TvRe0p+R4F6JC1nlGixYt6XWsUHWTSYpAlJw747vm4o=;
  b=MCqH3+3vJ6Fgw4yQji0m+FW1dK19iJDB7FnwhEKh53FayHx7hKGJGR8Z
   IlD6hZ7tM0OW4U3VvEGZjP2jCX/jKucKH3o8Tq6sqbDPbnBheHPmLB/5b
   x5U5BJok23RVswyuXnHU5e5wfL8K/GKmzWfQLuGcg2PZAnjHlSHbiE8YA
   j/1FDtsLQQkPZEmc4wsaA2r7CGfa0ABAjL3jmPcYVAkLspZLeIBF7GEZy
   OoP47AjWCfj4l7LWP97gH179qjMw99SqekGqd2qI8RGgFCM41UlHZVyaq
   S7SCVTw0KNhVq4d78wUk370z6iFk7KP0aMBfLmpLZb3061GkSUir3BbFR
   A==;
X-CSE-ConnectionGUID: cCz+QGLeRRiXZBwBq96n7A==
X-CSE-MsgGUID: +P8SumUDSVqWdoOc8VVmNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38805512"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="38805512"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 02:34:39 -0700
X-CSE-ConnectionGUID: WadyuVbMTRCYa4KZVanvvw==
X-CSE-MsgGUID: uSXBcAKFRHGLRsn3dasBkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="81302790"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Oct 2024 02:33:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szuyp-000EFf-2k;
	Sun, 13 Oct 2024 09:33:39 +0000
Date: Sun, 13 Oct 2024 17:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH v9 net-next 12/15] virtchnl: support
 queue rate limit and quanta size configuration
Message-ID: <202410131710.71Wt6LKO-lkp@intel.com>
References: <839002f7bd6f63b985a060a51b079f6e6dbbe237.1728460186.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <839002f7bd6f63b985a060a51b079f6e6dbbe237.1728460186.git.pabeni@redhat.com>

Hi Paolo,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/genetlink-extend-info-user-storage-to-match-NL-cb-ctx/20241009-161414
base:   net-next/main
patch link:    https://lore.kernel.org/r/839002f7bd6f63b985a060a51b079f6e6dbbe237.1728460186.git.pabeni%40redhat.com
patch subject: [Intel-wired-lan] [PATCH v9 net-next 12/15] virtchnl: support queue rate limit and quanta size configuration
config: m68k-randconfig-r121-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131710.71Wt6LKO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410131710.71Wt6LKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131710.71Wt6LKO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/i40e/i40e.h:11,
                    from drivers/net/ethernet/intel/i40e/i40e_main.c:13:
   include/linux/avf/virtchnl.h:171:43: warning: division by zero [-Wdiv-by-zero]
     171 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/avf/virtchnl.h:1505:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
    1505 | VIRTCHNL_CHECK_STRUCT_LEN(12, virtchnl_quanta_cfg);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/avf/virtchnl.h:1505:31: error: enumerator value for 'virtchnl_static_assert_virtchnl_quanta_cfg' is not an integer constant
    1505 | VIRTCHNL_CHECK_STRUCT_LEN(12, virtchnl_quanta_cfg);
         |                               ^~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:171:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     171 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/virtchnl_static_assert_virtchnl_quanta_cfg +1505 include/linux/avf/virtchnl.h

  1504	
> 1505	VIRTCHNL_CHECK_STRUCT_LEN(12, virtchnl_quanta_cfg);
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
