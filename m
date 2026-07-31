Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43706442106
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 15:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513169; cv=none; b=XfnoIHou/dShG1hfKqTyhrnmuSJdM5PAJoyR2NoTLXOf3a2G1Cyz32w73/3INAOdBjptBry3264e9eNJV/ifZLcjHlZ0DTtadlWBM7XqHvgkdz7oRwBnGZEsPTTgigUCx5YoOPh0nFogGlaoyBhBNBzpIok9IFx+8Gdg+KNFGoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513169; c=relaxed/simple;
	bh=QfSdP9Ca86izDzE7GupkEEODeHGlasVtDsizdeDGRGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GZNNQR4XSpkPjQEc+ZVWrmzll65imBHVgARefBk/ATsrMbWgqd66o/mZpBBylNGsgXLHC2S3OYOTWhpWnpXHuc8/cJdgtNV3wEGoW4M6PTt5VSVo5znggahZbHslnA+LrjJOYU+DAM79PO6at1XRRAzn06CAILMC/h3fJhIuTac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPE4+tuL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPE4+tuL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785513167; x=1817049167;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QfSdP9Ca86izDzE7GupkEEODeHGlasVtDsizdeDGRGM=;
  b=SPE4+tuLdffdYakV7Q15+K3rAPvskzhNtUj2SpY+MjOZN+jGEh3Pyf3u
   TJ0WqCBLcu2WwXGb4t7JPui5u45yqjY/Hu3XTj/l3LFmFaU6Bo+F6MgqL
   5FcwoZ5qVFPVFS0ZY6dnlGkpGPxWzhzY5KMRQIRk3kgPjO743lUSIdaUb
   +1FycrvRX9PNTzaB+JXyWmRWntPgSv6AAFa+5u6YFmKdIxE9Yau84f/nx
   OaTbS1h7JLWLHl6cgXDSzwzW4qOP3T//CS9NNn8uWGQlaqgS/RDezUqok
   o3WCFctNxpSXx+qSbcAAyhSceFk28SS6UVUjzlS8cWbXKk3x2YOQcrCww
   g==;
X-CSE-ConnectionGUID: uA+c76yRQ86g0q6JxZIvDw==
X-CSE-MsgGUID: v8Ds9SnxT7CPrj7ftrNfqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96498496"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96498496"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 08:52:01 -0700
X-CSE-ConnectionGUID: XCqnHvLkQryh0lW2fFkpPw==
X-CSE-MsgGUID: Spca8JPHSsml/ERlN8fIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="265665413"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jul 2026 08:51:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wppWd-000000001Tx-3lWZ;
	Fri, 31 Jul 2026 15:51:55 +0000
