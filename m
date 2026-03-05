Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E88025A2C6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772686290; cv=none; b=Re/6kUGmkdDBJltAk7OtnF5SW2yvlmO27z2yMgRET1xlxRB4ZNfh9N8trt9GINW/Oeaiyg5JLasTXVBzAXFK4K1oW0SiB6KRxs6kb+p8TeKeI8gE3A1XVr6c9Tw3ZXPa+MHsVO2gwMWfvSnIUHtgLXDtcDHdwHeU4hK6pX2O4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772686290; c=relaxed/simple;
	bh=q1DFWNZ2mMPGIh1zaTNUCa2EMWyr/llyY0iNd/dZKsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NQXGrsv4G+hiDJiekFARUly/UFjq/j26UUnhEaRo9y5NPPmtGpr0u6FuhGwMT494EyqzzbDofqb7BqAE813bf5Z4A51QDdyN4EYyiZPUQxE13DIeBXeXyScsqzupZi+90F8SxhZwe/kAcbjOLemrZZXy53KAdcKRyNtkz7AR11s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjUg2Xld; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjUg2Xld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772686288; x=1804222288;
  h=date:from:to:cc:subject:message-id;
  bh=q1DFWNZ2mMPGIh1zaTNUCa2EMWyr/llyY0iNd/dZKsY=;
  b=RjUg2XldQ0Sr/UoI0jbatfL6DhLODjtktsTXqHDt6u4kzPbUggxzmVyA
   McvsoayxBd9qCdqhs4xuxy4ifhaI9KJTM+VAu4jdJm74dljTXSNeCECDK
   PmYJX3HGiPoFe9BRoNnnjvK78LGxtpUXhjjdGtPBr6cRZbMCF7rNauxMC
   MqWWifoMLtffqbamgXEEtVhfCzKwf2cZz+P2GGP43/lVo3NDARHSmealN
   +6iMlMfRtYLand4iUH1g+NsZQ534hZUhDE/zcylFvCpteEsfiZmgHKvcX
   0kNxKkjqY3vSB+wEqjZKR9At1MHI/mdvqSI5qD0Co2EmqZVa4sjOL/R3e
   A==;
X-CSE-ConnectionGUID: HbA/nRbVRUqbe9ggC0GqCA==
X-CSE-MsgGUID: HcIPxHiQTjSZX34bKFt3/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84847523"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="84847523"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:51:28 -0800
X-CSE-ConnectionGUID: QPNVDSEVQOK4tlPRYnNm3A==
X-CSE-MsgGUID: i6ZHNE/gQAuHEtyn9AFSpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218508767"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2026 20:51:26 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy0bf-00000000073-1PJB;
	Thu, 05 Mar 2026 04:48:12 +0000
Date: Thu, 05 Mar 2026 12:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.12.y 955/955]
 arch/x86/kernel/setup.c:380:15: error: implicit declaration of function
 'ima_validate_range'
Message-ID: <202603051205.dAWQ3Uz1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.12.y
head:   c1924e059c728edf4138c6343fafb2c6d234ac35
commit: f8f73bf0f8a57ee9b86792456bd42079bc98c6b7 [955/955] x86/kexec: add a sanity check on previous kernel's ima kexec buffer
config: x86_64-randconfig-073-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051205.dAWQ3Uz1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051205.dAWQ3Uz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051205.dAWQ3Uz1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/setup.c: In function 'ima_get_kexec_buffer':
>> arch/x86/kernel/setup.c:380:15: error: implicit declaration of function 'ima_validate_range' [-Wimplicit-function-declaration]
     380 |         ret = ima_validate_range(ima_kexec_buffer_phys, ima_kexec_buffer_size);
         |               ^~~~~~~~~~~~~~~~~~


vim +/ima_validate_range +380 arch/x86/kernel/setup.c

   372	
   373	int __init ima_get_kexec_buffer(void **addr, size_t *size)
   374	{
   375		int ret;
   376	
   377		if (!ima_kexec_buffer_size)
   378			return -ENOENT;
   379	
 > 380		ret = ima_validate_range(ima_kexec_buffer_phys, ima_kexec_buffer_size);
   381		if (ret)
   382			return ret;
   383	
   384		*addr = __va(ima_kexec_buffer_phys);
   385		*size = ima_kexec_buffer_size;
   386	
   387		return 0;
   388	}
   389	#endif
   390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
