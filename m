Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27532FBF1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 03:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706670329; cv=none; b=AtkAUtuFcOKiOZTy0pAezxORQ9yhKYS4zWdVKYM97zaE83s59eRe885Ll/XxVnftshZLpXEid4r3yHlcbY1oZCcYAHrxVStrzu8AUCj++esQNje9Ja9XI6cmnUBi1itA2w8Uz84ej+NYu2+h/j+OfDNdNSNputMMSemps+ZxBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706670329; c=relaxed/simple;
	bh=oc00ogoGrM5XAVUTG7YuS/ba6FMJWntUwC7qVRVl1b4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsyhWZIlYJstKPPyvHWrK2V5uGH5lYgydwpFcWxsR8WPKpAjwHOyfIV+EBedk8NCcN78rWrg7GbIWvm0vxDyCO2eLPi8tuEYuAGlpnj2RJSeZxHpXqbK8GMa53851wPogR8f1x9e7NI9ALRM7Pkka8RXfRH6ksV+DsNQvaIJ/zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbj4lkhE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbj4lkhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706670327; x=1738206327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oc00ogoGrM5XAVUTG7YuS/ba6FMJWntUwC7qVRVl1b4=;
  b=Gbj4lkhERnbVh1heuuNNnqbF0RVrvtWK7A0fdRwzwjn4RjKTnMjsqpBm
   Ub+WFWy3SH438/CwnwMuPSi/K9SjU564Ljo5kj+Ajq54gWeq3WvhQeksW
   37zO183YpIHGEhZdK8hQDK1uD0rowTVgY1441gXvMDdk5JHkYP5U4GmKc
   RxXLD8bD5jXO2kmACN8kbzLpQaMwAUn3uxfjzbD234U7pPDFwugz7NdYk
   3hMTaUVYhJrp+QmmNuMzshUiP3Bd7MNC5jnmns30GI12yS5zmGEX6LG60
   GyRtSS7MOC55t1obxhKHxziLIzMvcKUZWQN9EzBFHFUd3ujNFKKSlbXYH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="24947150"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="24947150"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 19:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36718427"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2024 19:05:24 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV0uf-00015O-1f;
	Wed, 31 Jan 2024 03:05:21 +0000
Date: Wed, 31 Jan 2024 11:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2660/2881] rdtgroup.c:undefined reference to
 `lockdep_is_cpus_held'
Message-ID: <202401311012.3VXz4ppN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   370d9c06c9c2609f0c25810eb8f913fc9cdde776
commit: c054efea286659a6504fdeafc0a611c6a3b124cc [2660/2881] x86/resctrl: Claim get_domain_from_cpu() for resctrl
config: x86_64-buildonly-randconfig-002-20240129 (https://download.01.org/0day-ci/archive/20240131/202401311012.3VXz4ppN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311012.3VXz4ppN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311012.3VXz4ppN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/resctrl/core.o: in function `rdt_ctrl_update':
   core.c:(.text+0x14df): undefined reference to `lockdep_is_cpus_held'
   ld: arch/x86/kernel/cpu/resctrl/rdtgroup.o: in function `resctrl_offline_cpu':
>> rdtgroup.c:(.text+0xbd56): undefined reference to `lockdep_is_cpus_held'
   ld: arch/x86/kernel/cpu/resctrl/monitor.o: in function `update_mba_bw':
>> monitor.c:(.text+0x1e7): undefined reference to `lockdep_is_cpus_held'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
