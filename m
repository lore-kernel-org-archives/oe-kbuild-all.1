Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C317D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 01:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipEYqbJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697505803; x=1729041803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CXx3voC4c+HQyN8Im6NbMGVWOE2e3DLBAQlqQbK5KRQ=;
  b=ipEYqbJVBMuF2YLUQqiZwc+Z36w3r5EOLxSCPAevim0b7goIFm1p+W3h
   nig4voXSRtWG2RcG0z9INDKbqPJCswIBSLwkZqr+0YIng2d15SPQR1XUH
   AW81hAr15emk453kG77fhh3EowwmTOh9TcStLFAvHflKbDuCJsQrpvM0f
   9vIEJTBtVGnndh4rlol6Gtao69W7CO637+7jfCBS146PYc6usFFXoXm7r
   LtcJaN2+p9lhCfotUFjul0OC5XOGGkTkYlCHBNdE6WVnSLz02GbNBYGNj
   SZ2odV8vLwd4HxWsdh4IhQ2sEMUsk0P5wjA9TCuAqXWdKwPJuVMuVXiyI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384549225"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="384549225"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 18:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="785306256"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="785306256"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Oct 2023 18:23:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsYnm-0008oh-0M;
	Tue, 17 Oct 2023 01:23:18 +0000
Date: Tue, 17 Oct 2023 09:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 146/232] checkpatch: ERROR: space prohibited
 before that ':' (ctx:WxV)
Message-ID: <202310170926.cnYFL9BW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   74d338d77518cf071da9b6ee3676154341830251
commit: 515ae014205e4f034df4d5dae53292a14a67cf39 [146/232] KVM: x86/mmu: Add a new is_private member for union kvm_mmu_page_role
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170926.cnYFL9BW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170926.cnYFL9BW-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space prohibited before that ':' (ctx:WxV)
#27: FILE: arch/x86/include/asm/kvm_host.h:346:
+		unsigned :4;
 		         ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
