Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1739FDD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710096447; cv=none; b=C8wE194YfRwz2u4ql4MzYDvIaaJFtBuOvltAa1fb8NJYX9vsSIZw9W3zdUH3R60VpluzvrE2/UfyjIprjDjDQ7MVpusY8RMjhEKzq2hYIk1aIbqWkl86ojkNx/iHESKdcJKygUunuPSwn0pvB95qjhWN23mTb6F/oADaC6fo3FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710096447; c=relaxed/simple;
	bh=OnvecFk16yKoxloCGLYRYwZ4l8us5eJJib7xrGJ91Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eM6jONyG/r/PwfkicrLJIgS09rMFGMGg/c7bncKmLfQKuCtwd7v6OziG8QXspLtOsGYvt7uSA1OM938fb3vr/Q30Vbc2tQ+B6Tsq6w8lyAexvpXWCLigeMAwFtQgTfQkUuzAbHbHdkioyOmZkzMSU6Huz4IFqPRkH/2JsP2agvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0YC5n8x; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0YC5n8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710096444; x=1741632444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OnvecFk16yKoxloCGLYRYwZ4l8us5eJJib7xrGJ91Nk=;
  b=e0YC5n8xJdlOOyDlhdDU1X+zAriOcHD0pNZOXVh98hIIt8VSjLrDMF2p
   Q4wRG8SLnEgc7L1YK6NV7k+y2g1Z3ZxK6+U3uQApgIxupwctyJ99lXYPV
   xtZxsZhN4f9/b2sXXfEqhgwKfI1Gi22zkrTVZgs+jwf8fCS8A+Vossr/x
   jDRV8Iz0LF12cHtDF9rtx1kLKMaWB51nmOqMwppXCIa7PzLY+Vk6xJ+7c
   gV7nFaPbNDL66bjoIYSCdJd4eoQhcSDj8RGC3XcagSiUDF3oluY7yEd+m
   XQRrBkxC1ld6oNQNH0wIWoqJvjuxYvuYG/57Gf8LtC0782taIW7F5Fv+b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4924242"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4924242"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 11:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="11044127"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2024 11:47:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjOCe-0008Tc-08;
	Sun, 10 Mar 2024 18:47:20 +0000
Date: Mon, 11 Mar 2024 02:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:for-next 21/25] fs/smb/client/smb2pdu.c:804:25:
 sparse: sparse: restricted __le16 degrades to integer
Message-ID: <202403110214.M283tAcp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git for-next
head:   db03fa1dc47a26b597d82334e6d20f02b77edda9
commit: 6a4ca4deeba8a1080059a42b2f05df0fd1f53012 [21/25] smb: client: negotiate compression algorithms
config: x86_64-randconfig-123-20240310 (https://download.01.org/0day-ci/archive/20240311/202403110214.M283tAcp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110214.M283tAcp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110214.M283tAcp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/smb2pdu.c:804:25: sparse: sparse: restricted __le16 degrades to integer

vim +804 fs/smb/client/smb2pdu.c

   777	
   778	static void decode_compress_ctx(struct TCP_Server_Info *server,
   779				 struct smb2_compression_capabilities_context *ctxt)
   780	{
   781		unsigned int len = le16_to_cpu(ctxt->DataLength);
   782		__le16 alg;
   783	
   784		server->compression.enabled = false;
   785	
   786		/*
   787		 * Caller checked that DataLength remains within SMB boundary. We still
   788		 * need to confirm that one CompressionAlgorithms member is accounted
   789		 * for.
   790		 */
   791		if (len < 10) {
   792			pr_warn_once("server sent bad compression cntxt\n");
   793			return;
   794		}
   795	
   796		if (le16_to_cpu(ctxt->CompressionAlgorithmCount) != 1) {
   797			pr_warn_once("invalid SMB3 compress algorithm count\n");
   798			return;
   799		}
   800	
   801		alg = ctxt->CompressionAlgorithms[0];
   802	
   803		/* 'NONE' (0) compressor type is never negotiated */
 > 804		if (alg == 0 || alg > 3) {
   805			pr_warn_once("invalid compression algorithm '%u'\n", alg);
   806			return;
   807		}
   808	
   809		server->compression.alg = alg;
   810		server->compression.enabled = true;
   811	}
   812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
