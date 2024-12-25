Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A841754648
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 16:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735144987; cv=none; b=s6g77FzxLlqc4WNlW10gve72wMWF5GQLyAbXDtnc2stfyoCqPBNDY79tZraTEyco5cp/OlgWqc9rw0QfrgcQPF6JWm2M+kvzC+UattKEyP4UZpgraoLha6hBEryddW8b86ECvQzMhJjmVrW2OPR4hGA1qXLq/kvLc/037KJj6Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735144987; c=relaxed/simple;
	bh=JoW+23w/rc7cNz10QURNCb26zyNMC6VBhoRuF+3B3dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNZudrC7QWyJGspUajAZlYgpicpP/g4QX1uuLsiRO4jYX7xgkv7GuPBl9ngQfx363Lg7qyh43K1UcZAGSNGoWq0OJf6mdaLp6aJllEGHMM7H9fVxm9LwyDrTyL7tLYyYTY5UaYZqrNX0VdC4JZZgqwqP3xYGyhrk9eMPA2ouXRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kB17iYRn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kB17iYRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735144986; x=1766680986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JoW+23w/rc7cNz10QURNCb26zyNMC6VBhoRuF+3B3dQ=;
  b=kB17iYRneFSFuD9lMKkTqequQ8ZHRTcJvCWq0V5m+CbgLAqNBWXo4fhH
   Qy/fgr8H59aBA9Z7kDzT04lSq8gCRRO1OOqpdetniQxoX7m3XsVgNyymD
   t9Glk+OtBCqupsljwNUkL0uIg3wyouviwCIz4aLQVjwvukLt+jWTH2/IS
   9rAp3LexdZb4PLH0/UkornQZbfIiBa5xWFrG98ea98F5zqhSC3o2NqX55
   ur9t6+6ZCApYSJBk3xCbCJlzejsqSB0CIGAO+GXN1T5qeGXKh4iCuc/UE
   Bf270JLR9YnLeF+36lF/w5F2c8Pvx5wjPqi2Iu8If55Ur3Eb0I7Dn2TG7
   A==;
X-CSE-ConnectionGUID: 3tGBv3S7Qdikj1NmJIMCIQ==
X-CSE-MsgGUID: ZEE4Q8JqQpCCatQ5jUn8TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46961095"
X-IronPort-AV: E=Sophos;i="6.12,263,1728975600"; 
   d="scan'208";a="46961095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 08:43:06 -0800
X-CSE-ConnectionGUID: 3OJwbfdFQcmk/3BWMc44ow==
X-CSE-MsgGUID: Hef3iwjVTwaMvqeoBZCy6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123018145"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Dec 2024 08:43:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQUTN-00021e-2k;
	Wed, 25 Dec 2024 16:43:01 +0000
Date: Thu, 26 Dec 2024 00:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 30/38] fs/smb/client/connect.c:3168:21: sparse: sparse:
 cast to restricted __be16
Message-ID: <202412260014.EZWxnwiM-lkp@intel.com>
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
commit: 20d462f966b7d331cfc7e9f6c152bd324db85302 [30/38] cifs: Improve establishing SMB connection with NetBIOS session
config: x86_64-randconfig-123-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260014.EZWxnwiM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260014.EZWxnwiM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260014.EZWxnwiM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/smb/client/connect.c:3137:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] length @@     got restricted __be16 [usertype] @@
   fs/smb/client/connect.c:3137:20: sparse:     expected unsigned short [addressable] [assigned] [usertype] length
   fs/smb/client/connect.c:3137:20: sparse:     got restricted __be16 [usertype]
>> fs/smb/client/connect.c:3168:21: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3169:25: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3169:25: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3169:25: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3169:25: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3169:25: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3169:25: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3181:21: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3225:21: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3232:33: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3232:33: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3232:33: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3232:33: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3232:33: sparse: sparse: cast to restricted __be16
   fs/smb/client/connect.c:3232:33: sparse: sparse: cast to restricted __be16

