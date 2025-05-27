Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47927D766
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364763; cv=none; b=gw63HBI8wBjSkAc/yVcLxnb9E9pzZeP2kEEbnacl7U2PvO4gZP32JRmqKgdKyCVJEX2vgfJ3JjlZUbsweDgzV6IxhP5k8N/fxSVY8VitmVo2cPpPhxgzsbrqewfvtF2Sm/n07+gF4uqRYSugsJgdPr9r/AasWr1hz5+mM7ZCs7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364763; c=relaxed/simple;
	bh=jcutTLEMOmBY7ZWKQpPqjyQZJ517xlCfHq00WS4C4do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XG4OopFFBvWJlkXQEHtbJqCHFCFm7FwX2Q53B1TBFCGU96leW38LKVvdnQTSbXlixlGWOV3G6SZe/3QJT4gVGzC7FrbJEJ7pElSe3oi8qspdxXw2K5DUBwxN6FS+60XQASmr86pv0qfrDPNDmMdnCisAlHDriHfGumsO8dKwxR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yafivc97; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yafivc97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748364762; x=1779900762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jcutTLEMOmBY7ZWKQpPqjyQZJ517xlCfHq00WS4C4do=;
  b=Yafivc977vNZHYOCDlzN3dEja0NBqQ9EYEXxpt8e5VqYP99u4aIcni7W
   tze0U/ds9etFt87XQ6ij/qpEWfak0r5JFOWmJhuzti7K1BI0+Gb5ew0ru
   CaGSgqWimPu5IS37KDQ4wWUnrQGe43KPNSXXBVLMadPhwZbrXbASY9O96
   A7Fz9i6rBWEDuvvffFUDxdsh8TXFD0zgCpT8zQTFKqldWAgYnwHvZemRH
   DQGp+FY51m1OXrCy0T4DPjlkuXJMYL+BP+8xxHzm4pMV0BufaToaTXXkV
   lFJgxCpP3ggSbG7t3AXSVODcu5DG/qylMpuSW4y8sZkNWUBCM+0Ianbvh
   Q==;
X-CSE-ConnectionGUID: WGEzQ5djTeyvDchH7xKf0A==
X-CSE-MsgGUID: NDmQBDvlSbehqwoTMsl5vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61025698"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="61025698"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:52:41 -0700
X-CSE-ConnectionGUID: suu7oMmMT+yjH544FlvUug==
X-CSE-MsgGUID: wd4wsloNTJ2jZd5ehKVjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143862948"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2025 09:52:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJxXa-000TU6-1X;
	Tue, 27 May 2025 16:52:38 +0000
Date: Wed, 28 May 2025 00:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/remoteproc/mtk_vcp_rproc.c:413:21: error: incompatible integer to
 pointer conversion assigning to 'void *' from 'enum vcp_core_id'
Message-ID: <202505280056.Miz5Qm8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a8b155e1dd30a4460ca0bf9db35d30ab891d3e91
commit: 4e897a6f031967176cb958e30ca3d45acd05792d [133/133] CHROMIUM: remoteproc: vcp: fix vcp ipidev distinguish core statue flow
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505280056.Miz5Qm8n-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280056.Miz5Qm8n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280056.Miz5Qm8n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/remoteproc/mtk_vcp_rproc.c:21:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/remoteproc/mtk_vcp_rproc.c:413:21: error: incompatible integer to pointer conversion assigning to 'void *' from 'enum vcp_core_id' [-Wint-conversion]
     413 |                 vcp_ipidev.prdata = core_id;
         |                                   ^ ~~~~~~~
   drivers/remoteproc/mtk_vcp_rproc.c:913:9: warning: variable 'mblock_start_size' set but not used [-Wunused-but-set-variable]
     913 |         size_t mblock_start_size;
         |                ^
   drivers/remoteproc/mtk_vcp_rproc.c:1097:29: warning: cast to smaller integer type 'enum vcp_core_id' from 'void *' [-Wvoid-pointer-to-enum-cast]
    1097 |         enum vcp_core_id core_id = (enum vcp_core_id) vcp_core_id;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/mtk_vcp_rproc.c:1128:29: warning: cast to smaller integer type 'enum vcp_core_id' from 'void *' [-Wvoid-pointer-to-enum-cast]
    1128 |         enum vcp_core_id core_id = (enum vcp_core_id) vcp_core_id;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +413 drivers/remoteproc/mtk_vcp_rproc.c

   398	
   399	/*
   400	 * callback function for work struct
   401	 * notify apps to start their tasks
   402	 * @param ws:   work struct
   403	 */
   404	static void vcp_A_notify_ws(struct work_struct *ws)
   405	{
   406		struct vcp_work_struct *sws =
   407			container_of(ws, struct vcp_work_struct, work);
   408		enum vcp_core_id core_id = sws->flags;
   409	
   410		if (core_id < VCP_CORE_TOTAL) {
   411			mutex_lock(&vcp_ready_mutex);
   412			vcp_ready[core_id] = 1;
 > 413			vcp_ipidev.prdata = core_id;
   414			mutex_unlock(&vcp_ready_mutex);
   415	
   416			mutex_lock(&vcp_A_notify_mutex);
   417	
   418			vcp_extern_notify(core_id, VCP_EVENT_READY);
   419			mutex_unlock(&vcp_A_notify_mutex);
   420	
   421			/*clear reset status and unlock wake lock*/
   422			dev_info(sws->dev, "%s core id %u ready\n", __func__, core_id);
   423		} else
   424			dev_warn(sws->dev, "%s wrong core id %u\n", __func__, core_id);
   425	}
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
