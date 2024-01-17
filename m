Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C449A1EB24
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705497726; cv=none; b=RGkXY2tn0CEP6akltTguyS1MLrskJCrxSYEt/WmtOR/mqQSh9XOcc/hhZaKNiWx5LbqEySZUXZs6BPv4hh2aoDZVoRcYogk/tgA7qQz5C4mkojm33Mzuj2VDB575Zqh+LIHNmFQEIZeVQtB7XWpGFgSSin+QO9NCz7z/YkXRqGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705497726; c=relaxed/simple;
	bh=BiTv3W2tCoJzk4RKgVeVoCKcNYVMy9KSitAPKUSDn48=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=q4S6Flu3TOEG5NNPHxT70ZigqWzNa2PlM41JkfkrXImOeZ8QY19LW+TbF0TZ29sG/egHOUP+e5uzVrMe3cSGdRKkwnGIoE3USGfVE6W41LphR05I12EscWbVFIPgQkNFyDSXlwlmnsuFuwswxPwqtUMGqbi1tPjhsiKbw5cUKeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMk2mbA7; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMk2mbA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705497724; x=1737033724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BiTv3W2tCoJzk4RKgVeVoCKcNYVMy9KSitAPKUSDn48=;
  b=KMk2mbA7BkCxcRdi552Im/zvqEj6wzWkqqzVLLbqXShCqdwQJFbIsC7t
   DjuOKZShlWU7QkfHffzkDgDsnH/sgFquDCkJBftd73Z1CLFlN5kMmQSp1
   6m+L5myt/WSEZFY7XxhWCtkHGtMyCywrsnal8LME5eWSzR/wazx2Knv/k
   OBiaglk3UWSLun6w5fFDu+r2K+F745H4qNX4itTbKSXyEYrs5PYJZGzSi
   46NoAvV9r8EfzzSXCCiFU2gyQuXbosGhTvosZN5ARXzkQHyTVmIk1hrbs
   fDcNbr1JSjBzOQwUxtBwvp7902sJyJD3Rj9ZKMfaf2Ymn/ilWRXeDjCe/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="403923950"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="403923950"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 05:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854699807"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="854699807"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2024 05:22:02 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ5rk-00021C-1m;
	Wed, 17 Jan 2024 13:22:00 +0000
Date: Wed, 17 Jan 2024 21:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 160/175]
 arch/arm64/kvm/hyp_trace.c:763:37: warning: unused variable 'hyp_trace_fops'
Message-ID: <202401172136.NjYKreba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   00d46b7d4ac191fcc28b0ea7cbdb8611a8628fce
commit: c5c554823f2b582cf6a0a1e2b37297f623392483 [160/175] ANDROID: KVM: arm64: Add trace_clock for nVHE tracing
config: arm64-randconfig-003-20240116 (https://download.01.org/0day-ci/archive/20240117/202401172136.NjYKreba-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401172136.NjYKreba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401172136.NjYKreba-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c:719:37: warning: unused variable 'hyp_trace_raw_fops' [-Wunused-const-variable]
     719 | static const struct file_operations hyp_trace_raw_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_trace.c:763:37: warning: unused variable 'hyp_trace_fops' [-Wunused-const-variable]
     763 | static const struct file_operations hyp_trace_fops = {
         |                                     ^~~~~~~~~~~~~~
   2 warnings generated.


vim +/hyp_trace_fops +763 arch/arm64/kvm/hyp_trace.c

c24ca55000da34 Vincent Donnefort 2023-06-13  762  
c24ca55000da34 Vincent Donnefort 2023-06-13 @763  static const struct file_operations hyp_trace_fops = {
c24ca55000da34 Vincent Donnefort 2023-06-13  764  	.open           = hyp_trace_open,
c24ca55000da34 Vincent Donnefort 2023-06-13  765  	.read           = hyp_trace_read,
c24ca55000da34 Vincent Donnefort 2023-06-13  766  	.write          = hyp_trace_write,
c24ca55000da34 Vincent Donnefort 2023-06-13  767  	.release        = NULL,
c24ca55000da34 Vincent Donnefort 2023-06-13  768  };
c24ca55000da34 Vincent Donnefort 2023-06-13  769  

:::::: The code at line 763 was first introduced by commit
:::::: c24ca55000da3492aacf4e383634f060faeb5050 ANDROID: KVM: arm64: Add nVHE hyp tracing to tracefs

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
