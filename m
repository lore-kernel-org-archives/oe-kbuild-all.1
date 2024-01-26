Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B1171A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706251842; cv=none; b=BGRQ7qPzqc2NTtDdtKpFoLLR2iGtxuIu82r37xZneNu8Y0zdpVf+VkS8FywRiaMVuUMkCaDNVl6UXOexTrED45RWH01vxrAMjsY0c7lgGN+XXXF3BTWR/xjDmCGH4WbFq7cHe2ftiQxHy1vZgGalFDT2/XrSMXFTzWNF+s4OfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706251842; c=relaxed/simple;
	bh=2rtp0Cj7ZQMz13H+yIp12+tey52Sa94/8IQb45OdXqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bH8fw+QZBlv93tp/U9UaLO22yQasBt/jcdS2xJ9/rhdNHuE+sXdMf7D71BdTcQvdHHRR0RatG8XBJlrlpKX2kElvVbYqDVIT6yBvhKxX7dthmKtIoHq4p4szBmV22eHxK8dkF9qz0bXNwhYpXA7CByVGrcC5330/o/lNTovAjdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8tZ2sXq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8tZ2sXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706251840; x=1737787840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2rtp0Cj7ZQMz13H+yIp12+tey52Sa94/8IQb45OdXqk=;
  b=H8tZ2sXqvK0gI19azZa86FfnplCnv8SHLSDc79JmYNl/3tiltJ/IrzNL
   gDnK93STV0efxsRsK1NKMpvR5N3RbPQDy+bXaxlHQItdgW/LMm5ZGy4Wu
   GHzZVeq6/0zvb8grk5beu7vTKSIlao+C+E3XfRfFZjRxqN0gphT8m7b5j
   PYuwXw9PzaSpoa/BrSTFzhkmuYIOux1oNoFr73jaGR7Rrejz8zvEQrVdE
   8cMg6drVIzum6kJrRHgCJ+uZJBxEok7NgYV2DaDTBd9puAlSw07lKAQv1
   9tS1/Ufp7sN0Vzn7PuCWwxor8eHrKYmuUr8sVkQ5VKjPxn421IULl8kwG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15929445"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15929445"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 22:50:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736598441"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736598441"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2024 22:50:36 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTG2r-0000mi-2U;
	Fri, 26 Jan 2024 06:50:33 +0000
Date: Fri, 26 Jan 2024 14:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2688/2772] WARNING: modpost: vmlinux: section
 mismatch in reference: resctrl_init+0x6c (section: .text) ->
 rdtgroup_setup_default (section: .init.text)
Message-ID: <202401261430.Xq824gQ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   171c8e9da50fa0469772aff8e1c60184f51b55f6
commit: c5a4bf91167c714de74c47f5cd6d888c66e9860d [2688/2772] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240126/202401261430.Xq824gQ5-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a31a60074717fc40887cfe132b77eec93bedd307)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261430.Xq824gQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261430.Xq824gQ5-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: resctrl_init+0x6c (section: .text) -> rdtgroup_setup_default (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm64/kernel/arm64-reloc-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm64/crypto/crct10dif-ce.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm64/crypto/poly1305-neon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm64/crypto/aes-neon-bs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/test_udelay.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/time_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/kcsan/kcsan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/backtracetest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/resource_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/sysctl-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/scftorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kfence/kfence_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/dmapool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/hwpoison-inject.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/zsmalloc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/nfs_acl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/grace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp852.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp874.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-13.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-croatian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8data.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8-selftest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/jbd2/jbd2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/minix/minix.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/isofs/isofs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hfs/hfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/sysv/sysv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hpfs/hpfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ufs/ufs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/efs/efs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/qnx4/qnx4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/qnx6/qnx6.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
