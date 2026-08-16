Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A33CB548
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786861400; cv=none; b=rwbTk+mlVjHDXOSGQWDxfGsGbeK4XMch0+T7nfpYaNfmeRuko4Dgl94WF/SclTa/cPTT9tp9O73IWCdvgGAnxjSl/4+f9K/ScyYMR4Bewz0K93+usSkPRx6yPlLUwtNqovEJIQ8B3dh0L01OZ1xrE+6U84rpFdLnFWX7jLsmZO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786861400; c=relaxed/simple;
	bh=5yHQJer4EaRXZPJyj8BHpi/q8mVGx5T9WT6UbXTRBVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f9aJg7wEeXwZPzPtLYQ6388uTV9OvVaZ2nl05Cz4FR3xaqo9uavY0MaU7iCSZZaDLPUIBkHke4EYSTQ5e3zL+S3HzQlu5dXPiye3zwaTsOKuonDEmwNkIZ0o47rqnrV21PIfTFb4ehsdmbt8Rh1GKfEm9GEmvgpQb11AV96v7Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfjEqujD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfjEqujD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786861397; x=1818397397;
  h=date:from:to:cc:subject:message-id;
  bh=5yHQJer4EaRXZPJyj8BHpi/q8mVGx5T9WT6UbXTRBVM=;
  b=cfjEqujDsbXPd3Y57awJ8CjM/kGBsvBHRbJl06a0IEwB6FqS6fAfPNQL
   Wt3cZ42o68ZBEccdYEz67u+f41Lk3qPTnqsw2sCqBHrvRgOhIbJo3J2mK
   BaBzG5oXZ0TOIHeZxfR6fPvOXgC4usxZz/D7QZkkFJD2rJfSL548zxjGE
   ZJvDKBYidXsJPVTVXhkQjSWgf2SDX9DgXsyiqkWxRjpewzPyJ62BXZMMd
   df3XNg6P30mV98xtPDtC1SS+xxdfYGOcsekYZZR220u0c6rE587nSihhf
   HLJxJYjxfto0eqRIqYWN+ZsgjjZ1FYQt+98gZeFefFTQACUpGc8qqBbtA
   A==;
X-CSE-ConnectionGUID: +59GzwiATWqBo4OujpcD7w==
X-CSE-MsgGUID: aywQrD9FTV6a56OpMV426Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="91187388"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="91187388"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 23:23:17 -0700
X-CSE-ConnectionGUID: rvpGeTMdTXGuCORHaD4vtQ==
X-CSE-MsgGUID: ybHYOLhsS4W4nCiKNQRLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="260830023"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 15 Aug 2026 23:23:16 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvUH3-000000006Yz-3rOF;
	Sun, 16 Aug 2026 06:23:13 +0000
Date: Sun, 16 Aug 2026 08:22:16 +0200
From: kernel test robot <lkp@intel.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/s390/net/bpf_jit_comp.c:3125:49: error: implicit
 declaration of function 'bpf_jit_binary_hdr'; did you mean
 'bpf_jit_binary_free'?
Message-ID: <202608160842.bEJPm8w0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pu-Lehui/bpf-arm64-Fix-memory-leak-in-bpf_jit_free/20260814-035453
head:   3c6c16ba6a344682b307bb4f0cce5dd0648c2a1a
commit: 9ac7eec2dea338df039c74eda34d74059ac2b8ab s390/bpf: Fix memory leak in bpf_jit_free
date:   2 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260816/202608160842.bEJPm8w0-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160842.bEJPm8w0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608160842.bEJPm8w0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/net/bpf_jit_comp.c: In function 'bpf_jit_free':
>> arch/s390/net/bpf_jit_comp.c:3125:49: error: implicit declaration of function 'bpf_jit_binary_hdr'; did you mean 'bpf_jit_binary_free'? [-Wimplicit-function-declaration]
    3125 |                 struct bpf_binary_header *hdr = bpf_jit_binary_hdr(fp);
         |                                                 ^~~~~~~~~~~~~~~~~~
         |                                                 bpf_jit_binary_free
>> arch/s390/net/bpf_jit_comp.c:3125:49: error: initialization of 'struct bpf_binary_header *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> arch/s390/net/bpf_jit_comp.c:3129:40: error: invalid use of undefined type 'struct bpf_jit_data'
    3129 |                         kvfree(jit_data->ctx.addrs);
         |                                        ^~


vim +3125 arch/s390/net/bpf_jit_comp.c

  3120	
  3121	void bpf_jit_free(struct bpf_prog *fp)
  3122	{
  3123		if (fp->jited) {
  3124			struct bpf_jit_data *jit_data = fp->aux->jit_data;
> 3125			struct bpf_binary_header *hdr = bpf_jit_binary_hdr(fp);
  3126	
  3127			/* Cleanup for earlier subprogs if jit_subprogs() aborts */
  3128			if (jit_data) {
> 3129				kvfree(jit_data->ctx.addrs);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
