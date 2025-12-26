Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD60615E97
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 01:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766713826; cv=none; b=OgPa2k3UvSrIUOvrw1zd0ZXrQZsAqrZAcIFhwcwQ6hW0hCsmFGGQ4KtYJMs+2wbn7vnTJ2iPQURKbF6/UG8lqoH0TRkyw1xt9wDU5IiTqxJLEPDyts9BR/I9f7XWQe7nH9tyPhnYUelZaOC6jMU1ACbc0n6hJEsJQc9MaD0z+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766713826; c=relaxed/simple;
	bh=jWXfPDUJuw6weQdyWoig3/P/Rj8zX03i1qPThUQBqnk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EPpVEfLOdPdfvMSnUvR29x9+d9Vb4O6hnUumQjlh3PQPdop6JoLqzMlGTyA8bOinC58UWt1BYeme9fx38MlvWe1Vc2Crh3gABxcoylr0pMcbo8xZj7G9D7tXXZAeWB8dK3ag4z9d3rfYqn6y9eQDQXAeG0peM+vByZCX9CjdCBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IktWaxmn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IktWaxmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766713824; x=1798249824;
  h=date:from:to:cc:subject:message-id;
  bh=jWXfPDUJuw6weQdyWoig3/P/Rj8zX03i1qPThUQBqnk=;
  b=IktWaxmnSxODuNs6CNRAbvv77VRSW3tryXeK3g4Q5b51DoEZgG4Zf7Jc
   ZsIQlQ3ffnSkM8mjDmn6t3GLQIawHP8Sfj9DpfLq3NX15l1hiwHsQKCV4
   YyPUYc9resqVK05BAYm656liZvaZuzOoTUz0ayLbieMU7W8ypx6PbmKl5
   SmHZc88brIMQN8tGGjPdrMuGgxeHtQkoTmn5WgR/CXirQ74nea6WnOS80
   m0DpVqihrK8JYxy8WVYRW15SUfCKsziEkWgwJ+PVGPNqqic1tIkjdMzKm
   ijwB7yi+GNkGYtKTsFMnf2e/MjJ9dJsG4paDpsnSI7vtOa8GkMPeoFJjF
   g==;
X-CSE-ConnectionGUID: nHLAF4trTPqajJr6g9Bgvw==
X-CSE-MsgGUID: PYRmzd96QKqYxY6pvaNfaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="86070721"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="86070721"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 17:50:23 -0800
X-CSE-ConnectionGUID: tNwKqhzwRjWp+bNLNAs7vQ==
X-CSE-MsgGUID: trRv5x7CQDu0fNVySLTP/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="199546569"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Dec 2025 17:50:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYwyB-000000004bF-07Fm;
	Fri, 26 Dec 2025 01:50:19 +0000
Date: Fri, 26 Dec 2025 09:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/ub/ubus/ubus_config.c:191:6: warning: no previous prototype for
 'ub_sync_cfg_rsp_handle'
Message-ID: <202512260914.fC4Pfn5g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: 280895301d3bc3507606cbd2e3cdccba75a8dcdc [13/13] ub:ubus: Support Ubus read/write configuration functions
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260914.fC4Pfn5g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260914.fC4Pfn5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260914.fC4Pfn5g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/ubus_config.c:191:6: warning: no previous prototype for 'ub_sync_cfg_rsp_handle' [-Wmissing-prototypes]
     191 | void ub_sync_cfg_rsp_handle(struct cfg_msg_pld_rsp *rsp, u8 size,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/ubus/ubus_config.c:310:5: warning: no previous prototype for '__ub_cfg_read_byte' [-Wmissing-prototypes]
     310 | int __ub_cfg_read_byte(struct ub_entity *uent, u64 pos, u8 *val)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/ub/ubus/ubus_config.c:320:5: warning: no previous prototype for '__ub_cfg_read_word' [-Wmissing-prototypes]
     320 | int __ub_cfg_read_word(struct ub_entity *uent, u64 pos, u16 *val)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/ub/ubus/ubus_config.c:330:5: warning: no previous prototype for '__ub_cfg_read_dword' [-Wmissing-prototypes]
     330 | int __ub_cfg_read_dword(struct ub_entity *uent, u64 pos, u32 *val)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/ubus/ubus_config.c:340:5: warning: no previous prototype for '__ub_cfg_write_byte' [-Wmissing-prototypes]
     340 | int __ub_cfg_write_byte(struct ub_entity *uent, u64 pos, u8 val)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/ubus/ubus_config.c:350:5: warning: no previous prototype for '__ub_cfg_write_word' [-Wmissing-prototypes]
     350 | int __ub_cfg_write_word(struct ub_entity *uent, u64 pos, u16 val)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/ub/ubus/ubus_config.c:360:5: warning: no previous prototype for '__ub_cfg_write_dword' [-Wmissing-prototypes]
     360 | int __ub_cfg_write_dword(struct ub_entity *uent, u64 pos, u32 val)
         |     ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/ub_sync_cfg_rsp_handle +191 drivers/ub/ubus/ubus_config.c

   190	
 > 191	void ub_sync_cfg_rsp_handle(struct cfg_msg_pld_rsp *rsp, u8 size,
   192				    u64 pos, bool write, u32 *val)
   193	{
   194	#define UB_CFG_REG_SIZE 4
   195		u8 pos_in_reg = pos % UB_CFG_REG_SIZE;
   196		u32 read_data;
   197	
   198		if (!write) {
   199			read_data = rsp->read_data >> (pos_in_reg * BITS_PER_BYTE);
   200			if (size == sizeof(u8))
   201				*(u8 *)val = read_data;
   202			else if (size == sizeof(u16))
   203				*(u16 *)val = read_data;
   204			else
   205				*val = read_data;
   206		}
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