Date: Fri, 31 Jul 2026 23:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 9303/10862]
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:615:28: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202607312356.lYA2tnF4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   95d6a9ccef99117115e41e9adb271243bd5e985b
commit: 1d8cfeb69daa863a70134b8ed6df8055c418a5b0 [9303/10862] drm/amdgpu: P=
ack nested ucode_info struct
config: riscv-randconfig-r113-20260731 (https://download.01.org/0day-ci/arc=
hive/20260731/202607312356.lYA2tnF4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260731/202607312356.lYA2tnF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312356.lYA2tnF4-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:543:27: sparse: sparse: cast to re=
stricted __le32
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:544:53: sparse: sparse: cast to re=
stricted __le32
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:545:58: sparse: sparse: cast to re=
stricted __le32
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:549:60: sparse: sparse: cast to re=
stricted __le32
>> drivers/gpu/drm/amd/amdgpu/cik_sdma.c:615:28: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:615:28: sparse:     expected unsig=
ned int [usertype]
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:615:28: sparse:     got restricted=
 __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:629:23: sparse: sparse: cast to re=
stricted __le32
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:668:28: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:668:28: sparse:     expected unsig=
ned int [usertype]
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:668:28: sparse:     got restricted=
 __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/cik_sdma.c:693:15: sparse: sparse: cast to re=
stricted __le32
--
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c: note: in included file:
   drivers/gpu/drm/amd/amdgpu/clearstate_ci.h:939:7: sparse: sparse: Using =
plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/clearstate_ci.h:943:7: sparse: sparse: Using =
plain integer as NULL pointer
>> drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3895:25: sparse: sparse: incorrect=
 type in assignment (different base types) @@     expected unsigned int [us=
ertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3895:25: sparse:     expected unsi=
gned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3895:25: sparse:     got restricte=
d __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3896:25: sparse: sparse: incorrect=
 type in assignment (different base types) @@     expected unsigned int [us=
ertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3896:25: sparse:     expected unsi=
gned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3896:25: sparse:     got restricte=
d __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3897:25: sparse: sparse: incorrect=
 type in assignment (different base types) @@     expected unsigned int [us=
ertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3897:25: sparse:     expected unsi=
gned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3897:25: sparse:     got restricte=
d __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3898:25: sparse: sparse: incorrect=
 type in assignment (different base types) @@     expected unsigned int [us=
ertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3898:25: sparse:     expected unsi=
gned int [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3898:25: sparse:     got restricte=
d __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2401:36: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2402:35: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2403:35: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2404:40: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2405:40: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2406:41: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2413:18: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2414:19: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2423:18: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2424:19: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2433:18: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2434:19: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2659:36: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2660:41: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2668:18: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2669:19: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2683:45: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2684:50: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2690:26: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2691:27: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3425:36: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3426:41: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3453:43: sparse: sparse: cast to r=
estricted __le32
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3454:19: sparse: sparse: cast to r=
estricted __le32
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:204:22: sparse: sparse:=
 cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:271:41: sparse: sparse:=
 incorrect type in argument 2 (different address spaces) @@     expected vo=
id [noderef] __user *addr @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:271:41: sparse:     exp=
ected void [noderef] __user *addr
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:271:41: sparse:     got=
 void *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:289:49: sparse: sparse:=
 incorrect type in argument 2 (different address spaces) @@     expected vo=
id [noderef] __user *addr @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:289:49: sparse:     exp=
ected void [noderef] __user *addr
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:289:49: sparse:     got=
 void *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:322:41: sparse: sparse:=
 incorrect type in argument 2 (different address spaces) @@     expected vo=
id [noderef] __user *addr @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:322:41: sparse:     exp=
ected void [noderef] __user *addr
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:322:41: sparse:     got=
 void *
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.c:224:44: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.c:225:44: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.c:226:42: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.c:227:42: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.c:466:41: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.c:467:41: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.c:468:46: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v11.c:469:46: spars=
e: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12_1.c:277:44: spa=
rse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12_1.c:278:44: spa=
rse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12_1.c:279:42: spa=
rse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12_1.c:280:42: spa=
rse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12_1.c:415:41: spa=
rse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12_1.c:416:41: spa=
rse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12_1.c:417:46: spa=
rse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12_1.c:418:46: spa=
rse: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.c:194:44: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.c:195:44: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.c:238:39: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.c:239:39: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.c:354:44: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_cik.c:355:44: spars=
e: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.c:272:44: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.c:273:44: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.c:274:42: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.c:275:42: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.c:546:41: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v9.c:547:41: sparse=
: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_vi.c:188:25: spa=
rse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_vi.c:191:25: spa=
rse: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.c:123:23: sparse: =
sparse: incorrect type in assignment (different address spaces) @@     expe=
cted void [noderef] __user *[addressable] [assigned] read_ptr @@     got un=
signed int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.c:123:23: sparse: =
    expected void [noderef] __user *[addressable] [assigned] read_ptr
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.c:123:23: sparse: =
    got unsigned int [usertype] *
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.c:124:24: sparse: =
sparse: incorrect type in assignment (different address spaces) @@     expe=
cted void [noderef] __user *[addressable] [assigned] write_ptr @@     got u=
nsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.c:124:24: sparse: =
    expected void [noderef] __user *[addressable] [assigned] write_ptr
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_kernel_queue.c:124:24: sparse: =
    got unsigned int [usertype] *
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.c:186:44: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.c:187:44: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.c:188:42: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.c:189:42: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.c:390:41: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v10.c:391:41: spars=
e: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.c:192:44: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.c:193:44: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.c:194:42: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.c:195:42: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.c:384:41: sparse=
: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_vi.c:385:41: sparse=
: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:272:21: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:273:21: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:276:16: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:282:17: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:318:35: sparse=
: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:318:33: sparse=
: sparse: incorrect type in assignment (different base types) @@     expect=
ed unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:318:33: sparse=
:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:318:33: sparse=
:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:341:25: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:369:21: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:370:21: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:371:17: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:372:16: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:373:23: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:374:23: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:542:36: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:594:19: sparse=
: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:595:16: sparse=
: sparse: cast to restricted __le32
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:267:21: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:268:21: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:270:16: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:276:17: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:277:23: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:316:21: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:317:21: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:318:19: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:319:17: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:320:16: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:321:23: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:322:23: spars=
e: sparse: cast to restricted __le32
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.c:291:25: spa=
rse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.c:294:25: spa=
rse: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:140:21: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:141:21: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:144:16: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:150:17: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:201:21: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:202:21: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:203:17: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:204:16: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:205:23: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:206:23: spars=
e: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v10.c:353:36: spars=
e: sparse: cast to restricted __le32
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1302:42: sparse: spar=
se: incorrect type in argument 1 (different address spaces) @@     expected=
 void const [noderef] __user *src @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1302:42: sparse:     =
expected void const [noderef] __user *src
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1302:42: sparse:     =
got void *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1411:42: sparse: spar=
se: incorrect type in argument 1 (different address spaces) @@     expected=
 void const [noderef] __user *src @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1411:42: sparse:     =
expected void const [noderef] __user *src
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:1411:42: sparse:     =
got void *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:2343:45: sparse: spar=
se: incorrect type in argument 1 (different address spaces) @@     expected=
 void const [noderef] __user *src @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:2343:45: sparse:     =
expected void const [noderef] __user *src
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:2343:45: sparse:     =
got void *
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:248:19: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:249:16: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:257:21: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:258:21: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:266:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:267:23: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:305:21: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:306:21: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:307:19: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:308:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:309:16: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:310:23: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v12_1.c:311:23: spa=
rse: sparse: cast to restricted __le32
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12.c:199:44: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12.c:200:44: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12.c:201:42: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12.c:202:42: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12.c:340:41: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12.c:341:41: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12.c:342:46: spars=
e: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_mqd_manager_v12.c:343:46: spars=
e: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c:253:17: sparse: spa=
rse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c:255:17: sparse: spa=
rse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.c:597:47:=
 sparse: sparse: incorrect type in argument 2 (different address spaces) @@=
     expected void [noderef] __user *addr @@     got void * @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.c:597:47:=
 sparse:     expected void [noderef] __user *addr
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.c:597:47:=
 sparse:     got void *
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.c:837:34:=
 sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process_queue_manager.c:838:35:=
 sparse: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:239:17: sparse: spars=
e: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:241:17: sparse: spars=
e: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1536:59: sparse: spar=
se: incorrect type in argument 2 (different address spaces) @@     expected=
 void [noderef] __iomem *vaddr_iomem @@     got void *[addressable] kaddr @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1536:59: sparse:     =
expected void [noderef] __iomem *vaddr_iomem
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1536:59: sparse:     =
got void *[addressable] kaddr
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1550:9: sparse: spars=
e: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse: spars=
e: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse: spars=
e: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse: spars=
e: incorrect type in initializer (different address spaces) @@     expected=
 unsigned long long [noderef] [usertype] __user *const [noderef] __user *__=
p @@     got unsigned long long [noderef] [usertype] __user ** @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse:     e=
xpected unsigned long long [noderef] [usertype] __user *const [noderef] __u=
ser *__p
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:2393:9: sparse:     g=
ot unsigned long long [noderef] [usertype] __user **
--
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:236:34: =
sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:238:26: =
sparse: sparse: cast removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3464:28:=
 sparse: sparse: incorrect type in argument 1 (different address spaces) @@=
     expected void const [noderef] __user * @@     got unsigned int [userty=
pe] *usr_queue_id_array @@
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3464:28:=
 sparse:     expected void const [noderef] __user *
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3464:28:=
 sparse:     got unsigned int [usertype] *usr_queue_id_array
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3711:45:=
 sparse: sparse: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3712:44:=
 sparse: sparse: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:267:17: sparse: spars=
e: cast removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:269:17: sparse: spars=
e: cast removes address space '__user' of expression
--
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2332:60: sparse: sp=
arse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2332:60: sparse: sp=
arse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2332:60: sparse: sp=
arse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2332:60: sparse: sp=
arse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2332:60: sparse: sp=
arse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2332:60: sparse: sp=
arse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1444:32: sparse: sp=
arse: incorrect type in assignment (different base types) @@     expected u=
nsigned short [usertype] fps_high_t @@     got restricted __be16 [usertype]=
 @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1444:32: sparse:   =
  expected unsigned short [usertype] fps_high_t
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1444:32: sparse:   =
  got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1452:31: sparse: sp=
arse: incorrect type in assignment (different base types) @@     expected u=
nsigned char [usertype] fps_low_t @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1452:31: sparse:   =
  expected unsigned char [usertype] fps_low_t
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1452:31: sparse:   =
  got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:664:49: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed int [usertype] SclkFrequency @@     got restricted __be32 [usertype]=
 @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:664:49: sparse:    =
 expected unsigned int [usertype] SclkFrequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:664:49: sparse:    =
 got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:692:44: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed int [usertype] MinVddNb @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:692:44: sparse:    =
 expected unsigned int [usertype] MinVddNb
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:692:44: sparse:    =
 got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:702:38: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed short [usertype] AT @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:702:38: sparse:    =
 expected unsigned short [usertype] AT
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:702:38: sparse:    =
 got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:777:38: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed int [usertype] low_sclk_interrupt_t @@     got restricted __be32 [us=
ertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:777:38: sparse:    =
 expected unsigned int [usertype] low_sclk_interrupt_t
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:777:38: sparse:    =
 got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:909:48: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed int [usertype] VclkFrequency @@     got restricted __be32 [usertype]=
 @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:909:48: sparse:    =
 expected unsigned int [usertype] VclkFrequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:909:48: sparse:    =
 got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:910:48: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed int [usertype] DclkFrequency @@     got restricted __be32 [usertype]=
 @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:910:48: sparse:    =
 expected unsigned int [usertype] DclkFrequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:910:48: sparse:    =
 got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:911:43: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed short [usertype] MinVddNb @@     got restricted __be16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:911:43: sparse:    =
 expected unsigned short [usertype] MinVddNb
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:911:43: sparse:    =
 got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:980:44: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed int [usertype] Frequency @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:980:44: sparse:    =
 expected unsigned int [usertype] Frequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:980:44: sparse:    =
 got restricted __be32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:981:45: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected un=
signed short [usertype] MinVoltage @@     got restricted __be16 [usertype] =
@@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:981:45: sparse:    =
 expected unsigned short [usertype] MinVoltage
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:981:45: sparse:    =
 got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1043:45: sparse: sp=
arse: incorrect type in assignment (different base types) @@     expected u=
nsigned int [usertype] Frequency @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1043:45: sparse:   =
  expected unsigned int [usertype] Frequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1043:45: sparse:   =
  got restricted __be32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1044:46: sparse: sp=
arse: incorrect type in assignment (different base types) @@     expected u=
nsigned short [usertype] MinVoltage @@     got restricted __be16 [usertype]=
 @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1044:46: sparse:   =
  expected unsigned short [usertype] MinVoltage
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1044:46: sparse:   =
  got restricted __be16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1105:44: sparse: sp=
arse: incorrect type in assignment (different base types) @@     expected u=
nsigned int [usertype] Frequency @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1105:44: sparse:   =
  expected unsigned int [usertype] Frequency
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1105:44: sparse:   =
  got restricted __be32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1106:45: sparse: sp=
arse: incorrect type in assignment (different base types) @@     expected u=
nsigned short [usertype] MinVoltage @@     got restricted __be16 [usertype]=
 @@
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1106:45: sparse:   =
  expected unsigned short [usertype] MinVoltage
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:1106:45: sparse:   =
  got restricted __be16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2569:44: sparse: sp=
arse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2570:47: sparse: sp=
arse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2572:25: sparse: sp=
arse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2585:21: sparse: sp=
arse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2592:33: sparse: sp=
arse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2594:33: sparse: sp=
arse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2596:21: sparse: sp=
arse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2651:21: sparse: sp=
arse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2652:22: sparse: sp=
arse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2653:23: sparse: sp=
arse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2656:29: sparse: sp=
arse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2657:29: sparse: sp=
arse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2680:16: sparse: sp=
arse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2719:18: sparse: sp=
arse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c: note: in included =
file (through drivers/gpu/drm/amd/amdgpu/../include/atombios.h, drivers/gpu=
/drm/amd/amdgpu/../amdgpu/atom.h):
   drivers/gpu/drm/amd/amdgpu/../include/pptable.h:483:35: sparse: sparse: =
array of flexible structures
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2722:18: sparse: sp=
arse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2725:18: sparse: sp=
arse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2771:24: sparse: sp=
arse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2868:24: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2868:24: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2868:24: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2868:24: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2868:24: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:2868:24: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:3276:32: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:3276:32: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:3276:32: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:3276:32: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:3276:32: sparse: sp=
arse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/kv_dpm.c:3276:32: sparse: sp=
arse: cast to restricted __be32

vim +615 drivers/gpu/drm/amd/amdgpu/cik_sdma.c

a2e73f56fa62824 Alex Deucher    2015-04-20  590 =20
a2e73f56fa62824 Alex Deucher    2015-04-20  591  /**
a2e73f56fa62824 Alex Deucher    2015-04-20  592   * cik_sdma_ring_test_ring=
 - simple async dma engine test
a2e73f56fa62824 Alex Deucher    2015-04-20  593   *
a2e73f56fa62824 Alex Deucher    2015-04-20  594   * @ring: amdgpu_ring stru=
cture holding ring information
a2e73f56fa62824 Alex Deucher    2015-04-20  595   *
a2e73f56fa62824 Alex Deucher    2015-04-20  596   * Test the DMA engine by =
writing using it to write an
a2e73f56fa62824 Alex Deucher    2015-04-20  597   * value to memory. (CIK).
a2e73f56fa62824 Alex Deucher    2015-04-20  598   * Returns 0 for success, =
error for failure.
a2e73f56fa62824 Alex Deucher    2015-04-20  599   */
a2e73f56fa62824 Alex Deucher    2015-04-20  600  static int cik_sdma_ring_t=
est_ring(struct amdgpu_ring *ring)
a2e73f56fa62824 Alex Deucher    2015-04-20  601  {
a2e73f56fa62824 Alex Deucher    2015-04-20  602  	struct amdgpu_device *ade=
v =3D ring->adev;
a2e73f56fa62824 Alex Deucher    2015-04-20  603  	unsigned i;
a2e73f56fa62824 Alex Deucher    2015-04-20  604  	unsigned index;
a2e73f56fa62824 Alex Deucher    2015-04-20  605  	int r;
a2e73f56fa62824 Alex Deucher    2015-04-20  606  	u32 tmp;
a2e73f56fa62824 Alex Deucher    2015-04-20  607  	u64 gpu_addr;
a2e73f56fa62824 Alex Deucher    2015-04-20  608 =20
fbf41e05119f43e Shahyan Soltani 2026-06-03  609  	r =3D amdgpu_wb_get(adev,=
 &index);
dc9eeff84c77080 Christian K=C3=B6nig 2018-10-29  610  	if (r)
a2e73f56fa62824 Alex Deucher    2015-04-20  611  		return r;
a2e73f56fa62824 Alex Deucher    2015-04-20  612 =20
a2e73f56fa62824 Alex Deucher    2015-04-20  613  	gpu_addr =3D adev->wb.gpu=
_addr + (index * 4);
a2e73f56fa62824 Alex Deucher    2015-04-20  614  	tmp =3D 0xCAFEDEAD;
a2e73f56fa62824 Alex Deucher    2015-04-20 @615  	adev->wb.wb[index] =3D cp=
u_to_le32(tmp);
a2e73f56fa62824 Alex Deucher    2015-04-20  616 =20
a27de35caab59ba Christian K=C3=B6nig 2016-01-21  617  	r =3D amdgpu_ring_al=
loc(ring, 5);
dc9eeff84c77080 Christian K=C3=B6nig 2018-10-29  618  	if (r)
dc9eeff84c77080 Christian K=C3=B6nig 2018-10-29  619  		goto error_free_wb;
dc9eeff84c77080 Christian K=C3=B6nig 2018-10-29  620 =20
a2e73f56fa62824 Alex Deucher    2015-04-20  621  	amdgpu_ring_write(ring, S=
DMA_PACKET(SDMA_OPCODE_WRITE, SDMA_WRITE_SUB_OPCODE_LINEAR, 0));
a2e73f56fa62824 Alex Deucher    2015-04-20  622  	amdgpu_ring_write(ring, l=
ower_32_bits(gpu_addr));
a2e73f56fa62824 Alex Deucher    2015-04-20  623  	amdgpu_ring_write(ring, u=
pper_32_bits(gpu_addr));
a2e73f56fa62824 Alex Deucher    2015-04-20  624  	amdgpu_ring_write(ring, 1=
); /* number of DWs to follow */
a2e73f56fa62824 Alex Deucher    2015-04-20  625  	amdgpu_ring_write(ring, 0=
xDEADBEEF);
a27de35caab59ba Christian K=C3=B6nig 2016-01-21  626  	amdgpu_ring_commit(r=
ing);
a2e73f56fa62824 Alex Deucher    2015-04-20  627 =20
a2e73f56fa62824 Alex Deucher    2015-04-20  628  	for (i =3D 0; i < adev->u=
sec_timeout; i++) {
a2e73f56fa62824 Alex Deucher    2015-04-20  629  		tmp =3D le32_to_cpu(adev=
->wb.wb[index]);
a2e73f56fa62824 Alex Deucher    2015-04-20  630  		if (tmp =3D=3D 0xDEADBEE=
F)
a2e73f56fa62824 Alex Deucher    2015-04-20  631  			break;
c366be543c5ea35 Sam Ravnborg    2019-06-10  632  		udelay(1);
a2e73f56fa62824 Alex Deucher    2015-04-20  633  	}
a2e73f56fa62824 Alex Deucher    2015-04-20  634 =20
dc9eeff84c77080 Christian K=C3=B6nig 2018-10-29  635  	if (i >=3D adev->use=
c_timeout)
dc9eeff84c77080 Christian K=C3=B6nig 2018-10-29  636  		r =3D -ETIMEDOUT;
a2e73f56fa62824 Alex Deucher    2015-04-20  637 =20
dc9eeff84c77080 Christian K=C3=B6nig 2018-10-29  638  error_free_wb:
fbf41e05119f43e Shahyan Soltani 2026-06-03  639  	amdgpu_wb_free(adev, inde=
x);
a2e73f56fa62824 Alex Deucher    2015-04-20  640  	return r;
a2e73f56fa62824 Alex Deucher    2015-04-20  641  }
a2e73f56fa62824 Alex Deucher    2015-04-20  642 =20

:::::: The code at line 615 was first introduced by commit
:::::: a2e73f56fa6282481927ec43aa9362c03c2e2104 drm/amdgpu: Add support for=
 CIK parts

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
