Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D953123B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 01:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755910992; cv=none; b=ZMCvKTvB7ucFcLwh+QzCMU94EZIlg6+s5C8GSjz4+Pq1FJKsZ2DRnMHwHUVC5yteDEaVOzhVrDHMNbfidHusMZ/9eTOhM/u535bmXLCaAKpm5Vtt20MkitMvm/HMoIdhYBcjYomVwp1hHgi2IHjUCM6PsoAcC4JT/6Q77bzQ9Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755910992; c=relaxed/simple;
	bh=GKtp2tdxHBwKduQS879ES398FLml3TdKxPTRv07z6bs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJrAX6IG/T+AWZq7R/XtfQQ4gV0wUUlXDzRmQECvALyMp3SpNI7h3lZP0sGIu5CPAL+zLTXIaPsACsqrRgOofH721n0GVSq8SwgAN9g1NV64b7rf9v1/qjNtDBDWjODfUpoAojmOEXM0aNjKMc7MntQ3B0y0XcM8MYkMvaWydGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7P2nM06; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7P2nM06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755910991; x=1787446991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GKtp2tdxHBwKduQS879ES398FLml3TdKxPTRv07z6bs=;
  b=C7P2nM06p35af23MWctbiIcNflMiZ3+a9XmqNC1D/ezaxD7JTx0+2313
   nDbjRHrKCPRTpLZChBbyPyE6ddRTxjeo7Tzs3Wz29zrl8OZVC3JqJqm/P
   JKBahJ8830AU68LBd6NyCfbDizVHzt7aYmAXdQkmrtv/SRt66edV89J0Z
   Y0zGF0A8ojOdl+3kuq9cCTx5IzY1jqZxB6h4W/Iz5PjgvI/BMBBJGfMBr
   H97pXsm7pt9gGLm8YYA4ZxtH41GDs7FPj5p11hNCjzEQg8BjuEoUC2Etk
   7iV6iunVND99MQvQ8nj+57Id8sPLhPOHJzAFkm1aEY5Ef7R+CpWZzHZfM
   g==;
X-CSE-ConnectionGUID: OozI0sh6Quay5d2i8I1rOg==
X-CSE-MsgGUID: C5GlajHjTPWegMiAVhHq6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69589121"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69589121"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 18:03:07 -0700
X-CSE-ConnectionGUID: V0G1TeSjRTuNBt39pueYkQ==
X-CSE-MsgGUID: aXyZinAHRBmseMf+Lr7mmg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 18:03:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upceu-000Lz6-0c;
	Sat, 23 Aug 2025 01:03:04 +0000
Date: Sat, 23 Aug 2025 09:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [linux-next:master 2683/4234]
 drivers/accel/amdxdna/aie2_pci.c:794:13: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202508230855.0b9efFl6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: c8cea4371e5eca30cda8660aabb337747dabc51d [2683/4234] accel/amdxdna: Add a function to walk hardware contexts
config: x86_64-randconfig-122-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230855.0b9efFl6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230855.0b9efFl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230855.0b9efFl6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/aie2_pci.c:794:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct amdxdna_drm_query_hwctx [noderef] __user *tmp @@     got void *[assigned] _res @@
   drivers/accel/amdxdna/aie2_pci.c:794:13: sparse:     expected struct amdxdna_drm_query_hwctx [noderef] __user *tmp
   drivers/accel/amdxdna/aie2_pci.c:794:13: sparse:     got void *[assigned] _res
>> drivers/accel/amdxdna/aie2_pci.c:807:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct amdxdna_drm_query_hwctx [noderef] __user *tmp @@
   drivers/accel/amdxdna/aie2_pci.c:807:31: sparse:     expected void const *from
   drivers/accel/amdxdna/aie2_pci.c:807:31: sparse:     got struct amdxdna_drm_query_hwctx [noderef] __user *tmp
