Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1044315C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341921; cv=none; b=uqdHfi9rao3tfQ/xwkMNcNliO0GEDSlgBcaBNdIsjr9DQ4uE7uKz0VDrHqxWphNbsrc6z04zhDXOO1VNXSOuf+Sjh+O/GrRxO/gpMcObw62b9wM4ZhyNozkZukoOT5yVLU8R73nei8RdyWQ7h7jDcd+M2DhIIEPcCYOQD7JuoRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341921; c=relaxed/simple;
	bh=fimqVoEvpNyJd448Fb+owi1ncpeM+t6y9gGCX5h9hmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJmclkIpKeXBpuvdiWQ++sgb5JdqgMcoZPt9vhXPrKQ1WgulXWYp/pKZb5ayYZ4LHoA+qQfUh3u2Nt+JrwIaC7mVu+9n0QO5STBpZfMCikot9wEezsdOjKGIA2sVSJBYLZQq7bX6nuazymr5viNICzW2JPXp6GcjikujxNTK15Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZgl4Qg0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZgl4Qg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748341920; x=1779877920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fimqVoEvpNyJd448Fb+owi1ncpeM+t6y9gGCX5h9hmU=;
  b=OZgl4Qg0eyuphFV1giJ4D1l/9cdIWXpl4Kirz0A6omZqfDsGujZG+8vn
   X9Ce0MDeo1aQnotY9OVGdTT+TH2YzJ2AVvLrIpp6MD9z4M74cZOZkgh4k
   6WCP36LYOcu8DbTDpvhY6ens9lEIFCCKXxH0Op9JnYbC3jaVvNj7iT5rp
   A8lcoKMW7SHsGNgQcKCZl+7+j9lkGLilr5tK8JmrIKUzpLflcrAR0fLuL
   r3Tt4YFn96uEFO6MYfRS7Q80pSozPoOE4JeqfjRKTADZyIJrXInbGZKkQ
   cDJJ9FH99eNl06MXIA3RYhBFmi51fX4D4+GiIn30jUqYwwpJkcVYCMU+i
   Q==;
X-CSE-ConnectionGUID: Mo6oLS0USo2sjWFMc/HWBw==
X-CSE-MsgGUID: 9R8b6tjfT7+tPlG9b7zFTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50022467"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="50022467"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 03:31:59 -0700
X-CSE-ConnectionGUID: Vy2WCs1nT7SWPjXm6fkWzg==
X-CSE-MsgGUID: 0wly3PQPRwy830GoGTEAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="165951954"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 May 2025 03:31:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJrb9-000T7M-3A;
	Tue, 27 May 2025 10:31:55 +0000
Date: Tue, 27 May 2025 18:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/soc/mediatek/mtk-mmdvfs-v3.c:428:29: warning: unused variable
 'mtk_mmdvfs_req_ops'
Message-ID: <202505271815.zIQZy03f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00e2b7e08c550ff321daba7b9956795d281bdd98
commit: 4d3162e27617a05f29587c0d2850e1be07ce5a28 [133/133] CHROMIUM: remoteproc: vcp: support MMDVFS and MMQOS feature requirement
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250527/202505271815.zIQZy03f-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271815.zIQZy03f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271815.zIQZy03f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/mediatek/mtk-mmdvfs-v3.c:9:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
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
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:481:6: warning: no previous prototype for function 'vmm_notify_work_func' [-Wmissing-prototypes]
     481 | void vmm_notify_work_func(struct work_struct *work)
         |      ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:481:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     481 | void vmm_notify_work_func(struct work_struct *work)
         | ^
         | static 
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:535:5: warning: no previous prototype for function 'vmm_avs_debug_dump' [-Wmissing-prototypes]
     535 | int vmm_avs_debug_dump(char *buf, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:535:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     535 | int vmm_avs_debug_dump(char *buf, const struct kernel_param *kp)
         | ^
         | static 
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:692:5: warning: no previous prototype for function 'mmdvfs_vmm_ceil_step' [-Wmissing-prototypes]
     692 | int mmdvfs_vmm_ceil_step(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:692:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     692 | int mmdvfs_vmm_ceil_step(const char *val, const struct kernel_param *kp)
         | ^
         | static 
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:717:5: warning: no previous prototype for function 'mmdvfs_rst_clk_rate' [-Wmissing-prototypes]
     717 | int mmdvfs_rst_clk_rate(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:717:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     717 | int mmdvfs_rst_clk_rate(const char *val, const struct kernel_param *kp)
         | ^
         | static 
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:756:5: warning: no previous prototype for function 'mmdvfs_get_vcp_log' [-Wmissing-prototypes]
     756 | int mmdvfs_get_vcp_log(char *buf, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     756 | int mmdvfs_get_vcp_log(char *buf, const struct kernel_param *kp)
         | ^
         | static 
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:784:5: warning: no previous prototype for function 'mmdvfs_set_vcp_log' [-Wmissing-prototypes]
     784 | int mmdvfs_set_vcp_log(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:784:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     784 | int mmdvfs_set_vcp_log(const char *val, const struct kernel_param *kp)
         | ^
         | static 
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:813:5: warning: no previous prototype for function 'mmdvfs_get_vmrc_log' [-Wmissing-prototypes]
     813 | int mmdvfs_get_vmrc_log(char *buf, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:813:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     813 | int mmdvfs_get_vmrc_log(char *buf, const struct kernel_param *kp)
         | ^
         | static 
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:841:5: warning: no previous prototype for function 'mmdvfs_set_vmrc_log' [-Wmissing-prototypes]
     841 | int mmdvfs_set_vmrc_log(const char *val, const struct kernel_param *kp)
         |     ^
   drivers/soc/mediatek/mtk-mmdvfs-v3.c:841:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     841 | int mmdvfs_set_vmrc_log(const char *val, const struct kernel_param *kp)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mmdvfs-v3.c:428:29: warning: unused variable 'mtk_mmdvfs_req_ops' [-Wunused-const-variable]
     428 | static const struct clk_ops mtk_mmdvfs_req_ops = {
         |                             ^~~~~~~~~~~~~~~~~~
   13 warnings generated.


vim +/mtk_mmdvfs_req_ops +428 drivers/soc/mediatek/mtk-mmdvfs-v3.c

1cc9e9ca2d2e26a Yunfei Dong 2024-09-03  427  
1cc9e9ca2d2e26a Yunfei Dong 2024-09-03 @428  static const struct clk_ops mtk_mmdvfs_req_ops = {
1cc9e9ca2d2e26a Yunfei Dong 2024-09-03  429  	.set_rate	= mtk_mmdvfs_set_rate,
1cc9e9ca2d2e26a Yunfei Dong 2024-09-03  430  	.round_rate	= mtk_mmdvfs_round_rate,
1cc9e9ca2d2e26a Yunfei Dong 2024-09-03  431  	.recalc_rate	= mtk_mmdvfs_recalc_rate,
1cc9e9ca2d2e26a Yunfei Dong 2024-09-03  432  };
1cc9e9ca2d2e26a Yunfei Dong 2024-09-03  433  

:::::: The code at line 428 was first introduced by commit
:::::: 1cc9e9ca2d2e26a6b7e9b650ba61a261506201ee CHROMIUM: mmdvfs: add basic driver to support mmdvfs

:::::: TO: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
