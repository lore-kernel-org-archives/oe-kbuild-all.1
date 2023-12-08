Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63219459
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oaop2v+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702039835; x=1733575835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rXer6BoytSzn1SuWBN+xmOkdlfRiydYnmJIq6NqsPzU=;
  b=Oaop2v+lYGDyED2AL0r8QXRgWsxmbw0aaisO70RfErBzsAFNPtJ0yFUJ
   iMQVXwGfihezWW+CWBhsgTzopraizja5w3QZncsCzEuIAXaP8XohzSV8M
   IxJHvU156hrkJnHFolkAWw/Nc6m0aq1GwWqqZdx7+uEg9zWwQV46Zy8k2
   PsJOVx5AqzjXy44mn3ki8t3XSPx55J1XF/HUm1lqXcBGbuVB7OuEan0hj
   pimYwbGGhssFLLwYygWq6jZTa45yy2pOfP1q6icYjKxuKi3H6Q1nWffFh
   /X5paux1HK92Yk8F29PPNhisRAwzxUaubGcYoSg6+QP0xSDjNqXKTtRcO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15952847"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="15952847"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 04:50:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775780485"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="775780485"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 08 Dec 2023 04:50:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBaJK-000Djg-1Y;
	Fri, 08 Dec 2023 12:50:30 +0000
Date: Fri, 8 Dec 2023 20:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: drivers/soc/qcom/qcom_aoss.c:230:9: warning: function 'qmp_send'
 might be a candidate for 'gnu_printf' format attribute
Message-ID: <202312082016.BRzEllrB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5e3f5b81de80c98338bcb47c233aebefee5a4801
commit: 8873d1e2f88afbe89c99d8f49f88934a2da2991f soc: qcom: aoss: Format string in qmp_send()
date:   4 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231208/202312082016.BRzEllrB-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312082016.BRzEllrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312082016.BRzEllrB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/qcom_aoss.c: In function 'qmp_send':
>> drivers/soc/qcom/qcom_aoss.c:230:9: warning: function 'qmp_send' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     230 |         len = vsnprintf(buf, sizeof(buf), fmt, args);
         |         ^~~


vim +230 drivers/soc/qcom/qcom_aoss.c

   204	
   205	/**
   206	 * qmp_send() - send a message to the AOSS
   207	 * @qmp: qmp context
   208	 * @fmt: format string for message to be sent
   209	 * @...: arguments for the format string
   210	 *
   211	 * Transmit message to AOSS and wait for the AOSS to acknowledge the message.
   212	 * data must not be longer than the mailbox size. Access is synchronized by
   213	 * this implementation.
   214	 *
   215	 * Return: 0 on success, negative errno on failure
   216	 */
   217	int qmp_send(struct qmp *qmp, const char *fmt, ...)
   218	{
   219		char buf[QMP_MSG_LEN];
   220		long time_left;
   221		va_list args;
   222		int len;
   223		int ret;
   224	
   225		if (WARN_ON(IS_ERR_OR_NULL(qmp) || !fmt))
   226			return -EINVAL;
   227	
   228		memset(buf, 0, sizeof(buf));
   229		va_start(args, fmt);
 > 230		len = vsnprintf(buf, sizeof(buf), fmt, args);
   231		va_end(args);
   232	
   233		if (WARN_ON(len >= sizeof(buf)))
   234			return -EINVAL;
   235	
   236		mutex_lock(&qmp->tx_lock);
   237	
   238		/* The message RAM only implements 32-bit accesses */
   239		__iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
   240				 buf, sizeof(buf) / sizeof(u32));
   241		writel(sizeof(buf), qmp->msgram + qmp->offset);
   242	
   243		/* Read back length to confirm data written in message RAM */
   244		readl(qmp->msgram + qmp->offset);
   245		qmp_kick(qmp);
   246	
   247		time_left = wait_event_interruptible_timeout(qmp->event,
   248							     qmp_message_empty(qmp), HZ);
   249		if (!time_left) {
   250			dev_err(qmp->dev, "ucore did not ack channel\n");
   251			ret = -ETIMEDOUT;
   252	
   253			/* Clear message from buffer */
   254			writel(0, qmp->msgram + qmp->offset);
   255		} else {
   256			ret = 0;
   257		}
   258	
   259		mutex_unlock(&qmp->tx_lock);
   260	
   261		return ret;
   262	}
   263	EXPORT_SYMBOL(qmp_send);
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
