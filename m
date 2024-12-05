Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC8C21D592
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414269; cv=none; b=I2AGx6sx+DjMKFBn0UkLsG1ULQ6CkkkyEyXuop1P7y25pon07L2tNDVbfhziFo+xKXnIkTmoBHI+xX2LLqTSlN4S+iGvvRm5E9g/twZ2Q8wFZrbylazAjWLJ6bi02CyOr1HCALnFxQChwIGncAzmiLYQ0VJdEoE6pISB0lxx7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414269; c=relaxed/simple;
	bh=yuXOfv1JqDWyxTHQ9UuP57ZZR1BO/vGVFUXm33S+Wy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnXyX6MDJonaPQuFU+ZWsu00Kr+q5GIWsq4WSFP+jnLF4u6ln1gi77J55jWLUX3xt7ZNmLf+6kAaEm5OoEU/ziVCgoURYgPOlIH/GVd47hEEwYJt938JCLE+Cvp0n6pSzHQxFoKuYvCu4LIufLZKL9eKRQRZqYYtaaL75KNWW3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7X1milL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7X1milL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733414267; x=1764950267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yuXOfv1JqDWyxTHQ9UuP57ZZR1BO/vGVFUXm33S+Wy0=;
  b=T7X1milLyJ9NRK24V9DTTtR5evXZeTD4daNB2Vu6gPrAODhY5Tfu5XVb
   agVdNBDO7zLtaWUvIeV3IxeHfflQ6IsLPHM6HuMsW1RJ3+qlr6nDFardL
   Gpc3gaOND7mvTzKASXhAOUs3QRQI0PPxRglAE2yl/KU3LUUUIypRBPuI+
   0G26h1jNikh75eDSGP3hNrlvH7ZYeM8yuskls2gDmelGLH+uNz4qLW4+B
   r+YCTXYlNT6vq2la1x4Pm1yz88j7S4yU6zMFFG09oxbG7R4ZUJu3hKU+I
   vdVNu0uvXqpx/E43pcSavPXdRWPy/NHiV+rbcxY1S1RPs9xO/Rv7xDy0h
   w==;
X-CSE-ConnectionGUID: HxZckiAvQ+S97z4Onji7WQ==
X-CSE-MsgGUID: HjCKrblHSB6mp7Omzw6n6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33976408"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33976408"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 07:57:44 -0800
X-CSE-ConnectionGUID: Z+8sVC6OS5ygfZwfTUpJAg==
X-CSE-MsgGUID: 40NrBJ15TiWoxy6+Q1y56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="93959167"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2024 07:57:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJEEW-0000AE-2x;
	Thu, 05 Dec 2024 15:57:40 +0000
Date: Thu, 5 Dec 2024 23:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] mailbox: tmelite-qmp: Introduce QCOM TMEL QMP
 mailbox driver
Message-ID: <202412052339.XMsRYjf4-lkp@intel.com>
References: <20241205080633.2623142-3-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205080633.2623142-3-quic_srichara@quicinc.com>

Hi Sricharan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.12]
[cannot apply to robh/for-next linus/master v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sricharan-R/dt-bindings-mailbox-qcom-Document-qcom-tmelite-qmp/20241205-161122
base:   v6.12
patch link:    https://lore.kernel.org/r/20241205080633.2623142-3-quic_srichara%40quicinc.com
patch subject: [PATCH RFC 2/2] mailbox: tmelite-qmp: Introduce QCOM TMEL QMP mailbox driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241205/202412052339.XMsRYjf4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412052339.XMsRYjf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052339.XMsRYjf4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from drivers/mailbox/qcom-tmelite-qmp.c:10:
   drivers/mailbox/qcom-tmelite-qmp.c: In function 'qmp_send_data':
>> drivers/mailbox/qcom-tmelite-qmp.c:303:36: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     303 |                 dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/mailbox/qcom-tmelite-qmp.c:303:17: note: in expansion of macro 'dev_err'
     303 |                 dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
         |                 ^~~~~~~
   drivers/mailbox/qcom-tmelite-qmp.c:303:63: note: format string is defined here
     303 |                 dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
         |                                                             ~~^
         |                                                               |
         |                                                               long unsigned int
         |                                                             %u
   In file included from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/mailbox/qcom-tmelite-qmp.c:7:
   drivers/mailbox/qcom-tmelite-qmp.c: In function 'tmelcom_process_request':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:462:25: note: in definition of macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:533:9: note: in expansion of macro 'printk'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:533:16: note: in expansion of macro 'KERN_ERR'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/mailbox/qcom-tmelite-qmp.c:704:17: note: in expansion of macro 'pr_err'
     704 |                 pr_err("Invalid pkt.size received size: %lu, expected: %zu\n",
         |                 ^~~~~~


vim +303 drivers/mailbox/qcom-tmelite-qmp.c

   281	
   282	/**
   283	 * qmp_send_data() - Copy the data to the channel's mailbox and notify
   284	 *		     remote subsystem of new data. This function will
   285	 *		     return an error if the previous message sent has
   286	 *		     not been read. Cannot Sleep.
   287	 * @chan:	mailbox channel that data is to be sent over.
   288	 * @data:	Data to be sent to remote processor, should be in the format of
   289	 *		a kvec.
   290	 *
   291	 * Return: 0 on succes or standard Linux error code.
   292	 */
   293	static int qmp_send_data(struct qmp_device *mdev, void *data)
   294	{
   295		struct kvec *pkt = (struct kvec *)data;
   296		void __iomem *addr;
   297		unsigned long flags;
   298	
   299		if (!mdev || !data || !completion_done(&mdev->ch_complete))
   300			return -EINVAL;
   301	
   302		if (pkt->iov_len > QMP_MAX_PKT_SIZE) {
 > 303			dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
   304			return -EINVAL;
   305		}
   306	
   307		spin_lock_irqsave(&mdev->tx_lock, flags);
   308		if (mdev->tx_sent) {
   309			spin_unlock_irqrestore(&mdev->tx_lock, flags);
   310			return -EAGAIN;
   311		}
   312	
   313		dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
   314			mdev->mcore.val, mdev->ucore.val);
   315	
   316		addr = mdev->mcore_desc + QMP_CTRL_DATA_SIZE;
   317		memcpy_toio(addr, pkt->iov_base, pkt->iov_len);
   318	
   319		mdev->mcore.bits.frag_size = pkt->iov_len;
   320		mdev->mcore.bits.rem_frag_count = 0;
   321	
   322		dev_dbg(mdev->dev, "Copied buffer to mbox, sz: %d",
   323			mdev->mcore.bits.frag_size);
   324	
   325		mdev->tx_sent = true;
   326		QMP_MCORE_CH_VAR_TOGGLE(mdev, tx);
   327		send_irq(mdev);
   328		qmp_schedule_tx_timeout(mdev);
   329		spin_unlock_irqrestore(&mdev->tx_lock, flags);
   330	
   331		return 0;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
