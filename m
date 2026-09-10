Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8460637B021
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037286; cv=none; b=BccOYgrQESvXx2U7jQDdsg7+c205LgoGw5TvAsAC6pYwEdAaYr7ea90osWrQGG7P44wNbC/YvKxFRN5TCsfemH3zIlXsN6f+XxEhztmQPRTNn8oS8E4GmQVp/f6sGb0i+kasAhnoEmk49xGtmF59KhdWBz5n9c0AoZ2dn6jaxoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037286; c=relaxed/simple;
	bh=CKJP3LWV0XbiTPX5pJ7NiWChkdlri8kaJ5mSH2lh3xY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O4VEX45eI2c0dWUq0KvEtoreNaLwhVIoSCBxAyhpzK43hpOUJ/rJDawmrlqapE3CBcMqHNw4J26gGtMAFAH5na4qxpxucIRSPis2Z+OeaKmGvP8rFzwPvSCKESGNYhSuynAaXPZ8sr7xq4YJDuUDikqlMg3H67D+fuwBuTpCKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7C3juhl; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7C3juhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789037282; x=1820573282;
  h=date:from:to:cc:subject:message-id;
  bh=CKJP3LWV0XbiTPX5pJ7NiWChkdlri8kaJ5mSH2lh3xY=;
  b=D7C3juhlcKpnL33Bol2CWWuMY5ax7XzimT6wJYPH9WiDw9/WoFQNlqer
   JlFgc1Vf7N5uW0ocjLuGBF7mEZL4xojKPtQYARuR0yhZx4xvdwJllauL6
   jXV0Yb/O8Dky3IloKpGZB+iCk28mEJ6d0cn20MNAjOHN9ogEK1N7UvXM2
   9Q9hdtBR0iVhPVqwov7N6JJiKZ+6vvW4Ka+6zQ3VAYh9ZYyf3gxjOKsXn
   29ZKihSkt8pGXCLKQ4b0mhmVUGhaQptBf/+WEwNM3oO/Qoaxm8LnU/H4n
   ItkfeW01Pk5hErCGWXgY04k6hFSHC4e8xHVjrm3O12Sh0vLM9VEprutZk
   A==;
X-CSE-ConnectionGUID: Oast69ilRXWcOKk2yvYF8A==
X-CSE-MsgGUID: mzzhhg3MTByrVJGMusdMHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="5082"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="5082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 03:48:00 -0700
X-CSE-ConnectionGUID: AVaUdzUaS9yIf3iUXs2YDA==
X-CSE-MsgGUID: ym2N2vwNQP6JzLl8MfS//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301487735"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 03:47:58 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4cJv-000000001i7-3UeU;
	Thu, 10 Sep 2026 10:47:55 +0000
Date: Thu, 10 Sep 2026 18:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: arch/s390/include/asm/io.h:30:22: error: implicit
 declaration of function 'ioremap_prot'; did you mean 'ioremap_np'?
Message-ID: <202609101854.0eBirOer-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mukesh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 0b0379fcf9ce395bb51cadb6552ec3b1380436bb remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
date:   6 weeks ago
config: s390-randconfig-r121-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101854.0eBirOer-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101854.0eBirOer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b0379fcf9ce ("remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101854.0eBirOer-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:8,
                    from drivers/firmware/qcom/qcom_scm.c:13:
   include/linux/firmware/qcom/qcom_pas.h: In function 'qcom_pas_ctx_map':
>> arch/s390/include/asm/io.h:30:22: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_np'? [-Werror=implicit-function-declaration]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:9: note: in expansion of macro 'ioremap_prot'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^~~~~~~~~~~~
   include/linux/firmware/qcom/qcom_pas.h:29:29: note: in expansion of macro 'ioremap_wc'
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^~~~~~~~~~
   arch/s390/include/asm/io.h:30:22: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:9: note: in expansion of macro 'ioremap_prot'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^~~~~~~~~~~~
   include/linux/firmware/qcom/qcom_pas.h:29:29: note: in expansion of macro 'ioremap_wc'
      29 |         void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
         |                             ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +30 arch/s390/include/asm/io.h

cd24834130ac655 Jan Glauber 2012-11-29  26  
b43b3fff042d08a Baoquan He  2023-07-06  27  /*
b43b3fff042d08a Baoquan He  2023-07-06  28   * I/O memory mapping functions.
b43b3fff042d08a Baoquan He  2023-07-06  29   */
b43b3fff042d08a Baoquan He  2023-07-06 @30  #define ioremap_prot ioremap_prot
b43b3fff042d08a Baoquan He  2023-07-06  31  #define iounmap iounmap
b43b3fff042d08a Baoquan He  2023-07-06  32  

:::::: The code at line 30 was first introduced by commit
:::::: b43b3fff042d08a0bcc0a6d87c3216b44860298e s390: mm: convert to GENERIC_IOREMAP

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
