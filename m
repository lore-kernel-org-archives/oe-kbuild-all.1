Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB971A6817
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 01:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773190832; cv=none; b=TYpz4aHe5O7NcJb0Amyud3EIx9cE9s8MbENpbpyNbg5uOUPH9adThiCrT089E1qW9lX2ZuDs+WpCVkRlw6c4YWBsEMygH/GZ8qyIVVlFm1ocVjnr5vKzNTnUq2uZrc23ULM5lomtWf/XB6JBe6Hak55B+HEjSbjKK32dULyUdy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773190832; c=relaxed/simple;
	bh=2nRyGCp/u/t48t6g/TeP3eA6TCsz9hD8l7/U6aBpPlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/vgK8S7hd3EvgccJzFoOGx/SzoDHVok7jxk7CP0SrFC7UKCE48ZMPApq4nVaL2tVNNA/ibm20iw0QJE/f1mbeN0cA8sLwHIWWSdKX7LACx2qJGtLD29oN8mNKKtkKKhnIA/rajKgojO4KoUlCyaJlGGASexOzfSgpjzloZdnAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdqMaCDL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdqMaCDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773190830; x=1804726830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2nRyGCp/u/t48t6g/TeP3eA6TCsz9hD8l7/U6aBpPlw=;
  b=kdqMaCDLTMrMMhKpgZIb2ZCd4v6MFRnBXhYdPuc77zofWHtaPT/xHDp1
   OQKBdZGdKDtdN9+UvJcT0rlKidJUZRseMY7w0Danw+nxVlYF2rsGc+Cze
   oJTRV9T7ptrS/PSprXekv3cq4ocGBsszV1h/zPoOs1y87dvGvv3yiggZd
   +G3pCxKejLTQH4vvpI7o40Ac2QAz6NuPi3xWlNs+B3CPpdA7NF6VMZdse
   CRhV/4PjK0ezhyPvLYyyT5RD6HrY0i7jlJlQVfZAh1QqY2kX+cREmbEMV
   fWnfC1eKvESvaJO01GeenJXwM/nSAGeIAR+Yyuqa3Dbwd5Lw4wd261CNK
   w==;
X-CSE-ConnectionGUID: qZ9amCH3TD6sb6nF+WpFTA==
X-CSE-MsgGUID: 2Tr+eV+0TfugIxPtwTcRaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73448440"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="73448440"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 18:00:29 -0700
X-CSE-ConnectionGUID: QV6pcc3jTFqGiNjRTI7yTg==
X-CSE-MsgGUID: UOIGKUdHRhGE065+kWWlVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216602576"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2026 18:00:26 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w07vz-000000000Td-1wcb;
	Wed, 11 Mar 2026 01:00:23 +0000
Date: Wed, 11 Mar 2026 08:59:55 +0800
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
Message-ID: <202603110810.eZLkgGbx-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on lee-mfd/for-mfd-next broonie-regulator/for-next linus/master v7.0-rc3 next-20260310]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/i3c-master-Add-the-APIs-to-support-I3C-hub/20260310-150040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260310065727.3759342-6-lakshay.piplani%40nxp.com
patch subject: [PATCH v6 6/7] i3c: hub: Add support for the I3C interface in the I3C hub
config: s390-randconfig-001-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110810.eZLkgGbx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110810.eZLkgGbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110810.eZLkgGbx-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_disable_ibi':
>> hub.c:(.text+0x344): undefined reference to `i3c_dev_disable_ibi_locked'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_enable_ibi':
>> hub.c:(.text+0x43c): undefined reference to `i3c_dev_enable_ibi_locked'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_free_ibi':
>> hub.c:(.text+0x508): undefined reference to `i3c_master_direct_detach_i3c_dev'
>> s390-linux-ld: hub.c:(.text+0x51c): undefined reference to `i3c_dev_free_ibi_locked'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_request_ibi':
>> hub.c:(.text+0x5e2): undefined reference to `i3c_master_direct_attach_i3c_dev'
>> s390-linux-ld: hub.c:(.text+0x644): undefined reference to `i3c_dev_request_ibi_locked'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_master_priv_xfers':
>> hub.c:(.text+0x78e): undefined reference to `i3c_device_do_xfers'
>> s390-linux-ld: hub.c:(.text+0x7b8): undefined reference to `i3c_master_reattach_i3c_dev'
   s390-linux-ld: hub.c:(.text+0x7d2): undefined reference to `i3c_master_reattach_i3c_dev'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_master_send_ccc_cmd':
>> hub.c:(.text+0x88c): undefined reference to `i3c_master_send_ccc_cmd'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_master_do_daa':
>> hub.c:(.text+0x92a): undefined reference to `i3c_master_do_daa'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_master_supports_ccc_cmd':
>> hub.c:(.text+0x9ae): undefined reference to `i3c_master_supports_ccc_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