vim +3168 fs/smb/client/connect.c

  3089	
  3090	static int
  3091	ip_rfc1001_connect(struct TCP_Server_Info *server)
  3092	{
  3093		int rc = 0;
  3094		/*
  3095		 * some servers require RFC1001 sessinit before sending
  3096		 * negprot - BB check reconnection in case where second
  3097		 * sessinit is sent but no second negprot
  3098		 */
  3099		struct rfc1002_session_packet req = {};
  3100		struct rfc1002_session_packet resp = {};
  3101		struct msghdr msg = {};
  3102		struct kvec iov = {};
  3103		unsigned int len;
  3104		size_t sent;
  3105		size_t recv;
  3106	
  3107		req.trailer.session_req.called_len = sizeof(req.trailer.session_req.called_name);
  3108	
  3109		if (server->server_RFC1001_name[0] != 0)
  3110			rfc1002mangle(req.trailer.session_req.called_name,
  3111				      server->server_RFC1001_name,
  3112				      RFC1001_NAME_LEN_WITH_NULL);
  3113		else
  3114			rfc1002mangle(req.trailer.session_req.called_name,
  3115				      DEFAULT_CIFS_CALLED_NAME,
  3116				      RFC1001_NAME_LEN_WITH_NULL);
  3117	
  3118		req.trailer.session_req.calling_len = sizeof(req.trailer.session_req.calling_name);
  3119	
  3120		/* calling name ends in null (byte 16) from old smb convention */
  3121		if (server->workstation_RFC1001_name[0] != 0)
  3122			rfc1002mangle(req.trailer.session_req.calling_name,
  3123				      server->workstation_RFC1001_name,
  3124				      RFC1001_NAME_LEN_WITH_NULL);
  3125		else
  3126			rfc1002mangle(req.trailer.session_req.calling_name,
  3127				      "LINUX_CIFS_CLNT",
  3128				      RFC1001_NAME_LEN_WITH_NULL);
  3129	
  3130		/*
  3131		 * As per rfc1002, @len must be the number of bytes that follows the
  3132		 * length field of a rfc1002 session request payload.
  3133		 */
  3134		len = sizeof(req.trailer.session_req);
  3135		req.type = RFC1002_SESSION_REQUEST;
  3136		req.flags = 0;
  3137		req.length = cpu_to_be16(len);
  3138		len += offsetof(typeof(req), trailer.session_req);
  3139		iov.iov_base = &req;
  3140		iov.iov_len = len;
  3141		iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &iov, 1, len);
  3142		rc = smb_send_kvec(server, &msg, &sent);
  3143		if (rc < 0 || len != sent)
  3144			return (rc == -EINTR || rc == -EAGAIN) ? rc : -ECONNABORTED;
  3145	
  3146		/*
  3147		 * RFC1001 layer in at least one server requires very short break before
  3148		 * negprot presumably because not expecting negprot to follow so fast.
  3149		 * For example DOS SMB servers cannot process negprot if it was received
  3150		 * before the server sent response for SESSION_REQUEST packet. So, wait
  3151		 * for the response, read it and parse it as it can contain useful error
  3152		 * information (e.g. specified server name was incorrect). For example
  3153		 * even the latest Windows Server 2022 SMB1 server over port 139 send
  3154		 * error if its server name was in SESSION_REQUEST packet incorrect.
  3155		 * Nowadays usage of port 139 is not common, so waiting for reply here
  3156		 * does not slowing down mounting of common case (over port 445).
  3157		 */
  3158		len = offsetof(typeof(resp), trailer);
  3159		iov.iov_base = &resp;
  3160		iov.iov_len = len;
  3161		iov_iter_kvec(&msg.msg_iter, ITER_DEST, &iov, 1, len);
  3162		rc = smb_recv_kvec(server, &msg, &recv);
  3163		if (rc < 0 || recv != len)
  3164			return (rc == -EINTR || rc == -EAGAIN) ? rc : -ECONNABORTED;
  3165	
  3166		switch (resp.type) {
  3167		case RFC1002_POSITIVE_SESSION_RESPONSE:
> 3168			if (be16_to_cpu(resp.length) != 0) {
  3169				cifs_dbg(VFS, "RFC 1002 positive session response but with invalid non-zero length %u\n",
  3170					 be16_to_cpu(resp.length));
  3171				return -EIO;
  3172			}
  3173			cifs_dbg(FYI, "RFC 1002 positive session response");
  3174			break;
  3175		case RFC1002_NEGATIVE_SESSION_RESPONSE:
  3176			/* Read RFC1002 response error code and convert it to errno in rc */
  3177			len = sizeof(resp.trailer.neg_ses_resp_error_code);
  3178			iov.iov_base = &resp.trailer.neg_ses_resp_error_code;
  3179			iov.iov_len = len;
  3180			iov_iter_kvec(&msg.msg_iter, ITER_DEST, &iov, 1, len);
  3181			if (be16_to_cpu(resp.length) == len &&
  3182			    smb_recv_kvec(server, &msg, &recv) == 0 &&
  3183			    recv == len) {
  3184				cifs_dbg(VFS, "RFC 1002 negative session response with error 0x%x\n",
  3185					 resp.trailer.neg_ses_resp_error_code);
  3186				switch (resp.trailer.neg_ses_resp_error_code) {
  3187				case RFC1002_NOT_LISTENING_CALLED:
  3188					/* server does not listen for specified server name */
  3189					fallthrough;
  3190				case RFC1002_NOT_PRESENT:
  3191					/* server name is incorrect */
  3192					rc = -ENOENT;
  3193					cifs_dbg(VFS, "Server rejected NetBIOS servername %.15s\n",
  3194						 server->server_RFC1001_name[0] ?
  3195						 server->server_RFC1001_name :
  3196						 DEFAULT_CIFS_CALLED_NAME);
  3197					cifs_dbg(VFS, "Specify correct NetBIOS servername in source path or with -o servern= option\n");
  3198					break;
  3199				case RFC1002_NOT_LISTENING_CALLING:
  3200					/* client name was not accepted by server */
  3201					rc = -EACCES;
  3202					cifs_dbg(VFS, "Server rejected NetBIOS clientname %.15s\n",
  3203						 server->workstation_RFC1001_name[0] ?
  3204						 server->workstation_RFC1001_name :
  3205						 "LINUX_CIFS_CLNT");
  3206					cifs_dbg(VFS, "Specify correct NetBIOS clientname with -o netbiosname= option\n");
  3207					break;
  3208				case RFC1002_INSUFFICIENT_RESOURCE:
  3209					/* remote server resource error */
  3210					rc = -EREMOTEIO;
  3211					break;
  3212				case RFC1002_UNSPECIFIED_ERROR:
  3213				default:
  3214					/* other/unknown error */
  3215					rc = -EIO;
  3216					break;
  3217				}
  3218			} else {
  3219				cifs_dbg(VFS, "RFC 1002 negative session response\n");
  3220				rc = -EIO;
  3221			}
  3222			return rc;
  3223		case RFC1002_RETARGET_SESSION_RESPONSE:
  3224			cifs_dbg(VFS, "RFC 1002 retarget session response\n");
  3225			if (be16_to_cpu(resp.length) == sizeof(resp.trailer.retarget_resp)) {
  3226				len = sizeof(resp.trailer.retarget_resp);
  3227				iov.iov_base = &resp.trailer.retarget_resp;
  3228				iov.iov_len = len;
  3229				iov_iter_kvec(&msg.msg_iter, ITER_DEST, &iov, 1, len);
  3230				if (smb_recv_kvec(server, &msg, &recv) == 0 && recv == len) {
  3231					cifs_dbg(VFS, "Server wants to redirect connection\n");
  3232					cifs_dbg(VFS, "Remount with options -o ip=%pI4,port=%u\n",
  3233						 &resp.trailer.retarget_resp.retarget_ip_addr,
  3234						 be16_to_cpu(resp.trailer.retarget_resp.port));
  3235				}
  3236			}
  3237			cifs_dbg(VFS, "Closing connection\n");
  3238			/* FIXME: Should we automatically redirect to new retarget_resp server? */
  3239			return -EMULTIHOP;
  3240		default:
  3241			cifs_dbg(VFS, "RFC 1002 unknown response type 0x%x\n", resp.type);
  3242			return -EIO;
  3243		}
  3244	
  3245		return 0;
  3246	}
  3247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
