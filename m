Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790B17BD2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708375983; cv=none; b=bTrY4ql7QoB1sQ/XdO2FB9UwMVakauYFpT9GXYG08/cTbi9/SY3GkeLwUXHRL3qU4E+SbRazM+WNbcmqTdovd7LUs9RPGVsbCB2ysK3o8zYVpdiQl4iyutQUtjh6yU6R6OWDfkqX4T36uEn7xqwPfwAE1ABZoHvIib/11VVnWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708375983; c=relaxed/simple;
	bh=qCGWTx6++kab0pPB6OrQ4V4VhzGqD5QEz+jZrC5AO/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HEkQHZTP9WUwZMSkEnhNUbPAqezqmoaqoQfGR0Wr866WKimXL6YntBqLf+EbNqZOofMJLHk10ud4Av2Q5alJ8f0Dghb8kQ/Aj3nwy346EklHSWltsJDnDqiqBIAy7v+4pUZrsuvBIkIN1QOC8dZFEUPH51633ZGjdiFfkrPiR7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxl9Llc0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxl9Llc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708375982; x=1739911982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qCGWTx6++kab0pPB6OrQ4V4VhzGqD5QEz+jZrC5AO/s=;
  b=nxl9Llc0PQUvsp80s4uqhDG9TCMcoANWUsZlWFbYVssZbfxZrABy+hKX
   A+KVv3XuqPCkPPy3QX64LF11G3BGTaS64hUOKspa06bERVc83G9czMKgw
   F2+9Gt4XlwtqvwfvNN0qWa5D0q64QZDQjw/wbiJ83PVdYRcCwgKy1m6vk
   94w3XK3uz0frv0bZFgHOx7qf3o0rCVHQ49tTGCeU451CwaAZauXHGl2ec
   59wVmRJ9APfnQQuyBZ7WXs/dS/t34FjsbMvC9avZsNIRUPmMYH1j09riE
   cpJtMgusZrIZSHda/aA4EP7bJPqS+c8cCwYYN7Tx46EIVYBoviXLwSVAB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2330063"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2330063"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 12:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="936339221"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="936339221"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2024 12:52:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcAdF-00043W-1N;
	Mon, 19 Feb 2024 20:52:57 +0000
Date: Tue, 20 Feb 2024 04:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, wangyuan <wangyuan46@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21582/21628]
 include/linux/uaccess.h:112:17: warning: 'qp_ctx' may be used uninitialized
Message-ID: <202402200406.0uniupLa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   94f199d2ce0118d64c47192cef7247cf30560eba
commit: 267bce716c1008522c3b8ddbeac8d3c65514e98f [21582/21628] crypto: hisilicon/qm - drop unnecessary IS_ENABLE(CONFIG_NUMA) check
config: arm64-randconfig-003-20240218 (https://download.01.org/0day-ci/archive/20240220/202402200406.0uniupLa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402200406.0uniupLa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402200406.0uniupLa-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/poll.h:12,
                    from include/linux/rtc.h:52,
                    from include/linux/efi.h:20,
                    from arch/arm64/include/asm/acpi.h:15,
                    from include/acpi/acpi_io.h:7,
                    from include/linux/acpi.h:47,
                    from drivers/crypto/hisilicon/qm.c:4:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'hisi_qm_uacce_ioctl' at drivers/crypto/hisilicon/qm.c:2280:7:
>> include/linux/uaccess.h:112:17: warning: 'qp_ctx' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:265,
                    from arch/arm64/include/asm/memory.h:24,
                    from arch/arm64/include/asm/page.h:52,
                    from drivers/crypto/hisilicon/qm.c:3:
   include/linux/kasan-checks.h: In function 'hisi_qm_uacce_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/crypto/hisilicon/qm.c:2277:28: note: 'qp_ctx' declared here
    2277 |         struct hisi_qp_ctx qp_ctx;
         |                            ^~~~~~
   drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'ce' description in 'qm_hw_error_init'
   drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'nfe' description in 'qm_hw_error_init'
   drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'fe' description in 'qm_hw_error_init'
   drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'msi' description in 'qm_hw_error_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for UACCE
   Depends on [n]: IOMMU_API [=n]
   Selected by [y]:
   - CRYPTO_DEV_HISI_QM [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && PCI [=y]


vim +/qp_ctx +112 include/linux/uaccess.h

d597580d373774 Al Viro        2017-03-20  104  
d597580d373774 Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  108  {
d597580d373774 Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4 Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4 Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774 Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  114  	}
d597580d373774 Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774 Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774 Al Viro        2017-03-20  117  	return res;
d597580d373774 Al Viro        2017-03-20  118  }
d597580d373774 Al Viro        2017-03-20  119  #else
d597580d373774 Al Viro        2017-03-20  120  extern unsigned long
d597580d373774 Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774 Al Viro        2017-03-20  122  #endif
d597580d373774 Al Viro        2017-03-20  123  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
