Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19B1AB6F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 00:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457750; cv=none; b=mLSGRqzYthktA0f8B1HxDLLvFyOMj/uIdPCPsW9OabONypTMHiCOp8dJba3B9LCZlJ//WrHDCj4223u+Y7Jk2m7MjCqvfh1sRNf7hhsBHA8xUSfz38+1c3Q5fHLgDB43lKWz5LAgjnadXNOy3ryYauoEKn7CqnDrRd4VsJsaJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457750; c=relaxed/simple;
	bh=PDpum8S9FuQw6MwmtO9tKN/a6w3aO82Q/rFzlUCytjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rBgX7boGG0HVXL/Rh9/sVINjE5WfVX0V39bHrr5MkkndwYod7mwf3YSYGknSC0zQKK707YaSR+ACMnxgTiMTlwexDxtZD5EKvMli3Wsxk7VQ49TerrrwZO6UVyhx6o0Uclr44zHsOpH2zwRNNZJgtcJLUjSqt+48qtHt7BXYQKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0MeAUER; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0MeAUER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785457743; x=1816993743;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PDpum8S9FuQw6MwmtO9tKN/a6w3aO82Q/rFzlUCytjg=;
  b=f0MeAUERHollR0iDXxJ3juOuUlQK9IPuknFynRZU7cFDpP/HfEAgXFXD
   /N/0tPDpo8NhGB/iZxl/iMZr79ltsFttKI4ivkMTdU81uSYazvDjt6JKh
   Al7tNDFv3J3ZmsUMhup2+CMPwOfyZCGEYqK0AO71zrNG3j01Z/tw+xiXF
   dn8QCN1LWY+jrVPFNDU20zD5cJISgFAAuw3aIIThg0V+MuLPycxx50s3A
   8t39pV/YzAcFfY/6a6xuBQOR8stMqP84/wfSZWoKCikPv/kT6KGujDpbG
   TVW+bsm4bgrG7faEBP9qU4Mx6NvY3ROLnt9yRVuWNnK04ONXgLSlfLwPG
   A==;
X-CSE-ConnectionGUID: NyTJzT1tTmaeoJhoIrQIjA==
X-CSE-MsgGUID: V+HC+dFGTeqdY7PF5k/1pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="108877972"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="108877972"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 17:29:02 -0700
X-CSE-ConnectionGUID: WYH0DCyAQFivYgLcJU9zCA==
X-CSE-MsgGUID: qq5T8XoFTI6+H1WJ9+yRLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="257086641"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2026 17:29:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpb7R-00000000hkG-3Hf2;
	Fri, 31 Jul 2026 00:28:57 +0000
