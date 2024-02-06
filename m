Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C4A130AE9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707226333; cv=none; b=CDBt8bj+/Teb9sFeV8XYhZYs2VPYKDHNqV7nmk7Y5pf5ffpACPPxBXt9DWURX8k/weVKBiyOwvQ0f70RlUt6G72aeia8X53ClIMBV+tFVp5QuRQv5q729mH5jD2CSeT4YI7yywjdLoqsbEi6euxGXAPdNbZW8vJ+8y18X4a4YME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707226333; c=relaxed/simple;
	bh=6dm5rrEVc+0HdQS92ft5L6oUfoQL0yiKeh5DjKDHuOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQfuRXkW9zs2skHb/PgKvmhVjL3aJT6QyvDIrFM1q+pxoY0ccRnVHCb9nv0vsE3O/JfinrBCGjsdTaEiNV4fRce0QIRCE3hFeodiSWKRGFFLv/hHaalfk/7xlYqwzccOCE8cyLj1gy4UuxUwmNQuI23CQxfLzlRPtTVEl2dkJiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LW07umT4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LW07umT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707226331; x=1738762331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dm5rrEVc+0HdQS92ft5L6oUfoQL0yiKeh5DjKDHuOg=;
  b=LW07umT4HlLO/NbCEWwkkElhZLVQqPcYnkkmxVzCNCA81Pc8c8D9WI1i
   hSp+4P/YqnReTzPqmH36y25vA4mZwku9grWRvGHG5RD3STUV9yE4RYeud
   dvHFJ23gw2RRLJIoHuOJ5rHy1yWsSj/rzbK2j9xTnd8Gg5PtyPh3TKc6x
   rbUIuMPfaM+EVWPBFtcirnk4mCW6gRs1U0/JKJC2cOT9pifLdJJ5ozj+V
   BtuwNOjGUQ2ZYbmJbuIbLpPa/lvqbhMT+fWhTBAYHnek1tW4cuX0CUfmc
   Cxl5gJa8LUB1M5rdTJRTl/Wm1CYgVepjNZDePfb6C4HzGd8jcxZAR2PPb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="3706824"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="3706824"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5640775"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2024 05:32:06 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXLYR-0001QG-1d;
	Tue, 06 Feb 2024 13:32:03 +0000
Date: Tue, 6 Feb 2024 21:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 4132/4465] fs/smb/client/file.c:383:32: sparse:
 sparse: symbol 'cifs_req_ops' was not declared. Should it be static?
Message-ID: <202402062151.Kq60k2LK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac139fc7db67968e5061715508b5fc4aa7c40c56
commit: cff3c1bd9ccb3e6e9a7a3487722ca1d9705845c4 [4132/4465] cifs: Implement netfslib hooks
config: x86_64-randconfig-122-20240206 (https://download.01.org/0day-ci/archive/20240206/202402062151.Kq60k2LK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062151.Kq60k2LK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062151.Kq60k2LK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/file.c:383:32: sparse: sparse: symbol 'cifs_req_ops' was not declared. Should it be static?
   fs/smb/client/file.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/cifs_req_ops +383 fs/smb/client/file.c

   382	
 > 383	const struct netfs_request_ops cifs_req_ops = {
   384		.io_request_size	= sizeof(struct cifs_io_request),
   385		.io_subrequest_size	= sizeof(struct cifs_io_subrequest),
   386		.init_request		= cifs_init_request,
   387		.free_request		= cifs_free_request,
   388		.free_subrequest	= cifs_free_subrequest,
   389		.expand_readahead	= cifs_expand_readahead,
   390		.clamp_length		= cifs_clamp_length,
   391		.issue_read		= cifs_req_issue_read,
   392		.done			= cifs_rreq_done,
   393		.post_modify		= cifs_post_modify,
   394		.create_write_requests	= cifs_create_write_requests,
   395	};
   396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
