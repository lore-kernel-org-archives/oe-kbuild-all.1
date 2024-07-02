Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08274CDF9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 11:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719920092; cv=none; b=W5gkDrecO1UGXosBjNwE8yk/9qAGY0uytHGBISPT6PI2X4wKN/Q/G7UFFS5K52s/lmcxzS+EWc3i4aIkPHcBrEWC8UA8NVORVP3dbVzlQ0TIr731MAelwSffqBj1/q3+crYE4u3cnty66xZOt2A9xyTR5PF28jd1nLD7QIEEyj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719920092; c=relaxed/simple;
	bh=9kb6J/THjyU5XMeoJ+3nqQjCdrkp5beDnaoL7InQye4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flFReZbBLW+MPDKLdi24LDgVQ/kL7BywK8OP3g8e0XVL7mVlvyCv3zuchpvu+xo+wsVTZUzXeJtBHsy85G81zLaUmfExAPSHTDmlNZN8UKHoP+JTly43XyngoFJPPR+jQqjSX/SLB7WTE0NOILCscT2WmTKsPfmCJoBA1fhpXIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VS0JrK6Z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VS0JrK6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719920090; x=1751456090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9kb6J/THjyU5XMeoJ+3nqQjCdrkp5beDnaoL7InQye4=;
  b=VS0JrK6ZaUboY/3SZmqSaO+h0qDQYtSZYcWJdMpGxIWmXIxXrg625cXh
   dNkagSkfpIskAeMwf/JE5cStNkV3s5gCwAxeiG8L6+rf2lQ6pgvDJ0oph
   /9jAihORp6bl81fq53a4IyncnuUT/ezDAq+0lKVZW8+H3WwSMoMexgeeQ
   cg6cBmAZLoHOkxkWOHLGyRx8VKDJoqvPrjXsPzcUTI3r3BOYTzMWN3ZjK
   URcAgA2NsOLe0uI5jZxLWi/V7NBb/lLfUiuI2zAN3o4dEr/J+EgMSwOAV
   t4gVWsfagolxKpRBCBEp1FKEudGSV/D9W656odFbGuUXy392BTPLFfR3L
   w==;
X-CSE-ConnectionGUID: kcapMWVlRAmNpXXYfpJjzA==
X-CSE-MsgGUID: WxG6boqASY2iA8ct+3fWyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27769697"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="27769697"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 04:34:49 -0700
X-CSE-ConnectionGUID: ZP6zBSx2R5WtXSzTYvzNxQ==
X-CSE-MsgGUID: ssnX06qOSbqQDi0/N1ZNAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45664349"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2024 04:34:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sObmY-000O7U-0n;
	Tue, 02 Jul 2024 11:34:46 +0000
Date: Tue, 2 Jul 2024 19:34:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 16/17] fs/smb/client/file.c:259:13:
 warning: 'cifs_expand_readahead' defined but not used
Message-ID: <202407021929.qZyrumT3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   87ff2bfa2eb1cac0a80d376b99b244e96f582721
commit: 5a2bec0ed38eec31673fd7c48b558c29db922e1a [16/17] netfs: Speed up buffered reading
config: i386-buildonly-randconfig-003-20240702 (https://download.01.org/0day-ci/archive/20240702/202407021929.qZyrumT3-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407021929.qZyrumT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407021929.qZyrumT3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/file.c:259:13: warning: 'cifs_expand_readahead' defined but not used [-Wunused-function]
     259 | static void cifs_expand_readahead(struct netfs_io_request *rreq)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/cifs_expand_readahead +259 fs/smb/client/file.c

69c3c023af25ed David Howells 2023-10-06  253  
69c3c023af25ed David Howells 2023-10-06  254  /*
69c3c023af25ed David Howells 2023-10-06  255   * Expand the size of a readahead to the size of the rsize, if at least as
69c3c023af25ed David Howells 2023-10-06  256   * large as a page, allowing for the possibility that rsize is not pow-2
69c3c023af25ed David Howells 2023-10-06  257   * aligned.
69c3c023af25ed David Howells 2023-10-06  258   */
69c3c023af25ed David Howells 2023-10-06 @259  static void cifs_expand_readahead(struct netfs_io_request *rreq)
69c3c023af25ed David Howells 2023-10-06  260  {
69c3c023af25ed David Howells 2023-10-06  261  	unsigned int rsize = rreq->rsize;
69c3c023af25ed David Howells 2023-10-06  262  	loff_t misalignment, i_size = i_size_read(rreq->inode);
69c3c023af25ed David Howells 2023-10-06  263  
69c3c023af25ed David Howells 2023-10-06  264  	if (rsize < PAGE_SIZE)
69c3c023af25ed David Howells 2023-10-06  265  		return;
69c3c023af25ed David Howells 2023-10-06  266  
69c3c023af25ed David Howells 2023-10-06  267  	if (rsize < INT_MAX)
69c3c023af25ed David Howells 2023-10-06  268  		rsize = roundup_pow_of_two(rsize);
69c3c023af25ed David Howells 2023-10-06  269  	else
69c3c023af25ed David Howells 2023-10-06  270  		rsize = ((unsigned int)INT_MAX + 1) / 2;
69c3c023af25ed David Howells 2023-10-06  271  
69c3c023af25ed David Howells 2023-10-06  272  	misalignment = rreq->start & (rsize - 1);
69c3c023af25ed David Howells 2023-10-06  273  	if (misalignment) {
69c3c023af25ed David Howells 2023-10-06  274  		rreq->start -= misalignment;
69c3c023af25ed David Howells 2023-10-06  275  		rreq->len += misalignment;
69c3c023af25ed David Howells 2023-10-06  276  	}
69c3c023af25ed David Howells 2023-10-06  277  
69c3c023af25ed David Howells 2023-10-06  278  	rreq->len = round_up(rreq->len, rsize);
69c3c023af25ed David Howells 2023-10-06  279  	if (rreq->start < i_size && rreq->len > i_size - rreq->start)
69c3c023af25ed David Howells 2023-10-06  280  		rreq->len = i_size - rreq->start;
69c3c023af25ed David Howells 2023-10-06  281  }
69c3c023af25ed David Howells 2023-10-06  282  

:::::: The code at line 259 was first introduced by commit
:::::: 69c3c023af25edb5433a2db824d3e7cc328f0183 cifs: Implement netfslib hooks

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
