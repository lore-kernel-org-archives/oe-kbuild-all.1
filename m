Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044B05C603
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725708876; cv=none; b=j6K87hd4KjvAj+jUZCgqtvxT/Beu4WE4WKk18hWC4UEWp7l3ydKxvnFZjIy78+lYavx+UslaWq4gwK1F/2ZMQminSfOdGOt/F0xRNBmPTbGS8PVJj6M/XHEeD42fnMdaJn1MYguXN6EFwGhrY0wMzzLwpnT9Kdx827VT4azhytY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725708876; c=relaxed/simple;
	bh=p8z5+cQsI4uIXLljFwqpBkZTFVit607aFGqxeHWxPCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzy6DW5hP2bR48FokzmrxADIo8XyDRFA6oOkRh9d9VmByUNeRjYmD7i0nxv37UrzOqI4AvoWBw4RulZU+U1MKDxIEO3/OkLZfYd1T6HglJ3plbFZ2zZTTtwaPtKesw6CEXcV0OXOVhSn660oV5qp2HAJk/gQwQp/8WjVpWPpu7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOAYpejN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOAYpejN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725708875; x=1757244875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8z5+cQsI4uIXLljFwqpBkZTFVit607aFGqxeHWxPCA=;
  b=WOAYpejNto5rpAqge9+Zy4sMNaghEPKgACk3/qyBCTU9jd8GwmaAXuxz
   jaXAIjy0gjB7U/LaHeYL3Si+kviVJrOyUh/s2MM8rh7ZYelk29OGv7+GH
   kUjyCSVzXzFpHEGPhX/01JLzySLsBtzlIKOQhbqTZDq+x19Xwt+2htPZG
   r+nDBVf5Pt+einA91qKGOroFXSZKOG2TdZXYjljQ3MuHKdrJfdCW2Gmsf
   5kq/lFaoqrB2f9kawy/xnbbp3qJ9Ms5ubK4LVgC0qzSL8RAPbq7TtyTY7
   cLv5DSH6JlT0z1j3+719oQ4036dAz7aL+STAhpABO6nPGhtyPwkWTzmfP
   g==;
X-CSE-ConnectionGUID: CsR7EK1lQXWM6m5tQnmlpQ==
X-CSE-MsgGUID: TsOjdeh8TQ+jBjvfQDUCbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49871782"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="49871782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 04:34:34 -0700
X-CSE-ConnectionGUID: C/eLeD5eTpimmG57LbjQpw==
X-CSE-MsgGUID: TIRFt8O2SW6U0h1q5OPESw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="96989902"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2024 04:34:33 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smti2-000CW3-26;
	Sat, 07 Sep 2024 11:34:30 +0000
Date: Sat, 7 Sep 2024 19:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st 1771/2602]
 drivers/net/ethernet/qualcomm/qca_spi.c:547:49: error: 'struct
 qcafrm_handle' has no member named 'init'
Message-ID: <202409071954.kaoWmllZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st
head:   c18783f114b390babddc2dde4162ae03709497b2
commit: 9e3318db0fff49ffdec37a733fd4b75efbacc1ef [1771/2602] qca_spi: Fix reset behavior
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240907/202409071954.kaoWmllZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071954.kaoWmllZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071954.kaoWmllZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/qualcomm/qca_spi.c: In function 'qcaspi_spi_thread':
>> drivers/net/ethernet/qualcomm/qca_spi.c:547:49: error: 'struct qcafrm_handle' has no member named 'init'
        if (qca->frm_handle.state != qca->frm_handle.init)
                                                    ^
>> drivers/net/ethernet/qualcomm/qca_spi.c:550:5: error: implicit declaration of function 'qcafrm_fsm_init_spi'; did you mean 'qcafrm_fsm_init'? [-Werror=implicit-function-declaration]
        qcafrm_fsm_init_spi(&qca->frm_handle);
        ^~~~~~~~~~~~~~~~~~~
        qcafrm_fsm_init
   cc1: some warnings being treated as errors


