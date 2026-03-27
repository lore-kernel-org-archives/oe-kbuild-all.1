Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C54204E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 23:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652917; cv=none; b=ENIUgXyRmdSuet8UBPHXt3jjOUt+4scCbpnInaAMm6KjkziDqiw6jnhRNR0OeHMQqjRSbTGP7fMT5QiY+jummdbmqB7E1YWLhSGefWi5MXVgZ+apwwJcViR4s7zFGy1PnGH1iXGfG26AHzJLRywToxyafQeyKdtSqO477xs5Ev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652917; c=relaxed/simple;
	bh=6RM6kalpvXHL6oetu52kM98uuZk1fuxCuSG9UH8h5FI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tYL3OdcDu80y8j7djDsW2LagE+p8wCpHmu+9vcmCr78U7FaSXE/VRTDge0Rneul9liAJJv0x3eL+Bfy6+0ReEWH7CG8fcGucMkSHP7g259k9x+1df4TJdpv55EkvuMPEhX9pwTkbWydCqgYY1cYBVoMm5QTtNWkGxfl5z0QHiF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuWVBHVi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuWVBHVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774652917; x=1806188917;
  h=date:from:to:cc:subject:message-id;
  bh=6RM6kalpvXHL6oetu52kM98uuZk1fuxCuSG9UH8h5FI=;
  b=UuWVBHViNHsULp6OuW1YamCikqbLo4ledMppEzrkgqf4aKr/w0rdFHpJ
   lfgmYg9I8Iby2N/dlpc5prXtJIQ4yr8beBpd63HjUbI1qS1O/MCdl5pmt
   GDjsdTE7A8ObsXKwwwLFUWaOfWUqTnjIx1gJbrY3qejDS+O+HJtBm3GBw
   GswhKwNFJYgeEcuRcXkOv13d3ud+Av+YHrzJZiKxU2v01JtoHiQaLLLje
   zGc+0olEJ2CdeCEJnqNEojARtSrI8gcyPgBWsQZb66c5rqlx49zoGPO2A
   ElDcnQcP//UaITaXP2VwAa7xhSrPYNeS/vr/Gioe5sF0+Xnf/rq3+x/7j
   Q==;
X-CSE-ConnectionGUID: 8apWngKjRwOO2nATV1rZRg==
X-CSE-MsgGUID: SVA6D1F3Ru+L8B/p1m6nhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75931370"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75931370"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 16:08:36 -0700
X-CSE-ConnectionGUID: qCDsdluVSdiOsc1dtAbRjA==
X-CSE-MsgGUID: 09FbWH4dSOeu73WNUSq8cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="255953374"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2026 16:08:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6GI3-00000000Arj-3L46;
	Fri, 27 Mar 2026 23:08:31 +0000
Date: Sat, 28 Mar 2026 07:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 26/26]
 fs/netfs/buffered_read.c:223:6: warning: no previous prototype for
 'netfs_mark_read_submission'
Message-ID: <202603280644.RdtevT28-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   13e05ee43d1290bb487ef5318b4d2d27be8ce4b5
commit: 13e05ee43d1290bb487ef5318b4d2d27be8ce4b5 [26/26] netfs: Combine prepare and issue ops and grab the buffers on request
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260328/202603280644.RdtevT28-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280644.RdtevT28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280644.RdtevT28-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/buffered_read.c:223:6: warning: no previous prototype for 'netfs_mark_read_submission' [-Wmissing-prototypes]
     223 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/buffered_read.c: In function 'netfs_mark_read_submission':
>> fs/netfs/buffered_read.c:226:33: warning: unused variable 'stream' [-Wunused-variable]
     226 |         struct netfs_io_stream *stream = &rreq->io_streams[0];
         |                                 ^~~~~~


vim +/netfs_mark_read_submission +223 fs/netfs/buffered_read.c

   213	
   214	/**
   215	 * netfs_mark_read_submission - Mark a read subrequest as being ready for submission
   216	 * @subreq: The subrequest to be marked
   217	 *
   218	 * Calling this marks a read subrequest as being ready for submission and makes
   219	 * it available to the collection thread.  After calling this, the filesystem's
   220	 * ->issue_read() method must invoke netfs_read_subreq_terminated() to end the
   221	 * subrequest.
   222	 */
 > 223	void netfs_mark_read_submission(struct netfs_io_subrequest *subreq)
   224	{
   225		struct netfs_io_request *rreq = subreq->rreq;
 > 226		struct netfs_io_stream *stream = &rreq->io_streams[0];
   227	
   228		_enter("R=%08x[%x]", rreq->debug_id, subreq->debug_index);
   229	
   230		trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
   231	}
   232	EXPORT_SYMBOL(netfs_mark_read_submission);
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
