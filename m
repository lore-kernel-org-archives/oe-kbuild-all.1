Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21CB176FCE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729984711; cv=none; b=lPGgvSXeg9JxW9jvYIgevXpc/pSYa7DGoPDPrCO6w695uXXbAOpgEAftigu0UvZZ7eNr+BjugPRomJTcRj4QN0Omlui04m+1xL4e7R9/imeIN+9At38qiCt2zz6c9xFGuY6LgyF1a9OYxQBNJBphRhvSb7HlM+IwkpBgpcdKl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729984711; c=relaxed/simple;
	bh=I/MsJ4lWsl2BurFNnbbJtxrsP4HDiYMqRAFez9z1WUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9QeCyqjB1B8mHbX4XksqeaiN/jJ+ywz8Un+bsZWgBUuOg+JrZh+I/UbYkGYDAGKEaFUPuc5sM13q2p1Fz1pFonrtU9ltIu4JZ0nq0rfSciPh5+ufgxAsYlHW+Kk99k8Ic4ayB3EyLAmBw+4N3h39nnCXRkuORwtGr8mbQLICG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClR5fTOB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClR5fTOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729984709; x=1761520709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/MsJ4lWsl2BurFNnbbJtxrsP4HDiYMqRAFez9z1WUM=;
  b=ClR5fTOBVAt2Cc8rRYEX69A77B2w5ipxEIUdRYI8TMyKmlUHZHGU2Nne
   ZTRWGCbu7GNpmLyV+w91KXs5vb6N147dwENn2mvzhERa2ue7zBOiRvMPW
   PbF5FbifvkJz2ESF/AxMZd1wcsmOYGI/k0E3QoM3FXQT/iPvlpKJGUwxG
   jAOP+gPoRKYBSYd6+96+WXpVM9DjJLM/U+1r34VB36tXnTP+WqhlO8njQ
   uWb/XkvdhFo/saEUqLZuEvwHMWSmeUwRbh6juNTuq9d6gtHJhfxqozVES
   J4uzLRAnTA7kIcAMMqsNJSDiWfwmBjIRlzBiK5bNbUOWWsvd84HUEclTw
   g==;
X-CSE-ConnectionGUID: /D+cTgmqQ3iagd3NRwEmog==
X-CSE-MsgGUID: ymOtKs4vTJeBlt4IyL+k5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="32484799"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="32484799"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 16:18:28 -0700
X-CSE-ConnectionGUID: itQOghqLQRS+ORh4FoWIzg==
X-CSE-MsgGUID: vsBlJu3uSriTQ+trTyHoIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85807457"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Oct 2024 16:18:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4q37-000a9e-1J;
	Sat, 26 Oct 2024 23:18:25 +0000
Date: Sun, 27 Oct 2024 07:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26172/30000] kismet: WARNING: unmet direct
 dependencies detected for BPF_NET_GLOBAL_PROG when selected by
 SCHED_TASK_RELATIONSHIP
Message-ID: <202410270704.ecpmDcvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 64ba5634c4c60ea966612ab3eca75cbf2d90f9bc [26172/30000] net: add some bpf hooks in tcp stack for network numa relationship
config: arm64-kismet-CONFIG_BPF_NET_GLOBAL_PROG-CONFIG_SCHED_TASK_RELATIONSHIP-0-0 (https://download.01.org/0day-ci/archive/20241027/202410270704.ecpmDcvG-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241027/202410270704.ecpmDcvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270704.ecpmDcvG-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG when selected by SCHED_TASK_RELATIONSHIP
   WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG
     Depends on [n]: NET [=n] && BPF_SYSCALL [=n]
     Selected by [y]:
     - SCHED_TASK_RELATIONSHIP [=y] && CGROUPS [=y] && NUMA_BALANCING [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
