Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4575B22B65A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855744; cv=none; b=DA5tIvvSxTiSU6DaNd5es1fpDMGVhIwWF3Mi4c+SwY2otLgCo5a5tMRaH0WCtGfuT+/av69jjPnf9u3IgTqCZrosga5XLYn+P0dMdfggVk6/ZBk/W0qeB61VMqhtWyoqCmoa7SWiWGWhx1LO2VZ+x1XsCRRmp3vGYYyGy0acdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855744; c=relaxed/simple;
	bh=C7No9fxNZVslHsHlEKmACA4Ax0povWlYsdC+UvH2xHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NnYRayPV0MxC2yLkMQRJQQZntWzoy/43W8Z3XyBVTOtiLeRtbjwWYbY1CY387oLLVRcBqjIethrmK/RVWBDrs7GiaULY9X2uDMLv5ZcIBxzlErNZwmuJpJiPwPCV4WNfcfxiJCu5N/fEPg1a99LKzjkSuG6uqJ0YkoKw2FX+ekc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ev876FMA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ev876FMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729855742; x=1761391742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C7No9fxNZVslHsHlEKmACA4Ax0povWlYsdC+UvH2xHM=;
  b=ev876FMADqP6gbZJlz+rOXQdamVdTagmUrvBSmxBrjHhlItUvp1DbFdY
   jBz+ggwxZ0t/NDOYyjq9hOQ036skXK1BnRmREZ50KmHy/H7zUT9Y/RGMQ
   WdXH76QumIPy0/ooBFoRWk8LxFBfgKEFPx5kLBSatqr+rZHav71hqmFq1
   7KzF+Aj5/NHnwAUceRIg7AfQLDSVtZqmi8ZqWRyIIt7Ug461uUIuTuGQ1
   kZVVHhxoQS1mMApYAQOOpmknS01JbYKdWt5ZENhh+c0YDCWykoV5TVZxv
   oFgtgMjMa8SSxyTLDjQqoWlAyjna/3WanBQ9FFTSDmsRerd7zEYTbd/F6
   A==;
X-CSE-ConnectionGUID: 7aTyuEROS1+UwAj3M4klXQ==
X-CSE-MsgGUID: 8Vi0/klfSe6GahNArA1EgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33326147"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="33326147"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 04:29:02 -0700
X-CSE-ConnectionGUID: XFss+O4hTBSqYV2LR/idcQ==
X-CSE-MsgGUID: N9wilqDZQ3GEN1mNuOBIng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81316055"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Oct 2024 04:29:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4IV0-000YAI-1S;
	Fri, 25 Oct 2024 11:28:58 +0000
Date: Fri, 25 Oct 2024 19:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 7838/23859] fs/debugfs/file.o: warning:
 objtool: full_proxy_open()+0x55b: unreachable instruction
Message-ID: <202410251924.cmJOufCW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d2a40c79ddef4b96b8a7a396bd7273121b1b4a5c
commit: d4bdc26bcd632cee393b5171345d5fa6293fe42b [7838/23859] include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures
config: x86_64-randconfig-004-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251924.cmJOufCW-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251924.cmJOufCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251924.cmJOufCW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/debugfs/file.c:15:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/debugfs/file.o: warning: objtool: full_proxy_open()+0x55b: unreachable instruction
--
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:27:
   In file included from include/drm/drmP.h:62:
   In file included from arch/x86/include/asm/pgalloc.h:7:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:271: warning: Function parameter or member 'id' not described in 'amdgpu_vmid_grab_reserved'
   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:520: warning: Function parameter or member 'vmhub' not described in 'amdgpu_vmid_reset'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ids.o: warning: objtool: amdgpu_vmid_grab()+0xd5c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
