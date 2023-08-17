Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED21134BD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692283387; x=1723819387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHPVP8SMeoIYDxtCClwlmHN6sKqTabJ1nI6KrcMjGGQ=;
  b=ahMObzBR7tU228oEtBjWf1qiLIL+gTfHYm6akuVcyGPYi3whtQg8XQX7
   uEZjGfdj2PyGpVcwtC/GO/DOdn6jZ9BwKHulHrXbuoIb/gMbfc5pCwM+o
   kr9IO26HC787yX/E/IRGcMyrWIjDbN30Y4UUv/NWV9KxRB2WstyY4+5SP
   8MTlf3J+0Iw5MjIKkJ+Phhph5RXiSyahDJmT9oNo3UuwJM7jfBkm03Pju
   ec8/HewXUBzL5gyT5rTVcltGJOd6OIAcglllqiQQe15wBHYMlr9b44u9l
   Yfdsie5aHnnAcdYZaXMMo68zWmEn3AQJrjLF3QjXIuOVBs4cje7oF3uKa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="352416488"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="352416488"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 07:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908420143"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="908420143"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 07:43:03 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWeDG-0001EB-2t;
	Thu, 17 Aug 2023 14:43:02 +0000
Date: Thu, 17 Aug 2023 22:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: Harald Freudenberger <freude@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 77/9999] drivers/s390/crypto/ap_queue.c:31:
 warning: Function parameter or member 'aq' not described in
 'ap_queue_enable_irq'
Message-ID: <202308172251.MSLGOP0z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Harald,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   da742ebfa00c3add4a358dd79ec92161c07e1435
commit: a758b1d4ca207a5f03a69a210a8b90d86fdd93a1 [77/9999] s390/ap: fix state machine hang after failure to enable irq
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230817/202308172251.MSLGOP0z-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172251.MSLGOP0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172251.MSLGOP0z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/s390/crypto/ap_queue.c:31: warning: Function parameter or member 'aq' not described in 'ap_queue_enable_irq'
>> drivers/s390/crypto/ap_queue.c:31: warning: Excess function parameter 'qid' description in 'ap_queue_enable_irq'
   drivers/s390/crypto/ap_queue.c:299: warning: Function parameter or member 'aq' not described in 'ap_sm_reset'
   drivers/s390/crypto/ap_queue.c:299: warning: Excess function parameter 'qid' description in 'ap_sm_reset'


vim +31 drivers/s390/crypto/ap_queue.c

46fde9a9d204e3 Harald Freudenberger 2016-11-09  20  
e28d2af43614eb Ingo Tuchscherer     2016-08-25  21  /**
a758b1d4ca207a Harald Freudenberger 2021-08-25  22   * ap_queue_enable_irq(): Enable interrupt support on this AP queue.
e28d2af43614eb Ingo Tuchscherer     2016-08-25  23   * @qid: The AP queue number
e28d2af43614eb Ingo Tuchscherer     2016-08-25  24   * @ind: the notification indicator byte
e28d2af43614eb Ingo Tuchscherer     2016-08-25  25   *
e28d2af43614eb Ingo Tuchscherer     2016-08-25  26   * Enables interruption on AP queue via ap_aqic(). Based on the return
e28d2af43614eb Ingo Tuchscherer     2016-08-25  27   * value it waits a while and tests the AP queue if interrupts
e28d2af43614eb Ingo Tuchscherer     2016-08-25  28   * have been switched on using ap_test_queue().
e28d2af43614eb Ingo Tuchscherer     2016-08-25  29   */
a758b1d4ca207a Harald Freudenberger 2021-08-25  30  static int ap_queue_enable_irq(struct ap_queue *aq, void *ind)
e28d2af43614eb Ingo Tuchscherer     2016-08-25 @31  {
e28d2af43614eb Ingo Tuchscherer     2016-08-25  32  	struct ap_queue_status status;
46fde9a9d204e3 Harald Freudenberger 2016-11-09  33  	struct ap_qirq_ctrl qirqctrl = { 0 };
e28d2af43614eb Ingo Tuchscherer     2016-08-25  34  
46fde9a9d204e3 Harald Freudenberger 2016-11-09  35  	qirqctrl.ir = 1;
46fde9a9d204e3 Harald Freudenberger 2016-11-09  36  	qirqctrl.isc = AP_ISC;
46fde9a9d204e3 Harald Freudenberger 2016-11-09  37  	status = ap_aqic(aq->qid, qirqctrl, ind);
e28d2af43614eb Ingo Tuchscherer     2016-08-25  38  	switch (status.response_code) {
e28d2af43614eb Ingo Tuchscherer     2016-08-25  39  	case AP_RESPONSE_NORMAL:
e28d2af43614eb Ingo Tuchscherer     2016-08-25  40  	case AP_RESPONSE_OTHERWISE_CHANGED:
e28d2af43614eb Ingo Tuchscherer     2016-08-25  41  		return 0;
e28d2af43614eb Ingo Tuchscherer     2016-08-25  42  	case AP_RESPONSE_Q_NOT_AVAIL:
e28d2af43614eb Ingo Tuchscherer     2016-08-25  43  	case AP_RESPONSE_DECONFIGURED:
e28d2af43614eb Ingo Tuchscherer     2016-08-25  44  	case AP_RESPONSE_CHECKSTOPPED:
e28d2af43614eb Ingo Tuchscherer     2016-08-25  45  	case AP_RESPONSE_INVALID_ADDRESS:
e28d2af43614eb Ingo Tuchscherer     2016-08-25  46  		pr_err("Registering adapter interrupts for AP device %02x.%04x failed\n",
e28d2af43614eb Ingo Tuchscherer     2016-08-25  47  		       AP_QID_CARD(aq->qid),
e28d2af43614eb Ingo Tuchscherer     2016-08-25  48  		       AP_QID_QUEUE(aq->qid));
e28d2af43614eb Ingo Tuchscherer     2016-08-25  49  		return -EOPNOTSUPP;
e28d2af43614eb Ingo Tuchscherer     2016-08-25  50  	case AP_RESPONSE_RESET_IN_PROGRESS:
e28d2af43614eb Ingo Tuchscherer     2016-08-25  51  	case AP_RESPONSE_BUSY:
e28d2af43614eb Ingo Tuchscherer     2016-08-25  52  	default:
e28d2af43614eb Ingo Tuchscherer     2016-08-25  53  		return -EBUSY;
e28d2af43614eb Ingo Tuchscherer     2016-08-25  54  	}
e28d2af43614eb Ingo Tuchscherer     2016-08-25  55  }
e28d2af43614eb Ingo Tuchscherer     2016-08-25  56  

:::::: The code at line 31 was first introduced by commit
:::::: e28d2af43614eb86f59812e7221735fc221bbc10 s390/zcrypt: add multi domain support

:::::: TO: Ingo Tuchscherer <ingo.tuchscherer@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
