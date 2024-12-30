Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4542AD3B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735561359; cv=none; b=Sq5VrdHH+2VCFlj5j2KTlN99xYyb3e5RBsgKaJc1fY5ZII5Ql77kA/MCp8SbcCfcxKoEKjnvoZoZiLvqoUKucFq2VVpe8rgyVcUdSoKOk8IL+C0iXf1KkOhtreIgTlPhS7EUZAY68z3z4SqxXw00dCI9ADH++D5+XVDk/dbfWWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735561359; c=relaxed/simple;
	bh=9+TgL7O7amM2rUGwCoV9+YsSBSCOWMDbXoj/2LjU1m8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHU2WUULE8wm/u0eJ0LXUckoNddADT7S852Ka+jw8ysFLdvpdKTozfY72A/YtZGpf6gh4i2VqRgb7OaAH2EIF13PgC8hfsnFJo95JvO0n7pOvG2x0zsSqjMsjc8Zrvj0ZKcRrtITUYO8f45Vx8XKcJ9kWPPI5P7Arv+HB+07/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7WcEW7K; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7WcEW7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735561358; x=1767097358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9+TgL7O7amM2rUGwCoV9+YsSBSCOWMDbXoj/2LjU1m8=;
  b=l7WcEW7KkHerADXjxw9RfaPbjR3zAgm7He+t6l5slXSpi7EtV42apy3X
   Ptky6F6NW3oyLGN5BbEdfUp85xil25WLxFX3ZZRcJ7WKODMRWAzJE9baa
   c7+cKSefqOTdiagHZd7SD9kwUTofvvAbmE25Wm6C+NUNUL6ghLw5B+U0h
   FF6FFm5ZwINj0BfEC67t6YoyORW2MZewAocx2F5WlUC5KmCikgeHL4OcW
   g3f21+DNTjN1Ki63GxUWilH0n8dRWIEBLDyxPScKqWkJWB5dRBmXSEsMO
   YUarj0Vp796Bz6m/6Wf1y2S/hjK6Z/lA3liYUBNs5a2z3+zYogR3bVYCJ
   Q==;
X-CSE-ConnectionGUID: ZNJBpGNzRGqySrkngrgRJw==
X-CSE-MsgGUID: DMPeDtQsQl2rCzz5pkr9Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46341252"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="46341252"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 04:22:38 -0800
X-CSE-ConnectionGUID: yMcG+8eiR3aQtNlfosaNlw==
X-CSE-MsgGUID: hkrYJQdlQsGsny/d2y/IEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105852482"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Dec 2024 04:22:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSEn4-0005hU-1R;
	Mon, 30 Dec 2024 12:22:34 +0000
Date: Mon, 30 Dec 2024 20:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 99/99] drivers/mailbox/mailbox.c:382:11:
 error: incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'int'
Message-ID: <202412302041.mQTjVszk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f5002a03972c582b24af87ac1e3c5ffecb07573f
commit: 71e4fcb288df366078213ba4fcf976f12a14d5e2 [99/99] FROMLIST: mailbox: Add power_get/power_put API to mbox_chan_ops
config: x86_64-buildonly-randconfig-002-20241230 (https://download.01.org/0day-ci/archive/20241230/202412302041.mQTjVszk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412302041.mQTjVszk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412302041.mQTjVszk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/mailbox.c:382:11: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
     382 |                         return ERR_PTR(ret);
         |                                ^~~~~~~~~~~~
   1 error generated.


vim +382 drivers/mailbox/mailbox.c

   355	
   356	static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
   357	{
   358		struct device *dev = cl->dev;
   359		unsigned long flags;
   360		int ret;
   361	
   362		if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
   363			dev_dbg(dev, "%s: mailbox not free\n", __func__);
   364			return -EBUSY;
   365		}
   366	
   367		spin_lock_irqsave(&chan->lock, flags);
   368		chan->msg_free = 0;
   369		chan->msg_count = 0;
   370		chan->active_req = NULL;
   371		chan->cl = cl;
   372		init_completion(&chan->tx_complete);
   373	
   374		if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
   375			chan->txdone_method = TXDONE_BY_ACK;
   376	
   377		spin_unlock_irqrestore(&chan->lock, flags);
   378	
   379		if (chan->mbox->ops->power_get) {
   380			ret = chan->mbox->ops->power_get(chan);
   381			if (ret < 0)
 > 382				return ERR_PTR(ret);
   383		}
   384	
   385		if (chan->mbox->ops->startup) {
   386			ret = chan->mbox->ops->startup(chan);
   387	
   388			if (ret) {
   389				dev_err(dev, "Unable to startup the chan (%d)\n", ret);
   390				mbox_free_channel(chan);
   391				return ret;
   392			}
   393		}
   394	
   395		return 0;
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
