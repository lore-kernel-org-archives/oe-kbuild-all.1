Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4769171BA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711194723; cv=none; b=is7g8fcUIvgT8oiu9g81Gjn2zWJDTSCHy9McesHf2p6L7pg14y1oAve13nBuGtEwZ2r3uQG/Qc+dRfbNB+5PqwQ1EmhiBzGcNx3JaDCJ4H9XIejYcEgJtPLncrnFjXa+KJsLI2melYaCqRTVsZp88OlN3qJ68qemFshzBis/qx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711194723; c=relaxed/simple;
	bh=uyJBiHXzIHAZ1n8uYwcvF0iefsCLlAkZ0aPRqd/kYdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crTIFFwJL93uP0NyX+LluX4vgP1MCI/14C+O74H1PdSnRvDBbi5ciMPq9xnnscbPUMNBSWhdkBw5gKneS9h2xDTF8DwFFGVlQO0nRd8IJ73LM2nx+KE5vmHGrfLddFswizd5UpMGRrd4eeZFUPgriTZHSSd0rv4WpmbQtF8NqmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVIEzDYx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVIEzDYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711194722; x=1742730722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uyJBiHXzIHAZ1n8uYwcvF0iefsCLlAkZ0aPRqd/kYdE=;
  b=VVIEzDYxBS+D60nCMMp96Qo/YUNPPej06xtO1zaMaO3yqM6Go/aHeh8f
   dDbrp7UZkdtvvxxmXRMoc+JWRC70zJIC4RmEMRP9wX62CZXmPwM+B+nDt
   NrNa80gV2T6PHcp+ub6LNCgKQfFOJheDCxiXwL2aCjOPxrKkpFndWReCg
   tjNIWAw83Fhmjrbl41OlJa+DR6w2XUHXHhw8HFP/5TCG6kW6NMX6Ri/uN
   hcdVESlQl45SzivLf8mo+GwCUDn29wkTbVHPCj5R8/YZZncEUc+dnnPmC
   ArlnSp0ckA1+/eMSfPd6QJWajAKRZU0yHiAB7tkqwO2PcwCNka9reZ0tR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10017992"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="10017992"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 04:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15169225"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Mar 2024 04:51:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnzul-000L7X-15;
	Sat, 23 Mar 2024 11:51:55 +0000
Date: Sat, 23 Mar 2024 19:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14628/30000] ld.lld: error: undefined symbol:
 proc_mm_idle_operations
Message-ID: <202403231943.bTlhzqcv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   459341c4b4845b283c7a884e6a0dc4bd8cdb89e6
commit: 4232d9005401d839ceeb1a02da34749b6dab1376 [14628/30000] etmem: add CONFIG_ETMEM macro definition for etmem feature
config: x86_64-randconfig-072-20240323 (https://download.01.org/0day-ci/archive/20240323/202403231943.bTlhzqcv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231943.bTlhzqcv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231943.bTlhzqcv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: proc_mm_idle_operations
   >>> referenced by base.c
   >>>               proc/base.o:(tid_base_stuff) in archive fs/built-in.a
   >>> referenced by base.c
   >>>               proc/base.o:(tgid_base_stuff) in archive fs/built-in.a
--
>> ld.lld: error: undefined symbol: proc_mm_swap_operations
   >>> referenced by base.c
   >>>               proc/base.o:(tid_base_stuff) in archive fs/built-in.a
   >>> referenced by base.c
   >>>               proc/base.o:(tgid_base_stuff) in archive fs/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
