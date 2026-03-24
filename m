Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADD285056
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 05:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331231; cv=none; b=kWmgGevcWbU/hPO82OkekS87uELLO0aFsA7BJbRFcrFAnrUN5WSHwseMJ21FOlshkO2bcrJ3YPO3Wotc1sqeqqabnPMxH9LeGLx211TYSXXaS9gF6euXWF/uFcHRvKPsjmsgzyf61RXLMBFRyySSirzR3cnFt1VU6bnxikRKPUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331231; c=relaxed/simple;
	bh=z2t7lppU9gTCuNc9KBwbvw1j1xCCAVWZa784dMVO2e4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HtU/Pox8Q0VbwXG2XQHZUgPszlpLjMLCsB6EidjmBbE37RJCn6zgO8RSvbZ4vcpGAKxX8BgB8orprGm6S7ZwPDspmFiG71NZ6VMwuOAaPkQjwTItphHv+bkhx8vABaadkUOrDNVxcQuhj5zcAS4GhY2/5GedSNCaGpkv4G4XAwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqImklP8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqImklP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774331230; x=1805867230;
  h=date:from:to:cc:subject:message-id;
  bh=z2t7lppU9gTCuNc9KBwbvw1j1xCCAVWZa784dMVO2e4=;
  b=EqImklP8AlhBhfizC77ey+wHRxV1lSsfslWB2jA0SVsnn80Czeb9ZEEJ
   q7CcCOzb3m48XQvzSlEKgSd54huV7XDsWDEN4NtUcw/Bn9Xyi9AI2cXcV
   pVnxDJEX4f/3amvyONWeNoGNEG5z4wU5hN7/MBdgTt7xM6bd85Y2ux7AG
   tEJHN9qxFIqSeUlvP3kQqgXc4qfN3B7k1pn4MPS5dOVtDkTfBbHdkCM+w
   /Gv1ABn+0NbuJ4xGgkadcVD/0mUBZfppIJsYe0c9TeNJ7Xm4JJJHDQXZF
   gV/UdK+EC8xH0WmAqIGJelbeMdxxnq4LeoZsij55TXNFJ73LNjpDzgRNx
   w==;
X-CSE-ConnectionGUID: Vi+2uQfPRdyWjaP/syYZMQ==
X-CSE-MsgGUID: 2xAjJGNOTKqAqP6kZJrCBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74360445"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74360445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:47:09 -0700
X-CSE-ConnectionGUID: 9DVLrz49S+ynp+rWpEcd8Q==
X-CSE-MsgGUID: ED+wICHfQS6s8RhXkaK7tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228322987"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Mar 2026 22:47:07 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4ubZ-000000003wL-0u3Y;
	Tue, 24 Mar 2026 05:47:05 +0000
Date: Tue, 24 Mar 2026 13:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 34/42]
 fs/netfs/write_issue.c:708:55: sparse: sparse: incorrect type in argument 2
 (different base types)
Message-ID: <202603241339.lba97HLk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   ae7ccdf83025020c44837849de26fb4546fbf825
commit: d045bc8a941a2f79f07a9d3fc62b3596fa4a4326 [34/42] netfs: Perform content encryption for buffered writeback
config: s390-randconfig-r131-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241339.lba97HLk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241339.lba97HLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241339.lba97HLk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/netfs/write_issue.c:708:55: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int debug_id @@
   fs/netfs/write_issue.c:708:55: sparse:     expected restricted gfp_t [usertype] gfp
   fs/netfs/write_issue.c:708:55: sparse:     got unsigned int debug_id
   fs/netfs/write_issue.c:713:65: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int debug_id @@
   fs/netfs/write_issue.c:713:65: sparse:     expected restricted gfp_t [usertype] gfp
   fs/netfs/write_issue.c:713:65: sparse:     got unsigned int debug_id

vim +708 fs/netfs/write_issue.c

   693	
   694	/*
   695	 * Set up the buffering for a buffered write.
   696	 *
   697	 * If we are using a bounce buffer, we set up two parallel buffers: one
   698	 * contains the original folios (load_cursor => collect_cursor), the
   699	 * other contains a bounce buffer with the data copied into it
   700	 * (bounce_cursor => encrypt_cursor => dispatch_cursor => bounce_collect).
   701	 *
   702	 * If we aren't using a bounce buffer, everything is done in the one
   703	 * buffer (load->cursor => dispatch_cursor => collect_cursor).
   704	 */
   705	static int netfs_set_wb_buffers(struct netfs_io_request *wreq,
   706					struct netfs_wb_params *params)
   707	{
 > 708		if (bvecq_buffer_init(&wreq->load_cursor, wreq->debug_id) < 0)
   709			return -ENOMEM;
   710		bvecq_pos_set(&wreq->collect_cursor, &wreq->load_cursor);
   711	
   712		if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &wreq->flags)) {
   713			if (bvecq_buffer_init(&wreq->bounce_cursor, wreq->debug_id) < 0)
   714				return -ENOMEM;
   715			bvecq_pos_set(&wreq->encrypt_cursor, &wreq->bounce_cursor);
   716			bvecq_pos_set(&params->dispatch_cursor, &wreq->bounce_cursor);
   717			bvecq_pos_set(&wreq->bounce_collect, &wreq->bounce_cursor);
   718		} else {
   719			bvecq_pos_set(&params->dispatch_cursor, &wreq->load_cursor);
   720		}
   721		return 0;
   722	}
   723	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
