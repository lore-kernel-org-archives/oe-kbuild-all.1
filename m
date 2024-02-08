Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A64529CFB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396524; cv=none; b=cqe1wJsS26EPFMJmA+EFMdwK5kWyhxyWTeEt+9XMz18FanbI6cmkcOUjMj/q+Z+tQeMuqH1DF2ekrs8uP1D0uM6sDjUa3YWi+0rCGnVCr3TG0S/iYY/fT5iqKwlkM8MNqf7DXNl8E1kyAsnmRJlGv6vEldlkBO0Uv9P10vxzdus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396524; c=relaxed/simple;
	bh=REdwxuYTcNkB9E9Js1uBuH/WQHx3g3quc+eJo+1nvfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cr8KqdpJmBm2w5nIYvLsliFqwpQ+lhlezLnEaFjCM9BfHrLcwg3TgHNdhTkLcbvfJSi6N6jIlJCBE5W/IqvbjOQEjOWjYoMprKfiFC1IAO7rpZ6Fd123fzRm0kj33I0D9+38pX/fd/GylREw7YPRMgoDYfNBM4SpUrVGmfc/6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOCo8foO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOCo8foO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707396523; x=1738932523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REdwxuYTcNkB9E9Js1uBuH/WQHx3g3quc+eJo+1nvfA=;
  b=nOCo8foOBSsaLuYAKIRfeiAopF9GCaHRCZM6HVOCpMO+jzM1yOgvZpfG
   clftw0cSSBf45eEkUKPBIS82q4SSQygEYEk8U8fSIyr5lP8C2qlueyowK
   wqt2MgVgwNpgt6sOp7L/XOU+D2Z46UVmqjeeu7fEq5cDpvl6D6PMnKJff
   E4fVqJdvqknZqKB3QvXr68HKodtjixZWsyodbU2tnTyfNdlDFhS7flWiS
   ftR0aq0GlORkBZp9EJOfnxvArVDnMhvjMVSxDy0mXPpmwwQjFq9ErSOrk
   UNONBXYvKoYbT80UREfsfvNewRT04d4ePk+HrUyeRObhzX8LxJoV/nGnS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1367849"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1367849"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 04:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1944376"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2024 04:48:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY3pW-0003kk-3D;
	Thu, 08 Feb 2024 12:48:38 +0000
Date: Thu, 8 Feb 2024 20:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 2/4] fs/nfs/nfs4xdr.c:4456:12: warning:
 'decode_dir_delegation_stateid' defined but not used
Message-ID: <202402082009.7bejmvoi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   861bf90064b2f2eaf6c0263f6bd5cbbbdc653169
commit: 8fa14a7ad0d26096059c1d94840a0a7d61c92199 [2/4] nfs: add encoders and decoders for GET_DIR_DELEGATION
config: x86_64-randconfig-161-20240208 (https://download.01.org/0day-ci/archive/20240208/202402082009.7bejmvoi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402082009.7bejmvoi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402082009.7bejmvoi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/nfs4xdr.c:4456:12: warning: 'decode_dir_delegation_stateid' defined but not used [-Wunused-function]
    4456 | static int decode_dir_delegation_stateid(struct xdr_stream *xdr, nfs4_stateid *stateid)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/decode_dir_delegation_stateid +4456 fs/nfs/nfs4xdr.c

  4455	
> 4456	static int decode_dir_delegation_stateid(struct xdr_stream *xdr, nfs4_stateid *stateid)
  4457	{
  4458		stateid->type = NFS4_DIR_DELEGATION_STATEID_TYPE;
  4459		return decode_stateid(xdr, stateid);
  4460	}
  4461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
