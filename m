Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92BF26FD9B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 03:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762225856; cv=none; b=Ii69E7D4wofyEyu4sW/OvwSwOs8vUBwTms9M4Rvdv0E1pOO7LvR1OvB0ph/LrVdOYySdYHCOep+0pnB+2/FKpvsg8F9wWwYyTU+/A+RVi2uFhf8HZbuCyQ59M/9tnc694oY7ICy0TXVkPV1qpqDbNuS+Vs2CXT+nV/It6XGXW80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762225856; c=relaxed/simple;
	bh=ZNqbYtUX/yE1sCWuMUS+UmLNe0h2/HLgjwy7/c3JYPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/Biv1ByuhiUTxoGBDc6N/Dyh1U/UyyXUDi6qV1NU9ExLK1C1XSgnf06dKEXrJDM+BX4iSsop9pNKvh70Md4SlkRKESsJJVbndRlfA1Q3YAhfUoS05g2MHEzbKQVulwJrBRKrXhYnuW+355vrpvv+kD9D3Clg9iJDeo6HOD9e1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBCwDv1Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBCwDv1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762225855; x=1793761855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNqbYtUX/yE1sCWuMUS+UmLNe0h2/HLgjwy7/c3JYPE=;
  b=aBCwDv1YI6yCfmJOh2OeLa7+pMAdZj5p8rF31jtfZ+Hy2zG4EDe+3103
   fxUXhEb0e6iloP/5hXeUARj7YxEiX+dSL1dWZdPKDwSV1rLxwIAeRwA3x
   WanMbeZovEh4FS+HVBb7nqZlLAHZlvq+YTfmvf5ARXoc0laSBzAedwLgI
   hmZShG+zx48SANA6GofwrEn+iq/7yZoPU+lRoiOCaLGJ4AnFz2mi8NKNa
   TKvcybZrxd5YbE8rk2fyJt9SJ+ckdZbeVLdywHdOKktmZRk/AoyvYVpsi
   Yqx3ohoMMtFwb3LSVXquKsxGC/egp6pu6nFVzI9XEfk4ACDw6XhHK+7jC
   A==;
X-CSE-ConnectionGUID: Zcw5WnocT3ayh3WrWTsv8w==
X-CSE-MsgGUID: Acq247fATyKFgFfbDl0bCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81718846"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="81718846"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 19:10:54 -0800
X-CSE-ConnectionGUID: e18xhBaqS+2wLu/fd9pMHQ==
X-CSE-MsgGUID: uRjHsecCRNe4O8LfqjZrhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186714679"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2025 19:10:53 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG7Rb-000QnQ-0C;
	Tue, 04 Nov 2025 03:10:51 +0000
Date: Tue, 4 Nov 2025 11:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] fs/proc/stat.c:224:17: warning: no
 previous prototype for 'bpf_get_idle_time'
Message-ID: <202511041056.Im8VvChb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: 70780f6924c9b58d5a745d4e20e08e9ace28e711 [3098/3098] bpf-rvi: proc: add bpf_get_{idle,iowait}_time kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041056.Im8VvChb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041056.Im8VvChb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041056.Im8VvChb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/stat.c:224:17: warning: no previous prototype for 'bpf_get_idle_time' [-Wmissing-prototypes]
     224 | __bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^~~~~~~~~~~~~~~~~
>> fs/proc/stat.c:229:17: warning: no previous prototype for 'bpf_get_iowait_time' [-Wmissing-prototypes]
     229 | __bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^~~~~~~~~~~~~~~~~~~


vim +/bpf_get_idle_time +224 fs/proc/stat.c

   222	
   223	#ifdef CONFIG_BPF_RVI
 > 224	__bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
   225	{
   226		return get_idle_time(kcs, cpu);
   227	}
   228	
 > 229	__bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
   230	{
   231		return get_iowait_time(kcs, cpu);
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
