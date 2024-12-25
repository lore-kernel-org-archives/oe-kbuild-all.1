Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE451CA81
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735138124; cv=none; b=Jf/pxH+tegjT8Qup/Oct48qsbiW+7bNgp6+crt9p5PXOIa5ZcGAKtlBTth/1m2WfM4mvM1tBdF5mZrVmI7L6yhp/2G/oN0PvcFYkaeKFai8urzpojn3qUnwsl+agbQCOLDrgQZwF5oMCZ88XaK+vEE9t6jV6c5YlqgX92fkRNsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735138124; c=relaxed/simple;
	bh=/6IhFL09r0Ql4XQzZZzR7nJpPj7cmYdTKqKLBPyiGu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvfcOgSbGQ4neO3lGDWutC34ElwFL4mjlM3053PcS8+/hUut6uhCCITAh/NyEOV+BK8aBkcK9Odq0OO0H/wSBoDAm3h49VAfBq737KBVMcbHIptfjdT4U2nz6kRp+pBF8qTjUWEjIKmDIjVCXMPuXDlNV83PnF01APwVFWQ7+zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwycaM+D; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwycaM+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735138123; x=1766674123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/6IhFL09r0Ql4XQzZZzR7nJpPj7cmYdTKqKLBPyiGu8=;
  b=PwycaM+DNfiM9HwWqVT7ntJWMpcz6T4vCbdYkYB8S6F07do0azy04268
   6zJCTB6+kCSu7cWZvVWGKinfuv5VCfDU8P6ma837rdEw3jzZfGkwD2zP9
   sXx9yjW4db7z225//wsSBNMVIB8m0H0Pnv1rAUSJ4vj9xkw942ne/S8CF
   SHv+aUMsbVMOR1yQW9/fDtsZRgf61/mKSajVkfTq4NbLTEtMcbOvh7aYR
   bPvCecob/i63ODX4HN7JxCae/v/RAZpzKjbuhVwyB2cXAWm8eYsQmGs9x
   SJua+oyi0OgL80XK9EWajILQre7VhlbvHQosJpHFS/QBmw8uQKD6OFksw
   g==;
X-CSE-ConnectionGUID: 7BH6Tw8SQeaA6+g3sHLMxg==
X-CSE-MsgGUID: X6mPRJ1ARC2ddnNwXw0ZfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46584876"
X-IronPort-AV: E=Sophos;i="6.12,263,1728975600"; 
   d="scan'208";a="46584876"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 06:48:42 -0800
X-CSE-ConnectionGUID: /L2uH1CCTQae5hjelEPzFw==
X-CSE-MsgGUID: aOs96GhIShW0YvfvKf/yyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103810384"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Dec 2024 06:48:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQSgg-0001vj-2J;
	Wed, 25 Dec 2024 14:48:38 +0000
Date: Wed, 25 Dec 2024 22:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 29/38] fs/smb/client/connect.c:3097:20: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202412252224.liHxX1nk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   4a7fbaf556836b77fe7bb452939af3a505ee5ee9
commit: 53714b10243a10c39c962a2e38c66a8c3c0388ca [29/38] cifs: Fix establishing NetBIOS session for SMB2+ connection
config: x86_64-randconfig-123-20241225 (https://download.01.org/0day-ci/archive/20241225/202412252224.liHxX1nk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412252224.liHxX1nk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412252224.liHxX1nk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/connect.c:3097:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] length @@     got restricted __be16 [usertype] @@
   fs/smb/client/connect.c:3097:20: sparse:     expected unsigned short [addressable] [assigned] [usertype] length
   fs/smb/client/connect.c:3097:20: sparse:     got restricted __be16 [usertype]

vim +3097 fs/smb/client/connect.c

  3051	
  3052	static int
  3053	ip_rfc1001_connect(struct TCP_Server_Info *server)
  3054	{
  3055		int rc = 0;
  3056		/*
  3057		 * some servers require RFC1001 sessinit before sending
  3058		 * negprot - BB check reconnection in case where second
  3059		 * sessinit is sent but no second negprot
  3060		 */
  3061		struct rfc1002_session_packet req = {};
  3062		struct msghdr msg = {};
  3063		struct kvec iov = {};
  3064		unsigned int len;
  3065		size_t sent;
  3066	
  3067		req.trailer.session_req.called_len = sizeof(req.trailer.session_req.called_name);
  3068	
  3069		if (server->server_RFC1001_name[0] != 0)
  3070			rfc1002mangle(req.trailer.session_req.called_name,
  3071				      server->server_RFC1001_name,
  3072				      RFC1001_NAME_LEN_WITH_NULL);
  3073		else
  3074			rfc1002mangle(req.trailer.session_req.called_name,
  3075				      DEFAULT_CIFS_CALLED_NAME,
  3076				      RFC1001_NAME_LEN_WITH_NULL);
  3077	
  3078		req.trailer.session_req.calling_len = sizeof(req.trailer.session_req.calling_name);
  3079	
  3080		/* calling name ends in null (byte 16) from old smb convention */
  3081		if (server->workstation_RFC1001_name[0] != 0)
  3082			rfc1002mangle(req.trailer.session_req.calling_name,
  3083				      server->workstation_RFC1001_name,
  3084				      RFC1001_NAME_LEN_WITH_NULL);
  3085		else
  3086			rfc1002mangle(req.trailer.session_req.calling_name,
  3087				      "LINUX_CIFS_CLNT",
  3088				      RFC1001_NAME_LEN_WITH_NULL);
  3089	
  3090		/*
  3091		 * As per rfc1002, @len must be the number of bytes that follows the
  3092		 * length field of a rfc1002 session request payload.
  3093		 */
  3094		len = sizeof(req.trailer.session_req);
  3095		req.type = RFC1002_SESSION_REQUEST;
  3096		req.flags = 0;
> 3097		req.length = cpu_to_be16(len);
  3098		len += offsetof(typeof(req), trailer.session_req);
  3099		iov.iov_base = &req;
  3100		iov.iov_len = len;
  3101		iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &iov, 1, len);
  3102		rc = smb_send_kvec(server, &msg, &sent);
  3103		if (rc < 0 || len != sent)
  3104			return (rc == -EINTR || rc == -EAGAIN) ? rc : -ECONNABORTED;
  3105	
  3106		/*
  3107		 * RFC1001 layer in at least one server requires very short break before
  3108		 * negprot presumably because not expecting negprot to follow so fast.
  3109		 * This is a simple solution that works without complicating the code
  3110		 * and causes no significant slowing down on mount for everyone else
  3111		 */
  3112		usleep_range(1000, 2000);
  3113	
  3114		return 0;
  3115	}
  3116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