vim +547 drivers/net/ethernet/qualcomm/qca_spi.c

   508	
   509	static int
   510	qcaspi_spi_thread(void *data)
   511	{
   512		struct qcaspi *qca = data;
   513		u16 intr_cause = 0;
   514	
   515		netdev_info(qca->net_dev, "SPI thread created\n");
   516		while (!kthread_should_stop()) {
   517			set_current_state(TASK_INTERRUPTIBLE);
   518			if ((qca->intr_req == qca->intr_svc) &&
   519			    !qca->txr.skb[qca->txr.head])
   520				schedule();
   521	
   522			set_current_state(TASK_RUNNING);
   523	
   524			netdev_dbg(qca->net_dev, "have work to do. int: %d, tx_skb: %p\n",
   525				   qca->intr_req - qca->intr_svc,
   526				   qca->txr.skb[qca->txr.head]);
   527	
   528			qcaspi_qca7k_sync(qca, QCASPI_EVENT_UPDATE);
   529	
   530			if (qca->sync != QCASPI_SYNC_READY) {
   531				netdev_dbg(qca->net_dev, "sync: not ready %u, turn off carrier and flush\n",
   532					   (unsigned int)qca->sync);
   533				netif_stop_queue(qca->net_dev);
   534				netif_carrier_off(qca->net_dev);
   535				qcaspi_flush_tx_ring(qca);
   536				msleep(QCASPI_QCA7K_REBOOT_TIME_MS);
   537			}
   538	
   539			if (qca->intr_svc != qca->intr_req) {
   540				qca->intr_svc = qca->intr_req;
   541				start_spi_intr_handling(qca, &intr_cause);
   542	
   543				if (intr_cause & SPI_INT_CPU_ON) {
   544					qcaspi_qca7k_sync(qca, QCASPI_EVENT_CPUON);
   545	
   546					/* Frame decoding in progress */
 > 547					if (qca->frm_handle.state != qca->frm_handle.init)
   548						qca->net_dev->stats.rx_dropped++;
   549	
 > 550					qcafrm_fsm_init_spi(&qca->frm_handle);
   551					qca->stats.device_reset++;
   552	
   553					/* not synced. */
   554					if (qca->sync != QCASPI_SYNC_READY)
   555						continue;
   556	
   557					netif_wake_queue(qca->net_dev);
   558					netif_carrier_on(qca->net_dev);
   559				}
   560	
   561				if (intr_cause & SPI_INT_RDBUF_ERR) {
   562					/* restart sync */
   563					netdev_dbg(qca->net_dev, "===> rdbuf error!\n");
   564					qca->stats.read_buf_err++;
   565					qca->sync = QCASPI_SYNC_UNKNOWN;
   566					continue;
   567				}
   568	
   569				if (intr_cause & SPI_INT_WRBUF_ERR) {
   570					/* restart sync */
   571					netdev_dbg(qca->net_dev, "===> wrbuf error!\n");
   572					qca->stats.write_buf_err++;
   573					qca->sync = QCASPI_SYNC_UNKNOWN;
   574					continue;
   575				}
   576	
   577				/* can only handle other interrupts
   578				 * if sync has occurred
   579				 */
   580				if (qca->sync == QCASPI_SYNC_READY) {
   581					if (intr_cause & SPI_INT_PKT_AVLBL)
   582						qcaspi_receive(qca);
   583				}
   584	
   585				end_spi_intr_handling(qca, intr_cause);
   586			}
   587	
   588			if (qca->sync == QCASPI_SYNC_READY)
   589				qcaspi_transmit(qca);
   590		}
   591		set_current_state(TASK_RUNNING);
   592		netdev_info(qca->net_dev, "SPI thread exit\n");
   593	
   594		return 0;
   595	}
   596	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
