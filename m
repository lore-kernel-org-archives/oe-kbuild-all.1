Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFC743179
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732946370; cv=none; b=VQ0S29XqvD85VSLxiv5mzSr+zh6AMaz9IMzSvuV+C5Vizu2gsYQadHa8aFM8O/HrBaELeiojlu0113v3fKhGozKI2+g1RPGF/a4O2Lr8izpRC/AMSKOUBywZdu2529wGKD1MPBo9dvmgBwRd6gzL4WpfHd7xPQP/5JMpU+UgGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732946370; c=relaxed/simple;
	bh=mVSYsuQJOijNL32Dds03+QmDC3XkTe44lnpMfJzL+cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ro22xh0XFCdwg0nh+S6Od7I169xdy1aTSc9SxGpbxlvh5QgAmyItdG/+2kGoYqhOWmYEu7xYSd1emNJ+rG7xYxEK22/M8iQsNxViPwMjHUUp+eGjwXu00Y7yj+ddIcXFl+HQCp1pEAwMMmALiOouYE8McNUqicgZGOD/MQuubQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+ozMaTX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+ozMaTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732946369; x=1764482369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mVSYsuQJOijNL32Dds03+QmDC3XkTe44lnpMfJzL+cc=;
  b=M+ozMaTXbzslHzEPM78RwavVZ8n0WOzgX6DsPN6RxLda0lV0LICMBDmW
   J5dEuTNcpOe5RxUxdsAaizGIk2Oqi75EX9zeAhj6QjTMcdZc4IaZk4iNt
   tJZNkqHhcL3wv0bAaArpz1g5NNRjGrJMlWyR4Hi8hW9jFAM4nsjdBGjZy
   RP/EpAhnQ/Bm8anNbalDzjy682zp8mZV8iUXazSzOQASiqxD0pLxDJ9W/
   asS9ItwMLzFK9xPVijHd+hjx996BOo+xH6zF1VqjdgYvFjZRHDW8fyn20
   VWd+lOIBFTOH45y64DvQcPHgSUUpawD5/16Jg4yEn22Cootsmg62vbVXC
   w==;
X-CSE-ConnectionGUID: sBlBoK3zRVS3aT01i/+mVg==
X-CSE-MsgGUID: ToBS9FxpT96lLIwFCIsuAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33223578"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="33223578"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 21:59:28 -0800
X-CSE-ConnectionGUID: 94RwyqhYQ/yvAoxs93BBAg==
X-CSE-MsgGUID: YVF5tna9QbqYOPB1YmpOJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="115907732"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Nov 2024 21:59:26 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHGVo-00007n-0x;
	Sat, 30 Nov 2024 05:59:24 +0000
Date: Sat, 30 Nov 2024 13:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, dinglongwei <dinglongwei1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1030/1030]
 drivers/gpu/drm/nouveau/nvkm/core/object.o: warning: objtool:
 nvkm_object_del()+0xd1: unreachable instruction
Message-ID: <202411301320.I40SexLC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 901dbb48d8a4f60af427f1ec67ac1247ff219f39 [1030/1030] nouveau: lock the client object tree.
config: x86_64-buildonly-randconfig-002-20240801 (https://download.01.org/0day-ci/archive/20241130/202411301320.I40SexLC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301320.I40SexLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301320.I40SexLC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/core/object.c:37:19: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
      37 |                 struct rb_node *node = client->objroot.rb_node;
         |                                 ^
   1 warning generated.
>> drivers/gpu/drm/nouveau/nvkm/core/object.o: warning: objtool: nvkm_object_del()+0xd1: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
