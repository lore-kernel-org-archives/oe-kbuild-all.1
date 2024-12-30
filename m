Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D33126C18
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 12:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735560710; cv=none; b=EeugWq2K5S7J5E5fwamjojTLz3e0lA+WVhLFAB56AYoOgyXC2MdeQu89UrAX7LX+js4V4QzBgF8sai1dyJeh5iTGw/voGSE6p8LrmjcAHTtmUsHmuEx+c86UV09mVm7rrS4jzX3937FYSr4bFaYP8/EXGVPre4Sxhc2kmvTA4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735560710; c=relaxed/simple;
	bh=pruhUKHEjGr0fdTSQU+a7zcwfRHiHi8MdD6nN09U+/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lG9JQ7gK/zyOLE8Y67OwJfPVEnDSY/U4SwOv4KuZdMEoeRxQ2XKTk7ICoebtzY+dp20wT0G5A/XBJMku5kvoGt3aDmZfreVqXfYAsd75OOi6hXB125MSLDn0eKjA/y3IDKVpZ3A4kIEA0x3asYb1czIzO9Hl2yuqUsjNp3HUhBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Itmh+kMR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Itmh+kMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735560709; x=1767096709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pruhUKHEjGr0fdTSQU+a7zcwfRHiHi8MdD6nN09U+/Q=;
  b=Itmh+kMRehhWmRWrCgpBNFsRBEKs2MMAyYW8pRw+HkfkZpzGdSl1bpoN
   6gxImeb6aYllM2kewDsKuyy4r/2u41TXbaccoDtclI/Au6ufvsRgtqt4o
   h5pZkLLYLT2d0Z31bOEZkRHa/zx1QfosQb3kHb1Xnk43yyxE8agojHpN8
   LzAg+ZJEO/fgvzbsjqSdpCO+GwLKgj79E3Q5LpbPko00nrb+XRLOOiIjA
   r5oqsPY8A6IjmiL5R5AFhBlTV2uGGPWWWyf0Xx12uKjtn8TNNSKkFm3g/
   TAvivQ5nRO2N6eTohHLi6iiNvOFLMwLO2JzkTrBGO8AyNzDbCCavF2U8n
   w==;
X-CSE-ConnectionGUID: +CzJDTP+SL2AW9Y8PG46Jg==
X-CSE-MsgGUID: BYQE4YtBQ1ust0V+j7CxPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39778165"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="39778165"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 04:11:40 -0800
X-CSE-ConnectionGUID: 1kXbuxEoRN+Taw1iuVgLdg==
X-CSE-MsgGUID: nKhSiY8qRDGIufpX7aNCGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="100961820"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Dec 2024 04:11:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSEcP-0005h0-1D;
	Mon, 30 Dec 2024 12:11:33 +0000
Date: Mon, 30 Dec 2024 20:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 99/99] drivers/mailbox/mailbox.c:382:32:
 warning: returning 'void *' from a function with return type 'int' makes
 integer from pointer without a cast
Message-ID: <202412302042.bAcoc56F-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20241230 (https://download.01.org/0day-ci/archive/20241230/202412302042.bAcoc56F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412302042.bAcoc56F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412302042.bAcoc56F-lkp@intel.com/

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
