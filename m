Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FED0142E66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 03:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715311727; cv=none; b=aOUZDoLczwsjow3XErECEHg6epOkAyD+UScLGCEIi1KquBLE3Otu4lt0Kl6lRuRbgcLEieTzKjEloyv5nPxbGU6sOm7xTXvYwTCKXrtY+ZWvdCoQDT6gBUM/eL2UfC7s6k3V4M5wW1PVE5kLM/LrEJtzx2SHFrlnBKUY8ogX86g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715311727; c=relaxed/simple;
	bh=eUMoz4zOQGcoXsyHuLXFEQ+r3NkNj1RB2JQ+UUOQ3Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gNJr1YmLPLSIPeRQfsn+d9v7cN5zwvBI+B5IWCwluf/SGH3ikWDpeBULvFYLunt2qVgucapvqY7t+JZrU3l7nDdjBBSVlysqYL5xXwLtF4DfHpqNSBxxHh8rFuaJHCNNNvE635ABwoaWbnAcaGOXxfUhqJHInCuiRMeTZJd2BYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hw1V631D; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hw1V631D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715311725; x=1746847725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eUMoz4zOQGcoXsyHuLXFEQ+r3NkNj1RB2JQ+UUOQ3Xo=;
  b=hw1V631D9avSyxWBLq3ZSD4zcEpCpzqidspuEPeY29r9xQr6Lxlk7BeV
   DoFPKNV+75Nn3mVqSQN4Hs5rKGcoXC5LiOLVTP0kIPkXBU6CGn+nppOts
   /nInG8AfA1i+7fhtlOaGBqLDz9tazTrtcGthtSOriC3s/btoeUAJeuHE5
   kOcJJJ+0YpVdX+FMkKnJqx70J0RiS668zoxRDtJTo5+x4iIGzcOhSMykG
   IdzTICoet61iNeAM8P0zG2reda9+t3BUVlDvHscakOCXKrWG6OoJAsVxB
   sq59TvE1QNgzp2mNRmvo696ZiNOwrPPNhTzRKBJ7N3yzRyTWiwzqSUISn
   Q==;
X-CSE-ConnectionGUID: tHmrsXWdRcGh57WR5E3qzg==
X-CSE-MsgGUID: NxnkNOzDTBu/IqX618tEdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21945246"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="21945246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 20:28:45 -0700
X-CSE-ConnectionGUID: S+2DmMI8TvqMg5aoJXq5Vw==
X-CSE-MsgGUID: nqQw5fWSTi66r1yytjKjrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="34004497"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 May 2024 20:28:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Gw4-0005fp-2Q;
	Fri, 10 May 2024 03:28:40 +0000
Date: Fri, 10 May 2024 11:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 99/104]
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c:2378:6:
 error: variable 'raw_status' set but not used
Message-ID: <202405101105.aU6kScH9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   cb75f24663df84986d5056df93e821564be6d886
commit: 3d4651aa212e1a671e15a4a8411b748bb70a8585 [99/104] CHROMIUM: media: platform: mediatek: isp: isp_7x camsys driver migration
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240510/202405101105.aU6kScH9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101105.aU6kScH9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101105.aU6kScH9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c:15:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:1776:
   include/linux/vmstat.h:502:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c:2378:6: error: variable 'raw_status' set but not used [-Werror,-Wunused-but-set-variable]
    2378 |         int raw_status = 0;
         |             ^
   6 errors generated.


vim +/raw_status +2378 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c

  2372	
  2373	int mtk_cam_s_data_raw_select(struct mtk_cam_request_stream_data *s_data,
  2374				      struct mtkcam_ipi_input_param *cfg_in_param)
  2375	{
  2376		struct mtk_cam_ctx *ctx;
  2377		struct mtk_raw_pipeline *pipe;
> 2378		int raw_status = 0;
  2379		bool selected = false;
  2380	
  2381		ctx = mtk_cam_s_data_get_ctx(s_data);
  2382		pipe = ctx->pipe;
  2383		raw_status = mtk_raw_available_resource(pipe->raw);
  2384		raw_status &= ~pipe->enabled_raw;
  2385	
  2386		mtk_raw_available_resource(pipe->raw);
  2387	
  2388		if (!selected)
  2389			return -EINVAL;
  2390	
  2391		return 0;
  2392	}
  2393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
