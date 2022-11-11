Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95480B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Nov 2022 08:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668157085; x=1699693085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/K1OGKvxiKFArO/iGi6he/zO4L5VAtoS58akme1yUs=;
  b=Io+1p3LGV96/EnyUfcpnmqVCI5ODQ5g7Jv5DtrNYR1299X6+pChdgzts
   9bw9H7Io5OQ0Ac2VP1a2EiLBuFPPryWqlyNBgMZYdNMsCiVvdv9QrefGy
   ZrySj4QKAAmSEBJU5HuA8D9rLr6y/O9a65xkfGsVuOoZVLxB1W9Zgtxc7
   anx5Bd1yyHPZptHUT+Q7gF1m04qSLxSB1bgwr8oBkCmFk8Zfu4Lp4Dao2
   j7MjXEcsSgGxCOmXaDX5R0WmALbPtZcvLaIdQ11bHTSiL4uTpOmx70Ol7
   rjYlMc+7ILsNHdEPVuut+F/7vPe7tlOLdgOA3uNnsT/DKiqt8lyePAX39
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="375822401"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="375822401"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 00:58:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="966760126"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="966760126"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Nov 2022 00:58:00 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1otPrM-0003n5-10;
	Fri, 11 Nov 2022 08:58:00 +0000
Date: Fri, 11 Nov 2022 16:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>
Subject: drivers/crypto/hisilicon/sec2/sec_main.c:282:6: warning: Local
 variable 'ctx_q_num' shadows outer variable [shadowVariable]
Message-ID: <202211111655.DyDy9Bu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bbf3422df78029f03161640dcb1e9d1ed64d1ea
commit: 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb LoongArch: Add PCI controller support
date:   3 months ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/crypto/hisilicon/sec2/sec_main.c:282:6: warning: Local variable 'ctx_q_num' shadows outer variable [shadowVariable]
    u32 ctx_q_num;
        ^
   drivers/crypto/hisilicon/sec2/sec_main.c:304:12: note: Shadowed declaration
   static u32 ctx_q_num = SEC_CTX_Q_NUM_DEF;
              ^
   drivers/crypto/hisilicon/sec2/sec_main.c:282:6: note: Shadow variable
    u32 ctx_q_num;
        ^
--
   drivers/crypto/hisilicon/qm.c:4563:8: warning: %x in format string (no. 2) requires 'unsigned int *' but the argument type is 'signed int *'. [invalidScanfArgType_int]
    ret = sscanf(tbuf_bdf, "%u:%x:%u.%u", &tmp1, &bus, &device, &function);
          ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/crypto/hisilicon/qm.c:1704:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
    dregs = NULL;
    ^
>> drivers/crypto/hisilicon/qm.c:4553:8: warning: sscanf() without field width limits can crash with huge input data. [invalidscanf]
    ret = sscanf(buf, "%s %s", tbuf_bdf, val_buf);
          ^
>> drivers/crypto/hisilicon/qm.c:3499:46: warning: Parameter 'pdev' can be declared as pointer to const [constParameter]
   static int qm_try_frozen_vfs(struct pci_dev *pdev,
                                                ^
>> drivers/crypto/hisilicon/qm.c:4229:29: warning: Uninitialized variable: tmp->distance [uninitvar]
      if (res->distance < tmp->distance) {
                               ^
   drivers/crypto/hisilicon/qm.c:4222:7: note: Assuming condition is false
     if (!res)
         ^
   drivers/crypto/hisilicon/qm.c:4229:29: note: Uninitialized variable: tmp->distance
      if (res->distance < tmp->distance) {
                               ^

vim +/ctx_q_num +282 drivers/crypto/hisilicon/sec2/sec_main.c

416d82204df44e Zaibo Xu 2019-11-13  279  
416d82204df44e Zaibo Xu 2019-11-13  280  static int sec_ctx_q_num_set(const char *val, const struct kernel_param *kp)
416d82204df44e Zaibo Xu 2019-11-13  281  {
416d82204df44e Zaibo Xu 2019-11-13 @282  	u32 ctx_q_num;
416d82204df44e Zaibo Xu 2019-11-13  283  	int ret;
416d82204df44e Zaibo Xu 2019-11-13  284  
416d82204df44e Zaibo Xu 2019-11-13  285  	if (!val)
416d82204df44e Zaibo Xu 2019-11-13  286  		return -EINVAL;
416d82204df44e Zaibo Xu 2019-11-13  287  
416d82204df44e Zaibo Xu 2019-11-13  288  	ret = kstrtou32(val, 10, &ctx_q_num);
416d82204df44e Zaibo Xu 2019-11-13  289  	if (ret)
416d82204df44e Zaibo Xu 2019-11-13  290  		return -EINVAL;
416d82204df44e Zaibo Xu 2019-11-13  291  
7c7d902aa4059b Zaibo Xu 2020-01-11  292  	if (!ctx_q_num || ctx_q_num > SEC_CTX_Q_NUM_MAX || ctx_q_num & 0x1) {
416d82204df44e Zaibo Xu 2019-11-13  293  		pr_err("ctx queue num[%u] is invalid!\n", ctx_q_num);
416d82204df44e Zaibo Xu 2019-11-13  294  		return -EINVAL;
416d82204df44e Zaibo Xu 2019-11-13  295  	}
416d82204df44e Zaibo Xu 2019-11-13  296  
416d82204df44e Zaibo Xu 2019-11-13  297  	return param_set_int(val, kp);
416d82204df44e Zaibo Xu 2019-11-13  298  }
416d82204df44e Zaibo Xu 2019-11-13  299  

:::::: The code at line 282 was first introduced by commit
:::::: 416d82204df44ef727de6eafafeaa4d12fdc78dc crypto: hisilicon - add HiSilicon SEC V2 driver

:::::: TO: Zaibo Xu <xuzaibo@huawei.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
