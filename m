Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C228657D4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714398825; cv=none; b=lZ9BGE7BaEX5oJMYVTCaq2sH42+HpCjri1lw2cbZRk96neK49obWihoTI4RuKUcisPC8DX6Ibf7f1oyBEykPf7JxM7y3yFNEhOCBdzNQpCrzv6c2LXDS5vQgInfmu7v3cSyCNi6Hgxms+e3sAeNCJzF2OrJ+fS1l+fo7O4lT/HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714398825; c=relaxed/simple;
	bh=wrP6GX9u0ApWbkIixdSgXCPeqJ7Vgqb7ip6MyRi6jE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iociaz7HHYiyTf3Kr9hk0/A2htB2DgqMLVnG++dUxU0a4hxnojyRrThdmOgZMGHnilOK6+eX6hhavarCfPhGT+CVDepZkKSmOTmzXlROCjTqaloJRZGzUFpTLRMkH2/xVQncW9eOOdXy6u0CYhGuwaCux+5t4B6zixy5G7uxW4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aw9qNzqB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aw9qNzqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714398823; x=1745934823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wrP6GX9u0ApWbkIixdSgXCPeqJ7Vgqb7ip6MyRi6jE8=;
  b=aw9qNzqBXyXvdBwpHGOX0wFjB0qAlV/piQZtGAhvPFZc69RMFD0X0Abw
   3e+ALnVU1BMtGUY7b3EpT8eadYsT8RFEyGIDae/P2/lcrw/uJtOH6sxyh
   13Cv0uvZRBDceo1QI6bHm63hHpk+SKdJhum6okgnQX2B7bBIQk6NyUolu
   buNjHDbLi07H6ftp4WCgbpeJTF/fTLcP/EJfBIXa857axZ/NPxnxM53cg
   bmjLWLuf6poubqEPD/lbzxzCWf6d6cYkH3Mvex8TwpsfzCDnl90GQXgTP
   n8so5jDKVZrySI6utPFEgzZ9l3p30kSOLT4Ac1U2zs8KAz152mEIFS89q
   w==;
X-CSE-ConnectionGUID: SqNWaHFaRX+dv3irvd7YdQ==
X-CSE-MsgGUID: avm4DvruQQScodmYI0bREg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32562592"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="32562592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 06:53:42 -0700
X-CSE-ConnectionGUID: JAH92ZzARwOgRna2TwSNfw==
X-CSE-MsgGUID: 34C8F43vRBCi2kJWSVqOyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="63597398"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2024 06:53:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1RRr-0007Cw-0U;
	Mon, 29 Apr 2024 13:53:39 +0000
Date: Mon, 29 Apr 2024 21:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: oe-kbuild-all@lists.linux.dev, linux1394-devel@lists.sourceforge.net
Subject: [ieee1394-linux1394:topic/tracepoints-async-request-response 16/19]
 drivers/firewire/core-transaction.c:177:52: sparse: sparse: non
 size-preserving pointer to integer cast
Message-ID: <202404292125.6DDhAQxR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git topic/tracepoints-async-request-response
head:   973721534ecdb2a088f602d6f3aac52966e1849b
commit: 5aa49e400d57a9e36f4c0c02961cfe86f71248ee [16/19] firewire: core: add tracepoints events for asynchronous outbound request
config: i386-randconfig-061-20240429 (https://download.01.org/0day-ci/archive/20240429/202404292125.6DDhAQxR-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292125.6DDhAQxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292125.6DDhAQxR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firewire/core-transaction.c:177:52: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firewire/core-transaction.c:401:52: sparse: sparse: non size-preserving pointer to integer cast

vim +177 drivers/firewire/core-transaction.c

   170	
   171	static void transmit_complete_callback(struct fw_packet *packet,
   172					       struct fw_card *card, int status)
   173	{
   174		struct fw_transaction *t =
   175		    container_of(packet, struct fw_transaction, packet);
   176	
 > 177		trace_async_request_outbound_complete((u64)t, status, packet->speed, packet->generation,
   178						      packet->timestamp);
   179	
   180		switch (status) {
   181		case ACK_COMPLETE:
   182			close_transaction(t, card, RCODE_COMPLETE, packet->timestamp);
   183			break;
   184		case ACK_PENDING:
   185		{
   186			t->split_timeout_cycle =
   187				compute_split_timeout_timestamp(card, packet->timestamp) & 0xffff;
   188			start_split_transaction_timeout(t, card);
   189			break;
   190		}
   191		case ACK_BUSY_X:
   192		case ACK_BUSY_A:
   193		case ACK_BUSY_B:
   194			close_transaction(t, card, RCODE_BUSY, packet->timestamp);
   195			break;
   196		case ACK_DATA_ERROR:
   197			close_transaction(t, card, RCODE_DATA_ERROR, packet->timestamp);
   198			break;
   199		case ACK_TYPE_ERROR:
   200			close_transaction(t, card, RCODE_TYPE_ERROR, packet->timestamp);
   201			break;
   202		default:
   203			/*
   204			 * In this case the ack is really a juju specific
   205			 * rcode, so just forward that to the callback.
   206			 */
   207			close_transaction(t, card, status, packet->timestamp);
   208			break;
   209		}
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
