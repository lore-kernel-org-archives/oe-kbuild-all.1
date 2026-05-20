Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C47C342CA7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261601; cv=none; b=fY2oPBPnPnABYfsIEA3UpHnBKMqCu3QZm4Kyaw1cWsmPIxzxva53Z9LX5s2TC336wOL/ZrnrnvwVyU4Rh4cft8w5g765j7YLOsPCGI4aY/m3WD0sIZumjo4MZuXaX9IUHVhT8Oitoh/k/DcWCIRf4J/1kHMnh30WnoBsUZWC7Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261601; c=relaxed/simple;
	bh=UBWX68jy7YWqvqywBh83hpbcBVZmU9KrWWlexNi1lLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nMWzM2UzqYaBy7OEjvJprzteWAEA6nYhHwn/g2e04ZzfczgJH8SZPVPdnTPdx7o3smP99v2TzFKEdcc655BXFBExAmnZ+SJDSFgM2CGeV/y61/isMURTq843XzpYEjYv4FN2LMbdsfCJL1x3vm8g/yTTNXdddLmcmOHRcqKEBrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMTPN/6m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMTPN/6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779261600; x=1810797600;
  h=date:from:to:cc:subject:message-id;
  bh=UBWX68jy7YWqvqywBh83hpbcBVZmU9KrWWlexNi1lLg=;
  b=KMTPN/6mY6L9t+2fheuW5vKp66ZizMlIFLvrQfhdRE5f1ZcjPkQ/Fd2d
   WDvTu9VWDFugofO9v08TEotmRVbkyw894WFvpSNPLqb6aJr25RzoV8FXs
   u43UtUlWoHIlS3Zpfg5GRpr95zAkqul3MmyJjEh4ERlXE4mzwsg8sPQ3J
   2eYqclAWHfOEiCrXAzSltQp9lo7kpsVENsg/b1owwHyMTcNqCbRde68FU
   i6sLHsRrdKa/29IFw877hW7LEa74NIzyGFM3MtX4S7FAPZTDvytSQ4tJ7
   3zocCM8kymB3I0anBAAa8ffn3JXgak544Dx5lc2Jt7t77BBlinoxuaIDw
   w==;
X-CSE-ConnectionGUID: k1Isi4GdRs+pnXnide6GHQ==
X-CSE-MsgGUID: oqskIntWS/++wsIMPE/F8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83769402"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83769402"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 00:20:00 -0700
X-CSE-ConnectionGUID: IBb0JTKIT9Oazfu6igWF5A==
X-CSE-MsgGUID: i255t+zaSSKdHHNKmBJegg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2026 00:19:58 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPbDa-000000002iD-17pQ;
	Wed, 20 May 2026 07:19:52 +0000
Date: Wed, 20 May 2026 15:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 25/34] fs/netfs/write_retry.c:34
 netfs_prepare_write_retry_buffer() warn: unsigned 'len' is never less than
 zero.
Message-ID: <202605201507.AbniGadH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   13cee75c8b683f7c4382573f8c27adfbd49ffc47
commit: 0bc90a453f6e9deeddbf0a9f923637e0fc614ee7 [25/34] netfs: Allow the fs to ask for the bvecq to be copied when prepping
config: microblaze-randconfig-r072-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201507.AbniGadH-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201507.AbniGadH-lkp@intel.com/

smatch warnings:
fs/netfs/write_retry.c:34 netfs_prepare_write_retry_buffer() warn: unsigned 'len' is never less than zero.

vim +/len +34 fs/netfs/write_retry.c

    13	
    14	/*
    15	 * Prepare the write buffer for a retry.  We can't necessarily reuse the write
    16	 * buffer from the previous run of a subrequest because the filesystem is
    17	 * permitted to modify it (add headers/trailers, encrypt it).  Further, the
    18	 * subrequest may now be a different size (e.g. cifs has to negotiate for
    19	 * maximum transfer size).  Also, we can't look at *stream as that may still
    20	 * refer to the source material being broken up into original subrequests.
    21	 */
    22	int netfs_prepare_write_retry_buffer(struct netfs_io_subrequest *subreq,
    23					     unsigned int max_segs, bool copy)
    24	{
    25		struct netfs_io_request *wreq = subreq->rreq;
    26		struct netfs_io_stream *stream = &wreq->io_streams[subreq->stream_nr];
    27		size_t len;
    28	
    29		bvecq_pos_set(&subreq->dispatch_pos, &wreq->retry_cursor);
    30	
    31		if (copy) {
    32			len = bvecq_extract(&wreq->retry_cursor, subreq->len, max_segs,
    33					    &subreq->content.bvecq);
  > 34			if (len < 0)
    35				return -ENOMEM;
    36		} else {
    37			bvecq_pos_set(&subreq->content, &wreq->retry_cursor);
    38			len = bvecq_slice(&wreq->retry_cursor, subreq->len, max_segs,
    39					  &subreq->nr_segs);
    40		}
    41	
    42		if (len < subreq->len) {
    43			subreq->len = len;
    44			trace_netfs_sreq(subreq, netfs_sreq_trace_limited);
    45		}
    46	
    47		stream->issue_from += len;
    48		stream->buffered   -= len;
    49		if (stream->buffered == 0)
    50			bvecq_pos_unset(&wreq->retry_cursor);
    51		return 0;
    52	}
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
