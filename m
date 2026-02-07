Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8B933EAED
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470627; cv=none; b=eeNXAX4mE1mWANDu18Vx9Wy4PFOo7UOmsabnAT1Eny9AG6M4jxBkeDW4lDEudP6xEtH52StodXkNF4mrdu0G1ngn894YYe9G32NItUxa1iF9tvjHc9a2QWjJJ9mK4n9PWIOY0lgm+UNdxQPFdc3ws7kXD1E3mogUK6IP4WVq7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470627; c=relaxed/simple;
	bh=6/UmMTy0Gq1wUdv06kPMIOojTG2JWFlRrFM54NQFeek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DI7N007hyhT0BXOTDXksaF67Noy+zRidPqFHi2BMg0gyUBWf9EAJtNYdlQ+IJm1qihSbTbTzsCYEjeJ0NYle8Pub0lvKoS1rJ/iQ3BRTBLbN7UwdGQHF2Aul6PPFlo390FBoy6Q7s+5m664rSBDuVSMPPWeDLMKjN3DCOYtxluE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEODkqWk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEODkqWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770470627; x=1802006627;
  h=date:from:to:cc:subject:message-id;
  bh=6/UmMTy0Gq1wUdv06kPMIOojTG2JWFlRrFM54NQFeek=;
  b=VEODkqWkdVFM4KeHVJt7zm7IRuht+68Cc5mmlwQMAQVGSKxyQaFLiRR/
   27Fato4YAqFJuB0CnyiFcFtzPCjsR/fLodsdSNL0NF9TbWCts2CJVoECL
   pmPsQixUPhyEwzpHcMjzHarZLD+UR4YKf842f02DSts6qDeHNzCy0RZ2L
   loa4BP6VzCj11sGjO0ic3xCKxYgSnyrwocRR5vMIpT9v0n17uXXkBRilB
   nBUa1ANaHTmcjIK5zTpFC82Lkoh1G1j1QKi8dLch0jx+fuvR3Sq+ZTPt8
   KQLgi/lYrNrShulfefFqrwkas3QXei43xHHFuljveS02wf/YKNZ8mVwAS
   Q==;
X-CSE-ConnectionGUID: oHHZN/d5RSOGZLPCQe/hQA==
X-CSE-MsgGUID: Fehdxq8zSSuHQpLO7g747Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75273536"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="75273536"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 05:23:47 -0800
X-CSE-ConnectionGUID: ybYY/UMAQkug6ywdNjbZPw==
X-CSE-MsgGUID: M4CYILQMRHqWOx4Ms7TS8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="211148833"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Feb 2026 05:23:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voiHm-00000000lfG-16BO;
	Sat, 07 Feb 2026 13:23:42 +0000
Date: Sat, 07 Feb 2026 21:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>,
 ChenXiaoSong <chenxiaosong@kylinos.cn>
Subject: [samba-ksmbd:for-next 51/52]
 fs/smb/client/smb2maperror.c:55:60: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202602072154.nzriZyX6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git for-next
head:   86163d5208e84648be59f3f2e06abd2f79f608bb
commit: ade60a2fceae59392db456be3a7a7784fa4ab20c [51/52] cifs: Autogenerate SMB2 error mapping table
config: x86_64-randconfig-r132-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072154.nzriZyX6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072154.nzriZyX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072154.nzriZyX6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/smb2maperror.c:55:60: sparse: sparse: restricted __le32 degrades to integer

vim +55 fs/smb/client/smb2maperror.c

ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  32  
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  33  int
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  34  map_smb2_to_linux_error(char *buf, bool log_err)
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  35  {
0d35e382e4e96a4 fs/cifs/smb2maperror.c       Ronnie Sahlberg 2021-11-05  36  	struct smb2_hdr *shdr = (struct smb2_hdr *)buf;
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  37  	unsigned int i;
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  38  	int rc = -EIO;
31473fc4f9653b7 fs/cifs/smb2maperror.c       Pavel Shilovsky 2016-10-24  39  	__le32 smb2err = shdr->Status;
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  40  
eccb4422cf97a4b fs/cifs/smb2maperror.c       Steve French    2018-05-17  41  	if (smb2err == 0) {
0d35e382e4e96a4 fs/cifs/smb2maperror.c       Ronnie Sahlberg 2021-11-05  42  		trace_smb3_cmd_done(le32_to_cpu(shdr->Id.SyncId.TreeId),
0d35e382e4e96a4 fs/cifs/smb2maperror.c       Ronnie Sahlberg 2021-11-05  43  			      le64_to_cpu(shdr->SessionId),
0d35e382e4e96a4 fs/cifs/smb2maperror.c       Ronnie Sahlberg 2021-11-05  44  			      le16_to_cpu(shdr->Command),
0d35e382e4e96a4 fs/cifs/smb2maperror.c       Ronnie Sahlberg 2021-11-05  45  			      le64_to_cpu(shdr->MessageId));
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  46  		return 0;
eccb4422cf97a4b fs/cifs/smb2maperror.c       Steve French    2018-05-17  47  	}
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  48  
6c1eb31ecb97c07 fs/smb/client/smb2maperror.c ChenXiaoSong    2025-12-05  49  	log_err = (log_err && (smb2err != STATUS_MORE_PROCESSING_REQUIRED) &&
6c1eb31ecb97c07 fs/smb/client/smb2maperror.c ChenXiaoSong    2025-12-05  50  		   (smb2err != STATUS_END_OF_FILE)) ||
6c1eb31ecb97c07 fs/smb/client/smb2maperror.c ChenXiaoSong    2025-12-05  51  		  (cifsFYI & CIFS_RC);
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  52  
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  53  	for (i = 0; i < sizeof(smb2_error_map_table) /
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15  54  			sizeof(struct status_to_posix_error); i++) {
ddfbefbd393fb1a fs/cifs/smb2maperror.c       Steve French    2011-03-15 @55  		if (smb2_error_map_table[i].smb2_status == smb2err) {

:::::: The code at line 55 was first introduced by commit
:::::: ddfbefbd393fb1a935bdf27cba5ad2eb24a76e75 CIFS: Map SMB2 status codes to POSIX errors

:::::: TO: Steve French <sfrench@us.ibm.com>
:::::: CC: Steve French <smfrench@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
