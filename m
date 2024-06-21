Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092612D76F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 05:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718946630; cv=none; b=fSOM9rtP4TI95Hg7TMP1ZOFKaI0jYxiHx93Q+WbtFLFYPCBpdLDHNsPr4hlMiiRojyBepQuwkSLPRTJ2FJiW4dX0Gl/rKV5T6ay/RHQB8uT4NQWccvu+2Eg6dqnALUhCM5ZsogLvCNSiOTuc3/sKk04vnpRgwqNk/s+sxvugu6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718946630; c=relaxed/simple;
	bh=mb9IBq7HwuWXnP7XDKhJ9qeBGHTQPNqY1EYcN3gz9pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSEmCfIx74UGAc+zejK+7l1h9odaXq87P+J70LDjN6VoV/YKclk+tlfjQHx1D532JVwWYq/gsj51dj0+8gxwlzTpky6mXE/m+L8bWWIwvoblYoCdOb3QhEQgWOl7yH/8iDkmE+oLik4g1ZlXXAXoqQ9MeeHG1ndHPAKEq5H46ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F291OZvY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F291OZvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718946628; x=1750482628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mb9IBq7HwuWXnP7XDKhJ9qeBGHTQPNqY1EYcN3gz9pk=;
  b=F291OZvY9GxbcBcmyuD6cO3myatTp4xPiXkE8QaGJmo27dl22arIcfFT
   8PetmRiSIR8yyCwCMBpB1TzgQiiCA9buxj6IPh/H5FdfwPaE1mVoUnrcV
   /roRM9Zp6lyE2C9Ax0D/0gtIsIKaP0KbpptqJluil7+AXA4O4JaUo24kz
   goI4eGo/eL8M8XC9vTmNYlMdS4ZzP7sVQ8KlFBnErm5aOKVg1/JbthKeT
   b2mkwB9yoKpc4Ly0/Jn2uX9mMtaTVHK+d79IUA7DwskQw34FZ+h+MPndh
   VanQIpmXW60DAj0LeV6YPC0vHRo1e7gGwZA9QfBL4qa9PQOAX9BkNeQkt
   A==;
X-CSE-ConnectionGUID: Rt+hnuSWTeOebbrDGJf57g==
X-CSE-MsgGUID: NVizDf4IS7qBPHvRQ3/uFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19846215"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="19846215"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 22:10:28 -0700
X-CSE-ConnectionGUID: TN46elqIShGG7v/z+jch2A==
X-CSE-MsgGUID: QJpHAjrAQOGcc/l9t3sIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42294550"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jun 2024 22:10:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKWXY-0008Fa-2X;
	Fri, 21 Jun 2024 05:10:24 +0000
Date: Fri, 21 Jun 2024 13:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 17/17] fs/netfs/buffered_read.c:23:13:
 warning: 'netfs_rreq_expand' defined but not used
Message-ID: <202406211338.Ctfo5Xsp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   d75f8ece3c49fa2ab1299cdabfc879952702a19a
commit: d75f8ece3c49fa2ab1299cdabfc879952702a19a [17/17] netfs: Speed up buffered reading
config: i386-randconfig-002-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211338.Ctfo5Xsp-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211338.Ctfo5Xsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211338.Ctfo5Xsp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/buffered_read.c:23:13: warning: 'netfs_rreq_expand' defined but not used [-Wunused-function]
      23 | static void netfs_rreq_expand(struct netfs_io_request *rreq,
         |             ^~~~~~~~~~~~~~~~~


vim +/netfs_rreq_expand +23 fs/netfs/buffered_read.c

16211268fcb366 David Howells 2022-03-01  22  
16211268fcb366 David Howells 2022-03-01 @23  static void netfs_rreq_expand(struct netfs_io_request *rreq,
16211268fcb366 David Howells 2022-03-01  24  			      struct readahead_control *ractl)
16211268fcb366 David Howells 2022-03-01  25  {
16211268fcb366 David Howells 2022-03-01  26  	/* Give the cache a chance to change the request parameters.  The
16211268fcb366 David Howells 2022-03-01  27  	 * resultant request must contain the original region.
16211268fcb366 David Howells 2022-03-01  28  	 */
16211268fcb366 David Howells 2022-03-01  29  	netfs_cache_expand_readahead(rreq, &rreq->start, &rreq->len, rreq->i_size);
16211268fcb366 David Howells 2022-03-01  30  
16211268fcb366 David Howells 2022-03-01  31  	/* Give the netfs a chance to change the request parameters.  The
16211268fcb366 David Howells 2022-03-01  32  	 * resultant request must contain the original region.
16211268fcb366 David Howells 2022-03-01  33  	 */
16211268fcb366 David Howells 2022-03-01  34  	if (rreq->netfs_ops->expand_readahead)
16211268fcb366 David Howells 2022-03-01  35  		rreq->netfs_ops->expand_readahead(rreq);
16211268fcb366 David Howells 2022-03-01  36  
16211268fcb366 David Howells 2022-03-01  37  	/* Expand the request if the cache wants it to start earlier.  Note
16211268fcb366 David Howells 2022-03-01  38  	 * that the expansion may get further extended if the VM wishes to
16211268fcb366 David Howells 2022-03-01  39  	 * insert THPs and the preferred start and/or end wind up in the middle
16211268fcb366 David Howells 2022-03-01  40  	 * of THPs.
16211268fcb366 David Howells 2022-03-01  41  	 *
16211268fcb366 David Howells 2022-03-01  42  	 * If this is the case, however, the THP size should be an integer
16211268fcb366 David Howells 2022-03-01  43  	 * multiple of the cache granule size, so we get a whole number of
16211268fcb366 David Howells 2022-03-01  44  	 * granules to deal with.
16211268fcb366 David Howells 2022-03-01  45  	 */
16211268fcb366 David Howells 2022-03-01  46  	if (rreq->start  != readahead_pos(ractl) ||
16211268fcb366 David Howells 2022-03-01  47  	    rreq->len != readahead_length(ractl)) {
16211268fcb366 David Howells 2022-03-01  48  		readahead_expand(ractl, rreq->start, rreq->len);
16211268fcb366 David Howells 2022-03-01  49  		rreq->start  = readahead_pos(ractl);
16211268fcb366 David Howells 2022-03-01  50  		rreq->len = readahead_length(ractl);
16211268fcb366 David Howells 2022-03-01  51  
16211268fcb366 David Howells 2022-03-01  52  		trace_netfs_read(rreq, readahead_pos(ractl), readahead_length(ractl),
16211268fcb366 David Howells 2022-03-01  53  				 netfs_read_trace_expanded);
16211268fcb366 David Howells 2022-03-01  54  	}
16211268fcb366 David Howells 2022-03-01  55  }
16211268fcb366 David Howells 2022-03-01  56  

:::::: The code at line 23 was first introduced by commit
:::::: 16211268fcb36672a84359362c2fc2c4695b0fc4 netfs: Split fs/netfs/read_helper.c

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
