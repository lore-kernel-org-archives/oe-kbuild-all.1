Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657FB41D23F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786051685; cv=none; b=BoLNtSG7H/KcV4IKEPLjVwFKzc8Puw+9T7RA0e9a1dluQHwoZC9b5je0SjyNpplYyBoW0Tf45R4bVDxYqneVSxJypfsI0+wkIXDWFUb23CWiJexFelLKhAdF0b9haCpFomW+TUq19SDfcirYrCHi048/MhFQjA8uUyYIe02IBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786051685; c=relaxed/simple;
	bh=m92sR0MVTDK1TrnqTrr6SjcXbItz2IEJ2E02MtKviyg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z7+0spd4VJ7LViQZ7ZbgOweUm2mEDzZk7t1dVvKOz4l5BUe8aSPA7WSNMgBnUkgoo+7ngYAHO8TsH6DLvrZMypaQrrc60WcDs/K8GR7F9ViVVoFQsSdGt0MojJOvS0HzdLe2GrfkA0AZSdK0SsST9ZhPXoZ55yUGE8/nenTo2Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxZ7wTD3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxZ7wTD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786051684; x=1817587684;
  h=date:from:to:cc:subject:message-id;
  bh=m92sR0MVTDK1TrnqTrr6SjcXbItz2IEJ2E02MtKviyg=;
  b=DxZ7wTD3tYpO6pV+Bmjb8JtEHXngml6XEkeK7ujcol9oAqhZaHvCmmOS
   3V4I2WaUc/M4LBpZWQVGFHBZdExAqTO/UkqVL0lnPwL8Trrwk01P45QOE
   Rwcnu7kCEGuD937zqoXPR9WPNMeSMngmmKRKZbOCyrRyrzfbDbyRYVdYZ
   4f+oE6K3npWfD6XDj263HBPumgHMtXenOAtypx1TCFaqyR0y+iP2+QLMT
   Ma3vBQIiFsTpTIM4s68h1CjLHuFTyvs//3TEt1kijt06iXfYpXIQQqvCT
   GCC4GLu5+vCBcArTHvlWeHSPXG6QhPWJY+MC+0ojLr7mfx4sMRUdSwq4L
   Q==;
X-CSE-ConnectionGUID: ozFD/EhlS/CfZQHNk1yPwA==
X-CSE-MsgGUID: B9Fy5uq8THa628dLrF9a8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86425989"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86425989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 14:28:03 -0700
X-CSE-ConnectionGUID: sMrT8ZCLTi+kHpsC3Ne3lQ==
X-CSE-MsgGUID: m5LhlBhMTOml5SsJuKHXug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="265694351"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Aug 2026 14:28:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws5d8-00000000GHR-2fjl;
	Thu, 06 Aug 2026 21:27:58 +0000
Date: Fri, 07 Aug 2026 05:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 9728/13479]
 arch/s390/include/asm/io.h:30:22: error: implicit declaration of function
 'ioremap_prot'; did you mean 'ioremap_np'?
Message-ID: <202608070540.Ijiswbnz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea2bff00da89d7767d677bb68470130ba96f4928
commit: 0b0379fcf9ce395bb51cadb6552ec3b1380436bb [9728/13479] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
config: s390-randconfig-002-20260807 (https://download.01.org/0day-ci/archive/20260807/202608070540.Ijiswbnz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070540.Ijiswbnz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070540.Ijiswbnz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:12,
                    from include/linux/firmware/qcom/qcom_pas.h:13,
                    from drivers/firmware/qcom/qcom_pas.c:9:
   include/linux/firmware/qcom/qcom_pas.h: In function 'qcom_pas_ctx_map':
>> arch/s390/include/asm/io.h:30:22: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_np'? [-Wimplicit-function-declaration]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:9: note: in expansion of macro 'ioremap_prot'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^~~~~~~~~~~~
   include/linux/firmware/qcom/qcom_pas.h:29:29: note: in expansion of macro 'ioremap_wc'
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^~~~~~~~~~
>> arch/s390/include/asm/io.h:30:22: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:9: note: in expansion of macro 'ioremap_prot'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^~~~~~~~~~~~
   include/linux/firmware/qcom/qcom_pas.h:29:29: note: in expansion of macro 'ioremap_wc'
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^~~~~~~~~~


vim +30 arch/s390/include/asm/io.h

cd24834130ac65 Jan Glauber 2012-11-29  26  
b43b3fff042d08 Baoquan He  2023-07-06  27  /*
b43b3fff042d08 Baoquan He  2023-07-06  28   * I/O memory mapping functions.
b43b3fff042d08 Baoquan He  2023-07-06  29   */
b43b3fff042d08 Baoquan He  2023-07-06 @30  #define ioremap_prot ioremap_prot
b43b3fff042d08 Baoquan He  2023-07-06  31  #define iounmap iounmap
b43b3fff042d08 Baoquan He  2023-07-06  32  

:::::: The code at line 30 was first introduced by commit
:::::: b43b3fff042d08a0bcc0a6d87c3216b44860298e s390: mm: convert to GENERIC_IOREMAP

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
