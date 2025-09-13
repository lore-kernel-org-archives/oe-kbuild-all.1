Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040FC28313A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757755041; cv=none; b=bjm10v3e8UXAU46u8PUw/roFydwYmL0Uk9xKYwPSkKIg2cLji+/n+E98Dn+WbEp5J255KAyRCBo0i4a7pWeMS4oz/jjitodC2xlwer7R0L+Hd3mKwJn7+LruGCSCiIr45yFDhoBxLRfhIsEHpsP7ERA2rfNioP+ZkhJ/D34HlkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757755041; c=relaxed/simple;
	bh=Q9LfKhHvFcvyde/+wypfglTQOXkLShUYFrxlOsZ/Ipc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2zL6UtFKUpNJ2kCNs7Lh+43AFHazK309Lx0g8ELXs/Etk410GE3nqYPSutr3OTv1KHsiVtsN2x53xNHqg8OjTPVK7AMD0bO+vBBx56xYI2u5slXB86FIL14C3pZcUdBI3SqtWOVQYGCLSFIZcNH+feZEmcHLyu/SacOkBtnMYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhjSYOOI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhjSYOOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757755040; x=1789291040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q9LfKhHvFcvyde/+wypfglTQOXkLShUYFrxlOsZ/Ipc=;
  b=OhjSYOOIGMBby3/4+st3l2bg9XVS32rBmPwSe9f2TYLiBXcqC2EBZp+D
   zbrGai6+B2R5a9Sz8AH8ektIEEMw2/CuzwTysaCBSvVeHOZmD7ee5bl2L
   +fZMkzE6XUMxI0K/ZN3OJ28alT8hFWx8tFI/Mr8tgfESZ/Zyovw1/zPIv
   hstaW9v0Fijv//C4JmyfYdoqQvlbxLD12Ff669I6nhUEKNC56lvibl1WS
   OMbaB3ruA8+bB+pW+jswL7obB/+8tyxXuylCelYlS9Xz9s8amx52Ms9yN
   gCRbvvxP7VSFCiC/mY3/eZ/6HhXUDFVGoTJv3eX3hsN2cyL3ia7fU759a
   A==;
X-CSE-ConnectionGUID: aBhyQeO/S3O2naW0THckyw==
X-CSE-MsgGUID: 8U8Z1UMXSAmQTkPd+7Sb1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="47656707"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="47656707"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 02:17:19 -0700
X-CSE-ConnectionGUID: C0SJ88xdTV21WghnTdFRWw==
X-CSE-MsgGUID: NvYlfKJeTZOcn26dvK0YwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="178516977"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 13 Sep 2025 02:17:18 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxMNc-0001R2-24;
	Sat, 13 Sep 2025 09:17:13 +0000
Date: Sat, 13 Sep 2025 17:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Subject: [cel:direct-io 52/54] fs/nfsd/filecache.c:1069:9: error: implicit
 declaration of function 'trace_nfsd_file_get_dio_attrs'; did you mean
 'trace_nfsd_file_get_dio_attr'?
Message-ID: <202509131748.GCYDTfYC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux direct-io
head:   bcd61e34b795f9544846e92d568aae005e20746d
commit: 388ddf4d5d45b5a056034a1d8b54c2c4c8790af8 [52/54] NFSD: filecache: add STATX_DIOALIGN and STATX_DIO_READ_ALIGN support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250913/202509131748.GCYDTfYC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131748.GCYDTfYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509131748.GCYDTfYC-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/filecache.c: In function 'nfsd_file_get_dio_attrs':
>> fs/nfsd/filecache.c:1069:9: error: implicit declaration of function 'trace_nfsd_file_get_dio_attrs'; did you mean 'trace_nfsd_file_get_dio_attr'? [-Wimplicit-function-declaration]
    1069 |         trace_nfsd_file_get_dio_attrs(inode, &stat);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         trace_nfsd_file_get_dio_attr


vim +1069 fs/nfsd/filecache.c

  1053	
  1054	static __be32
  1055	nfsd_file_get_dio_attrs(const struct svc_fh *fhp, struct nfsd_file *nf)
  1056	{
  1057		struct inode *inode = file_inode(nf->nf_file);
  1058		struct kstat stat;
  1059		__be32 status;
  1060	
  1061		/* Currently only need to get DIO alignment info for regular files */
  1062		if (!S_ISREG(inode->i_mode))
  1063			return nfs_ok;
  1064	
  1065		status = fh_getattr(fhp, &stat);
  1066		if (status != nfs_ok)
  1067			return status;
  1068	
> 1069		trace_nfsd_file_get_dio_attrs(inode, &stat);
  1070	
  1071		if (stat.result_mask & STATX_DIOALIGN) {
  1072			nf->nf_dio_mem_align = stat.dio_mem_align;
  1073			nf->nf_dio_offset_align = stat.dio_offset_align;
  1074		}
  1075		if (stat.result_mask & STATX_DIO_READ_ALIGN)
  1076			nf->nf_dio_read_offset_align = stat.dio_read_offset_align;
  1077		else
  1078			nf->nf_dio_read_offset_align = nf->nf_dio_offset_align;
  1079	
  1080		return nfs_ok;
  1081	}
  1082	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
