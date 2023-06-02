Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6798510F6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 04:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iLxRvZ+7lUNZWojUx0sDac6+8i+ApwSrWoB4Zu7LMnE=;
  b=XPqqeWHT6ewjok2C9KYzUURSb3I6VWOaOZ07IZ6oGl91XvCRX/xPCPUC
   /CydWsimcui6X2ZOTkOU8lXQPbIox6JMpX3rKADs2eRMR9gYTJxHjWJe7
   e4gKRLCsHKsF2uh85ai5H9IYxOXaH8XUfD06aCelmQSuHW8VhR5MXdXYZ
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.00,211,1681164000"; 
   d="scan'208";a="110830311"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 06:55:44 +0200
Date: Fri, 2 Jun 2023 06:55:44 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Max Gurtovoy <mgurtovoy@nvidia.com>
cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org, 
    Keith Busch <kbusch@kernel.org>, Israel Rukshin <israelr@nvidia.com>, 
    Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-6.5 15/21] drivers/nvme/host/fabrics.c:96:2-8:
 preceding lock on line 85 (fwd)
Message-ID: <alpine.DEB.2.22.394.2306020654430.2925@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

An unlock appears to be missing on line 96.

julia

---------- Forwarded message ----------
Date: Fri, 2 Jun 2023 09:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-nvme:nvme-6.5 15/21] drivers/nvme/host/fabrics.c:96:2-8:
    preceding lock on line 85

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-nvme@lists.infradead.org
TO: Max Gurtovoy <mgurtovoy@nvidia.com>
CC: Keith Busch <kbusch@kernel.org>
CC: Israel Rukshin <israelr@nvidia.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/nvme.git nvme-6.5
head:   14ad91f7a9a29562f23bedd205ef209255d8b8d1
commit: f0cebf82004d610be3ef47abf315ddf95aa2dcd1 [15/21] nvme-fabrics: prevent overriding of existing host
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c032-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020909.MTUEBeIa-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306020909.MTUEBeIa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/host/fabrics.c:96:2-8: preceding lock on line 85

vim +96 drivers/nvme/host/fabrics.c

f0cebf82004d61 Max Gurtovoy      2023-05-12   80
f0cebf82004d61 Max Gurtovoy      2023-05-12   81  static struct nvmf_host *nvmf_host_add(const char *hostnqn, uuid_t *id)
07bfcd09a28855 Christoph Hellwig 2016-06-13   82  {
07bfcd09a28855 Christoph Hellwig 2016-06-13   83  	struct nvmf_host *host;
07bfcd09a28855 Christoph Hellwig 2016-06-13   84
07bfcd09a28855 Christoph Hellwig 2016-06-13  @85  	mutex_lock(&nvmf_hosts_mutex);
f0cebf82004d61 Max Gurtovoy      2023-05-12   86  	host = __nvmf_host_find(hostnqn, id);
f0cebf82004d61 Max Gurtovoy      2023-05-12   87  	if (IS_ERR(host)) {
f0cebf82004d61 Max Gurtovoy      2023-05-12   88  		goto out_unlock;
f0cebf82004d61 Max Gurtovoy      2023-05-12   89  	} else if (host) {
98096d8a787f05 Christoph Hellwig 2016-08-18   90  		kref_get(&host->ref);
07bfcd09a28855 Christoph Hellwig 2016-06-13   91  		goto out_unlock;
98096d8a787f05 Christoph Hellwig 2016-08-18   92  	}
07bfcd09a28855 Christoph Hellwig 2016-06-13   93
f0cebf82004d61 Max Gurtovoy      2023-05-12   94  	host = nvmf_host_alloc(hostnqn, id);
07bfcd09a28855 Christoph Hellwig 2016-06-13   95  	if (!host)
f0cebf82004d61 Max Gurtovoy      2023-05-12  @96  		return ERR_PTR(-ENOMEM);
07bfcd09a28855 Christoph Hellwig 2016-06-13   97
07bfcd09a28855 Christoph Hellwig 2016-06-13   98  	list_add_tail(&host->list, &nvmf_hosts);
07bfcd09a28855 Christoph Hellwig 2016-06-13   99  out_unlock:
07bfcd09a28855 Christoph Hellwig 2016-06-13  100  	mutex_unlock(&nvmf_hosts_mutex);
07bfcd09a28855 Christoph Hellwig 2016-06-13  101  	return host;
07bfcd09a28855 Christoph Hellwig 2016-06-13  102  }
07bfcd09a28855 Christoph Hellwig 2016-06-13  103

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
