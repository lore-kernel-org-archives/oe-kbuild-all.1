Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A970DDD2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 04:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741409178; cv=none; b=LfEu4wYgdLnk9UarvifUl5X4TZPs6BO0moxbnyzcgrRtcaPWn9G0ayhG8womflj3Zng81W2aS8YWb1LY9lT2RSqFp/LWWKeeN5J7NMUL48SLIcGGYFeuDRMW/pKw1c/Ju9QGixdZNt/aPLTTwc7u6auz052NIrtmR6qymoU2uKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741409178; c=relaxed/simple;
	bh=MpYGezMtPpitnMYbtYLZqzT6BB2kDXwNluqIvTdE7K8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cRoLro1GcGgzOLiz+XOyW3/yk4rkjvQpW7JGdng+Z4EvTokU4kCYQg44KSpYByV4QpUazQ3AzUF16davAxavD8L79V+4+GiFMwMHyXliS3lntZV39HlHI6kVQ2lFYMCQ5Oh6C4LQIZBeEwjkkqGMvr/lra5zISmvz5FaBbETFwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dN/GCn8S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dN/GCn8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741409176; x=1772945176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpYGezMtPpitnMYbtYLZqzT6BB2kDXwNluqIvTdE7K8=;
  b=dN/GCn8SupYPHD0w7qmhYTXxQCCnmFxzIxNjB1aOMaZ4ppfNi7RWlK0H
   ej2lbdsmLH0/vTfYAaPwemlEZtL+d8Rom9kWv6KL4GO3Z53TPsqZAe6MR
   IzAganILqxyCkaqwq0o2tJxryTeJHgCh4zwU0r6dRHsf3cJDi1U1qcBnr
   GR0HamDKRtChFiClheAN2BYPc4KJtUttlXMnC+pOSUUx/IMazzZLQnkCQ
   R+YJ83F9b0Y+d8Hpj4svkGCEZWy6IqEFbWB7tOdoqmZjC0oOthQW3f/22
   2I0egYHnnE/OKrM64R6XLAFGITQVhiwkVeX+rnbXcoGvUGc+92+tLF1vm
   A==;
X-CSE-ConnectionGUID: IAMmKW/zRVyS9fHpO7Zrcg==
X-CSE-MsgGUID: wL6R9RDuSxKKkyMvilCcug==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41719993"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="41719993"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 20:46:15 -0800
X-CSE-ConnectionGUID: 32vYzx+6SpGew8Al3I8mdg==
X-CSE-MsgGUID: dRpgr6uHSxeChJ9X5ZgBZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119435719"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2025 20:46:15 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqm4h-0001VB-3B;
	Sat, 08 Mar 2025 04:46:11 +0000
Date: Sat, 8 Mar 2025 12:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] ld.lld: error: undefined symbol:
 ntb_db_event
Message-ID: <202503081215.KLOu0HqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   2f429dfdbdfb6613aa3347b5724bb781b5c92be4
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [1/1] PCI: endpoint: Support NTB transfer between RC and EP
config: arm-randconfig-r121-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081215.KLOu0HqC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503081215.KLOu0HqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081215.KLOu0HqC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ntb_db_event
   >>> referenced by pci-epf-vntb.c
   >>>               pci/endpoint/functions/pci-epf-vntb.o:(epf_ntb_cmd_handler) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ntb_link_event
   >>> referenced by pci-epf-vntb.c
   >>>               pci/endpoint/functions/pci-epf-vntb.o:(epf_ntb_cmd_handler) in archive drivers/built-in.a
   >>> referenced by pci-epf-vntb.c
   >>>               pci/endpoint/functions/pci-epf-vntb.o:(epf_ntb_cmd_handler) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ntb_register_device
   >>> referenced by pci-epf-vntb.c
   >>>               pci/endpoint/functions/pci-epf-vntb.o:(pci_vntb_probe) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
