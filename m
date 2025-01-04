Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43F91D5CDB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736019979; cv=none; b=Wkx61bjjW6HozyMsMSs9MDI4+TnHd5IqqSMeIC5GGy1SWvgpAsPZLvRDAge0cdPNBM4jkV0VM1VT/dCBufekNV30prnAjOhtDFvFUYaV2Sx87tG00Yw52NUXSHNUygIR+BB+w6l0EeOUWRKfa+aGxxaOsJ9wIZy9XxXtgnCUIyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736019979; c=relaxed/simple;
	bh=CFn+qtqTtDa9M2BBEhlAlN7L4hJoF5D8N9J4KhpwGP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZLq1Ns76r8rH4T6XAZToiJpTxijolckvk/mg3yx5EGOpoW4/aUbAzEp51Vy6DmqPW4NfRo6j+PNjW1JNDnxlOd0bie5PsHq0CCzNqIpFMB441ARnGsYiXpCdg+WNR0B04HmAZI0qx3bnnoY5rzWaW+hnmbHDK7cz4GR4+WaAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrA+k05U; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrA+k05U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736019978; x=1767555978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CFn+qtqTtDa9M2BBEhlAlN7L4hJoF5D8N9J4KhpwGP4=;
  b=HrA+k05UevdszgBU9xrsXwbnr/9fbNEDLgNiiU7VzLAGhtNFOi0xUd3r
   W5bR30X8w/ThtcThcY82wXGoeVskO5VO9S3ph5edNQM+an43QbVCgTT+f
   V7u26uMzO1ShSqlqibZmSTkrIK73IuO4MeQjpgb9piqUPICdION91q/Sz
   2MJh23DvVoOm/DMu7RwEilShrouKXSZ5AMIa5DE5vUYiUYprdTLWs2rUw
   rJH8feb/pz1yH2L0EadQCWib63zmVsvt7PAI3FfgXpO5Tv876SYnLC+rJ
   kfR23Hw2mY1sZWFARVwluDzsH/eLogR2iuNeUewnOI8BAFndQMKUht995
   g==;
X-CSE-ConnectionGUID: SiKhbyN2Qhy6FK/nTqZ7QA==
X-CSE-MsgGUID: /eAy/ewfRRufseC98x42gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="40155285"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="40155285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 11:46:17 -0800
X-CSE-ConnectionGUID: Y/R+HN2RQECflgoF5akeCw==
X-CSE-MsgGUID: n0X1Hl/6Sq2dixbYjx2vgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102560684"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jan 2025 11:46:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUA69-000BAp-2L;
	Sat, 04 Jan 2025 19:46:13 +0000
Date: Sun, 5 Jan 2025 03:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 114/114] drivers/mailbox/mailbox.c:382:39:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <202501050339.NXvEzBhJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   8795c987b64fdefb79f11cc3d5746d4c6e098d08
commit: 71e4fcb288df366078213ba4fcf976f12a14d5e2 [114/114] FROMLIST: mailbox: Add power_get/power_put API to mbox_chan_ops
config: x86_64-randconfig-r133-20250105 (https://download.01.org/0day-ci/archive/20250105/202501050339.NXvEzBhJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050339.NXvEzBhJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050339.NXvEzBhJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/mailbox.c:382:39: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got void * @@
   drivers/mailbox/mailbox.c:382:39: sparse:     expected int
   drivers/mailbox/mailbox.c:382:39: sparse:     got void *
   drivers/mailbox/mailbox.c: note: in included file (through include/linux/preempt.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

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
