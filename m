Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902442F32
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 02:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731812080; cv=none; b=HmjX8sQF59+ELI+QJYGodB4XeC7h7iqNnXHBsuXkD/nGIwEFTTO0T6ciaiytJuVig+RpWkG1Cab8BdaBH6E/K6N/4sB0vzpkhOGsLMnQw2shYOHMWCfuWe6NqHLuTP7ARThDyL9Evi/z/KWePB7NhaFQSKEFXKpWIdu+gor9apQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731812080; c=relaxed/simple;
	bh=6OMpTFaREYe5yafWqE/IwKj3gtoO5M6Gofkj96A+Gm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2UfjG62kAi+J1iIQHSXgE8XQypEc9VsBTxngc2Lu6stBN7l88GSle8OB+MvUhZiyPjaO8uCaTfoTfdfEm3qRDgaKzBDcqfED/0U7yovRL+59+H4t0yC2onMZb0Ff/mmnruW1Py1mbNf5cmiZ+1fyJAFFGOEgyzn8cJT0ef78b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5bNEwRX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5bNEwRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731812079; x=1763348079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6OMpTFaREYe5yafWqE/IwKj3gtoO5M6Gofkj96A+Gm4=;
  b=I5bNEwRX91+L5OqlZIh8/XlJu1s3jMN6h0iPo13W1Ep4ugKiZm1DfBRP
   ag0jzTRdCXctr+l+8vPxyXd3KPSazuWB09UsnLJOXMvgu3xjf8L/iaL9p
   lL7kSouLxm1gCqAdYZDmw0WBUsho5M6CVTN8jc5ChT35rnLMXn2HBj7B4
   MJJLPpLF3Ou74uzLuvVJp72VekLvbmaTBpO2H99wI6eGsE2Wg4diw3Gm3
   ixqEPulMODIhmySsqVyemr4mDSDW2FwtVy5JU8W8CmoZhe6JxCIAxQQLJ
   Ekub7De345DPVWYkHZaaJcpSrXMjsogF8cie378HNzzv2VmYHBKdZO8lk
   A==;
X-CSE-ConnectionGUID: wPKYfy/1QXGX8UIJ6lzbHA==
X-CSE-MsgGUID: cXOgHpq5SROJVlqpj70Q/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43187129"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="43187129"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 18:54:38 -0800
X-CSE-ConnectionGUID: F7ixz4cvT3eEMfn/2Rxrvw==
X-CSE-MsgGUID: hGZzFwZ0SruHNhhoc/YIKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="119840564"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Nov 2024 18:54:36 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCVQo-0001HJ-1g;
	Sun, 17 Nov 2024 02:54:34 +0000
Date: Sun, 17 Nov 2024 10:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 59/259]
 arch/x86/kvm/vmx/pkvm/hyp/nested.c: pkvm_nested_vmcs_fields.h is included
 more than once.
Message-ID: <202411171030.5AbKqJIB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: 9cb1c5184e0e4caf7086537d6bd92d663fce984a [59/259] ANDROID: pkvm: x86: Init vmcs read/write bitmap for vmcs emulation
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171030.5AbKqJIB-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/pkvm/hyp/nested.c: pkvm_nested_vmcs_fields.h is included more than once.

vim +142 arch/x86/kvm/vmx/pkvm/hyp/nested.c

   139	
   140	static struct shadow_vmcs_field shadow_read_only_fields[] = {
   141	#define SHADOW_FIELD_RO(x, y) { x, offsetof(struct vmcs12, y) },
 > 142	#include "pkvm_nested_vmcs_fields.h"
   143	};
   144	static int max_shadow_read_only_fields =
   145		ARRAY_SIZE(shadow_read_only_fields);
   146	static struct shadow_vmcs_field shadow_read_write_fields[] = {
   147	#define SHADOW_FIELD_RW(x, y) { x, offsetof(struct vmcs12, y) },
 > 148	#include "pkvm_nested_vmcs_fields.h"
   149	};
   150	static int max_shadow_read_write_fields =
   151		ARRAY_SIZE(shadow_read_write_fields);
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
