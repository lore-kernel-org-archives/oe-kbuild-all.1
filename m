Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DA7381
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 00:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706487115; cv=none; b=Ncf4RhuUVDFQowwCLrUrlT++EPLNV9W4JhLvbRYRjYx9n4cJaVSP8J93EqZ0EfYW13TWSxfxEnV8JW/vSWC6zfqsP23q15+f8gztWRs18Is0PuJIxNiaKuZwuudmtdJW2hIfUHGVi+qHfNb1gObVNBLCXOAZWblrKqHpPdn7fDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706487115; c=relaxed/simple;
	bh=CAjKygnQiaU4SnyNg7ObuDxAVyxPTnOkTczjGvCYceU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FHtwBaZUGEip2q/o7EqaO4hgmEZOlU+lloXmSsPmQNeR5AkICgS8zv/3RSQIf7YUWHVhqRzyRRecOsGXtFYpSwqdq9OrFPK6+3lRktni0AF1NXEzVj9iCjwBiZFdHuLVUR0ilvIVjbDki9ob1LbYZixqYLA/boueQvQxZCK90T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceQS3RIv; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceQS3RIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706487113; x=1738023113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CAjKygnQiaU4SnyNg7ObuDxAVyxPTnOkTczjGvCYceU=;
  b=ceQS3RIvl7zcFN6TgAwEoTG9D4GBupRsZdSt/BCoRGcXx9M33v9VLkGz
   J/zHCbX4JfUAfHTTvaZkc5dxa93FrfOj+WmhDuTACY3hT/S1q5j7O2Jrw
   c/RYQj3ZC2J5QumEcMM1Hrwx5w0BmTgDDLZU8OxJ6aKdWYIvReugN2zI/
   6XCiRbHUsbbXchpZyBT1yIBITxNd5UhfkaQVSsPcI9KUdCM6jHuhFb6wy
   ZM4YKpTQEHNxcKjElepCQIq0h/yu3sblf7OdsjqfhAbIenDlRwppHoiFy
   gwu2ueS2tGxdS+k/GeQ+Bm6y5lBioyP3i/1HF+t67FAMjDJocqYn1su8j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="467084445"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="467084445"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 16:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="910882654"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="910882654"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Jan 2024 16:11:51 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUFFd-0003sI-1S;
	Mon, 29 Jan 2024 00:11:49 +0000
Date: Mon, 29 Jan 2024 08:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chris Lew <quic_clew@quicinc.com>
Subject: [qcom:drivers-for-6.9 5/9] drivers/soc/qcom/qcom_aoss.c:90: warning:
 Function parameter or struct member 'debugfs_root' not described in 'qmp'
Message-ID: <202401290805.IgHBQEEl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-6.9
head:   5155e48128826d0c5999dc9f47aa746df54da448
commit: d51d984c5525aebac0f90356ab1d923541b5cc60 [5/9] soc: qcom: aoss: Add debugfs interface for sending messages
config: i386-buildonly-randconfig-002-20240129 (https://download.01.org/0day-ci/archive/20240129/202401290805.IgHBQEEl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290805.IgHBQEEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290805.IgHBQEEl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/qcom/qcom_aoss.c:90: warning: Function parameter or struct member 'debugfs_root' not described in 'qmp'
>> drivers/soc/qcom/qcom_aoss.c:90: warning: Function parameter or struct member 'debugfs_files' not described in 'qmp'


vim +90 drivers/soc/qcom/qcom_aoss.c

05589b30b21ac0 Thara Gopinath  2019-07-30  58  
2209481409b7ab Bjorn Andersson 2019-06-11  59  /**
2209481409b7ab Bjorn Andersson 2019-06-11  60   * struct qmp - driver state for QMP implementation
2209481409b7ab Bjorn Andersson 2019-06-11  61   * @msgram: iomem referencing the message RAM used for communication
2209481409b7ab Bjorn Andersson 2019-06-11  62   * @dev: reference to QMP device
2209481409b7ab Bjorn Andersson 2019-06-11  63   * @mbox_client: mailbox client used to ring the doorbell on transmit
2209481409b7ab Bjorn Andersson 2019-06-11  64   * @mbox_chan: mailbox channel used to ring the doorbell on transmit
2209481409b7ab Bjorn Andersson 2019-06-11  65   * @offset: offset within @msgram where messages should be written
2209481409b7ab Bjorn Andersson 2019-06-11  66   * @size: maximum size of the messages to be transmitted
2209481409b7ab Bjorn Andersson 2019-06-11  67   * @event: wait_queue for synchronization with the IRQ
2209481409b7ab Bjorn Andersson 2019-06-11  68   * @tx_lock: provides synchronization between multiple callers of qmp_send()
2209481409b7ab Bjorn Andersson 2019-06-11  69   * @qdss_clk: QDSS clock hw struct
96ec310d5d9463 Lee Jones       2020-11-03  70   * @cooling_devs: thermal cooling devices
2209481409b7ab Bjorn Andersson 2019-06-11  71   */
2209481409b7ab Bjorn Andersson 2019-06-11  72  struct qmp {
2209481409b7ab Bjorn Andersson 2019-06-11  73  	void __iomem *msgram;
2209481409b7ab Bjorn Andersson 2019-06-11  74  	struct device *dev;
2209481409b7ab Bjorn Andersson 2019-06-11  75  
2209481409b7ab Bjorn Andersson 2019-06-11  76  	struct mbox_client mbox_client;
2209481409b7ab Bjorn Andersson 2019-06-11  77  	struct mbox_chan *mbox_chan;
2209481409b7ab Bjorn Andersson 2019-06-11  78  
2209481409b7ab Bjorn Andersson 2019-06-11  79  	size_t offset;
2209481409b7ab Bjorn Andersson 2019-06-11  80  	size_t size;
2209481409b7ab Bjorn Andersson 2019-06-11  81  
2209481409b7ab Bjorn Andersson 2019-06-11  82  	wait_queue_head_t event;
2209481409b7ab Bjorn Andersson 2019-06-11  83  
2209481409b7ab Bjorn Andersson 2019-06-11  84  	struct mutex tx_lock;
2209481409b7ab Bjorn Andersson 2019-06-11  85  
2209481409b7ab Bjorn Andersson 2019-06-11  86  	struct clk_hw qdss_clk;
05589b30b21ac0 Thara Gopinath  2019-07-30  87  	struct qmp_cooling_device *cooling_devs;
d51d984c5525ae Bjorn Andersson 2024-01-17  88  	struct dentry *debugfs_root;
d51d984c5525ae Bjorn Andersson 2024-01-17  89  	struct dentry *debugfs_files[QMP_DEBUGFS_FILES];
2209481409b7ab Bjorn Andersson 2019-06-11 @90  };
2209481409b7ab Bjorn Andersson 2019-06-11  91  

:::::: The code at line 90 was first introduced by commit
:::::: 2209481409b7abada0e952f4c797e074f4bf3abb soc: qcom: Add AOSS QMP driver

:::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
