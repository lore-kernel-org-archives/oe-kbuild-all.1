Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C2354AF6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760791230; cv=none; b=O7BMghLtH9nx2p/OdefAXd+O6FqbRyZKDnXWeUibWfPbwc5Jj4UT2BsOSIjyj+pQSokDVgQTml1QfIXnuLbmfqBdRh+BJavgEg8N1zK80i+MGBLiwQskIvOiT7KZDbXJuXe/ALc4DCf1b1hNfRKT0Q4ym0SlhKV6W59/xIi79jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760791230; c=relaxed/simple;
	bh=H3WK0t/V2VoTFN8BT9sadD++/B4PncNJL3s9HMGDF+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Onq9HxFGL7Pn4MXaXwGjK/FuIpeZbblPL2yK8IdhXrDnTIVy/40eP0ezZBgEW7PwJdwaY0yZhZQ/YsjI1vchJ9stvQHkp6tEgb1km14nc0EtFRxeNb1yMKzgeQSObimoYZziG+q/xKAKB0QaWbR9EK7XMUcGB2DIDmBdE/BaEbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DespCvrS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DespCvrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760791228; x=1792327228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H3WK0t/V2VoTFN8BT9sadD++/B4PncNJL3s9HMGDF+k=;
  b=DespCvrS1pW0pgM+whL+Ca4hyawrUDZhmwIOzRpo/DBIl35nXXK/Pvsu
   btu3EcBsF9340wMRD3Ma0ck+fwDqwUgGp49hVsoSXdFMmYhjDgckeQurg
   d2VWzGzI5DF6NL1B9IdKna0c0yIB1x1HF/zVB62AJHerMuQ9TC/eTYelH
   Tjt+SYoK4YveUbV6nAmSOhlVsfJJUXCaSGwJgnQiMtS6YBS41XCDL641B
   YdVudV/2dInk9pKSmzFKGdHQGUVqYW+wmqAJz2IbsPmc2jn369MAxTG2G
   xR5FpvbuckyKNvEHT3ld01RX+58z3GtBNCq20/4deXBs+My3mB6Mjr33L
   Q==;
X-CSE-ConnectionGUID: QOc211RyQTCabOloPM1aVA==
X-CSE-MsgGUID: OJ/CVdFYS0SCXjb1GQ+cEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62021823"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="62021823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 05:40:27 -0700
X-CSE-ConnectionGUID: 5U15FjJtSBGBYWHi9hmrlg==
X-CSE-MsgGUID: jeOF9QHgRceImIylS2+Xsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183439267"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Oct 2025 05:40:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA6DL-0008Hd-19;
	Sat, 18 Oct 2025 12:39:44 +0000
Date: Sat, 18 Oct 2025 20:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:272:5:
 sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it
 be static?
Message-ID: <202510182012.jZtZFjLW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e98deea13d81cacd6479edf0de6267118ae7c639
commit: 851a3ff0b4de68403c9a344c3d5378aa590705b7 [1740/1740] mm: Introduce proc interface to control memory reliable features
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251018/202510182012.jZtZFjLW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510182012.jZtZFjLW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510182012.jZtZFjLW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mem_reliable.c:52:14: sparse: sparse: restricted gfp_t degrades to integer
   mm/mem_reliable.c:199:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
>> mm/mem_reliable.c:272:5: sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it be static?
   mm/mem_reliable.c:199:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     199 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/mem_reliable.c:272:5: warning: no previous prototype for 'reliable_debug_handler' [-Wmissing-prototypes]
     272 | int reliable_debug_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_debug_handler +272 mm/mem_reliable.c

   271	
 > 272	int reliable_debug_handler(struct ctl_table *table, int write,
   273		void __user *buffer, size_t *length, loff_t *ppos)
   274	{
   275		unsigned long old_ctrl_bits, new_ctrl_bits;
   276		static DEFINE_MUTEX(reliable_debug_mutex);
   277		int ret;
   278	
   279		mutex_lock(&reliable_debug_mutex);
   280		old_ctrl_bits = mem_reliable_ctrl_bits;
   281		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   282		if (ret == 0 && write) {
   283			if (mem_reliable_ctrl_bits > (1 << CTRL_BITS_SHIFT) - 1) {
   284				mem_reliable_ctrl_bits = old_ctrl_bits;
   285				mutex_unlock(&reliable_debug_mutex);
   286	
   287				return -EINVAL;
   288			}
   289	
   290			new_ctrl_bits = mem_reliable_ctrl_bits;
   291			mem_reliable_ctrl_bits = old_ctrl_bits;
   292			if (!!test_bit(MEM_RELIABLE_ALL, &new_ctrl_bits))
   293				mem_reliable_parse_ctrl_bits(new_ctrl_bits);
   294			else
   295				mem_reliable_disable_all();
   296		}
   297	
   298		mutex_unlock(&reliable_debug_mutex);
   299	
   300		return ret;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
