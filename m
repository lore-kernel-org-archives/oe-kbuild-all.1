Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB80F2459D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345023; cv=none; b=FrQpqo+YOh+dqwePUt/bjhmPlIwnOj/0RdKujaRb7zMEdzDC59/gYweb7yvxP5bNhJGjZctpTyCY9G6CLHQXnI/8aBzJZp9+ADZLZoBPbK7Er3LbhIkQaw3dVrwWBdtirPvq/ldZVA2r+VQeHbUs2KnGz2288O8W/sjVJJ5dkNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345023; c=relaxed/simple;
	bh=WBBSqYBuOKIet23LS9P6GGfCyE8bj7WvxRx8gPUojBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDjFcqJyUpxkmF93a4GwJugpIDPTe1TaUQf1grtF0Fgh5m8kP6lb3iXRNVFcVYmVVraJDvPcfj3AACK1U6NPXmOXqAxcLGYL4NytVvb3b+YwiV7Kk57QiAuhO4h3cEUcu5THVXy7OVBdmzfWpJV5d0bX1XMH9grAu414FgQTrhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5NfJdKI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5NfJdKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764345022; x=1795881022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBBSqYBuOKIet23LS9P6GGfCyE8bj7WvxRx8gPUojBg=;
  b=m5NfJdKIhtIPTc36dAlRaK5oIe38l6iHffniA2uCcRocL/RGlVxBqqnq
   VEiz1iIzDEAxKAfm+DCeKT5vMH1XzLLmMhi00W4qVr+tXAFnKCNMCNe1k
   OVq83rEnc5v8Iem0nMSrN+nmbKbb3mF9wPM/nsS0hXyNlB3AC+TdVusFc
   cEDC6gmjUJpoIv+297vgYvLWkpW+Aaz8w521MkvceRjpKoPjq0GpVcm9o
   9U/WE3xHhMxQKfhl42sdEVnlvtk5IBvJm0AW1ApUkodu/mvt6LuU33tA6
   +MX5wHmA9EzH9wi3wQ2bvFEU68++FZrMBpZ7AsHMFWtqoV+weORX/i5YN
   w==;
X-CSE-ConnectionGUID: ekfZ0OXaTyW9fnpxmG0elw==
X-CSE-MsgGUID: Ret8eWzeSEqnG74n9jSE4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="68970074"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="68970074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 07:50:21 -0800
X-CSE-ConnectionGUID: CKT73+gfRzW6y6dFtrBr0A==
X-CSE-MsgGUID: CxFNFJ43QD6iFk4c0BW+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="197674742"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Nov 2025 07:50:20 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP0jh-000000006Vl-322d;
	Fri, 28 Nov 2025 15:50:17 +0000
Date: Fri, 28 Nov 2025 23:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: oe-kbuild-all@lists.linux.dev, Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [linux-next:master 11759/12740] net/can/raw.c:933: undefined
 reference to `safe_candev_priv'
Message-ID: <202511282325.uVQFRTkA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
commit: 1a620a723853a0f49703c317d52dc6b9602cbaa8 [11759/12740] can: raw: instantly reject unsupported CAN frames
config: nios2-randconfig-002-20251128 (https://download.01.org/0day-ci/archive/20251128/202511282325.uVQFRTkA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511282325.uVQFRTkA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511282325.uVQFRTkA-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: net/can/raw.o: in function `raw_check_txframe':
>> net/can/raw.c:933: undefined reference to `safe_candev_priv'
>> net/can/raw.c:933:(.text+0x284): relocation truncated to fit: R_NIOS2_CALL26 against `safe_candev_priv'


vim +933 net/can/raw.c

   929	
   930	static unsigned int raw_check_txframe(struct raw_sock *ro, struct sk_buff *skb,
   931					      struct net_device *dev)
   932	{
 > 933		struct can_priv *priv = safe_candev_priv(dev);
   934	
   935		/* Classical CAN */
   936		if (can_is_can_skb(skb) && raw_dev_cc_enabled(dev, priv))
   937			return CAN_MTU;
   938	
   939		/* CAN FD */
   940		if (ro->fd_frames && can_is_canfd_skb(skb) &&
   941		    raw_dev_fd_enabled(dev, priv))
   942			return CANFD_MTU;
   943	
   944		/* CAN XL */
   945		if (ro->xl_frames && can_is_canxl_skb(skb) &&
   946		    raw_dev_xl_enabled(dev, priv))
   947			return CANXL_MTU;
   948	
   949		return 0;
   950	}
   951	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
