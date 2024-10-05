Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D4BE6C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 23:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728172174; cv=none; b=g3wC4Be3UNLJH+zxs0l9W9rkoL9jXh5dQrsFdw2DzyQT2GMmffLLY8Ea70G8JUUhG134D9f65OOtQ36n0up7+5l60vHlnGKDS8yhY0tYnVHLwwK76ZZBJiwCZfz0lKtbWdiTij5RoNmAXo5tUk11rRDiEBd39fd8hjxGVrcMAcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728172174; c=relaxed/simple;
	bh=hLjP/E/l6sEgJJFj0cMhdIKNc54pVb7cu5BC0Z0mVQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nf8f1vxVCCVezU+HmjoVSYeCOWQzO5YCusEgDCDX+qldWCInSoRpg43reLP6gQlVZoKR+Ho0H7Llpd3qAoaizez5UJNWL3FGAD27JDPhd/VZpblBr31DYjFZ/cwS9DVudnoYoIAdhZ5Q6Dlbg2OXXzAxn2AdCULh7fEb3e5Q9eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8vjCCPz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8vjCCPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728172172; x=1759708172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLjP/E/l6sEgJJFj0cMhdIKNc54pVb7cu5BC0Z0mVQk=;
  b=D8vjCCPzdeZf+DqGUhZURwzhJQcl8G1a+jpN/OrbaJI4KDX5KDSQFbn9
   8R7o6CJrY2xzr3vzkugQIGMp0VDCEFtY4TOnW7hVbFNxmhJsV9KorvvUb
   BPyHjb+/scrZ8JEZ+aiBpiFoD1YC3GvC+uWvGJUAuEf7E0rB2EaD+ZsmD
   D2vTHTJzAOEANnVGjjbz2Kbl3J611NOzE+jZZ8QPmHLIjfNdm3hs+jwla
   /COD8BpVuZXgB8ezO1hgnOtHI1c0h42E2h8vtYpYWoNjigBYlJileP0Xr
   k2pwx6okJ24CrSz2uLocxIivpezhjVv9AZ3BAM9PBHtcBwdHQ4BoQlwTx
   w==;
X-CSE-ConnectionGUID: RC2jBzKaSIWbtP1hZQisrg==
X-CSE-MsgGUID: rQUZMx6ESH+x6dpWuZ2STQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="38015525"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="38015525"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 16:49:31 -0700
X-CSE-ConnectionGUID: 9jDvfEyuRCC0ldBvpElt0g==
X-CSE-MsgGUID: jado5TjSTA+uk9s5+L9oSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="112548547"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2024 16:49:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxEWe-0003Sa-20;
	Sat, 05 Oct 2024 23:49:28 +0000
Date: Sun, 6 Oct 2024 07:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 3328/23811]
 drivers/char/ipmi/ipmi_si_intf.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202410060723.NM8MwCWb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 221a9ce1bd3b42ba2226d22663110aed96ae471b [3328/23811] ipmi_si: Fix crash when using hard-coded device
config: x86_64-buildonly-randconfig-003-20240925 (https://download.01.org/0day-ci/archive/20241006/202410060723.NM8MwCWb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060723.NM8MwCWb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060723.NM8MwCWb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/ipmi/ipmi_si_intf.c:22:
   include/linux/module.h:133:13: warning: 'init_module' specifies less restrictive attribute than its target 'init_ipmi_si': 'cold' [-Wmissing-attributes]
     133 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2175:1: note: in expansion of macro 'module_init'
    2175 | module_init(init_ipmi_si);
         | ^~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2109:19: note: 'init_module' target declared here
    2109 | static int __init init_ipmi_si(void)
         |                   ^~~~~~~~~~~~
>> drivers/char/ipmi/ipmi_si_intf.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
