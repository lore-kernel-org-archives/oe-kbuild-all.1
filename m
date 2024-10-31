Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629DD13D29A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 04:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730350499; cv=none; b=VGurW2Noq9Mdig7qT3V+87tDtqtVED74qwQxxusQtk6APs3xhfVcVg8ZAkVnz2IRSSYnAec9tEEQpmsyLL0bF1J5sG9H/X3GqQDHjIneUgUZ1JjmmgHaV50u8AG6HhOCJEdkTnEO+7B6fj2g4md8ptCGkMVYT0XEE7VX5vl5cps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730350499; c=relaxed/simple;
	bh=/lnGKRHO0/diTNc3YCLVeYIijVyW/Hveh+uRkzylN8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ein+BRIUX1BsfATl9aKYHbbAss2c6r0pgODLOx+/C4hfm3KDxO29FVYhHkGmC9O3vzsHw/kugQWbpgy8xqhEk0LEsSRnJLTufLZaH6UX1GEPjZt48MaTaLqtq5RkFvw7cSv3lRUBBYiFf79WH+kUuUTVh91VfaPPnrvJgoX7vZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNgf82hW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNgf82hW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730350496; x=1761886496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/lnGKRHO0/diTNc3YCLVeYIijVyW/Hveh+uRkzylN8w=;
  b=QNgf82hWiBGQTu/g8Dq/QIUROE+zm+TAefKuEQlcu5kKnkZJhxIIX3Q+
   3oo4Vf3hltw+6d3IkmOaeqmnwBk1GaeLfGknYFBFSI7ohPaoRRgL2vXjL
   fPyfcCLczakyCR0YXRdnbklEo9dseDna2c2M9QvnkAbwD0AZxDnbIQ/jO
   XBVi6hjksMhXtGIOWZ+S7bBKNjk8f+9JNVzYB32jMWbmIj6Q+8XEwq55+
   +3GTCnlL2K9euUK5yYBhFPJe8QFZDZg2sPG0WTLluTd2GZjp/GaCVRi21
   mv+s3SQL1sFmxpK3H2zZMohLxQ9zSjHxQcsr0SIbsIUTN1pVwnE9yvkKt
   Q==;
X-CSE-ConnectionGUID: aZXd+aF0TOeigs9TU0s8Qg==
X-CSE-MsgGUID: eTHJaK+LRkyGRPlYJXiOYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30285862"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="30285862"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 21:54:56 -0700
X-CSE-ConnectionGUID: U+Qm3SLJQzG/eAScs2iu8Q==
X-CSE-MsgGUID: hud/+D98RBuS31zBtBmG3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82435845"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2024 21:54:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6NCu-000fg1-1G;
	Thu, 31 Oct 2024 04:54:52 +0000
Date: Thu, 31 Oct 2024 12:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 7622/30000]
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.o: warning: objtool:
 amdgpu_bo_release_notify()+0x2a3: unreachable instruction
Message-ID: <202410311230.Fxmrdp4m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f3af467e22b5869f73a416310ce9ba5558603b5b
commit: 613db224006696c7a210a0f850f37d8b4ad88fad [7622/30000] drm/amdgpu: Fix recursive locking warning
config: x86_64-buildonly-randconfig-001-20241030 (https://download.01.org/0day-ci/archive/20241031/202410311230.Fxmrdp4m-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311230.Fxmrdp4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311230.Fxmrdp4m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.o: warning: objtool: amdgpu_bo_release_notify()+0x2a3: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
