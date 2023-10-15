Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C1185E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 11:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+XT34It"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697369741; x=1728905741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+GtEjW7WV0I0BZ/zIRpHPAbDvTlJqTkkQCSYSTv0+9o=;
  b=F+XT34ItcmJlDLCBJoom+iuehSXYnsbqNG/PpeyeI3LeSQr0iWsVP51e
   qroKrSDHKu0zxPf4si8hfuIzLf3rs0jEPeYA+PaOYVKqC2hP65mtOrhwA
   v5dbOex5/gaxfrDkNQvLB4UsinNmfAVwVDVXnfg5Rx9zWC8wx4OeYj7Qk
   E88sG1/YIhA0pbVP4aFFoxAqu4kcSGidDj8CWWbdLI8cGHdPluenlH4ay
   iVagjHVItX5wPLmzDZtZibbk9metZue2G3n+I9O16yPOyhA7CVirQ0FeZ
   bVhJYi4T1ZoTQA6BgK+d+uLLqSDyaB8mMeHadq9qk/5hWwp653/u70S04
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449575544"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="449575544"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 04:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002581541"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1002581541"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Oct 2023 04:35:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrzPF-0007Mx-0V;
	Sun, 15 Oct 2023 11:35:37 +0000
Date: Sun, 15 Oct 2023 19:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2702/30000]
 drivers/char/imx_amp/imx_sema4.c:122:5: warning: no previous prototype for
 '_imx_sema4_mutex_lock'
