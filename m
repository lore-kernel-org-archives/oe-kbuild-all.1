Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CEE51C324
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 18:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545277; cv=none; b=WNoWYazFhsTwd0znk7wP0PFXH2bKawIn/msnBETgcumXMh7gMh50EJd4b7Xm2SqL0VSZrowro0M8JckXCltfIW9QC9vS8/gtK1mZsFCVtvTu5rAnF8qIICWScW35L8iYMaHUifUdCYq4A5xR+8vWMBfP2T1aEnGsOa6+qPQUFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545277; c=relaxed/simple;
	bh=kCLuD6QsCSUGT8nNyblqSxGcZRYk89ea04WyTKZvU50=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h7KFLGoK7MA1klJcYXP+XCyhF/k/Fd6VLfA8WUlHyUBNPwV1DZNOFmD48EfrFItohD9C19Fe/s1Gx2SdkPVq6mkGHGLj0UeLpd4jZoOP3z8jjw+0h2wVJJ6rxV0oYf0zFBufklV7/Mn8FoCzb3n+K0xeFFgXQJgznQWooUQfTu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXrIr6HD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXrIr6HD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788545277; x=1820081277;
  h=date:from:to:cc:subject:message-id;
  bh=kCLuD6QsCSUGT8nNyblqSxGcZRYk89ea04WyTKZvU50=;
  b=hXrIr6HDGOpfd1qujzJvd1m9SP/OvyKnBTMA0Oa+KtwZrrtFIwt6JMfn
   77RYmTRAkvEMgBGPQbsbqhr26Kq5yzgFMi4kpnlH6wJwprlKkHJZMx98y
   cI+o1xJxpOYBMAZdicvnixQ0zkBhVCcoKQAnj24kBbkKg6aOwt3Ar3Rwc
   aSpk/sUfGfdKctbpqVpQpx/Ht7aZ8fGF8dBud2hmPboOdofOCxJEXFH7p
   TK/6tro19oi+VRNj5duAVvRamAyIPWJkjaw8CRQeWQJtQpEFapZVFQ1pK
   s4Ij2w1L4zOjvjFy7n9NSKSlZA+zkiQXscSYFDdTZevwCRHeJZDAEjQ/R
   A==;
X-CSE-ConnectionGUID: Wenk0k8TS7OYa/2m2OQAJg==
X-CSE-MsgGUID: gfcNnJs3T4yt+JWbG7skxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99384717"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="99384717"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:07:54 -0700
X-CSE-ConnectionGUID: fwtvSQaVSjWLd+EMJ9E5CA==
X-CSE-MsgGUID: vJ6IuK05SACFVykk7e4TaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="268803315"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2026 11:07:52 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2YKL-00000000A4E-2VJH;
	Fri, 04 Sep 2026 18:07:49 +0000
Date: Sat, 05 Sep 2026 02:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/qcom_geni_serial.c:921:13: warning:
 'qcom_geni_serial_poll_rx_fifo_locked' defined but not used
Message-ID: <202609050203.u7Y5yPkc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   986c24e0fe44f844b44d365b71ce831947f50298
commit: 8200871327d1bd4c08daf248a8693a3093982fa4 serial: qcom-geni: Keep FIFO RX active during console TX
date:   5 weeks ago
config: sh-randconfig-r133-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050203.u7Y5yPkc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050203.u7Y5yPkc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8200871327d1 ("serial: qcom-geni: Keep FIFO RX active during console TX")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050203.u7Y5yPkc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/qcom_geni_serial.c:921:13: warning: 'qcom_geni_serial_poll_rx_fifo_locked' defined but not used [-Wunused-function]
     921 | static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/qcom_geni_serial_poll_rx_fifo_locked +921 drivers/tty/serial/qcom_geni_serial.c

   919	
   920	/* Caller holds the UART port lock. */
 > 921	static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport)
   922	{
   923		struct qcom_geni_serial_port *port = to_dev_port(uport);
   924		struct tty_port *tport = &uport->state->port;
   925		u32 s_irq_status;
   926		bool drop_rx = false;
   927	
   928		s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
   929		writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
   930	
   931		if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
   932			uport->icount.overrun++;
   933			tty_insert_flip_char(tport, 0, TTY_OVERRUN);
   934		}
   935	
   936		if (s_irq_status & (S_GP_IRQ_0_EN | S_GP_IRQ_1_EN)) {
   937			if (s_irq_status & S_GP_IRQ_0_EN)
   938				uport->icount.parity++;
   939			drop_rx = true;
   940		} else if (s_irq_status & (S_GP_IRQ_2_EN | S_GP_IRQ_3_EN)) {
   941			uport->icount.brk++;
   942			port->brk = true;
   943		}
   944	
   945		qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
   946	}
   947	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
