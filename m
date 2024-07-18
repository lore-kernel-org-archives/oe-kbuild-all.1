Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13E6849C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 01:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721267606; cv=none; b=nUQsa02lZ1q93OLJHZ4ZTtwfqvaVE8+VPk560bOn5IiZi6WthugFw8MpYegFlbEqYrFVPLs6bWatBekF9xANcqmZoGo0A5kIp/aXZxX3kQWGvLa9CXu0C9DiIiYnFyuzQZn13RmH2JlMDwiPhq6pl5tPE2sMUI2QMTISB/zrB9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721267606; c=relaxed/simple;
	bh=1EQNMaNHEBKMTPKPRc9L1dzrrngTtgvBQqvpniFBzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2WyWWWonu+S9wN2BJmH9R906xkq0us3NrvdndZy3j4rupV0A8IgcsnakRUqg9uMXQ8RYj8EvXbGYzyDgUxUgarWwqiUtVuXJZIw4bEJ9lIHWUKq0+/GKGODrL/1lGntSbRau3SE5g5qT79vBC8hBpqVmttktJ9wM2+cZzAf4CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZI+1qRy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZI+1qRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721267604; x=1752803604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EQNMaNHEBKMTPKPRc9L1dzrrngTtgvBQqvpniFBzjw=;
  b=KZI+1qRyrL0bxwTnziLLdhDyJdvn8wTJgss1FRw4h8lGfBaOMy/iPXTG
   GuG781hFftokXdMeP/zGsKgsDSWZHL96oLgH9ey8ZjzLsBf2F3OmeCv/I
   +jvs3cHZmqJpMVD8D1Tug+M2zFNJrg0oeO1xN/pjyxcZtNnGZ1pOM4keS
   cydRX9Q26JtGuWhETAXsTvxFnAWDhqeNeMUk/0p/eyQIV6fhMP2xaPafe
   KzT2mE/z8sR/cKIALJV3jkZCcvelzYbEUqaJe5SJwEEe9IgfWLnRwg1+y
   IoX7VHgFXdrN7RP46ifkflSqZt4MyXGfMHjCE0xGqBx1UpEg4vH+9f+re
   A==;
X-CSE-ConnectionGUID: t5SheOuUSXKyOe6dvfcI8g==
X-CSE-MsgGUID: 40OCdBILSr+uTyxba5yUJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18619545"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="18619545"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 18:53:10 -0700
X-CSE-ConnectionGUID: f2Z2WOrmT9GanLuw+EWEuw==
X-CSE-MsgGUID: FaX+yBp7ScuMzXf4s1GYFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="55436177"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2024 18:53:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUGKP-000grK-32;
	Thu, 18 Jul 2024 01:53:05 +0000
Date: Thu, 18 Jul 2024 09:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [linux-next:master 11543/13349]
 drivers/mailbox/qcom-cpucp-mbox.c:54:18: error: implicit declaration of
 function 'readq'; did you mean 'readb'?
Message-ID: <202407180959.HbXuMk9S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   797012914d2d031430268fe512af0ccd7d8e46ef
commit: 0e2a9a03106cd5fa0dbc9047675e7645c55e2669 [11543/13349] mailbox: Add support for QTI CPUCP mailbox controller
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240718/202407180959.HbXuMk9S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180959.HbXuMk9S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180959.HbXuMk9S-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/qcom-cpucp-mbox.c: In function 'qcom_cpucp_mbox_irq_fn':
>> drivers/mailbox/qcom-cpucp-mbox.c:54:18: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Wimplicit-function-declaration]
      54 |         status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
         |                  ^~~~~
         |                  readb
>> drivers/mailbox/qcom-cpucp-mbox.c:65:17: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Wimplicit-function-declaration]
      65 |                 writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
         |                 ^~~~~~
         |                 writeb


vim +54 drivers/mailbox/qcom-cpucp-mbox.c

    47	
    48	static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
    49	{
    50		struct qcom_cpucp_mbox *cpucp = data;
    51		u64 status;
    52		int i;
    53	
  > 54		status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
    55	
    56		for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
    57			u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
    58			struct mbox_chan *chan = &cpucp->chans[i];
    59			unsigned long flags;
    60	
    61			/* Provide mutual exclusion with changes to chan->cl */
    62			spin_lock_irqsave(&chan->lock, flags);
    63			if (chan->cl)
    64				mbox_chan_received_data(chan, &val);
  > 65			writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
    66			spin_unlock_irqrestore(&chan->lock, flags);
    67		}
    68	
    69		return IRQ_HANDLED;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
