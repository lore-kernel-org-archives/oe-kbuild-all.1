Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF673EBF1C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771419474; cv=none; b=SwYTithwi0tAO30rvXy/o8uF9q5MoQ6CanAQ7HYIgpsdPryCxDjmSeR7uBa4KM1i4xoDPBXdkzFsj3EBE+tnT54gIDKe1Dru+OVaFTUoz4qQ971lFREct+9OOzkgTRISonIdRzysj0saODaBZxGi3OS5EQVqc0ecDnei1i+PFP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771419474; c=relaxed/simple;
	bh=I49LwfJIz+a4l8p7jh7wfjT+Rdy92gjcH8awcPyArOo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PZWw/IgOefNLZkbGSqW/YfbI7ksyif8hNktDESyQBY2LOp5hJj1KYXBvWI91yspyZonljq5JKUL7E8T/86+g0tFaroAqvkqfobkdvNFmtv4EwehXq0nJnnOfwfeKAvZP9sIMEO1iu4T1P4VrhsA9dH+GCIJRatEMHaU7gPk9i28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgV3jzRU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgV3jzRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771419473; x=1802955473;
  h=date:from:to:cc:subject:message-id;
  bh=I49LwfJIz+a4l8p7jh7wfjT+Rdy92gjcH8awcPyArOo=;
  b=dgV3jzRUtmC8jffAqUJZG/cFNMLVZ0CWdkWlmOCKqSybej30eDzMXrTm
   02Q9IxlSts08sU0Uac3hEmIIpJO4qivfecDvPYutOGJeLJi8JPFq2JmZE
   Y+Yjymskbizcsb4ocQ1S5bRlfOLuVO9b9lGWEe1VCIZWlVhMI67G/SfCu
   lEJ8Bb8OCLUqUqnfbud9eA2VKlruXWqwKvdW/DT0vylRzqUAP5HzuaeOu
   hUcREpADnpHnPj6L9q8QCJcSwa32WimTZ8TGExdUqdUV7eBxGV2eftmbJ
   Rr87T29VyRBaXrHz34W3lAg7BgB7gAjwBCA1AAUuK5VL8cq9oUqC+gfUE
   g==;
X-CSE-ConnectionGUID: Q+byTQikRoW/MdLVwQpt7g==
X-CSE-MsgGUID: QwVb0X0OQ6K06KIVKf44IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72583016"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72583016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 04:57:53 -0800
X-CSE-ConnectionGUID: AWbtZLv8TFKarYH7/OUGIA==
X-CSE-MsgGUID: VX5+f8NWTFKHIVfk/WNbCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="213384351"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Feb 2026 04:57:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsh7l-000000012M2-1e8h;
	Wed, 18 Feb 2026 12:57:49 +0000
Date: Wed, 18 Feb 2026 20:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 10/18] <stdin>:1636:2: warning:
 syscall container_enter not implemented
Message-ID: <202602182003.PFmg5k2c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   322545d60dd20abbe7456256165d81cd33aa1689
commit: e8d2efa78c5d0d25517279fad58fee78cd05fcc3 [10/18] containers: Implement container_enter()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260218/202602182003.PFmg5k2c-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602182003.PFmg5k2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602182003.PFmg5k2c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1627:2: warning: syscall container_create not implemented [-W#warnings]
    1627 | #warning syscall container_create not implemented
         |  ^
   <stdin>:1630:2: warning: syscall container_wait not implemented [-W#warnings]
    1630 | #warning syscall container_wait not implemented
         |  ^
   <stdin>:1633:2: warning: syscall container_kill not implemented [-W#warnings]
    1633 | #warning syscall container_kill not implemented
         |  ^
>> <stdin>:1636:2: warning: syscall container_enter not implemented [-W#warnings]
    1636 | #warning syscall container_enter not implemented
         |  ^
   4 warnings generated.
--
   <stdin>:1627:2: warning: syscall container_create not implemented [-W#warnings]
    1627 | #warning syscall container_create not implemented
         |  ^
   <stdin>:1630:2: warning: syscall container_wait not implemented [-W#warnings]
    1630 | #warning syscall container_wait not implemented
         |  ^
   <stdin>:1633:2: warning: syscall container_kill not implemented [-W#warnings]
    1633 | #warning syscall container_kill not implemented
         |  ^
>> <stdin>:1636:2: warning: syscall container_enter not implemented [-W#warnings]
    1636 | #warning syscall container_enter not implemented
         |  ^
   4 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
