Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5221A00F8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 22:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496475; cv=none; b=hygSR1PSkZGw+tZ6kcQU4YW3NSK65tAxj9oddbJsPjdXNMIeRHnc/IojQkyAKfX7sQ7pt6z+e3fY3hduGrNRTA9qN5r5PeyjOjzw1WCk1YCcF8n9jPIKITgYeOo/Hrr99xyR1jMWMMUI6z8Va4cn1Chhiq6gzc9aJo8n3x7I6vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496475; c=relaxed/simple;
	bh=jvNDweNUCKJOQXD3JlJh5ISwW7x1jOv0bECmdk5/Nz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgq+DkcKDpVA+bwIwK+rK/AJc4k7Mbz6yV8CWH6fWToDRDHjfSD5yJxLOHn4C3SGnXjC4FmmG9TF5jIwIMC1JBWxuI11jC3xLMxkeebzRcA+D3gObXqHWShEBzc9vbWIS2iGPqEQMg+OTKR4aGkEtDR5cRkrsP/j9XSpZd+fn0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZ8Oh3Aj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZ8Oh3Aj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751496474; x=1783032474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvNDweNUCKJOQXD3JlJh5ISwW7x1jOv0bECmdk5/Nz4=;
  b=XZ8Oh3AjSdn8iDJkslnwiFtAG+5pgJBXdvcv9Lq2DiswDwD9eeMAwiyD
   Yv/WyzzOqRl2sOXr9XhHiERr5MjmH0CG18lCShikUvI7dQeP8reEGu1u+
   V+PTElUAWLUSHqoIGST5T7czjDEi8SOzjBFlefAPeHd7DlI2C107mriCI
   t1orwuxi0Vk3ZLniTzORB55C3ETgPIdmQUvRfexxPTYruHxrV/T8gkaZL
   NX66mxf4lArJloWvtZZ1XCUmp+A1FG92Ad3P4E1jSygFUlYbdCvRADANB
   nFX4SYPAcPwOP158smTNwSRcEnctEGqirerW+yvtw7ZTPzquP2TmRVGVS
   Q==;
X-CSE-ConnectionGUID: Nx2AI4YhQDSaxWvpXnN3aQ==
X-CSE-MsgGUID: 56T3BANRR4qJMLaPL9ISlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52926992"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="52926992"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 15:47:53 -0700
X-CSE-ConnectionGUID: SyajBAJiRnCBhZNhwm6gWA==
X-CSE-MsgGUID: hGlSH2MzQaWY1y/B8bsvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="153616210"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2025 15:47:53 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX6F3-0000MH-27;
	Wed, 02 Jul 2025 22:47:49 +0000
Date: Thu, 3 Jul 2025 00:47:42 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] drivers/pci/pci.c:215:
 warning: Function parameter or member 'path' not described in
 'pci_dev_str_match_path'
Message-ID: <202507030025.FLRGGgYy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 45db33709ccc7330c55fc6751c96468de407f2ac [1605/1605] PCI: Allow specifying devices using a base bus and path of devfns
config: x86_64-buildonly-randconfig-2001-20250501 (https://download.01.org/0day-ci/archive/20250703/202507030025.FLRGGgYy-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030025.FLRGGgYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030025.FLRGGgYy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pci.c:215: warning: Function parameter or member 'path' not described in 'pci_dev_str_match_path'
>> drivers/pci/pci.c:215: warning: Excess function parameter 'p' description in 'pci_dev_str_match_path'


vim +215 drivers/pci/pci.c

   193	
   194	/**
   195	 * pci_dev_str_match_path - test if a path string matches a device
   196	 * @dev:    the PCI device to test
   197	 * @p:      string to match the device against
   198	 * @endptr: pointer to the string after the match
   199	 *
   200	 * Test if a string (typically from a kernel parameter) formatted as a
   201	 * path of device/function addresses matches a PCI device. The string must
   202	 * be of the form:
   203	 *
   204	 *   [<domain>:]<bus>:<device>.<func>[/<device>.<func>]*
   205	 *
   206	 * A path for a device can be obtained using 'lspci -t'.  Using a path
   207	 * is more robust against bus renumbering than using only a single bus,
   208	 * device and function address.
   209	 *
   210	 * Returns 1 if the string matches the device, 0 if it does not and
   211	 * a negative error code if it fails to parse the string.
   212	 */
   213	static int pci_dev_str_match_path(struct pci_dev *dev, const char *path,
   214					  const char **endptr)
 > 215	{
   216		int ret;
   217		int seg, bus, slot, func;
   218		char *wpath, *p;
   219		char end;
   220	
   221		*endptr = strchrnul(path, ';');
   222	
   223		wpath = kmemdup_nul(path, *endptr - path, GFP_KERNEL);
   224		if (!wpath)
   225			return -ENOMEM;
   226	
   227		while (1) {
   228			p = strrchr(wpath, '/');
   229			if (!p)
   230				break;
   231			ret = sscanf(p, "/%x.%x%c", &slot, &func, &end);
   232			if (ret != 2) {
   233				ret = -EINVAL;
   234				goto free_and_exit;
   235			}
   236	
   237			if (dev->devfn != PCI_DEVFN(slot, func)) {
   238				ret = 0;
   239				goto free_and_exit;
   240			}
   241	
   242			/*
   243			 * Note: we don't need to get a reference to the upstream
   244			 * bridge because we hold a reference to the top level
   245			 * device which should hold a reference to the bridge,
   246			 * and so on.
   247			 */
   248			dev = pci_upstream_bridge(dev);
   249			if (!dev) {
   250				ret = 0;
   251				goto free_and_exit;
   252			}
   253	
   254			*p = 0;
   255		}
   256	
   257		ret = sscanf(wpath, "%x:%x:%x.%x%c", &seg, &bus, &slot,
   258			     &func, &end);
   259		if (ret != 4) {
   260			seg = 0;
   261			ret = sscanf(wpath, "%x:%x.%x%c", &bus, &slot, &func, &end);
   262			if (ret != 3) {
   263				ret = -EINVAL;
   264				goto free_and_exit;
   265			}
   266		}
   267	
   268		ret = (seg == pci_domain_nr(dev->bus) &&
   269		       bus == dev->bus->number &&
   270		       dev->devfn == PCI_DEVFN(slot, func));
   271	
   272	free_and_exit:
   273		kfree(wpath);
   274		return ret;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