Date: Fri, 31 Jul 2026 08:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [agd5f:drm-fixes-7.2 8/28]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202607310843.9bNQoqbi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-fixes-7.2
head:   114b42507b6a23d9d24e24e4ef165233332c64d4
commit: 43c9f7cba9f9fcd09a5e23686ab4f0f67b62d888 [8/28] drm/amdgpu: Pack ne=
sted ucode_info struct
config: csky-randconfig-r123-20260730 (https://download.01.org/0day-ci/arch=
ive/20260731/202607310843.9bNQoqbi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260731/202607310843.9bNQoqbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310843.9bNQoqbi-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: cast re=
moves address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: incorre=
ct type in initializer (different address spaces) @@     expected void [nod=
eref] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse:     expected vo=
id [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse:     got unsigne=
d int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:631:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: incorre=
ct type in initializer (different address spaces) @@     expected void [nod=
eref] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse:     expected vo=
id [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse:     got unsigne=
d int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:649:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: incorre=
ct type in initializer (different address spaces) @@     expected void [nod=
eref] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse:     expected vo=
id [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse:     got unsigne=
d int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:680:29: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c: note: in included file (throug=
h include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/=
signal.h, include/linux/rcuwait.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes add=
ress space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is no=
t an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes add=
ress space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes add=
ress space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is no=
t an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes add=
ress space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes add=
ress space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is no=
t an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes add=
ress space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating addre=
ss of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating addre=
ss of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating addre=
ss of non-lvalue (11)
--
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:200:24: sparse: sparse: cast to re=
stricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:224:25: sparse: sparse: cast to re=
stricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:225:21: sparse: sparse: cast to re=
stricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:229:18: sparse: sparse: cast to re=
stricted __le32
>> drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:235:28: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:235:28: sparse:     expected void =
volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:235:28: sparse:     got unsigned i=
nt [usertype] *
>> drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:238:30: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *dst @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:238:30: sparse:     expected void =
volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:238:30: sparse:     got unsigned i=
nt [usertype] *
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:239:23: sparse: sparse: cast to re=
stricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:239:21: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:239:21: sparse:     expected unsig=
ned int [usertype]
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:239:21: sparse:     got restricted=
 __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:241:28: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:241:28: sparse:     expected void =
volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:241:28: sparse:     got unsigned i=
nt [usertype] *
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:242:30: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *dst @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:242:30: sparse:     expected void =
volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:242:30: sparse:     got unsigned i=
nt [usertype] *
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:244:22: sparse: sparse: cast to re=
stricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:245:30: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *dst @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:245:30: sparse:     expected void =
volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:245:30: sparse:     got unsigned i=
nt [usertype] *
   drivers/gpu/drm/amd/amdgpu/vce_v1_0.c:247:31: sparse: sparse: cast to re=
stricted __le32
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:657:42: sparse: sparse: cast rem=
oves address space '__iomem' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: incorre=
ct type in initializer (different address spaces) @@     expected void cons=
t [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse:     expected vo=
id const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse:     got unsigne=
d int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2775:21: sparse: sparse: cast re=
moves address space '__user' of expression
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast=
 removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void [=
noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     expected=
 void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:153:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void c=
onst [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     expected=
 void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:155:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void [=
noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse:     expected=
 void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:280:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void c=
onst [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     expected=
 void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:282:29: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:327:46: sparse: sparse: inco=
rrect type in argument 2 (different address spaces) @@     expected void co=
nst [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata_v=
2 * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:327:46: sparse:     expected=
 void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:327:46: sparse:     got stru=
ct amdgpu_debugfs_regs2_iocdata_v2 *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:333:47: sparse: sparse: inco=
rrect type in argument 2 (different address spaces) @@     expected void co=
nst [noderef] __user *from @@     got struct amdgpu_debugfs_regs2_iocdata *=
 @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:333:47: sparse:     expected=
 void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:333:47: sparse:     got stru=
ct amdgpu_debugfs_regs2_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void [=
noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse:     expected=
 void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:457:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:485:37: sparse: sparse: inco=
rrect type in argument 2 (different address spaces) @@     expected void co=
nst [noderef] __user *from @@     got struct amdgpu_debugfs_gprwave_iocdata=
 * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:485:37: sparse:     expected=
 void const [noderef] __user *from
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:485:37: sparse:     got stru=
ct amdgpu_debugfs_gprwave_iocdata *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void [=
noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse:     expected=
 void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:544:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void c=
onst [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     expected=
 void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:598:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: cast=
 removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void [=
noderef] __user *__p @@     got unsigned long long [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse:     expected=
 void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse:     got unsi=
gned long long [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:655:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void c=
onst [noderef] __user *__p @@     got unsigned long long [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse:     expected=
 void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse:     got unsi=
gned long long [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:705:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void [=
noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse:     expected=
 void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:765:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void c=
onst [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse:     expected=
 void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:822:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void [=
noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse:     expected=
 void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:882:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: inco=
rrect type in initializer (different address spaces) @@     expected void c=
onst [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse:     expected=
 void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse:     got unsi=
gned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:939:21: sparse: sparse: cast=
 removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
[noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse:     expecte=
d void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse:     got uns=
igned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1039:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: cas=
t removes address space '__user' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
[noderef] __user *__p @@     got signed int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse:     expecte=
d void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse:     got sig=
ned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1116:29: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
[noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse:     expecte=
d void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse:     got uns=
igned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1201:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
[noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse:     expecte=
d void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse:     got uns=
igned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1293:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
[noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse:     expecte=
d void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse:     got uns=
igned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1348:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse:     expecte=
d void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse:     got uns=
igned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1394:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
[noderef] __user *__p @@     got unsigned long long [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse:     expecte=
d void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse:     got uns=
igned long long [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1445:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
const [noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse:     expecte=
d void const [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse:     got uns=
igned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1491:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
[noderef] __user *__p @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse:     expecte=
d void [noderef] __user *__p
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse:     got uns=
igned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1538:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1578:21: sparse: sparse: cas=
t removes address space '__user' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1578:21: sparse: sparse: inc=
orrect type in initializer (different address spaces) @@     expected void =
[noderef] __user *__p @@     got unsigned int [usertype] * @@
--
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1660:4=
3: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:267:29: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [assigned] [usertype] usPixelClock @@     got restric=
ted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:267:29: sp=
arse:     expected unsigned short [assigned] [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:267:29: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:297:29: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [assigned] [usertype] usPixelClock @@     got restric=
ted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:297:29: sp=
arse:     expected unsigned short [assigned] [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:297:29: sp=
arse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:445:35: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usInitInfo @@    =
 got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:445:35: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usIni=
tInfo
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:445:35: sp=
arse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:467:45: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usPixelClock @@  =
   got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:467:45: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usPix=
elClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:467:45: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:473:45: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usPixelClock @@  =
   got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:473:45: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usPix=
elClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:473:45: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:574:35: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usInitInfo @@    =
 got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:574:35: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usIni=
tInfo
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:574:35: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:605:45: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usPixelClock @@  =
   got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:605:45: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usPix=
elClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:605:45: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:611:45: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usPixelClock @@  =
   got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:611:45: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usPix=
elClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:611:45: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:706:35: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usInitInfo @@    =
 got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:706:35: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usIni=
tInfo
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:706:35: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:731:45: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usPixelClock @@  =
   got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:731:45: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usPix=
elClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:731:45: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:737:45: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usPixelClock @@  =
   got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:737:45: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usPix=
elClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:737:45: sp=
arse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:811:27: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usSymClock @@    =
 got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:811:27: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usSym=
Clock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:811:27: sp=
arse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:826:33: sp=
arse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:825:43: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usSymClock @@    =
 got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:825:43: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usSym=
Clock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:825:43: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:830:33: sp=
arse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:829:43: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usSymClock @@    =
 got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:829:43: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usSym=
Clock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:829:43: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:834:33: sp=
arse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:833:43: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usSymClock @@    =
 got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:833:43: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usSym=
Clock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:833:43: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:885:33: sp=
arse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:884:43: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned int [addressable] [assigned] [usertype] ulSymClock @@     g=
ot restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:884:43: sp=
arse:     expected unsigned int [addressable] [assigned] [usertype] ulSymCl=
ock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:884:43: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:889:33: sp=
arse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:888:43: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned int [addressable] [assigned] [usertype] ulSymClock @@     g=
ot restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:888:43: sp=
arse:     expected unsigned int [addressable] [assigned] [usertype] ulSymCl=
ock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:888:43: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:893:33: sp=
arse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:892:43: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned int [addressable] [assigned] [usertype] ulSymClock @@     g=
ot restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:892:43: sp=
arse:     expected unsigned int [addressable] [assigned] [usertype] ulSymCl=
ock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:892:43: sp=
arse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:969:40: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usRefDiv @@     g=
ot restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:969:40: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usRef=
Div
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:969:40: sp=
arse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:971:39: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usFbDiv @@     go=
t restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:971:39: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usFbD=
iv
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:971:39: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:979:44: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [addressable] [assigned] [usertype] usPixelClock @@  =
   got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:979:44: sp=
arse:     expected unsigned short [addressable] [assigned] [usertype] usPix=
elClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:979:44: sp=
arse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1042:40: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usFbDiv @@     g=
ot restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1042:40: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usFb=
Div
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1042:40: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:47: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned int [addressable] [assigned] [usertype] ulFbDivDecFrac @@ =
    got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:47: s=
parse:     expected unsigned int [addressable] [assigned] [usertype] ulFbDi=
vDecFrac
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1044:47: s=
parse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1057:45: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usPixelClock @@ =
    got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1057:45: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usPi=
xelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1057:45: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1131:40: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usFbDiv @@     g=
ot restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1131:40: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usFb=
Div
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1131:40: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1133:47: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned int [addressable] [assigned] [usertype] ulFbDivDecFrac @@ =
    got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1133:47: s=
parse:     expected unsigned int [addressable] [assigned] [usertype] ulFbDi=
vDecFrac
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1133:47: s=
parse:     got restricted __le32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1146:60: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned int [addressable] [assigned] [usertype] ulPixelClock:24 @@=
     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1146:60: s=
parse:     expected unsigned int [addressable] [assigned] [usertype] ulPixe=
lClock:24
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1146:60: s=
parse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1223:34: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned int [addressable] [assigned] [usertype] ulPixelClock @@   =
  got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1223:34: s=
parse:     expected unsigned int [addressable] [assigned] [usertype] ulPixe=
lClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1223:34: s=
parse:     got restricted __le32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1312:43: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrum=
Percentage @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1312:43: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usSp=
readSpectrumPercentage
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1312:43: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1361:51: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrum=
Percentage @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1361:51: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usSp=
readSpectrumPercentage
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1361:51: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1363:45: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrum=
Step @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1363:45: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usSp=
readSpectrumStep
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1363:45: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1377:47: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrum=
Amount @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1377:47: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usSp=
readSpectrumAmount
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1377:47: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1431:51: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrum=
AmountFrac @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1431:51: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usSp=
readSpectrumAmountFrac
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1431:51: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1433:45: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrum=
Step @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1433:45: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usSp=
readSpectrumStep
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1433:45: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1446:47: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usSpreadSpectrum=
Amount @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1446:47: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usSp=
readSpectrumAmount
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1446:47: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1505:29: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [usertype] usPixelClock @@     got restricted __le16=
 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1505:29: s=
parse:     expected unsigned short [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1505:29: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1519:43: s=
parse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1549:36: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [usertype] usPixelClock @@     got res=
tricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1549:36: s=
parse:     expected unsigned short [addressable] [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1549:36: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1569:43: s=
parse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:30: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [usertype] usPixelClock @@     got restricted __le16=
 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:30: s=
parse:     expected unsigned short [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1838:30: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1924:37: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [usertype] usDeviceID @@     got restricted __le16 [=
usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1924:37: s=
parse:     expected unsigned short [usertype] usDeviceID
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:1924:37: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2171:25: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usH_Size @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2171:25: s=
parse:     expected unsigned short [assigned] [usertype] usH_Size
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2171:25: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2173:34: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usH_Blanking_Time @@     got r=
estricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2173:34: s=
parse:     expected unsigned short [assigned] [usertype] usH_Blanking_Time
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2173:34: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2176:25: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usV_Size @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2176:25: s=
parse:     expected unsigned short [assigned] [usertype] usV_Size
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2176:25: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2178:34: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usV_Blanking_Time @@     got r=
estricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2178:34: s=
parse:     expected unsigned short [assigned] [usertype] usV_Blanking_Time
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2178:34: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:31: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usH_SyncOffset @@     got rest=
ricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:31: s=
parse:     expected unsigned short [assigned] [usertype] usH_SyncOffset
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2183:31: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2185:30: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usH_SyncWidth @@     got restr=
icted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2185:30: s=
parse:     expected unsigned short [assigned] [usertype] usH_SyncWidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2185:30: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2189:31: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usV_SyncOffset @@     got rest=
ricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2189:31: s=
parse:     expected unsigned short [assigned] [usertype] usV_SyncOffset
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2189:31: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2191:30: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usV_SyncWidth @@     got restr=
icted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2191:30: s=
parse:     expected unsigned short [assigned] [usertype] usV_SyncWidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2191:30: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2200:33: s=
parse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2199:49: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usAccess @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2199:49: s=
parse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2199:49: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2204:33: s=
parse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2203:49: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usAccess @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2203:49: s=
parse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2203:49: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2208:33: s=
parse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:49: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usAccess @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:49: s=
parse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2207:49: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2225:39: s=
parse: sparse: incorrect type in argument 1 (different base types) @@     e=
xpected restricted __le16 [usertype] *var @@     got unsigned short * @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2225:39: s=
parse:     expected restricted __le16 [usertype] *var
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2225:39: s=
parse:     got unsigned short *
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2231:33: s=
parse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2230:49: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usAccess @@     =
got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2230:49: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usAc=
cess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2230:49: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2097:26: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usH_Total @@     got restricte=
d __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2097:26: s=
parse:     expected unsigned short [assigned] [usertype] usH_Total
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2097:26: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2098:25: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usH_Disp @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2098:25: s=
parse:     expected unsigned short [assigned] [usertype] usH_Disp
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2098:25: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2099:30: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usH_SyncStart @@     got restr=
icted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2099:30: s=
parse:     expected unsigned short [assigned] [usertype] usH_SyncStart
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2099:30: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2100:30: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usH_SyncWidth @@     got restr=
icted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2100:30: s=
parse:     expected unsigned short [assigned] [usertype] usH_SyncWidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2100:30: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2101:26: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usV_Total @@     got restricte=
d __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2101:26: s=
parse:     expected unsigned short [assigned] [usertype] usV_Total
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2101:26: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2102:25: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usV_Disp @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2102:25: s=
parse:     expected unsigned short [assigned] [usertype] usV_Disp
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2102:25: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2103:30: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usV_SyncStart @@     got restr=
icted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2103:30: s=
parse:     expected unsigned short [assigned] [usertype] usV_SyncStart
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2103:30: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2105:30: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usV_SyncWidth @@     got restr=
icted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2105:30: s=
parse:     expected unsigned short [assigned] [usertype] usV_SyncWidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2105:30: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2121:33: s=
parse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2120:49: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usAccess @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2120:49: s=
parse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2120:49: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2125:33: s=
parse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2124:49: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usAccess @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2124:49: s=
parse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2124:49: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2129:33: s=
parse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2128:49: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usAccess @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2128:49: s=
parse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2128:49: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2144:38: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usV_SyncStart @@     got restr=
icted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2144:38: s=
parse:     expected unsigned short [assigned] [usertype] usV_SyncStart
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2144:38: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2150:33: s=
parse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2149:49: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] usAccess @@     got restricted=
 __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2149:49: s=
parse:     expected unsigned short [assigned] [usertype] usAccess
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2149:49: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2392:40: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] usPixelClock @@ =
    got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2392:40: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] usPi=
xelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2392:40: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2424:44: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned int [addressable] [assigned] [usertype] ulDispEngClkFreq @=
@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2424:44: s=
parse:     expected unsigned int [addressable] [assigned] [usertype] ulDisp=
EngClkFreq
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2424:44: s=
parse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2437:44: s=
parse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2519:44: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [usertype] usConnectorId @@     got restricted __le1=
6 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2519:44: s=
parse:     expected unsigned short [usertype] usConnectorId
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2519:44: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2529:43: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [usertype] usPixelClock @@     got restricted __le16=
 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2529:43: s=
parse:     expected unsigned short [usertype] usPixelClock
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2529:43: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2684:45: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned int [addressable] [assigned] [usertype] ulDCEClkFreq @@   =
  got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2684:45: s=
parse:     expected unsigned int [addressable] [assigned] [usertype] ulDCEC=
lkFreq
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2684:45: s=
parse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table.c:2688:53: s=
parse: sparse: cast to restricted __le32
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:529:34: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned int [addressable] [assigned] [usertype] pixclk_100hz @@   =
  got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:529:34: s=
parse:     expected unsigned int [addressable] [assigned] [usertype] pixclk=
_100hz
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:529:34: s=
parse:     got restricted __le32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:624:23: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] h_size @@     got restricted _=
_le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:624:23: s=
parse:     expected unsigned short [assigned] [usertype] h_size
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:624:23: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:626:32: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] h_blanking_time @@     got res=
tricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:626:32: s=
parse:     expected unsigned short [assigned] [usertype] h_blanking_time
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:626:32: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:630:23: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] v_size @@     got restricted _=
_le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:630:23: s=
parse:     expected unsigned short [assigned] [usertype] v_size
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:630:23: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:632:32: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] v_blanking_time @@     got res=
tricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:632:32: s=
parse:     expected unsigned short [assigned] [usertype] v_blanking_time
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:632:32: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:639:29: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] h_syncoffset @@     got restri=
cted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:639:29: s=
parse:     expected unsigned short [assigned] [usertype] h_syncoffset
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:639:29: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:642:28: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] h_syncwidth @@     got restric=
ted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:642:28: s=
parse:     expected unsigned short [assigned] [usertype] h_syncwidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:642:28: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:647:29: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] v_syncoffset @@     got restri=
cted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:647:29: s=
parse:     expected unsigned short [assigned] [usertype] v_syncoffset
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:647:29: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:650:28: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] v_syncwidth @@     got restric=
ted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:650:28: s=
parse:     expected unsigned short [assigned] [usertype] v_syncwidth
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:650:28: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:659:33: s=
parse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:658:37: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] modemiscinfo @@     got restri=
cted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:658:37: s=
parse:     expected unsigned short [assigned] [usertype] modemiscinfo
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:658:37: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:664:33: s=
parse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:663:37: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] modemiscinfo @@     got restri=
cted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:663:37: s=
parse:     expected unsigned short [assigned] [usertype] modemiscinfo
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:663:37: s=
parse:     got restricted __le16 [usertype]
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:669:33: s=
parse: sparse: cast to restricted __le16
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:668:37: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [assigned] [usertype] modemiscinfo @@     got restri=
cted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:668:37: s=
parse:     expected unsigned short [assigned] [usertype] modemiscinfo
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:668:37: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:687:39: s=
parse: sparse: incorrect type in argument 1 (different base types) @@     e=
xpected restricted __le16 [usertype] *var @@     got unsigned short * @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:687:39: s=
parse:     expected restricted __le16 [usertype] *var
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:687:39: s=
parse:     got unsigned short *
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:693:25: s=
parse: sparse: cast to restricted __le16
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:692:37: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned short [addressable] [assigned] [usertype] modemiscinfo @@ =
    got restricted __le16 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:692:37: s=
parse:     expected unsigned short [addressable] [assigned] [usertype] mode=
miscinfo
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:692:37: s=
parse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:962:43: s=
parse: sparse: incorrect type in assignment (different base types) @@     e=
xpected unsigned int [addressable] [assigned] [usertype] dceclk_10khz @@   =
  got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:962:43: s=
parse:     expected unsigned int [addressable] [assigned] [usertype] dceclk=
_10khz
   drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:962:43: s=
parse:     got restricted __le32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:971:53: s=
parse: sparse: cast to restricted __le32
--
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1361:25: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1365:23: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1366:23: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1371:28: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2624:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2624:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2624:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2624:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2624:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2624:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2629:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2629:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2629:17: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2631:36: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2739:37: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2747:25: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2747:25: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2747:25: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2778:47: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2780:45: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2782:45: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2785:43: spa=
rse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2786:43: spa=
rse: sparse: cast to restricted __le32

vim +631 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c

527e3d40339b22 Xiang Liu       2025-10-22  597 =20
4f4824b55650fa Tom St Denis    2016-04-27  598  /* Layout of file is 12 byt=
es consisting of
4f4824b55650fa Tom St Denis    2016-04-27  599   * - rptr
4f4824b55650fa Tom St Denis    2016-04-27  600   * - wptr
4f4824b55650fa Tom St Denis    2016-04-27  601   * - driver's copy of wptr
4f4824b55650fa Tom St Denis    2016-04-27  602   *
4f4824b55650fa Tom St Denis    2016-04-27  603   * followed by n-words of r=
ing data
4f4824b55650fa Tom St Denis    2016-04-27  604   */
4f4824b55650fa Tom St Denis    2016-04-27  605  static ssize_t amdgpu_debug=
fs_ring_read(struct file *f, char __user *buf,
4f4824b55650fa Tom St Denis    2016-04-27  606  					size_t size, loff_t *p=
os)
d38ceaf99ed015 Alex Deucher    2015-04-20  607  {
450630975da9e7 Al Viro         2016-12-04  608  	struct amdgpu_ring *ring =
=3D file_inode(f)->i_private;
1e40ef87ffdc29 Xiang Liu       2026-05-07  609  	u32 value, result, early[3=
] =3D { 0 };
5a1428242952f2 Tao Zhou        2025-01-22  610  	uint64_t p;
1e40ef87ffdc29 Xiang Liu       2026-05-07  611  	u32 avail_dw, start_dw, re=
ad_dw;
ebbc2ada5c636a Tim Huang       2024-04-25  612  	loff_t i;
ebbc2ada5c636a Tim Huang       2024-04-25  613  	int r;
d38ceaf99ed015 Alex Deucher    2015-04-20  614 =20
527e3d40339b22 Xiang Liu       2025-10-22  615  	if (ring->funcs->type =3D=
=3D AMDGPU_RING_TYPE_CPER && amdgpu_uniras_enabled(ring->adev))
527e3d40339b22 Xiang Liu       2025-10-22  616  		return amdgpu_ras_cper_de=
bugfs_read(f, buf, size, pos);
527e3d40339b22 Xiang Liu       2025-10-22  617 =20
c71dbd93eb0039 Tom St Denis    2016-05-02  618  	if (*pos & 3 || size & 3)
4f4824b55650fa Tom St Denis    2016-04-27  619  		return -EINVAL;
d38ceaf99ed015 Alex Deucher    2015-04-20  620 =20
4f4824b55650fa Tom St Denis    2016-04-27  621  	result =3D 0;
c7e6be2303d0b6 Christian K=C3=B6nig 2016-01-21  622 =20
8652920d2c0024 Tao Zhou        2025-02-10  623  	if (ring->funcs->type =3D=
=3D AMDGPU_RING_TYPE_CPER)
8652920d2c0024 Tao Zhou        2025-02-10  624  		mutex_lock(&ring->adev->c=
per.ring_lock);
8652920d2c0024 Tao Zhou        2025-02-10  625 =20
1e40ef87ffdc29 Xiang Liu       2026-05-07  626  	if (*pos < 12) {
9c5c71bbed4132 Tom St Denis    2018-03-01  627  		early[0] =3D amdgpu_ring_=
get_rptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  628  		early[1] =3D amdgpu_ring_=
get_wptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  629  		early[2] =3D ring->wptr &=
 ring->buf_mask;
4f4824b55650fa Tom St Denis    2016-04-27  630  		for (i =3D *pos / 4; i < =
3 && size; i++) {
4f4824b55650fa Tom St Denis    2016-04-27 @631  			r =3D put_user(early[i],=
 (uint32_t *)buf);
8652920d2c0024 Tao Zhou        2025-02-10  632  			if (r) {
8652920d2c0024 Tao Zhou        2025-02-10  633  				result =3D r;
8652920d2c0024 Tao Zhou        2025-02-10  634  				goto out;
8652920d2c0024 Tao Zhou        2025-02-10  635  			}
4f4824b55650fa Tom St Denis    2016-04-27  636  			buf +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  637  			result +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  638  			size -=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  639  			*pos +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  640  		}
4f4824b55650fa Tom St Denis    2016-04-27  641  	}
d38ceaf99ed015 Alex Deucher    2015-04-20  642 =20
5a1428242952f2 Tao Zhou        2025-01-22  643  	if (ring->funcs->type !=3D =
AMDGPU_RING_TYPE_CPER) {
4f4824b55650fa Tom St Denis    2016-04-27  644  		while (size) {
4f4824b55650fa Tom St Denis    2016-04-27  645  			if (*pos >=3D (ring->rin=
g_size + 12))
4f4824b55650fa Tom St Denis    2016-04-27  646  				return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  647 =20
4f4824b55650fa Tom St Denis    2016-04-27  648  			value =3D ring->ring[(*p=
os - 12)/4];
4f4824b55650fa Tom St Denis    2016-04-27  649  			r =3D put_user(value, (u=
int32_t *)buf);
4f4824b55650fa Tom St Denis    2016-04-27  650  			if (r)
4f4824b55650fa Tom St Denis    2016-04-27  651  				return r;
4f4824b55650fa Tom St Denis    2016-04-27  652  			buf +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  653  			result +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  654  			size -=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  655  			*pos +=3D 4;
d38ceaf99ed015 Alex Deucher    2015-04-20  656  		}
5a1428242952f2 Tao Zhou        2025-01-22  657  	} else {
1e40ef87ffdc29 Xiang Liu       2026-05-07  658  		early[0] =3D amdgpu_ring_=
get_rptr(ring) & ring->buf_mask;
1e40ef87ffdc29 Xiang Liu       2026-05-07  659  		early[1] =3D amdgpu_ring_=
get_wptr(ring) & ring->buf_mask;
1e40ef87ffdc29 Xiang Liu       2026-05-07  660 =20
5a1428242952f2 Tao Zhou        2025-01-22  661  		p =3D early[0];
5a1428242952f2 Tao Zhou        2025-01-22  662  		if (early[0] <=3D early[1=
])
1e40ef87ffdc29 Xiang Liu       2026-05-07  663  			avail_dw =3D early[1] - =
early[0];
5a1428242952f2 Tao Zhou        2025-01-22  664  		else
1e40ef87ffdc29 Xiang Liu       2026-05-07  665  			avail_dw =3D ring->buf_m=
ask + 1 - (early[0] - early[1]);
5a1428242952f2 Tao Zhou        2025-01-22  666 =20
1e40ef87ffdc29 Xiang Liu       2026-05-07  667  		start_dw =3D (*pos > 12) =
? ((*pos - 12) >> 2) : 0;
1e40ef87ffdc29 Xiang Liu       2026-05-07  668  		if (start_dw >=3D avail_d=
w)
1e40ef87ffdc29 Xiang Liu       2026-05-07  669  			goto out;
1e40ef87ffdc29 Xiang Liu       2026-05-07  670 =20
1e40ef87ffdc29 Xiang Liu       2026-05-07  671  		p =3D (p + start_dw) & ri=
ng->ptr_mask;
1e40ef87ffdc29 Xiang Liu       2026-05-07  672  		avail_dw -=3D start_dw;
1e40ef87ffdc29 Xiang Liu       2026-05-07  673  		read_dw =3D min_t(u32, av=
ail_dw, size >> 2);
1e40ef87ffdc29 Xiang Liu       2026-05-07  674 =20
1e40ef87ffdc29 Xiang Liu       2026-05-07  675  		while (read_dw) {
5a1428242952f2 Tao Zhou        2025-01-22  676  			if (p =3D=3D early[1])
8652920d2c0024 Tao Zhou        2025-02-10  677  				goto out;
5a1428242952f2 Tao Zhou        2025-01-22  678 =20
5a1428242952f2 Tao Zhou        2025-01-22  679  			value =3D ring->ring[p];
5a1428242952f2 Tao Zhou        2025-01-22  680  			r =3D put_user(value, (u=
int32_t *)buf);
8652920d2c0024 Tao Zhou        2025-02-10  681  			if (r) {
8652920d2c0024 Tao Zhou        2025-02-10  682  				result =3D r;
8652920d2c0024 Tao Zhou        2025-02-10  683  				goto out;
8652920d2c0024 Tao Zhou        2025-02-10  684  			}
5a1428242952f2 Tao Zhou        2025-01-22  685 =20
5a1428242952f2 Tao Zhou        2025-01-22  686  			buf +=3D 4;
5a1428242952f2 Tao Zhou        2025-01-22  687  			result +=3D 4;
1e40ef87ffdc29 Xiang Liu       2026-05-07  688  			read_dw--;
5a1428242952f2 Tao Zhou        2025-01-22  689  			p++;
5a1428242952f2 Tao Zhou        2025-01-22  690  			p &=3D ring->ptr_mask;
1e40ef87ffdc29 Xiang Liu       2026-05-07  691  			*pos +=3D 4;
5a1428242952f2 Tao Zhou        2025-01-22  692  		}
5a1428242952f2 Tao Zhou        2025-01-22  693  	}
4f4824b55650fa Tom St Denis    2016-04-27  694 =20
8652920d2c0024 Tao Zhou        2025-02-10  695  out:
8652920d2c0024 Tao Zhou        2025-02-10  696  	if (ring->funcs->type =3D=
=3D AMDGPU_RING_TYPE_CPER)
8652920d2c0024 Tao Zhou        2025-02-10  697  		mutex_unlock(&ring->adev-=
>cper.ring_lock);
8652920d2c0024 Tao Zhou        2025-02-10  698 =20
4f4824b55650fa Tom St Denis    2016-04-27  699  	return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  700  }
d38ceaf99ed015 Alex Deucher    2015-04-20  701 =20

:::::: The code at line 631 was first introduced by commit
:::::: 4f4824b55650fa7014eedf18cb1f9f243cb2b45e drm/amd/amdgpu: Convert rin=
g debugfs entries to binary

:::::: TO: Tom St Denis <tom.stdenis@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
