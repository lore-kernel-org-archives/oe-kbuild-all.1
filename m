Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B522417D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 04:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285685; cv=none; b=Ctf7xuaKiPitm+4h8IG5PU+mhjx2v4jwrlJqqrVtc89uHPqZuqHXM2VqSZfh/80IorwXBPOhHJzN43WfN6++LdFEvAxPl9IH9o0Eg3V8hxxrCB+RrlFjE8XrW+qJzqjXMlbsAVilarCMrJ10oikg7jPB7OiGzQrAVOWSSTeweso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285685; c=relaxed/simple;
	bh=P9dbCpqbXaSQHFEGSlqEfX6q1++kn3ss1vDW+yhGqPs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GHz77wLemYFPXYxKUFcXelVjvO7M5pJjVRRaAKvl4i8e4F4Nv7T9T15RwlNo7UspJGnYARdkOWgbJwlYh8lHFhgNfZ5rmC2hyZqLDuXJ7Ucmc3S4LsI8eLj48MqDz2TFNk44FISKKkprW8xWLUAt8iwfnZBMU9SdOAk0iSbzBww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhMYSUQC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhMYSUQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787285682; x=1818821682;
  h=date:from:to:cc:subject:message-id;
  bh=P9dbCpqbXaSQHFEGSlqEfX6q1++kn3ss1vDW+yhGqPs=;
  b=XhMYSUQC2DOlcgxdtR1y4kNyVBIFbNv6Ckhgj19VDHR4DLEaSt1oudrt
   z1i2ivUMDXkKU/dY0+jkQgFPrrJ5WDlE4dAYlT3yJyP2V9xdY9RqqQ64r
   BwNvpVy3XwVbQbx7dNFqTkGHTfjFJhJbAgb4mo8O5gaB7LbO5bm9DJ0BZ
   6ECzkxX8+uL3fnwNMU1dEOWQ6PaQtZ2BQJuhZGksoVXpgXaYdC1zXJFzg
   TG1gvMXIGvZngguS7/uB8K4FCuMEVMDX2t5oDd6V5iQFT2g8+Hn/L3G3g
   q12G60VM9R3gzt3pTelc0HuPaf6WynaeZw6dqEDbJvXaBlwUCbtbaVvah
   w==;
X-CSE-ConnectionGUID: eUILbEENTBiSsOLPP4AaGA==
X-CSE-MsgGUID: 4GiCfpMrQmmwyZKyaTTRRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="105212045"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="105212045"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 21:14:41 -0700
X-CSE-ConnectionGUID: CNYdccDjS0CT6vDHLRn7Nw==
X-CSE-MsgGUID: TsYVdCgGSk2+/0xqOT2OoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="266828065"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2026 21:14:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxGeL-00000000pIL-3di3;
	Fri, 21 Aug 2026 04:14:37 +0000
Date: Fri, 21 Aug 2026 12:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 ChiaHsuan Chung <ChiaHsuan.Chung@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>
Subject: [agd5f:amd-staging-drm-next 2342/2544] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1397
 cannot understand function prototype: 'unsigned int
 dcn60_debug_peak_bw_ramp_size = 0x100;'
Message-ID: <202608211232.kslPjQsM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   232bf7d5453df6cc0d877a1003f9aa172e9750de
commit: 90ceba0a0383aeb71476eda2a25d0153ed85138b [2342/2544] drm/amd/display: Fix DCN6 peak bandwidth measurement overshoot
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260821/202608211232.kslPjQsM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211232.kslPjQsM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211232.kslPjQsM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:732 Cannot find identifier on line:
    * @brief Resets the performance monitor for the DCN 6.0 hubbub.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:733 Cannot find identifier on line:
    *
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:734 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function resets the performance monitoring counters and related
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:755 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Starts measuring memory latencies (maximum, minimum, and average) in
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:877 Cannot find identifier on line:
    * @brief Reads the current performance monitor results and calculates
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:878 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * memory latencies in nanoseconds.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:943 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Starts measuring urgent assertion and deassertion counts using
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1035 Cannot find identifier on line:
    * @brief Reads the urgent assertion and deassertion counts from the
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1036 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * performance monitor.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1089 Cannot find identifier on line:
    * @brief Configures the performance monitor to measure the urgent ramp
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1090 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * latency.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1336 Cannot find identifier on line:
    * @brief Reads the current performance monitor result and calculates
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1337 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * the urgent ramp latency in nanoseconds.
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1397 cannot understand function prototype: 'unsigned int dcn60_debug_peak_bw_ramp_size = 0x100;'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1602 Cannot find identifier on line:
    * @brief Configures the performance monitor to measure in-order
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1603 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * bandwidth in megabits per second (Mbps).
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1683 Cannot find identifier on line:
    * @brief Reads the current performance monitor result and calculates
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1684 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * the in-order bandwidth in Mbps.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1742 Cannot find identifier on line:
    * @brief Configures the performance monitor to measure prefetch data size.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1743 Cannot find identifier on line:
    *
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1744 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function sets up performance monitoring counter 0 to measure
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1796 Cannot find identifier on line:
    * @brief Reads the current performance monitor result and calculates
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1797 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * the prefetch data size in bytes.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1822 Cannot find identifier on line:
    * @brief Forces the display to use the nominal QoS profile.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1823 Cannot find identifier on line:
    *
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1824 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function configures the hubbub to force the display to use
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1839 Cannot find identifier on line:
    * @brief Forces the display to use the urgent QoS profile.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1840 Cannot find identifier on line:
    *
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1841 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function configures the hubbub to force the display to use
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1856 Cannot find identifier on line:
    * @brief Resets the display QoS profile to default.
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1857 Cannot find identifier on line:
    *
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn60/dcn60_hubbub.c:1858 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function resets the display QoS profile by disabling any

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
