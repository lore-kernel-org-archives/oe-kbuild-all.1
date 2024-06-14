Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DE719AD95
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718384177; cv=none; b=JJj8goax/tNxxhF+ORod/y3RjhtRYOujWbAslJhkB/YpCCCGZiUWGpZqEw7asfD7+FRkf/eiUSaSi32XLxtMuGnc6lHx6AR0GPE0g3cEaXpDeDVVyEZe5E5lYFkaIVcl7oYF5L9HKOnufHdIBfag9wIPhNs9Oe0bpKXcUquPNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718384177; c=relaxed/simple;
	bh=4gxQJvtqrH/DDekyfR6KTtnrnWCAGodtYBUOPa1ceDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPgSud8UeP2mNCaPEjaNJ0F2qNmraNDrxBlX1RMSK/gsm39ZNzY6T1rZUWYu60e1R2cH1QuNNKi3SfUswkitrS3/yeMzVaQRL8MQqfLvK77Ha+1pJ6rb0lpB2MG7yWCKChL8S8HFHKa2VZWEDtXdfxMF2pAN/dFB4PtzTFxWy9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMMIS6HI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMMIS6HI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718384175; x=1749920175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4gxQJvtqrH/DDekyfR6KTtnrnWCAGodtYBUOPa1ceDI=;
  b=VMMIS6HIffH4zgbIPRLepVINzvdkTmvmnpBuWb1KSEuqhjjaKqkCAZ1N
   MtOJlY+glus4UBJ99AZ/0yhwCku5AlnexQ2NqBFm8DE/XNurq660xCR1s
   hfoFyHpOT6+BpYw47J49vap1CfMMn2bGXpV9r5M0RxObvh2zz+o9KtfdJ
   RaWrDyG1mpVloEjzP8QrC3enWmq3qy6sUJN2vXibOLO06ungyAvK9Adw4
   oYEYXcfWQWxu/7bcJfN8KWWN26DdRHw8FyQmzKRtkL/zNEp8xho/zil7V
   E3vz6bcrKBKxzLKhtrQEhUPtp4MqMD8IoK84F0NEMNWqbbERamqXltWLU
   A==;
X-CSE-ConnectionGUID: ph/eWqz8TaGPD4jezJZwvg==
X-CSE-MsgGUID: h17jlmrPR1ikGG3ENXDwmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26681679"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="26681679"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 09:56:14 -0700
X-CSE-ConnectionGUID: KjuO4WNFRWOIUcasvxLnrg==
X-CSE-MsgGUID: /9zugvV+SRiBk1eUsAZVAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="41062118"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jun 2024 09:56:11 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIADh-0001YH-0k;
	Fri, 14 Jun 2024 16:56:09 +0000
Date: Sat, 15 Jun 2024 00:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
Message-ID: <202406150041.QTui5Xgq-lkp@intel.com>
References: <20240614040133.24967-2-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614040133.24967-2-jason-jh.lin@mediatek.com>

Hi Jason-JH.Lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on fujitsu-integration/mailbox-for-next v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/mailbox-Add-power_get-power_put-API-to-mbox_chan_ops/20240614-120412
base:   linus/master
patch link:    https://lore.kernel.org/r/20240614040133.24967-2-jason-jh.lin%40mediatek.com
patch subject: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
config: arc-randconfig-002-20240614 (https://download.01.org/0day-ci/archive/20240615/202406150041.QTui5Xgq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150041.QTui5Xgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150041.QTui5Xgq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mailbox/mailbox.c: In function '__mbox_bind_client':
>> drivers/mailbox/mailbox.c:382:32: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     382 |                         return ERR_PTR(ret);
         |                                ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [y]:
   - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])


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
