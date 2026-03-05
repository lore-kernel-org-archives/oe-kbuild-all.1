Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B420E6E2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 01:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674803; cv=none; b=jvXgvh87BmglY8Cbbxh7V23M/VRUMcKeP0+m2kBvj12I8cDQXRHQldkI3+D94RoJifF2KDhTi7mBVaExDSsJH7MvFro0ALAaxJrgrWHC5Jx18AuGH0dhv17HtF0zBvOYsQ65btnUWamNivLwNF8v9XPUzrxc3h+yaiXWA8d2d0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674803; c=relaxed/simple;
	bh=kjH5uGFqOk1e651lQiMVYdVPJgOquhre1/Cbpb0SlU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DaSp0DXymMJj0L7LE0tIyw8UFLHbb/WVU11ya/ZKk005PaE2dioFiDNEtdE00d3aG+zPyU+pFPhHq0pIsJ5pi1qFgZDW27n+lE0dhaFb891GkFN1d+bOOmYnvt0XOJRC4fto1UrYGpBoh5+OBodpVQx+QwKdM6Qd3LlQZHzVr2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwaonEKF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwaonEKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772674802; x=1804210802;
  h=date:from:to:cc:subject:message-id;
  bh=kjH5uGFqOk1e651lQiMVYdVPJgOquhre1/Cbpb0SlU0=;
  b=iwaonEKFZDrLXpU27HmHh6LQg5qligM/dWe2hN+O5LhNtYMZY4XlEje/
   aUELelwP+fUqsr33uysztnbWhQTRh+4tKAAHxMwSVYu3ikpnfngJ9fxYB
   gF0MnSiFwmhMP6New6dGKhmJceGC8wvvRsjRR0mvISUSb3kBTOMIzs59K
   LTgoEtIy171fLMZR6c6Yrc0UyznoQ3YnjQdG2WnXf20veBwJGl+CCphJ9
   bPh/TPhR0YbVubKuSUTQZUZLAmNZqC69KSKv10Ca5PXV8zhHScMK1WqRW
   oi03EjpbHH7BN1UG7BruZ4a9qP1xAC9GzogXfrVlXiUJx0NG+7AnT05sG
   A==;
X-CSE-ConnectionGUID: cWS6ge4QTFOM01H4oU+iRg==
X-CSE-MsgGUID: snHHmxQkQxKTRjrUqNZY0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77623060"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="77623060"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 17:40:01 -0800
X-CSE-ConnectionGUID: Q00k3BC9QgG7EG+APN0WMA==
X-CSE-MsgGUID: ppeVf/oiSlabXcq62GtFUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="215816848"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2026 17:40:00 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxxgz-000000004xV-1b2p;
	Thu, 05 Mar 2026 01:39:57 +0000
Date: Thu, 05 Mar 2026 09:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 ./usr/include/linux/vbox_vmmdev_types.h:239:4: warning: field u within
 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union
 (unnamed at ./usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually
 due to 'struct vmmdev_hgcm_function_par...
Message-ID: <202603050904.fU7j00Xv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   7f9e000083563dd4928fb8eafa7cae2a1a3d8a88
commit: 26fa53553b6950c7dc242605991e34e7b96760f4 [1/1] kbuild: hdrcheck: fix cross build with clang
config: arm-randconfig-002-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050904.fU7j00Xv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050904.fU7j00Xv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050904.fU7j00Xv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/vbox_vmmdev_types.h:239:4: warning: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed at ./usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     239 |         } u;
         |           ^
>> ./usr/include/linux/vbox_vmmdev_types.h:254:6: warning: field u within 'struct vmmdev_hgcm_function_parameter64::(unnamed union)::(unnamed at ./usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed at ./usr/include/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(unnamed union)::(unnamed at ./usr/include/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 warnings generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/vboxguest.h:14:
>> usr/include/linux/vbox_vmmdev_types.h:239:4: warning: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed at usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     239 |         } u;
         |           ^
>> usr/include/linux/vbox_vmmdev_types.h:254:6: warning: field u within 'struct vmmdev_hgcm_function_parameter64::(unnamed union)::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed at usr/include/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(unnamed union)::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 warnings generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/hyperv.h:361:2: warning: field  within 'struct hv_kvp_exchg_msg_value' is less aligned than 'union hv_kvp_exchg_msg_value::(anonymous at ./usr/include/linux/hyperv.h:361:2)' and is usually due to 'struct hv_kvp_exchg_msg_value' being packed, which can lead to unaligned accesses [-Wunaligned-access]
     361 |         union {
         |         ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
