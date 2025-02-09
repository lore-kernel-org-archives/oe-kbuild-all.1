Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6713D28F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739103887; cv=none; b=CH8R35jhF6bzvVgw4fchn/fWxPzxNFWbjPM7EKMOpn4RceV4HDHK074oG0WfLKkhYdlNFChFTEZIaITV6VC77XuFclxuAehRPWzchtsd3Bh/YncJ7yyQu4hWk/zHqmPdYG8apM4Ro4vTSXuVvOCbxXLAesdzo825E+p+T7RcpDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739103887; c=relaxed/simple;
	bh=2ch6JVm4mQEWu0MXZ3Cj8ur0PIlmAS25QXQaagJGxok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M5HzT88pDB6HX7K1WIIPstnfGXk1pIqLQUFLweMFeDWRJ7Kej+jTSbYnwy5Q8OOVbcbaf+OCCfEfoDU8EDO6pi/m1YOfjNuUq8fmBBogzyzE8rSsq16D/rQvJ9HqlHYbLctnG5lsKkUY8+yGXul25QRvZ7hOabyw+l7bEIbHkWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VW4JroVF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VW4JroVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739103885; x=1770639885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ch6JVm4mQEWu0MXZ3Cj8ur0PIlmAS25QXQaagJGxok=;
  b=VW4JroVFDL5SQvLqT0WXMpKoo+K4wBdRt007guJl9Wf4igAh+dfzXqnW
   ndUXBzykNN1JAViUvT91GjAPjH3byOHLcArcvLxaOZkuuXAfU6un9wllT
   8/mjYNpuhyYrxsZKyx0PQzrBLjW2NwvxiQJXRQk5pg3HtEQFDvi7/KA/v
   MW9oFY7vaM2QcrC8jESaq/81tpaFGTBjmJIKVtAjyhJb57QaAgRVkL/2r
   29MXmXn48qCXuxxhTqaAgMQgAPwS4Y07btMXVMbITtlLMh6Fwq+CiXpwg
   8WLV0I42rH7NjEVUYnWMtWsFBRJCFS6fiZyh4JUW02G+iYRbEAktvZBml
   A==;
X-CSE-ConnectionGUID: GaZwtWY2SwOuLVGMPKIAdA==
X-CSE-MsgGUID: WrmnYI6MR3q8qbkbWMhi6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="51084943"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="51084943"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 04:24:44 -0800
X-CSE-ConnectionGUID: YuqhTyE/Sj6PSalW8HQhcA==
X-CSE-MsgGUID: LpS0ty9YSlOOq3VQ8CCzQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112383714"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Feb 2025 04:24:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th6MZ-0011RJ-34;
	Sun, 09 Feb 2025 12:24:39 +0000
Date: Sun, 9 Feb 2025 20:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1420/1420] mm/mem_reliable.c:272:5:
 sparse: sparse: symbol 'reliable_debug_handler' was not declared. Should it
 be static?
Message-ID: <202502092003.Ptadb8Sw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: 851a3ff0b4de68403c9a344c3d5378aa590705b7 [1420/1420] mm: Introduce proc interface to control memory reliable features
config: arm64-randconfig-r131-20250208 (https://download.01.org/0day-ci/archive/20250209/202502092003.Ptadb8Sw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502092003.Ptadb8Sw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502092003.Ptadb8Sw-lkp@intel.com/

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
