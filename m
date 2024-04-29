Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69E3DF5C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 06:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714370491; cv=none; b=SCEQ7T2KSzLp7bMExW9wnF26C8dTuOQOKot1Eb4LjEorxH+TZI1yiaI9Q2Osn5gdAicJ2SyDKEL3XrqV7Js6Mak+qige+J06Cv+ISa3VlZ5sLGKzCYRUn9uSjrpyBZqakzO+ilRFEuenH+w4wcOWdHajz9h1uOM+dR6l+1bAVHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714370491; c=relaxed/simple;
	bh=FkzgdxYHrYdpBAdRzFyyAOCm0p/0OTNOMCvKhuGWrQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXB+sJSkywQvHZfxuaXZWwERHUua64Nz6ID6h+Rjcv11hmKPDkqSQrT8acPMBT6G4mMz0PQodQDSrMcESs5e9wpUEf5yGX2XuH6dIRZpC777lQKpwbizNfwRLqNqbLrhziov7Jp5wJJ1yt6pE/cetJGDNcFSGiXfsuAuxQeqyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/a5flGZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/a5flGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714370488; x=1745906488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FkzgdxYHrYdpBAdRzFyyAOCm0p/0OTNOMCvKhuGWrQE=;
  b=f/a5flGZTKzcr/Fzr1CohbepIOhF/kUmR9naJE/g30Gwzs1s2iXER03d
   +Hs1zljZt7Ox2iMq1xHWiX3vcud9dOmNqPfW8AoY/jBaAn6uxRDT/U9jY
   Aez9rTh55QkKZNY8EEgvBWpqXUk4V5nsfwD6GDTPIjZaMNHegMhe62LgE
   XYV1maGHzjxgvNo1l5mL4Be5sO3psMmVzMrqsd1/36dCB7IqSZdd8qmMj
   c5lZui/fwuS5wA39+XASQtMKBib2KTYsKMFCo9D5kHri0PU7mlIwP44h8
   bFDjOW5/2cMQqo01NZs35lju1CXPrxz4mXAJd19j6WIiOOZCglNY71jTp
   g==;
X-CSE-ConnectionGUID: lvNM2jfhRb2EjXWDwhZJlg==
X-CSE-MsgGUID: QoA87AivTR6Wc5esuDh8BA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13793914"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="13793914"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:01:28 -0700
X-CSE-ConnectionGUID: 284ySl9JSKyxb0okM+GPLA==
X-CSE-MsgGUID: 6ZsLLFHNTgy9bBxMrDaVsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26638879"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Apr 2024 23:01:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1K4q-0006zC-2A;
	Mon, 29 Apr 2024 06:01:24 +0000
Date: Mon, 29 Apr 2024 14:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: oe-kbuild-all@lists.linux.dev, linux1394-devel@lists.sourceforge.net
Subject: [ieee1394-linux1394:topic/tracepoints-async-request-response 16/19]
 drivers/firewire/core-transaction.c:177:47: warning: cast from pointer to
 integer of different size
Message-ID: <202404291342.gvZ9s00l-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404291342.gvZ9s00l-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291342.gvZ9s00l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291342.gvZ9s00l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firewire/core-transaction.c: In function 'transmit_complete_callback':
>> drivers/firewire/core-transaction.c:177:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     177 |         trace_async_request_outbound_complete((u64)t, status, packet->speed, packet->generation,
         |                                               ^
   drivers/firewire/core-transaction.c: In function '__fw_send_request':
   drivers/firewire/core-transaction.c:401:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     401 |         trace_async_request_outbound_initiate((u64)t, speed, generation, t->packet.header, payload,
         |                                               ^


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