>> drivers/accel/amdxdna/aie2_pci.c:798:9: sparse: sparse: dereference of noderef expression
   drivers/accel/amdxdna/aie2_pci.c:799:9: sparse: sparse: dereference of noderef expression
   drivers/accel/amdxdna/aie2_pci.c:800:9: sparse: sparse: dereference of noderef expression
   drivers/accel/amdxdna/aie2_pci.c:801:9: sparse: sparse: dereference of noderef expression
   drivers/accel/amdxdna/aie2_pci.c:802:9: sparse: sparse: dereference of noderef expression
   drivers/accel/amdxdna/aie2_pci.c:803:9: sparse: sparse: dereference of noderef expression

vim +794 drivers/accel/amdxdna/aie2_pci.c

850d71f6bf4c20 Lizhi Hou 2024-11-18  785  
c8cea4371e5eca Lizhi Hou 2025-08-15  786  static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
850d71f6bf4c20 Lizhi Hou 2024-11-18  787  {
c8cea4371e5eca Lizhi Hou 2025-08-15  788  	struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = NULL;
c8cea4371e5eca Lizhi Hou 2025-08-15  789  	struct amdxdna_drm_get_info *get_info_args = arg;
850d71f6bf4c20 Lizhi Hou 2024-11-18  790  
c8cea4371e5eca Lizhi Hou 2025-08-15  791  	if (get_info_args->buffer_size < sizeof(*tmp))
c8cea4371e5eca Lizhi Hou 2025-08-15  792  		return -EINVAL;
850d71f6bf4c20 Lizhi Hou 2024-11-18  793  
850d71f6bf4c20 Lizhi Hou 2024-11-18 @794  	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
850d71f6bf4c20 Lizhi Hou 2024-11-18  795  	if (!tmp)
850d71f6bf4c20 Lizhi Hou 2024-11-18  796  		return -ENOMEM;
850d71f6bf4c20 Lizhi Hou 2024-11-18  797  
c8cea4371e5eca Lizhi Hou 2025-08-15 @798  	tmp->pid = hwctx->client->pid;
850d71f6bf4c20 Lizhi Hou 2024-11-18  799  	tmp->context_id = hwctx->id;
850d71f6bf4c20 Lizhi Hou 2024-11-18  800  	tmp->start_col = hwctx->start_col;
850d71f6bf4c20 Lizhi Hou 2024-11-18  801  	tmp->num_col = hwctx->num_col;
850d71f6bf4c20 Lizhi Hou 2024-11-18  802  	tmp->command_submissions = hwctx->priv->seq;
850d71f6bf4c20 Lizhi Hou 2024-11-18  803  	tmp->command_completions = hwctx->priv->completed;
850d71f6bf4c20 Lizhi Hou 2024-11-18  804  
c8cea4371e5eca Lizhi Hou 2025-08-15  805  	buf = u64_to_user_ptr(get_info_args->buffer);
c8cea4371e5eca Lizhi Hou 2025-08-15  806  
c8cea4371e5eca Lizhi Hou 2025-08-15 @807  	if (copy_to_user(buf, tmp, sizeof(*tmp)))
c8cea4371e5eca Lizhi Hou 2025-08-15  808  		return -EFAULT;
c8cea4371e5eca Lizhi Hou 2025-08-15  809  
c8cea4371e5eca Lizhi Hou 2025-08-15  810  	get_info_args->buffer += sizeof(*tmp);
c8cea4371e5eca Lizhi Hou 2025-08-15  811  	get_info_args->buffer_size -= sizeof(*tmp);
c8cea4371e5eca Lizhi Hou 2025-08-15  812  
c8cea4371e5eca Lizhi Hou 2025-08-15  813  	return 0;
850d71f6bf4c20 Lizhi Hou 2024-11-18  814  }
850d71f6bf4c20 Lizhi Hou 2024-11-18  815  

:::::: The code at line 794 was first introduced by commit
:::::: 850d71f6bf4c2010efae845f9ff841cce902f22c accel/amdxdna: Add query functions

:::::: TO: Lizhi Hou <lizhi.hou@amd.com>
:::::: CC: Jeffrey Hugo <quic_jhugo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
