Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A135171E65
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077732; cv=none; b=johuGe2HhFMTzzmfRKgiqwM0//y3urmfqgiIDgHc5cjhU/5WdAinobpy4xY0/BbDgUax/6WL0kmPbk0qEWiwIML/NRB6pj5ylxIFkTs3a6i5nHrNv6FJWWZAg/ePk0aE2huwpzXHBoJvwhZ2PUV8e8Ql/LD+x2yPkVTyJA0JKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077732; c=relaxed/simple;
	bh=cRoQq3SkQl/kbqzk47cW58T+5z0tbfaPNP42xHDQGss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVVwsDYxgzL82yZk0ni9b66SkWXwMyUm/K6kV30C4xAVMqsEQuo1gnUJEORkCdAqG80QzdJCuRZnnAkrY3RxDPCW3j+NAvnaU2UOt6rUsersURNiFev9nyuwryK3sPPvW1eztsAvi87HmE5dth90YUSPHX+nWgocAH0pq03xNO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGtWGepa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGtWGepa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729077731; x=1760613731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cRoQq3SkQl/kbqzk47cW58T+5z0tbfaPNP42xHDQGss=;
  b=jGtWGepa61XaEo9A/KXlCfThfzp/wx9uynGI/hTddD26bXS6iXgEPHZm
   luf43XCAkD8d+mtDfK/Tw/o7o/lqZGpaiwPCYWsNmgoWn7tlCkw4Wdk7I
   JotR2vnE39dxnpD0oTZH1rMmA953UPg8F1qychJm8azO2qH0EcuilqD4I
   7Lcsw7MQEc3gppgau+ugzYcMisZXLtXEJF458rhPhh7mFeqB8dvzZGtLC
   OD/ZFOkxeccvARq6x+omGXwrhin6S09cf4w+xcWVLOvqzaZMiRSpG/tgW
   YXzpJG+ZEVOChFRJQiP2ougeyZpSNMlqsJLGkOC8+YxuS+lejEBH8jB/x
   Q==;
X-CSE-ConnectionGUID: kXC2li0ATs6EVkATDZ64AA==
X-CSE-MsgGUID: FrmG8SCoS8uHm+f5tPWmfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39150869"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="39150869"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:22:10 -0700
X-CSE-ConnectionGUID: U7LFJH7QRSqshSjXlk1HBg==
X-CSE-MsgGUID: 5gT/M2lZS6uf7lsArgCkew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83005833"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2024 04:22:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t126R-000Kpt-0j;
	Wed, 16 Oct 2024 11:22:07 +0000
Date: Wed, 16 Oct 2024 19:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v11 06/14] iavf: add initial
 framework for registering PTP clock
Message-ID: <202410161910.syepGNce-lkp@intel.com>
References: <20241013154415.20262-7-mateusz.polchlopek@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013154415.20262-7-mateusz.polchlopek@intel.com>

Hi Mateusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on a77c49f53be0af1efad5b4541a9a145505c81800]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Polchlopek/virtchnl-add-support-for-enabling-PTP-on-iAVF/20241014-174710
base:   a77c49f53be0af1efad5b4541a9a145505c81800
patch link:    https://lore.kernel.org/r/20241013154415.20262-7-mateusz.polchlopek%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v11 06/14] iavf: add initial framework for registering PTP clock
config: i386-randconfig-141-20241015 (https://download.01.org/0day-ci/archive/20241016/202410161910.syepGNce-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161910.syepGNce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161910.syepGNce-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: rtnl_net_debug_exit+0xe (section: .exit.text) -> rtnl_net_debug_net_ops (section: .init.data)
>> ERROR: modpost: "iavf_ptp_release" [drivers/net/ethernet/intel/iavf/iavf.ko] undefined!
>> ERROR: modpost: "iavf_ptp_init" [drivers/net/ethernet/intel/iavf/iavf.ko] undefined!
>> ERROR: modpost: "iavf_ptp_cap_supported" [drivers/net/ethernet/intel/iavf/iavf.ko] undefined!
>> ERROR: modpost: "iavf_ptp_process_caps" [drivers/net/ethernet/intel/iavf/iavf.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
