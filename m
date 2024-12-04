Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069341C3BE7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 19:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339262; cv=none; b=DeivX7w3Z5xGqc678I4LhAGmsG8l58Sws3z2qi9Rf9FZuh8NxqrvywcbzaKHD620Faq7Mvl+kxgMGArHff3oYVm0AE/gSHgD/2MMJoucgmanHnVAsmTP15DZiGhBpul8e5wi9WrcrLxNT0SfNVCny86qAKzyKdfaNNLw27Acowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339262; c=relaxed/simple;
	bh=11N5LDB7QVT0DJEB5/5zBursMZ/55fhS8I0YGtfanqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IU+gvgMNWtERd81d9p4m8j9fSnWQ+BV9OV4tdiHNXGQx+vF/JsqkqwiyvO1xYS3vVN8kQKXhFA7y3YuwoLf9b6zeWdcnx2msxHRIbLMBJuqjXZe35JcwFZsnMrdg15cRMsJ4nCsbTKNOyyi+sIy2pX0Cn201gB5Oi5d1hGFUFZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StatR3Fe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StatR3Fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733339260; x=1764875260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=11N5LDB7QVT0DJEB5/5zBursMZ/55fhS8I0YGtfanqI=;
  b=StatR3FeDE2/TFdzns4aTg0qBM9KwwSfkT20gti41pK3UCo02EUESlBT
   o+CK2+3GHKpJKuq1Vo6ZLelCc4K0FNwN0/aQE53vhax1V/k57PUjRVgtG
   D6ZQk3lNpK+MRD3BFfto2/Wo7gsDA72pPRFxVeqlh8LQ7wQuLYZS2dScG
   smmXXNhAYrUvhzyYlS/5Q8I5dzcMA80rG0puxJ1gRzgZPzSs0We07LRW0
   c99NcVGT8LS7/dw69ORNvl41OL8QhmUnW9iJyA/N1ha59lneMOzklZj5a
   3G+KW0UKudExILfdY0o8tV27RqNBOkGDfeRRQmdsSzWohzXw2AKxP5w0W
   w==;
X-CSE-ConnectionGUID: A4Je5v9sRry8RmX/CrBV2g==
X-CSE-MsgGUID: Gdcuh5p1QOGsW8P9bJFQ0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44290868"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="44290868"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 11:07:39 -0800
X-CSE-ConnectionGUID: biGlDQh2SKKru+Wd6CoDjA==
X-CSE-MsgGUID: AvNhPzLgR6qwR5V6QKkMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="98929517"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Dec 2024 11:07:39 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIuim-0003PN-0N;
	Wed, 04 Dec 2024 19:07:36 +0000
Date: Thu, 5 Dec 2024 03:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 162/163]
 fs/xfs/xfs_notify_failure.c:580:40: sparse: sparse: dereference of noderef
 expression
Message-ID: <202412050254.hGYPGZOE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   3ef6d3267cdc0cf4ed98d255efb948c8d404eaf9
commit: 0940e5a093a2135fd652bf527ef564c15f144da3 [162/163] xfs: add media error reporting ioctl
config: i386-randconfig-061-20241204 (https://download.01.org/0day-ci/archive/20241205/202412050254.hGYPGZOE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050254.hGYPGZOE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050254.hGYPGZOE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_notify_failure.c:580:40: sparse: sparse: dereference of noderef expression
   fs/xfs/xfs_notify_failure.c:580:52: sparse: sparse: dereference of noderef expression
>> fs/xfs/xfs_notify_failure.c:580:40: sparse: sparse: dereference of noderef expression
   fs/xfs/xfs_notify_failure.c:580:52: sparse: sparse: dereference of noderef expression

vim +580 fs/xfs/xfs_notify_failure.c

   543	
   544	#define XFS_VALID_MEDIA_ERROR_FLAGS	(XFS_MEDIA_ERROR_DATADEV | \
   545						 XFS_MEDIA_ERROR_LOGDEV | \
   546						 XFS_MEDIA_ERROR_RTDEV)
   547	int
   548	xfs_ioc_media_error(
   549		struct xfs_mount		*mp,
   550		struct xfs_media_error __user	*arg)
   551	{
   552		struct xfs_media_error		me;
   553		enum xfs_failed_device		fdev;
   554	
   555		if (!capable(CAP_SYS_ADMIN))
   556			return -EPERM;
   557	
   558		if (copy_from_user(&me, arg, sizeof(me)))
   559			return -EFAULT;
   560	
   561		if (me.pad)
   562			return -EINVAL;
   563		if (me.flags & ~XFS_VALID_MEDIA_ERROR_FLAGS)
   564			return -EINVAL;
   565	
   566		switch (me.flags & XFS_MEDIA_ERROR_DEVMASK) {
   567		case XFS_MEDIA_ERROR_DATADEV:
   568			fdev = XFS_FAILED_DATADEV;
   569			break;
   570		case XFS_MEDIA_ERROR_LOGDEV:
   571			fdev = XFS_FAILED_LOGDEV;
   572			break;
   573		case XFS_MEDIA_ERROR_RTDEV:
   574			fdev = XFS_FAILED_RTDEV;
   575			break;
   576		default:
   577			return -EINVAL;
   578		}
   579	
 > 580		xfs_media_error_hook(mp, fdev, arg->daddr, arg->bbcount, false);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
