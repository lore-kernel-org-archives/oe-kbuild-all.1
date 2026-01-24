Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31139190664
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769253792; cv=none; b=NbA9ydnEo5dU+MWMS+6rgzChp2qlYaRQcffkORHN9DxsogpEfYpCsNbclOOCQtWH+hj7zC93JIN5OQeJ6/grPpC/qsHqWHbbqBt4YzMqMQ4a67B9KKwksyljKmg+PZVZcDSRM+8bS3KDosI5DIpA8biRxxcDCq+o7TuGK6kAMqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769253792; c=relaxed/simple;
	bh=786gD9vqrattwUybVw8qFjU13dLAxGPphBcyPEg4KXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ghSJhsHgy4M3ZdfEdXjE+/rFyMwbN3d+aaOcSaeQDLtXd/fXZ6vWQa4FDa/q0myx4+etCY/IooTsF9J6A2FB4+U2HBOZy70Y6ygO2YPXceSVleaEwWGOos/oMiJFaMq33LHBEIUgz5u/A6BZ6NgnnfXj/lgQfAsNT7vt5QBTJ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ap73IX+Y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ap73IX+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769253792; x=1800789792;
  h=date:from:to:cc:subject:message-id;
  bh=786gD9vqrattwUybVw8qFjU13dLAxGPphBcyPEg4KXY=;
  b=Ap73IX+YJY7KsIhQm5MclBXGBzfkHD5pYv4EH6xkJg2pdOABU6vuwqe8
   dvLtALNJlBYhCQBQ4q4AN49HOfhMa82fP3Cg5yLb1r6XeHjHO2CXKZx/n
   p0spyuHvKm0izprMLyFGDuFff/izgfIvLi92dx3+5qlV092/McVaLiq5h
   gszJc/Tr/autKo03ClObyuIcArleJiYhv2U5k/zLyKClqGpHMpJbduWdb
   3zfwRTQcN9OBVzn5nZy4eWyAQd70Zp7c7Q56s1+xShcEB9V2+zI6PURjt
   OJJY25Mlb6ZcIgwBfsBJmfYEc65uWVaq7i6kgT0jwxZWpqmLjgefXYXFS
   Q==;
X-CSE-ConnectionGUID: QHaH1ELnRNSqQb519m1Obw==
X-CSE-MsgGUID: SxUkRSwERWWMWo31Pms+PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70538556"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="70538556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 03:23:11 -0800
X-CSE-ConnectionGUID: FPFKJ2/tQ7+uPdvvTXo5nQ==
X-CSE-MsgGUID: nwMfTJ9MRYC/oX3xMVQJiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="244864773"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jan 2026 03:23:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjbjO-00000000V82-33QJ;
	Sat, 24 Jan 2026 11:23:06 +0000
Date: Sat, 24 Jan 2026 19:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bahubali B Gumaji <bahubali.bg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2]
 fs/smb/server/connection.c:47:58: error: 'struct ksmbd_conn' has no member
 named 'inet6_addr'; did you mean 'inet_addr'?
Message-ID: <202601241950.C7Mc3Hra-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   165b1c2775ace8540bc0869e3fa92aed566fc193
commit: 165b1c2775ace8540bc0869e3fa92aed566fc193 [2/2] ksmbd: add procfs interface for runtime monitoring and statistics
config: i386-randconfig-001-20260124 (https://download.01.org/0day-ci/archive/20260124/202601241950.C7Mc3Hra-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241950.C7Mc3Hra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241950.C7Mc3Hra-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[6]: *** [scripts/Makefile.build:287: fs/smb/server/mgmt/user_session.o] Error 1 shuffle=920842454
   make[6]: *** [scripts/Makefile.build:287: fs/smb/server/connection.o] Error 1 shuffle=920842454
>> make[6]: *** No rule to make target 'fs/smb/server/proc.o', needed by 'fs/smb/server/ksmbd.o'.
   make[6]: *** [scripts/Makefile.build:287: fs/smb/server/smb2pdu.o] Error 1 shuffle=920842454
   make[6]: *** [scripts/Makefile.build:287: fs/smb/server/smb2ops.o] Error 1 shuffle=920842454
   make[6]: *** [scripts/Makefile.build:287: fs/smb/server/vfs.o] Error 1 shuffle=920842454
   make[6]: *** [scripts/Makefile.build:287: fs/smb/server/server.o] Error 1 shuffle=920842454
   make[6]: *** [scripts/Makefile.build:287: fs/smb/server/mgmt/tree_connect.o] Error 1 shuffle=920842454
   make[6]: Target 'fs/smb/server/' not remade because of errors.
--
   fs/smb/server/connection.c: In function 'proc_show_clients':
>> fs/smb/server/connection.c:47:58: error: 'struct ksmbd_conn' has no member named 'inet6_addr'; did you mean 'inet_addr'?
      47 |                         seq_printf(m, "%-20pI6c", &conn->inet6_addr);
         |                                                          ^~~~~~~~~~
         |                                                          inet_addr


vim +47 fs/smb/server/connection.c

    28	
    29	static int proc_show_clients(struct seq_file *m, void *v)
    30	{
    31		struct ksmbd_conn *conn;
    32		struct timespec64 now, t;
    33		int i;
    34	
    35		seq_printf(m, "#%-20s %-10s %-10s %-10s %-10s %-10s\n",
    36				"<name>", "<dialect>", "<credits>", "<open files>",
    37				"<requests>", "<last active>");
    38	
    39		down_read(&conn_list_lock);
    40		hash_for_each(conn_list, i, conn, hlist) {
    41			jiffies_to_timespec64(jiffies - conn->last_active, &t);
    42			ktime_get_real_ts64(&now);
    43			t = timespec64_sub(now, t);
    44			if (conn->inet_addr)
    45				seq_printf(m, "%-20pI4c", &conn->inet_addr);
    46			else
  > 47				seq_printf(m, "%-20pI6c", &conn->inet6_addr);
    48			seq_printf(m, "   0x%-10x %-10u %-12d %-10d %ptT\n",
    49				   conn->dialect,
    50				   conn->total_credits,
    51				   atomic_read(&conn->stats.open_files_count),
    52				   atomic_read(&conn->req_running),
    53				   &t);
    54		}
    55		up_read(&conn_list_lock);
    56		return 0;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
