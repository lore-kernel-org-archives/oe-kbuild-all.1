Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D1D2E5B1B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770459761; cv=none; b=ITcyDG7/maA1qatdSFffNs5ocNdbE/XdUmkQxkjgdq5hwOzWOpTTAltnIw3tXeKIC+INj4KJe2Gcp5GmlrtaFn3RvArQ03Nu1t07TOwhgw/Abo/vFDgtkW8YqECspF9BB7XkJz/74PkD7mU1S/kRVTTd/WLRoB5E0GKHa78R840=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770459761; c=relaxed/simple;
	bh=ovYHp3djx6U43ZDjPLOwvoRiMT/eVJ9R/QgpaD4Rf44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/JuezIT5MjGdT4xCcq/H1oioLhVl6/jC3XJGRcLkinP2qUrfy7pimPl+sIQVDGMUNrebvIIZWBGDPb7+G6r9LYxm7s1LW+IRtxXCou6ACAPbU780VX41Qe+vbjvYiJ25bW/F03EH5VscCem+h/FttH2W7wqES1UiulOGJwChmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bC+6CpZN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bC+6CpZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770459761; x=1801995761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ovYHp3djx6U43ZDjPLOwvoRiMT/eVJ9R/QgpaD4Rf44=;
  b=bC+6CpZNVbzYV8/r93Our/vEGANVzVKjKAYkiC3BBLNCv7ibwg4YlGJW
   wvov1X+rr8X4wE3qwbWDJjewByQuVnOhrmxR1lzS+At6sP3JwmQLCMHZS
   lDyTJe8x4yYtXwgfR2i3BrTxjy4D99RUbA8fD4ng984jisbmrhlgy1jLC
   XK1GBpeXKQxjWNh6Jk0nH7LUhPwZjZGLribCvjK7LwJIpYq5YrzIIFnfO
   v1qKN51uTHprMCUgcAtyMWHNiIMc7wE2/gofSYfNxu150teQQQFYggdZT
   /30gk1VhYjUGOM+yIh4qERqQdcUG7uz4/Vd+rRYEziQixoAQSP2kmQbf7
   g==;
X-CSE-ConnectionGUID: ZN1XTMBySoiRt3IlbfXA1Q==
X-CSE-MsgGUID: 14wXm+WjRdmDrJHpXMazvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="97108822"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="97108822"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 02:22:40 -0800
X-CSE-ConnectionGUID: AeuLi+Q/T8ab1NWaF5eQxQ==
X-CSE-MsgGUID: 0gxCslCwSka3WR07kwIqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210896955"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2026 02:22:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vofSW-00000000lYy-3VdW;
	Sat, 07 Feb 2026 10:22:36 +0000
Date: Sat, 7 Feb 2026 18:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 08/11] riscv: hwprobe: Introduce rva23u64 base
 behavior
Message-ID: <202602071818.IUO6Uo0g-lkp@intel.com>
References: <20260206002349.96740-9-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206002349.96740-9-andrew.jones@oss.qualcomm.com>

Hi Andrew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/fixes]
[also build test ERROR on linus/master v6.19-rc8]
[cannot apply to shuah-kselftest/next next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Jones/riscv-hwprobe-add-support-for-RISCV_HWPROBE_KEY_IMA_EXT_1/20260206-082824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git fixes
patch link:    https://lore.kernel.org/r/20260206002349.96740-9-andrew.jones%40oss.qualcomm.com
patch subject: [RFC PATCH v1 08/11] riscv: hwprobe: Introduce rva23u64 base behavior
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260207/202602071818.IUO6Uo0g-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071818.IUO6Uo0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071818.IUO6Uo0g-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `hwprobe_isa_ext1':
>> sys_hwprobe.c:(.text+0xb1a): undefined reference to `riscv_have_user_pmlen_7'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
