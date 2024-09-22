Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BF9273FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727046859; cv=none; b=I9bF4ruZXvfkcF6yfrs1AcN7dPK+dlcYvQKqC4pESMs1B2gXqIgY33CqgU9OSwNEELIA5zJlqxBja8uVxpkYYISN+f/E/nZI8aHc5/lZJGHFpPm1lCYG4fDLBjke8vSi4nFo+Nm4r4fQEPV6F7pq7MTSa2HUYNRUaNYdCcZoymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727046859; c=relaxed/simple;
	bh=IdpF0M66TSPTxZWUPx+AX/98VKbTiKIysVFsicW14ME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTNQ/DKGerFhh1t3V+A/FlFWhVS/33rbbWrC3zJQzcpfcwJAEu/Xa8Uw8MD1m3lcWDnP+HytH2TpJqPYaD572Six3/BHkKF3ZD9Imtrvxq78Vool6jEDUg68GSzOZmJBRrgHkSOBjUqep4eysWqxCKFVLDHzw5YqfFL0Pg9E/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCZeJ77/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCZeJ77/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727046857; x=1758582857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IdpF0M66TSPTxZWUPx+AX/98VKbTiKIysVFsicW14ME=;
  b=CCZeJ77/T0Z14/XYY+WPGgm5tLYJO71Oz0YMu1thI9YYztIo3xP5Y36B
   Bb5pNwn1U67t2PVFawYH3KuDMsX27zE7ggY1wrcMb1pdAEtX1FRBWBJ/x
   s98QsbVVhH6Zeq4NfNozhkmk4UtHSwplHMLQQincRBfTouMHWaPNYliWj
   4c4HlVVgeBMYL7lCXDftk9DYP812E1xK+nQ1sqlh1htc7VAJeXmIOSifE
   bhNZ0MKByThgOXBzEtcpzYBhwGk/N3M1bwtHNhOwfzXy2Wct7WUFdsOX9
   BuBft8r4aj8GTmcjvRVPp7NkSCvdTjXlKt1TOcoVW+l1czncqNNbgGpAk
   w==;
X-CSE-ConnectionGUID: RzCnC2HvSPiz9jAtUm40Jw==
X-CSE-MsgGUID: sM68hKSwRwOyl6RN/AM0EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37352891"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="37352891"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 16:14:16 -0700
X-CSE-ConnectionGUID: 8G0KDz1qR9mNWnLLee0cIw==
X-CSE-MsgGUID: tgsVyuC6QjKAZn22kWWztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75839666"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Sep 2024 16:14:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssVmO-000GjG-0L;
	Sun, 22 Sep 2024 23:14:12 +0000
Date: Mon, 23 Sep 2024 07:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 10/13] fs/netfs/misc.c:66:47: sparse:
 sparse: cast truncates bits from constant value (5555555555555555 becomes
 55555555)
Message-ID: <202409230730.Er4Vhikj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   1b8d06c4ea0b6eb74b52b9dadb866a92c0cc5b69
commit: 337b2692901cf0b9e8a951acb48a8bac964dff6d [10/13] pgpriv2 support fixes 3
config: i386-randconfig-063-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230730.Er4Vhikj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230730.Er4Vhikj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230730.Er4Vhikj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/netfs/misc.c: note: in included file (through include/linux/mmzone.h, include/linux/swap.h):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
>> fs/netfs/misc.c:66:47: sparse: sparse: cast truncates bits from constant value (5555555555555555 becomes 55555555)
   fs/netfs/misc.c:94:52: sparse: sparse: cast truncates bits from constant value (5555555555555555 becomes 55555555)

vim +66 fs/netfs/misc.c

    52	
    53	/*
    54	 * Delete the head of a rolling queue.
    55	 */
    56	struct folio_queue *netfs_delete_buffer_head(struct netfs_io_request *wreq)
    57	{
    58		struct folio_queue *head = wreq->buffer, *next = head->next;
    59	
    60		if (next)
    61			next->prev = NULL;
    62		netfs_stat_d(&netfs_n_folioq);
    63		trace_netfs_folioq(wreq, head, netfs_trace_folioq_delete);
    64		set_bit(0, &head->dead);
    65		for (int i = 0; i < folioq_nr_slots(head); i++)
  > 66			head->vec.folios[i] = (void *)0x5555555555555555UL;
    67		kfree(head);
    68		wreq->buffer = next;
    69		return next;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
