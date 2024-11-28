Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246BA1946C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732787151; cv=none; b=iaSy6kcAyI7s74oWSSkoSt7u/9wK7xyMCEJe9EE0INBUtS8xFhG6RGl8KhxNVCnxdrmxGCnS3FUCew4b5Hwl5ztFLytDhocYg8H3B/YzUTS0SJzesckBIppwZ65Xm9TCjjaG6VBrn883iPOszNF08eE5PnDWWoKrXSU9StL3x7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732787151; c=relaxed/simple;
	bh=IDq9oX+Ude41vdaTq3af096hciMN/49jCkFkNbK4/w8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DfK12KOUj9hk0uFqvYjy0xByEC/TITh3iT/z6yXFIH0YIQEwL83IbF5kNsiOxZgIZOoAS2M2D+Lao81Q+d4jsr7+R0qgq3guulOuHXJtGT0jolPm+5+ZM+2FZ17WEmXRAXnLzxgZDBzPp+J+uUbJrTxiHT6dUPSxI8y5JDaq84w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDDZHnWR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDDZHnWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732787149; x=1764323149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDq9oX+Ude41vdaTq3af096hciMN/49jCkFkNbK4/w8=;
  b=gDDZHnWRxYeenh6BGZ10KXYY5DTcZ/gKVqd0N+1OfnT78mA9VqDGdcQj
   PLm4AKyHgLI2rcXxmA0T7gdQ+WD/su2hN2t6A1iEmnb2GT5vCwrS+f5AE
   lta917DcYd4jvXdXDl3Ko1Bb+lyL7Bk7r8pNzI7NMCWV6OXC0fstZLYgI
   nZgCR0aKzlCG3LqpuAL8KZotp817GwH7EDITHNS834v7jmVYxEClEH7Ty
   2mt6WDS0KLG8N+UeX2CjpKlF36dOwgx5eLdVQDg8XgJU6tr80cio6Q+x5
   v9OUp+PxOzGwP6bxuN9XRaC/V3WOWaki11yOoNXzQfS1gKeTuL353SD67
   g==;
X-CSE-ConnectionGUID: oge4CpbqSzeu0PozkNZ0YQ==
X-CSE-MsgGUID: wgElHZJeT7eDJYOBxoEqNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32380341"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="32380341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 01:45:48 -0800
X-CSE-ConnectionGUID: 6Kg4LMHaSHyieE2UVJNcAA==
X-CSE-MsgGUID: 2EXsihE/QhOWmwCJpZIXZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="123160389"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2024 01:45:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGb5l-0009Pf-0s;
	Thu, 28 Nov 2024 09:45:45 +0000
Date: Thu, 28 Nov 2024 17:45:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2498/2498] vmlinux.o: warning: objtool:
 do_machine_check()+0xff: call to mce_no_way_out.constprop.0() leaves
 .noinstr.text section
Message-ID: <202411281737.6qVsoQFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   48ec47c01c3800fd4419afd91af83e95ba9584d5
commit: 003a421b04ba85abaf24a92736dc47f76fda0803 [2498/2498] disable OPTIMIZE_INLINING by default
config: x86_64-buildonly-randconfig-003-20241128 (https://download.01.org/0day-ci/archive/20241128/202411281737.6qVsoQFv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281737.6qVsoQFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281737.6qVsoQFv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: arch/x86/power/hibernate_asm_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   vmlinux.o: warning: objtool: mce_setup()+0xc: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: do_machine_check()+0xff: call to mce_no_way_out.constprop.0() leaves .noinstr.text section
   ld: warning: arch/x86/power/hibernate_asm_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: warning: .tmp_vmlinux.kallsyms1.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms2 has a LOAD segment with RWX permissions
   ld: warning: .tmp_vmlinux.kallsyms2.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: vmlinux has a LOAD segment with RWX permissions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
