Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC728467D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 20:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177058; cv=none; b=REXHl0U7X1mZhQq84fY98IgYYQnWM5tMdgvuPueHUeTpBTwuR6eKuIGo7B9jsG576MRijXRPwhxv5Gjlh9hVerYjPFvDcFgwKzxz308wfCy5FdmrsXN/MiDqFN85Qx98qTTr/+N9Lfe5srgrBAWVg38lARzI169oQrT0MPttryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177058; c=relaxed/simple;
	bh=qVQQQSnSY2vIao/zILwgOOomZA48w5tu0gKV74gJbHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZNGP4cjIzwJh1V+9pLFQgus4meBwD3Q25adIWY0eSauXtJdXNYTsNJVtKMDcN+jn1NC1lGyYw3CqEncm+R69yv8nyFLseE+UkjssnP3cSMr+qNkuRH3LfJ+fN1FnrxCRXIQZrj++Ba3SwuuTVZO/WkQizZr6wWanuAKu/ipMkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJ9qgfbN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJ9qgfbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766177057; x=1797713057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qVQQQSnSY2vIao/zILwgOOomZA48w5tu0gKV74gJbHo=;
  b=hJ9qgfbNLEXCAnIbdfswDsrNOEzwIImG6E/DrAjy/Rh3WChImldfhnqI
   e6CAwb1v3B+yeNT/bf4qMZGmpe5dls2KpJXKIT4gVCIF3HPAPRbHMYg5q
   r8Z4ijWdvSPZ55rHYZsMfuafnlaprcfxWf1qRmlMpztrOmPSOwzooYPlZ
   TrBqXefu/IKQnt3FfhyHz3iVqwv0FKXQWSurZrpQZxPf8jDLeazmAi3/N
   YOs9g1/FQqAt20QWRWc8aWruIw6u+sxTafQKbmICMarcveuxlPU185fhf
   R7lF+NH/Kh2ZUPcRg4od+qf4ej+X1CA7YUYdM2RbaCKH/k6U1+pUoxahJ
   A==;
X-CSE-ConnectionGUID: WK4Yax6QTDG9kwP3vDmpMQ==
X-CSE-MsgGUID: XJYWbnOQTdO/PQGo04cxAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="85723757"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="85723757"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 12:44:16 -0800
X-CSE-ConnectionGUID: k48D1woASq+lcOZxWtkhzg==
X-CSE-MsgGUID: GdL8No9zTo6ALpnMDAC0Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="204027363"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Dec 2025 12:44:15 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWhKe-000000003yn-2kMk;
	Fri, 19 Dec 2025 20:44:12 +0000
Date: Sat, 20 Dec 2025 04:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2537:6: warning: no
 previous prototype for function 'dc_reset_state'
Message-ID: <202512200452.Co6OSDz0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rodrigo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: fb7c68bbccad1a92d9078a5b2160d448da542b7a [2/2] drm/amd/display: Add minimal pipe split transition state
config: x86_64-randconfig-122-20251212 (https://download.01.org/0day-ci/archive/20251220/202512200452.Co6OSDz0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200452.Co6OSDz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200452.Co6OSDz0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2537:6: warning: no previous prototype for function 'dc_reset_state' [-Wmissing-prototypes]
    2537 | void dc_reset_state(struct dc *dc, struct dc_state *context)
         |      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2537:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2537 | void dc_reset_state(struct dc *dc, struct dc_state *context)
         | ^
         | static 
   2 warnings generated.


vim +/dc_reset_state +2537 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

  2536	
> 2537	void dc_reset_state(struct dc *dc, struct dc_state *context)
  2538	{
  2539		dc_resource_state_destruct(context);
  2540	
  2541		/* clear the structure, but don't reset the reference count */
  2542		memset(context, 0, offsetof(struct dc_state, refcount));
  2543	
  2544		init_state(dc, context);
  2545	}
  2546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
