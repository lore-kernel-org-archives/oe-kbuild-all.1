Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986AB33DF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 04:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735877406; cv=none; b=CTcwUrYBpWGs6wmnHRKJy2bNe/UAOlEO1FCMm9xmQo27ewe9SQKDT6IVFBLGfhMUEce2GjLE8LmlxvnThq+s0Mzz5h4VWJIvejouDno6sfbCxqRiZSuIhF1sFJoIyWzGzlZRqp06PVniqdNR22azNPno/BD8N0HRaIC1W/42bIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735877406; c=relaxed/simple;
	bh=6dvm6YPH3VcC4CvZrXP4QO1lpKrLUltRih0JsFwemns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEc8VuntW5DX7VFZvQ2c28Ayd4GHKwTz++7wgj0khH26HHBTz3TGrU7dCl74oBgpwHUSMgrnk84fcyy0PNqoMNkD+yl1u0VVgvI7Gqke35fr4KtgIO2VHVrPxr0w4wUS1w5B67miDLuNH4gICqSgpz9fBP4Jkkofi5HsJkNiVmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJmJ/9cl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJmJ/9cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735877405; x=1767413405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dvm6YPH3VcC4CvZrXP4QO1lpKrLUltRih0JsFwemns=;
  b=LJmJ/9cl7p9Q6qdQwbelMAo5GrwnGkdXSLiNAtXizcjQFq8/xAnSR8j7
   urum1ob9NZde7UPAkt/lmlE/R9/skFP+m40wiBQbF5BxOft483VNEgqsH
   GdUkX9PoQnxPpWW6LvRLNjD/Ku3WptruSXh8hxd5O0gFxIR2eNpwuFTTN
   mBGfjWIxMsy49DOpm23AiJ71JJhdyNjgA/XKXEktQFQBfIIEyuaAkE3Wf
   WJZf6CQFH9sNMcH3dPI/w4wrL30smgTelBFodlNQabIEe2joVBI3Y+niR
   R2gIavcf50PBELhO1BJWsb/1zOuDLotP0kSX8GpPvyCI4lDRwVTA9uEqe
   A==;
X-CSE-ConnectionGUID: 0bdyNhDqQ3uEG8R4adMolw==
X-CSE-MsgGUID: wYl79KafTCST/P73DhqyJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="40048548"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="40048548"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 20:10:04 -0800
X-CSE-ConnectionGUID: 927RmN8yQc2C833Y4fy/xg==
X-CSE-MsgGUID: m+ZTU+S6TmCtGnE0l0dg0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="106544925"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jan 2025 20:10:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTZ0b-0009BV-0Y;
	Fri, 03 Jan 2025 04:10:01 +0000
Date: Fri, 3 Jan 2025 12:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 99/99] drivers/mailbox/mailbox.c:382:32:
 warning: returning 'void *' from a function with return type 'int' makes
 integer from pointer without a cast
Message-ID: <202501031100.VtKKrYUf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   79ef5afd889ffc81ed98258b561e132e0d9d81a3
commit: 71e4fcb288df366078213ba4fcf976f12a14d5e2 [99/99] FROMLIST: mailbox: Add power_get/power_put API to mbox_chan_ops
config: x86_64-buildonly-randconfig-003-20241230 (https://download.01.org/0day-ci/archive/20250103/202501031100.VtKKrYUf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031100.VtKKrYUf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031100.VtKKrYUf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mailbox/mailbox.c: In function '__mbox_bind_client':
>> drivers/mailbox/mailbox.c:382:32: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     382 |                         return ERR_PTR(ret);
         |                                ^~~~~~~~~~~~


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
