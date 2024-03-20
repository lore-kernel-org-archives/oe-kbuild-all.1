Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD644535C2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710949940; cv=none; b=FUI0xGMVRzL7aqLxdBSb+ZC+0jWYs1HMLt7oNQZo9xZrP3ZF2p+DfYE221JTkP7Xfp1P9bQHiSolUJ3h7/u3IPxPyUD6qufCJ9nu5qXdP8iKTGqIsinVhfsG05zg04O4hnJj1YdpUm4ycoWh2XCz7Rtmm08uYDaSx62WzRXkx2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710949940; c=relaxed/simple;
	bh=/9mlHb6MBu7WCLEyDVx61Tzy54VazGQmcDUfeMDBkDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDHZozYp96cxI493CpTTiikVBGW5VoRjwq5zxjLjWoJtbDRqVeVH4nps0A77j98C8XABH33fUIi7l+erVVyE3Fe9bFgGOx4K8XJcdRme0rnvH7g/IRMt0tAO6JuCosp5zurYbVrvHMP3LAVp3/bBvT2E9TP0TiNrEovlGF7UElc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZgCZ5kT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZgCZ5kT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710949938; x=1742485938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9mlHb6MBu7WCLEyDVx61Tzy54VazGQmcDUfeMDBkDg=;
  b=DZgCZ5kT9kbxsaP05AHp+K1w0aNB79wBzjBgqWzTFzwL3FLOv57wr141
   KO5s+bCxJFCJBrfkrSbjWqy0WyP+IqNl/KMTbAa2q6XfP9JE1CfizA+jH
   FUSybpEQ9SangpWebRqvOAcdPerwLs+yM1w8PQT4/zh2Hybhy9nxIcMFz
   9j2UWo1FUQF2joCnI87D7bWEPfyehqmnWgZpMFlZV+yvg7mJvBm1YkQrR
   b/dVK6zZwZ9OnY7j/RuoP3kJ3wqg7OnTZMYWquSXZvA80rNWk1Z2Vvtqh
   ya3YUYR19K+ZNMlZ4Mfhwt/j3dMuSdfbirkEueMOp8XpKAqRshlCxEhvm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6001818"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6001818"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 08:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="14075182"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2024 08:52:17 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmyEg-000Ik1-0d;
	Wed, 20 Mar 2024 15:52:14 +0000
Date: Wed, 20 Mar 2024 23:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dawei Li <dawei.li@shingroup.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 15/17] lib/cpumask.c:61: warning: cannot
 understand function prototype: 'struct kmem_cache *cpumask_cache
 __ro_after_init; '
Message-ID: <202403202344.Aao4CzXG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   fa63bc7d26007e1353fa90bb06cc37966bd1513a
commit: 61ec2810d92f31b0ef8b30b08ee1d1e1ffc45ddc [15/17] cpumask: create dedicated kmem cache for cpumask var
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240320/202403202344.Aao4CzXG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403202344.Aao4CzXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403202344.Aao4CzXG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/cpumask.c:61: warning: cannot understand function prototype: 'struct kmem_cache *cpumask_cache __ro_after_init; '


vim +61 lib/cpumask.c

    41	
    42	/* These are not inline because of header tangles. */
    43	#ifdef CONFIG_CPUMASK_OFFSTACK
    44	/**
    45	 * alloc_cpumask_var_node - allocate a struct cpumask on a given node
    46	 * @mask: pointer to cpumask_var_t where the cpumask is returned
    47	 * @flags: GFP_ flags
    48	 * @node: memory node from which to allocate or %NUMA_NO_NODE
    49	 *
    50	 * Only defined when CONFIG_CPUMASK_OFFSTACK=y, otherwise is
    51	 * a nop returning a constant 1 (in <linux/cpumask.h>).
    52	 *
    53	 * Return: TRUE if memory allocation succeeded, FALSE otherwise.
    54	 *
    55	 * In addition, mask will be NULL if this fails.  Note that gcc is
    56	 * usually smart enough to know that mask can never be NULL if
    57	 * CONFIG_CPUMASK_OFFSTACK=n, so does code elimination in that case
    58	 * too.
    59	 */
    60	
  > 61	static struct kmem_cache *cpumask_cache __ro_after_init;
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
