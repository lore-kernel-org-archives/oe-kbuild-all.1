Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3F21F91FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110547; cv=none; b=ESUuFNwzbdcMajhy1WvrBQZ6akCppmFsiVfQZmKvlnasQjCmuqO6j0Mmh7jmxw3FX7uUDaTNOjnmWckorr1v31Jzytyupa1Vw3DRLFehbd/24Z9IC52eNYRIpX29ckZIvTIN14JGPDuh+4Cck8Yss1WxiYZRdVDHPGqUWGTYGBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110547; c=relaxed/simple;
	bh=6Rj2oKwLwMfspNPvdjjiH1IwJHKl98UIMIWNql58ot0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nyk9uZjTrIi5KvZ67PAYyROxlwwJGNAvp1uS81ykDerzowDpYBDet02sR2GmBO6kAP+rnUzNjsvqa4xe9hcZZ50hdZUxayXj7z6TrFf7hvJLvO6YHv1TXKtZLXgMY0qXQY6mCnrUzKurd/hcOPVXKJoP1uW2vvWj5CqHR058fgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7+gTeMM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7+gTeMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737110547; x=1768646547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Rj2oKwLwMfspNPvdjjiH1IwJHKl98UIMIWNql58ot0=;
  b=R7+gTeMMXvz0dtz6r76dPBuVrZYRm4UTwCis8QY+NKgnt1Kxs49zA9Qm
   ScW3EViEX1r4NIDiPxTNulS4grft0idseTuJbh2tbChAXiMfVm+TNoOZs
   U6a2WPnxTCPNCL5QwTe5XIIKfnoLiBTnn5Y6IJ2jf8M4HAZmj7+0eBwnL
   T/7cT7OlDcGy7a4EJkyjV/h3pVR5JpF/BIJbKH9YoI1X1vY6jGlqiBoX1
   xQ9rhFmVSqtV6VuiWO9Bd9DOIWVe5cLCfuZLXXuwOSvvLXzbaqtogCP9T
   j+F3JxuCEhj3PlG1XhF8hpg45C808aKfqjgk59wQMUQHnqAgT9sLaKhfM
   A==;
X-CSE-ConnectionGUID: AN9c22qHQXu525mhxMcn1g==
X-CSE-MsgGUID: 8/E/KVbISeqpcbDlNoO0ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48537196"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="48537196"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 02:42:26 -0800
X-CSE-ConnectionGUID: PNVwyQSZRjKZWLkKe011cg==
X-CSE-MsgGUID: n9AkZWjyRniBeaoLnzVxoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110773532"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2025 02:42:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYjny-000T4z-1d;
	Fri, 17 Jan 2025 10:42:22 +0000
Date: Fri, 17 Jan 2025 18:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v11 15/24] io_uring/zcrx.c:282:27: warning: variable
 'netdev_tracker' set but not used
Message-ID: <202501171805.XpSpACD7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v11
head:   2b46f27a06ed067fab3d9e42146dc814321f8a65
commit: 6b18ecd901747779e068baae0af7a8bd5bd73801 [15/24] io_uring/zcrx: set pp memory provider for an rx queue
config: i386-buildonly-randconfig-003-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171805.XpSpACD7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171805.XpSpACD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171805.XpSpACD7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/zcrx.c: In function 'io_close_queue':
>> io_uring/zcrx.c:282:27: warning: variable 'netdev_tracker' set but not used [-Wunused-but-set-variable]
     282 |         netdevice_tracker netdev_tracker;
         |                           ^~~~~~~~~~~~~~


vim +/netdev_tracker +282 io_uring/zcrx.c

   278	
   279	static void io_close_queue(struct io_zcrx_ifq *ifq)
   280	{
   281		struct net_device *netdev;
 > 282		netdevice_tracker netdev_tracker;
   283		struct pp_memory_provider_params p = {
   284			.mp_ops = &io_uring_pp_zc_ops,
   285			.mp_priv = ifq,
   286		};
   287	
   288		if (ifq->if_rxq == -1)
   289			return;
   290	
   291		spin_lock(&ifq->lock);
   292		netdev = ifq->netdev;
   293		netdev_tracker = ifq->netdev_tracker;
   294		ifq->netdev = NULL;
   295		spin_unlock(&ifq->lock);
   296	
   297		if (netdev)
   298			net_mp_close_rxq(netdev, ifq->if_rxq, &p);
   299		ifq->if_rxq = -1;
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