Message-ID: <202310151920.oUMZuw0a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 08dcfadc9a22bdb8cd37bc1ce38bc98d202cd857 [2702/30000] Merge branch 'pm/next' into next
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231015/202310151920.oUMZuw0a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151920.oUMZuw0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151920.oUMZuw0a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx6sx.c:136:6: warning: no previous prototype for 'imx6sx_set_m4_highfreq' [-Wmissing-prototypes]
     136 | void imx6sx_set_m4_highfreq(bool high_freq)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/imx/clk-imx6sx.c:13:
   include/linux/imx_sema4.h:32:27: warning: 'idx_sema4' defined but not used [-Wunused-const-variable=]
      32 | static const unsigned int idx_sema4[SEMA4_NUM_GATES] = {
         |                           ^~~~~~~~~
--
>> drivers/char/imx_amp/imx_sema4.c:122:5: warning: no previous prototype for '_imx_sema4_mutex_lock' [-Wmissing-prototypes]
     122 | int _imx_sema4_mutex_lock(struct imx_sema4_mutex *mutex_ptr)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/_imx_sema4_mutex_lock +122 drivers/char/imx_amp/imx_sema4.c

f17252c51016f7 Anson Huang 2019-04-19  107  
f17252c51016f7 Anson Huang 2019-04-19  108  /*!
f17252c51016f7 Anson Huang 2019-04-19  109   * \brief Lock the mutex, shouldn't be interruted by INT.
f17252c51016f7 Anson Huang 2019-04-19  110   *
f17252c51016f7 Anson Huang 2019-04-19  111   * This function attempts to lock a mutex. If the mutex is already locked
f17252c51016f7 Anson Huang 2019-04-19  112   * by another task the function return -EBUSY, and tell invoker wait until
f17252c51016f7 Anson Huang 2019-04-19  113   * it is possible to lock the mutex.
f17252c51016f7 Anson Huang 2019-04-19  114   *
f17252c51016f7 Anson Huang 2019-04-19  115   * \param[in] mutex_ptr   Pointer to mutex structure.
f17252c51016f7 Anson Huang 2019-04-19  116   *
f17252c51016f7 Anson Huang 2019-04-19  117   * \return MQX_INVALID_POINTER (Wrong pointer to the mutex structure provided.)
f17252c51016f7 Anson Huang 2019-04-19  118   * \return COREMUTEX_OK (mutex successfully locked.)
f17252c51016f7 Anson Huang 2019-04-19  119   *
f17252c51016f7 Anson Huang 2019-04-19  120   * \see imx_sema4_mutex_unlock
f17252c51016f7 Anson Huang 2019-04-19  121   */
f17252c51016f7 Anson Huang 2019-04-19 @122  int _imx_sema4_mutex_lock(struct imx_sema4_mutex *mutex_ptr)
f17252c51016f7 Anson Huang 2019-04-19  123  {
f17252c51016f7 Anson Huang 2019-04-19  124  	int ret = 0, i = 0;
f17252c51016f7 Anson Huang 2019-04-19  125  
f17252c51016f7 Anson Huang 2019-04-19  126  	if ((mutex_ptr == NULL) || (mutex_ptr->valid != CORE_MUTEX_VALID))
f17252c51016f7 Anson Huang 2019-04-19  127  		return -EINVAL;
f17252c51016f7 Anson Huang 2019-04-19  128  
f17252c51016f7 Anson Huang 2019-04-19  129  	i = mutex_ptr->gate_num;
f17252c51016f7 Anson Huang 2019-04-19  130  	mutex_ptr->gate_val = readb(imx6_sema4->ioaddr + i);
f17252c51016f7 Anson Huang 2019-04-19  131  	mutex_ptr->gate_val &= SEMA4_GATE_MASK;
f17252c51016f7 Anson Huang 2019-04-19  132  	/* Check to see if this core already own it */
f17252c51016f7 Anson Huang 2019-04-19  133  	if (mutex_ptr->gate_val == SEMA4_A9_LOCK) {
f17252c51016f7 Anson Huang 2019-04-19  134  		/* return -EBUSY, invoker should be in sleep, and re-lock ag */
f17252c51016f7 Anson Huang 2019-04-19  135  		pr_err("%s -> %s %d already locked, wait! num %d val %d.\n",
f17252c51016f7 Anson Huang 2019-04-19  136  				__FILE__, __func__, __LINE__,
f17252c51016f7 Anson Huang 2019-04-19  137  				i, mutex_ptr->gate_val);
f17252c51016f7 Anson Huang 2019-04-19  138  		ret = -EBUSY;
f17252c51016f7 Anson Huang 2019-04-19  139  		goto out;
f17252c51016f7 Anson Huang 2019-04-19  140  	} else {
f17252c51016f7 Anson Huang 2019-04-19  141  		/* try to lock the mutex */
f17252c51016f7 Anson Huang 2019-04-19  142  		mutex_ptr->gate_val = readb(imx6_sema4->ioaddr + i);
f17252c51016f7 Anson Huang 2019-04-19  143  		mutex_ptr->gate_val &= (~SEMA4_GATE_MASK);
f17252c51016f7 Anson Huang 2019-04-19  144  		mutex_ptr->gate_val |= SEMA4_A9_LOCK;
f17252c51016f7 Anson Huang 2019-04-19  145  		writeb(mutex_ptr->gate_val, imx6_sema4->ioaddr + i);
f17252c51016f7 Anson Huang 2019-04-19  146  		mutex_ptr->gate_val = readb(imx6_sema4->ioaddr + i);
f17252c51016f7 Anson Huang 2019-04-19  147  		mutex_ptr->gate_val &= SEMA4_GATE_MASK;
f17252c51016f7 Anson Huang 2019-04-19  148  		/* double check the mutex is locked, otherwise, return -EBUSY */
f17252c51016f7 Anson Huang 2019-04-19  149  		if (mutex_ptr->gate_val != SEMA4_A9_LOCK) {
f17252c51016f7 Anson Huang 2019-04-19  150  			pr_debug("wait-locked num %d val %d.\n",
f17252c51016f7 Anson Huang 2019-04-19  151  					i, mutex_ptr->gate_val);
f17252c51016f7 Anson Huang 2019-04-19  152  			ret = -EBUSY;
f17252c51016f7 Anson Huang 2019-04-19  153  		}
f17252c51016f7 Anson Huang 2019-04-19  154  	}
f17252c51016f7 Anson Huang 2019-04-19  155  out:
f17252c51016f7 Anson Huang 2019-04-19  156  	return ret;
f17252c51016f7 Anson Huang 2019-04-19  157  }
f17252c51016f7 Anson Huang 2019-04-19  158  

:::::: The code at line 122 was first introduced by commit
:::::: f17252c51016f757f54211818d9850202c354b90 char: imx_amp: add sema4 driver support

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
