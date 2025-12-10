Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5480A1F03DE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328604; cv=none; b=c6qtMEDGrhwHi0oJfw/FBsBulCyf9LJLpsn8ttb5zmhD67goSPFqU8ZEbmJS/63tznbKHytjmdo0F4s/Ay+g6HKq0bnJNYD8AMbkJnysixuk7Kkgl9KWonfzUgj8xzFqqKALUBZyhrs78X1JCZ8MSh8SxKb8E01wJJqT0WPrNT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328604; c=relaxed/simple;
	bh=VFNR/+JPcsy5ECN/nmr1+lTxNv1S5xLpOPzVhmmxLhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqZANnSmGKUl+r2IjoH2o+GlNLzOwi2BDO9NPezRQoKQA1Nx2s2R5UDXqH3JCkFlIUFrnQwdfQbY/L/wOz6dp20XRj5LmPYN+kzspRdB30WD6qdyDxcTAjqyJmDMQMnMOc2LDjQgHEWI+NvP07a9WVIVVLoee02xz+02y04QRzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oLGLM09y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oLGLM09y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765328603; x=1796864603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFNR/+JPcsy5ECN/nmr1+lTxNv1S5xLpOPzVhmmxLhk=;
  b=oLGLM09yNaP7smu2qc5QnY64IF7yyayircwlFwuCsv/ozoFgDxdF9k1I
   RE7iWRuKiCnt1l2BZ4Ddy9PInCBjUmZHvC5/W453e4+fDu6IT6d8btwSE
   PPhG9V/xDTQuj8fxm2ZECtwqyNP4pZL8y2sL12ODgOHk+Lzo38L+Aq7z3
   7J2ULKMOxuGqaUleNi+T3sUD/2/R3Q/0Uzpp1SFksHVgO4bn32xWjZvtt
   25eY/1lkUIHPmgpP73FqVS9Bz04wxUMe6870sArI9YdE6Ni85HTeCKA5h
   9PV81teQaWkVcmndh1f/OyZkp+HeiJ1GIzmZXRoz5YC28uhPUiDYy38PI
   A==;
X-CSE-ConnectionGUID: TsMckAGJRvW21x44+ZfX2A==
X-CSE-MsgGUID: WF+phNL4QEmsbURwCNFxjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54840120"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="54840120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 17:03:23 -0800
X-CSE-ConnectionGUID: QmqbLpBlTpKw8+G4WhH+Wg==
X-CSE-MsgGUID: 6wUZAechQaKIwoQt6+xmcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="227408666"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 17:03:21 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT8bv-000000002Qv-2IB7;
	Wed, 10 Dec 2025 01:03:19 +0000
Date: Wed, 10 Dec 2025 09:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Steve French <stfrench@microsoft.com>
Subject: fs/smb/server/mgmt/user_session.c:236:8-27: WARNING:
 atomic_dec_and_test variation before object free at line 232.
Message-ID: <202512100842.3CPKchLh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
commit: fa4cdb8cbca7d6cb6aa13e4d8d83d1103f6345db ksmbd: fix session use-after-free in multichannel connection
date:   8 months ago
config: arc-randconfig-r051-20251210 (https://download.01.org/0day-ci/archive/20251210/202512100842.3CPKchLh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100842.3CPKchLh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/server/mgmt/user_session.c:236:8-27: WARNING: atomic_dec_and_test variation before object free at line 232.
   fs/smb/server/mgmt/user_session.c:236:8-27: WARNING: atomic_dec_and_test variation before object free at line 237.
   fs/smb/server/mgmt/user_session.c:236:8-27: WARNING: atomic_dec_and_test variation before object free at line 252.
   fs/smb/server/mgmt/user_session.c:256:7-26: WARNING: atomic_dec_and_test variation before object free at line 252.
   fs/smb/server/mgmt/user_session.c:256:7-26: WARNING: atomic_dec_and_test variation before object free at line 257.
   fs/smb/server/mgmt/user_session.c:333:10-29: WARNING: atomic_dec_and_test variation before object free at line 334.

vim +236 fs/smb/server/mgmt/user_session.c

   218	
   219	void ksmbd_sessions_deregister(struct ksmbd_conn *conn)
   220	{
   221		struct ksmbd_session *sess;
   222		unsigned long id;
   223	
   224		down_write(&sessions_table_lock);
   225		if (conn->binding) {
   226			int bkt;
   227			struct hlist_node *tmp;
   228	
   229			hash_for_each_safe(sessions_table, bkt, tmp, sess, hlist) {
   230				if (!ksmbd_chann_del(conn, sess) &&
   231				    xa_empty(&sess->ksmbd_chann_list)) {
 > 232					hash_del(&sess->hlist);
   233					down_write(&conn->session_lock);
   234					xa_erase(&conn->sessions, sess->id);
   235					up_write(&conn->session_lock);
 > 236					if (atomic_dec_and_test(&sess->refcnt))
   237						ksmbd_session_destroy(sess);
   238				}
   239			}
   240		}
   241	
   242		down_write(&conn->session_lock);
   243		xa_for_each(&conn->sessions, id, sess) {
   244			unsigned long chann_id;
   245			struct channel *chann;
   246	
   247			xa_for_each(&sess->ksmbd_chann_list, chann_id, chann) {
   248				if (chann->conn != conn)
   249					ksmbd_conn_set_exiting(chann->conn);
   250			}
   251	
   252			ksmbd_chann_del(conn, sess);
   253			if (xa_empty(&sess->ksmbd_chann_list)) {
   254				xa_erase(&conn->sessions, sess->id);
   255				hash_del(&sess->hlist);
   256				if (atomic_dec_and_test(&sess->refcnt))
   257					ksmbd_session_destroy(sess);
   258			}
   259		}
   260		up_write(&conn->session_lock);
   261		up_write(&sessions_table_lock);
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
