Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3C2C08A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 08:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503391; cv=none; b=P593BVygqh6voLJ7Td/TPJb+kglSaqDxqTqxymGkIeO2ojyirqFXDCpVookkjcGyOMXguy8U8hXBi9fV/DGSFnSFV5Fcr6LrcC+HaEBvfGpB3MWICyhf7ox0nnPTgFscW30P9ghQGO2gu5dVI7fYn0MO15MidVyF8nCyH/Ye4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503391; c=relaxed/simple;
	bh=SP0MEQhwvM3luH1Ax+JXGl6lHSXUZ1vmEIQJEDJYdzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iEgrIkM8O2kC3bl/WLBYzEUkqBncfKLW7QciM6wrSwd/Z9c776F0AYgXZqy0CNI9PWbWvrvgIEXx18yCzoEmTx5CDVj5Znaqxl55yJYGo6IhqvwlKEmLxKJH90sCu9fFvLZioyHbJYGrCz376GYQ1UHBifKjrnp9tIfiA/2xXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNNGUJ+h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNNGUJ+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769503390; x=1801039390;
  h=date:from:to:cc:subject:message-id;
  bh=SP0MEQhwvM3luH1Ax+JXGl6lHSXUZ1vmEIQJEDJYdzk=;
  b=mNNGUJ+h6Y1JZupBLVsPoeHPcYCK9Xx0EO2W6dOjnEZaMKHaj4/GxeMp
   bc70MRgvYk9GM9Dc7Wko1DZTw8H5OK/j9kNU3dCXBsNKXVqGRM/9F7w5B
   pqTp99ID/DxIuU+kH2ET0sACv9YCcxtW7mF5pQMzbpQcxu6t97bR1dOex
   hRyvKnmfvNhH51Dx2hrVgBOMm74gWeKTAbeltsGtDGSdRDFZVDXbDlxXi
   hJlmYvJZ2lXnXkQQAsEluAt+vDXRupPmwEZzJ04ScnqzGYxwuGTr6Z70x
   O1fON7xfUNNCF0GhXr+gmTCY4jMTO7e1/7la9q6EzZAV6eqgmwvlJGtn3
   w==;
X-CSE-ConnectionGUID: jAPFXZsdRkasQld7lIZisA==
X-CSE-MsgGUID: EujUSZ7zQD68cJbITCv71A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74556064"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="74556064"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:43:09 -0800
X-CSE-ConnectionGUID: jM2t+7/DROu9yLapjcH5xw==
X-CSE-MsgGUID: wbeqg7GZQWaIcCu1Vg3MAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208285923"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jan 2026 00:43:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkefB-00000000YAp-0z2X;
	Tue, 27 Jan 2026 08:43:05 +0000
Date: Tue, 27 Jan 2026 16:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bahubali B Gumaji <bahubali.bg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>,
 "Sang-Soo Lee" <constant.lee@samsung.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2]
 fs/smb/server/mgmt/user_session.c:98:58: error: 'struct ksmbd_conn' has no
 member named 'inet6_addr'; did you mean 'inet_addr'?
Message-ID: <202601271646.P2vIDioZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   8cc38d4af66aa19d0e67d4b148abd6c50de339f8
commit: 8cc38d4af66aa19d0e67d4b148abd6c50de339f8 [2/2] ksmbd: add procfs interface for runtime monitoring and statistics
config: mips-randconfig-r064-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271646.P2vIDioZ-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271646.P2vIDioZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271646.P2vIDioZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/server/mgmt/user_session.c: In function 'show_proc_session':
>> fs/smb/server/mgmt/user_session.c:98:58: error: 'struct ksmbd_conn' has no member named 'inet6_addr'; did you mean 'inet_addr'?
      seq_printf(m, "%-20s\t%pI6c\n", "client", &chan->conn->inet6_addr);
                                                             ^~~~~~~~~~
                                                             inet_addr
   fs/smb/server/mgmt/user_session.c: In function 'show_proc_sessions':
   fs/smb/server/mgmt/user_session.c:207:44: error: 'struct ksmbd_conn' has no member named 'inet6_addr'; did you mean 'inet_addr'?
       seq_printf(m, " %-40pI6c", &chan->conn->inet6_addr);
                                               ^~~~~~~~~~
                                               inet_addr


vim +98 fs/smb/server/mgmt/user_session.c

    80	
    81	static int show_proc_session(struct seq_file *m, void *v)
    82	{
    83		struct ksmbd_session *sess;
    84		struct ksmbd_tree_connect *tree_conn;
    85		struct ksmbd_share_config *share_conf;
    86		struct channel *chan;
    87		unsigned long id;
    88		int i = 0;
    89	
    90		sess = (struct ksmbd_session *)m->private;
    91		ksmbd_user_session_get(sess);
    92	
    93		i = 0;
    94		xa_for_each(&sess->ksmbd_chann_list, id, chan) {
    95		if (chan->conn->inet_addr)
    96			seq_printf(m, "%-20s\t%pI4c\n", "client", &chan->conn->inet_addr);
    97		else
  > 98			seq_printf(m, "%-20s\t%pI6c\n", "client", &chan->conn->inet6_addr);
    99		seq_printf(m, "%-20s\t%s\n", "user", session_user_name(sess));
   100		seq_printf(m, "%-20s\t%llu\n", "id", sess->id);
   101		seq_printf(m, "%-20s\t%s\n", "state", session_state_string(sess));
   102	
   103		seq_printf(m, "%-20s\t", "capabilities");
   104		ksmbd_proc_show_flag_names(m,
   105					   ksmbd_sess_cap_const_names,
   106					   ARRAY_SIZE(ksmbd_sess_cap_const_names),
   107					   chan->conn->vals->req_capabilities);
   108	
   109		if (sess->sign) {
   110			seq_printf(m, "%-20s\t", "signing");
   111			ksmbd_proc_show_const_name(m, "%s\t",
   112						   ksmbd_signing_const_names,
   113						   ARRAY_SIZE(ksmbd_signing_const_names),
   114						   le16_to_cpu(chan->conn->signing_algorithm));
   115		} else if (sess->enc) {
   116			seq_printf(m, "%-20s\t", "encryption");
   117			ksmbd_proc_show_const_name(m, "%s\t",
   118						   ksmbd_cipher_const_names,
   119						   ARRAY_SIZE(ksmbd_cipher_const_names),
   120						   le16_to_cpu(chan->conn->cipher_type));
   121		}
   122			i++;
   123		}
   124	
   125		seq_printf(m, "%-20s\t%d\n", "channels", i);
   126	
   127		i = 0;
   128		xa_for_each(&sess->tree_conns, id, tree_conn) {
   129			share_conf = tree_conn->share_conf;
   130			seq_printf(m, "%-20s\t%s\t%8d", "share",
   131				   share_conf->name, tree_conn->id);
   132			if (test_share_config_flag(share_conf, KSMBD_SHARE_FLAG_PIPE))
   133				seq_printf(m, " %s ", "pipe");
   134			else
   135				seq_printf(m, " %s ", "disk");
   136			seq_putc(m, '\n');
   137		}
   138	
   139		ksmbd_user_session_put(sess);
   140		return 0;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
