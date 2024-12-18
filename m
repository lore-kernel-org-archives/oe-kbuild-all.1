Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4D35974
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734497229; cv=none; b=FJRA43VhVhPK3HH4l0D0we/0C/CAZ3XoAeh+X6cwUCVDBAG2mQ+znj0DP3LjTAS0HToKpalhAVQFsAtUewAl5m4fzwFC5KosBGnL3Qgy80b7uHcBjK7WXZQvF9fLvQy1ms29yYISZHgotFFqw8/wvfgZPGhFFys3FTBTyjs5wVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734497229; c=relaxed/simple;
	bh=gzAKQ6/eNchbsM7erAYEeuNQfAUofRm+BXhoGy3zAFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SKSswn/ppdyWVLBb3rwjOCv6Eej00N4ZJrIYIVf6QmBcAG+nYbd12AUDFEIEid+zboiNflu9SZoFlouR0uGr9gPI6eMP0ZzCdHBXRDYjQqY52p+1E09etIbZQZ03vHQZ5JU88f1YDAMnkAQucrmP4W+uu77yQUeuW5J4Gk5Rbgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KX6X3M/s; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KX6X3M/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734497227; x=1766033227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gzAKQ6/eNchbsM7erAYEeuNQfAUofRm+BXhoGy3zAFA=;
  b=KX6X3M/sKp6ixJD2XZc90asg0I8KjLgo7CgmbCFuHfBL7mMWQg8sok0X
   u9kvdQxxBnk/iysx64l+xWpO3J26JGq9VhQXnkL1FS00Ajzq2bHO0Q3cD
   s3P4Fm1W5DU5xm4EhlM83DOybDU2AysA/gY7XnTHjmat/V8S3Vin/AVey
   eyF969GAfQTflGsfvswbnmcXVvnBEn3hCrUhxq6duwrWbp9amE2KXK8VZ
   h/n2tyngq1QEa3sfoKzaJ+1RM+BdEFPXeTmBS9vQwVSUp4GsWrCx7HSFU
   geEm/9C09XqFDxqa/TlYQRChYyh7Q7arAMBDUugrGwMS9EJ3kKSbhAoUU
   Q==;
X-CSE-ConnectionGUID: X4RFvgSAQgW78U0QVqwp/A==
X-CSE-MsgGUID: /aL7cTzNRrWndua2rqoQyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="60344348"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="60344348"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 20:47:05 -0800
X-CSE-ConnectionGUID: PsRqvy2pTeOo8I5QXMpm2g==
X-CSE-MsgGUID: 758E1h1iS8yzlxgC+yzAkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="102747425"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Dec 2024 20:47:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNlxd-000G4g-35;
	Wed, 18 Dec 2024 04:47:01 +0000
Date: Wed, 18 Dec 2024 12:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.13-rc2/remove-sockaddr 4/4] net/iucv/af_iucv.c:858:16:
 error: 'struct sockaddr_iucv' has no member named 'sa_family'; did you mean
 'siucv_family'?
Message-ID: <202412181231.qwUPPDlD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.13-rc2/remove-sockaddr
head:   333adcbb2159f90fedc3f9d3194dbf6352af9335
commit: 333adcbb2159f90fedc3f9d3194dbf6352af9335 [4/4] net: Convert proto_ops::getname to sockaddr_storage
config: s390-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181231.qwUPPDlD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181231.qwUPPDlD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181231.qwUPPDlD-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/iucv/af_iucv.c: In function 'iucv_sock_getname':
>> net/iucv/af_iucv.c:858:16: error: 'struct sockaddr_iucv' has no member named 'sa_family'; did you mean 'siucv_family'?
     858 |         siucv->sa_family = AF_IUCV;
         |                ^~~~~~~~~
         |                siucv_family


vim +858 net/iucv/af_iucv.c

   850	
   851	static int iucv_sock_getname(struct socket *sock,
   852				     struct sockaddr_storage *addr, int peer)
   853	{
   854		DECLARE_SOCKADDR(struct sockaddr_iucv *, siucv, addr);
   855		struct sock *sk = sock->sk;
   856		struct iucv_sock *iucv = iucv_sk(sk);
   857	
 > 858		siucv->sa_family = AF_IUCV;
   859	
   860		if (peer) {
   861			memcpy(siucv->siucv_user_id, iucv->dst_user_id, 8);
   862			memcpy(siucv->siucv_name, iucv->dst_name, 8);
   863		} else {
   864			memcpy(siucv->siucv_user_id, iucv->src_user_id, 8);
   865			memcpy(siucv->siucv_name, iucv->src_name, 8);
   866		}
   867		memset(&siucv->siucv_port, 0, sizeof(siucv->siucv_port));
   868		memset(&siucv->siucv_addr, 0, sizeof(siucv->siucv_addr));
   869		memset(&siucv->siucv_nodeid, 0, sizeof(siucv->siucv_nodeid));
   870	
   871		return sizeof(struct sockaddr_iucv);
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
