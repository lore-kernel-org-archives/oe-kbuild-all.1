Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB02222AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765394212; cv=none; b=r2Zhal7ukcIMSvU3S4k39hqktudvBVwhT29u09UKR41MyKd0Y9XQYFr/BTaTlc7GARXgs+h5L4AqfdklSmC97hu9nuA3HBX/z/zWv1Zzfggd44nm3jeFhTq2xINQcXoHj2yIjCc0FNQt1XCnD+7SZ4DituEmRZreHoQaXPAANeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765394212; c=relaxed/simple;
	bh=5+4cOlOLAQRILogkhtckBVnU1YA5m5FQy8V2fEL5RIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kO8S8rFUG3NmBKfL7idmSklxmRi2LJBk9najw46jB1H7Oax4vb0AnOueKT8eSenuHgmk83xKphhTuofCOKYkfQXdq2n4z6OPDdfUh8rnRiz1Zin4kxHFSP+9BR37FJjjvilqIK4B/zWw9G8+q9m1bnicG4n4Cejw8C+YLHu1Id0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P46KqMwE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P46KqMwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765394210; x=1796930210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+4cOlOLAQRILogkhtckBVnU1YA5m5FQy8V2fEL5RIM=;
  b=P46KqMwETkUGGL2dqP6j/hcev+dI4A0Rx3N4Qydq4gyKA53k6SfHMvAK
   SewGbT6Miz75OJV7QZX/HfnEz50ignCP6X9+jaHlvQwEe4xIWEeS3gRg6
   pgervOOfj9UBIWj32kHyZy6Yq6G+JWZN1+XPm/j01nE5KU46XLZPyULxc
   7cMWguvWaI41sLIaZSZgTnoADoBhWO1cQ9stoj/jd91cdMIZ2nBVNxZAn
   1M7u/AMOgyzVMGaAKkqVL5bxzHMSG9z5fkH9YWRoLvg7JaXLxvHxIjpIS
   ffpwwmcDK4WP5T7zT5LjHb3k7LSK3+I1/lM0QzrKVSFqTukJgn38P4SlH
   w==;
X-CSE-ConnectionGUID: aIVi8ogDTrOVMkky0bCqzA==
X-CSE-MsgGUID: DBgyAC0aSuyYUt4NzomF7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="66555425"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="66555425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 11:16:49 -0800
X-CSE-ConnectionGUID: IgA+EeFpTvy2nkQRyzkZow==
X-CSE-MsgGUID: TnuRJuCLQFeXSd6hb4ISHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="197088448"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2025 11:16:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTPg6-000000003gD-1Wwz;
	Wed, 10 Dec 2025 19:16:46 +0000
Date: Thu, 11 Dec 2025 03:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 39/39]
 fs/smb/client/connect.c:3004:20: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202512110351.ndSShTUk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   3fe930d3788d26f7593523d883615b9eabe61f40
commit: 8e93857d8d5957136e070b2e1680c44bfafdd8dd [39/39] cifs: Fix establishing NetBIOS session for SMB2+ connection
config: x86_64-randconfig-122-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110351.ndSShTUk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110351.ndSShTUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110351.ndSShTUk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/connect.c:3004:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] length @@     got restricted __be16 [usertype] @@
   fs/smb/client/connect.c:3004:20: sparse:     expected unsigned short [addressable] [assigned] [usertype] length
   fs/smb/client/connect.c:3004:20: sparse:     got restricted __be16 [usertype]

vim +3004 fs/smb/client/connect.c

  2958	
  2959	static int
  2960	ip_rfc1001_connect(struct TCP_Server_Info *server)
  2961	{
  2962		int rc = 0;
  2963		/*
  2964		 * some servers require RFC1001 sessinit before sending
  2965		 * negprot - BB check reconnection in case where second
  2966		 * sessinit is sent but no second negprot
  2967		 */
  2968		struct rfc1002_session_packet req = {};
  2969		struct msghdr msg = {};
  2970		struct kvec iov = {};
  2971		unsigned int len;
  2972		size_t sent;
  2973	
  2974		req.trailer.session_req.called_len = sizeof(req.trailer.session_req.called_name);
  2975	
  2976		if (server->server_RFC1001_name[0] != 0)
  2977			rfc1002mangle(req.trailer.session_req.called_name,
  2978				      server->server_RFC1001_name,
  2979				      RFC1001_NAME_LEN_WITH_NULL);
  2980		else
  2981			rfc1002mangle(req.trailer.session_req.called_name,
  2982				      DEFAULT_CIFS_CALLED_NAME,
  2983				      RFC1001_NAME_LEN_WITH_NULL);
  2984	
  2985		req.trailer.session_req.calling_len = sizeof(req.trailer.session_req.calling_name);
  2986	
  2987		/* calling name ends in null (byte 16) from old smb convention */
  2988		if (server->workstation_RFC1001_name[0] != 0)
  2989			rfc1002mangle(req.trailer.session_req.calling_name,
  2990				      server->workstation_RFC1001_name,
  2991				      RFC1001_NAME_LEN_WITH_NULL);
  2992		else
  2993			rfc1002mangle(req.trailer.session_req.calling_name,
  2994				      "LINUX_CIFS_CLNT",
  2995				      RFC1001_NAME_LEN_WITH_NULL);
  2996	
  2997		/*
  2998		 * As per rfc1002, @len must be the number of bytes that follows the
  2999		 * length field of a rfc1002 session request payload.
  3000		 */
  3001		len = sizeof(req.trailer.session_req);
  3002		req.type = RFC1002_SESSION_REQUEST;
  3003		req.flags = 0;
> 3004		req.length = cpu_to_be16(len);
  3005		len += offsetof(typeof(req), trailer.session_req);
  3006		iov.iov_base = &req;
  3007		iov.iov_len = len;
  3008		iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &iov, 1, len);
  3009		rc = smb_send_kvec(server, &msg, &sent);
  3010		if (rc < 0 || len != sent)
  3011			return (rc == -EINTR || rc == -EAGAIN) ? rc : -ECONNABORTED;
  3012	
  3013		/*
  3014		 * RFC1001 layer in at least one server requires very short break before
  3015		 * negprot presumably because not expecting negprot to follow so fast.
  3016		 * This is a simple solution that works without complicating the code
  3017		 * and causes no significant slowing down on mount for everyone else
  3018		 */
  3019		usleep_range(1000, 2000);
  3020	
  3021		return 0;
  3022	}
  3023	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
