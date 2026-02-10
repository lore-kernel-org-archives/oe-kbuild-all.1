Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CEA33F390
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715476; cv=none; b=NrXGDYSBbgOaA9MjxhIRKwJZlJ8tQtOEHLnrXEp6ZNf9yG4oZRb9TH/jRg1RMWiVQ6SNarbAkwFAu782hGHeR1qisWbJVqTgFABkM9/HmrV+VusmJffNiCPx4eoQi0X3PAmGmK99VG70d6D0b9/dMx3iKcx5XmyJaSTdTk72miE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715476; c=relaxed/simple;
	bh=RiSEeB1uyJWd19XIkjmyCb/6KdG//peZV7aVZNV6SGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BFDobEOUVPGInuHLkOdp23Y4C9zR73biO2wmQtGnh4o6c/xwIFbjo7k1Mmx7YjrPm2uemAS29q5rbDTmSMx+hYiuteBDSOm7q8zIWdfdSxirJr/4zrEl63Sp1u3oN8uC80H6lHSvfI3h22nKh3VZqNscmKzjaQCPaHmYtptFGBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqdbQi8t; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqdbQi8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770715475; x=1802251475;
  h=date:from:to:cc:subject:message-id;
  bh=RiSEeB1uyJWd19XIkjmyCb/6KdG//peZV7aVZNV6SGI=;
  b=EqdbQi8tSy0XebAb+E6xOlVvwjrsGeu1RmNR29qCjpum0XetOT3iLpLw
   TougTPXX1HGvcAaljq+4+6UZLHzvlxCq5XGpyw9iL20fuOG+DeGrQyzk0
   ZdEGmxo1gEMwlLw+IzSmfWw2SeCxxTep1wq7pdX0FVDyeo9t8oj7EVSC5
   Zzox7xETubZT7HdnivC2IvsBunvfgw1qkVjHqbHiNIvTtr/PxZSx9onA9
   cf/PgxRAcL/jaLzGqrC/bNIDDfOThd9aCk4k4vA8PUcEG/6nBLH9G0J8i
   knsQmrUggZmcrIW4CSAp4V98bJVr1fRbUa2788SEvojI4JkSWVmF5wpV2
   Q==;
X-CSE-ConnectionGUID: N9J+uD0ESOqpixWwfclclg==
X-CSE-MsgGUID: ODPIrNTjTGGuRKJ5ze9c9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83208598"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83208598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:24:35 -0800
X-CSE-ConnectionGUID: gzXVQLBGTBWRkrZUXUWfQA==
X-CSE-MsgGUID: 91YCrKQDSxWHRU2d/TWZTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="234827964"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2026 01:24:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpjyw-00000000orU-3jVp;
	Tue, 10 Feb 2026 09:24:30 +0000
Date: Tue, 10 Feb 2026 17:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next 25/31]
 fs/smb/server/mgmt/user_session.c:215:65: error: 'struct ksmbd_conn' has no
 member named 'inet6_addr'; did you mean 'inet_addr'?
Message-ID: <202602101748.iMMBq7TR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next
head:   31b9028c77dc279d720412013e95b279b1385aed
commit: b38f99c1217ae04753340f0fdcd8f35bf56841dc [25/31] ksmbd: add procfs interface for runtime monitoring and statistics
config: x86_64-randconfig-006-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101748.iMMBq7TR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101748.iMMBq7TR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101748.iMMBq7TR-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/server/mgmt/user_session.c: In function 'show_proc_sessions':
>> fs/smb/server/mgmt/user_session.c:215:65: error: 'struct ksmbd_conn' has no member named 'inet6_addr'; did you mean 'inet_addr'?
     215 |                         seq_printf(m, " %-40pI6c", &chan->conn->inet6_addr);
         |                                                                 ^~~~~~~~~~
         |                                                                 inet_addr
--
   fs/smb/server/connection.c: In function 'proc_show_clients':
>> fs/smb/server/connection.c:47:58: error: 'struct ksmbd_conn' has no member named 'inet6_addr'; did you mean 'inet_addr'?
      47 |                         seq_printf(m, "%-20pI6c", &conn->inet6_addr);
         |                                                          ^~~~~~~~~~
         |                                                          inet_addr


vim +215 fs/smb/server/mgmt/user_session.c

   195	
   196	static int show_proc_sessions(struct seq_file *m, void *v)
   197	{
   198		struct ksmbd_session *session;
   199		struct channel *chan;
   200		int i;
   201		unsigned long id;
   202	
   203		seq_printf(m, "#%-40s %-15s %-10s %-10s\n",
   204			   "<client>", "<user>", "<sess_id>", "<state>");
   205	
   206		down_read(&sessions_table_lock);
   207		hash_for_each(sessions_table, i, session, hlist) {
   208			xa_for_each(&session->ksmbd_chann_list, id, chan) {
   209			down_read(&chan->conn->session_lock);
   210			ksmbd_user_session_get(session);
   211	
   212			if (chan->conn->inet_addr)
   213				seq_printf(m, " %-40pI4", &chan->conn->inet_addr);
   214			else
 > 215				seq_printf(m, " %-40pI6c", &chan->conn->inet6_addr);
   216			seq_printf(m, " %-15s %-10llu %-10s\n",
   217				   session_user_name(session),
   218				   session->id,
   219				   session_state_string(session));
   220	
   221			ksmbd_user_session_put(session);
   222			up_read(&chan->conn->session_lock);
   223		}
   224		}
   225		up_read(&sessions_table_lock);
   226		return 0;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
