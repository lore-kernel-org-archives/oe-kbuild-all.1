Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31896212F8A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 18:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738693784; cv=none; b=pNQSeAkdQ3on1F/rhdSSF+jsvpxV6Geb2gJZJerq5qWuGvw9D1UKR08RaSoRhXHT5CYESawaocY10hi29e6OxWliiK5IGvoS6zpJj+qKYwycorWUH5UAe2RrkMcFOU9hp9s8C0fU74bUdMmSfX8EHlCluYgIpv3emkqlsk++opQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738693784; c=relaxed/simple;
	bh=agSECZoat0/fsf1kRhrSw+CTL2CJsQje6ZtTk5JJouQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpqYvHmKkKwmWhmnogh66k6rgfigyPKZZ2NZGSjcGDGEG8c/AzMp4gupOl1mlD18eh/LccN6PGD04IZqXa9NaQJMl7O9bMSJNiFRBdmxmuAeQF928E+Xf2c38iWNhD4O/L3dkpm2KflZhSHI7AK4gc8DOpzSl80jI/T2yivwR50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwMkNJbj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwMkNJbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738693782; x=1770229782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agSECZoat0/fsf1kRhrSw+CTL2CJsQje6ZtTk5JJouQ=;
  b=XwMkNJbjuIU551wPI/OSrsetGiSF+Na1r3B8dUuQZiwb1IySF8GpH5KH
   bdD1g3rp7hc3T9VFt/XFBYkomNFsbqMaW+4tNzQ3n6Hw5rV/EVFKlefL6
   sCQw9q0vLOOIwXozpcv3MtzBxZRnq8VRJ2UKDuiHKsTV++jb+FsEl2FgQ
   yPDw1R+Ju6+5Aor/cte8y0PbNaeo5Pv90hbU7FsethsWu1IISn/Tex+1b
   AA/Y0CRqXADJopXvtWXLgyQcOl8N5/AHXWQGdBtPB78M786/vpC5t07c4
   Ve4iHK+k4n9aeWxON2d0C84cZaUJR6YHUNq1Knbiz4inzubDGHThS1TYK
   A==;
X-CSE-ConnectionGUID: bZLIRYLATnmp8h3RgEQC9w==
X-CSE-MsgGUID: ImcztuCPQraJoNg83Zzdvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39390420"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39390420"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 10:29:41 -0800
X-CSE-ConnectionGUID: GJ8AWI0ySfKOQDfUYIZ7CQ==
X-CSE-MsgGUID: 7GJYtV3fTqmq9Jj/q22QOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115858048"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2025 10:29:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfNg1-000sqi-1y;
	Tue, 04 Feb 2025 18:29:37 +0000
Date: Wed, 5 Feb 2025 02:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Zijian Zhang <zijianzhang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Cong Wang <cong.wang@bytedance.com>,
	Amery Hung <amery.hung@bytedance.com>
Subject: [congwang:tcp_bpf 4/4] net/ipv4/tcp_bpf.c:127:12: warning:
 'tcp_bpf_ingress_backlog' defined but not used
Message-ID: <202502050205.KsmbuRTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git tcp_bpf
head:   d98266a1c1626a662b9712500b687adfdfef9bda
commit: d98266a1c1626a662b9712500b687adfdfef9bda [4/4] tcp_bpf: improve ingress redirection performance with message corking
config: sparc64-randconfig-002-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050205.KsmbuRTW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050205.KsmbuRTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050205.KsmbuRTW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_bpf.c:127:12: warning: 'tcp_bpf_ingress_backlog' defined but not used [-Wunused-function]
     127 | static int tcp_bpf_ingress_backlog(struct sock *sk, struct sock *sk_redir,
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/tcp_bpf_ingress_backlog +127 net/ipv4/tcp_bpf.c

   126	
 > 127	static int tcp_bpf_ingress_backlog(struct sock *sk, struct sock *sk_redir,
   128					   struct sk_msg *msg, u32 apply_bytes)
   129	{
   130		bool ingress_msg_empty = false;
   131		bool apply = apply_bytes;
   132		struct sk_psock *psock;
   133		struct sk_msg *tmp;
   134		u32 tot_size = 0;
   135		int ret = 0;
   136		u8 nonagle;
   137	
   138		psock = sk_psock_get(sk_redir);
   139		if (unlikely(!psock))
   140			return -EPIPE;
   141	
   142		spin_lock(&psock->backlog_msg_lock);
   143		/* If possible, coalesce the curr sk_msg to the last sk_msg from the
   144		 * psock->backlog_msg.
   145		 */
   146		if (!list_empty(&psock->backlog_msg)) {
   147			struct sk_msg *last;
   148	
   149			last = list_last_entry(&psock->backlog_msg, struct sk_msg, list);
   150			if (last->sk == sk) {
   151				int i = tcp_bpf_coalesce_msg(last, msg, &apply_bytes,
   152							     &tot_size);
   153	
   154				if (i == msg->sg.end || (apply && !apply_bytes))
   155					goto out_unlock;
   156			}
   157		}
   158	
   159		/* Otherwise, allocate a new sk_msg and transfer the data from the
   160		 * passed in msg to it.
   161		 */
   162		tmp = sk_msg_alloc(GFP_ATOMIC);
   163		if (!tmp) {
   164			ret = -ENOMEM;
   165			spin_unlock(&psock->backlog_msg_lock);
   166			goto error;
   167		}
   168	
   169		tmp->sk = sk;
   170		sock_hold(tmp->sk);
   171		tmp->sg.start = msg->sg.start;
   172		tcp_bpf_xfer_msg(tmp, msg, &apply_bytes, &tot_size);
   173	
   174		ingress_msg_empty = list_empty(&psock->ingress_msg);
   175		list_add_tail(&tmp->list, &psock->backlog_msg);
   176	
   177	out_unlock:
   178		spin_unlock(&psock->backlog_msg_lock);
   179		sk_wmem_queued_add(sk, tot_size);
   180	
   181		/* At this point, the data has been handled well. If one of the
   182		 * following conditions is met, we can notify the peer socket in
   183		 * the context of this system call immediately.
   184		 * 1. If the write buffer has been used up;
   185		 * 2. Or, the message size is larger than TCP_BPF_GSO_SIZE;
   186		 * 3. Or, the ingress queue was empty;
   187		 * 4. Or, the tcp socket is set to no_delay.
   188		 * Otherwise, kick off the backlog work so that we can have some
   189		 * time to wait for any incoming messages before sending a
   190		 * notification to the peer socket.
   191		 */
   192		nonagle = tcp_sk(sk)->nonagle;
   193		if (!sk_stream_memory_free(sk) ||
   194		    tot_size >= TCP_BPF_GSO_SIZE || ingress_msg_empty ||
   195		    (!(nonagle & TCP_NAGLE_CORK) && (nonagle & TCP_NAGLE_OFF))) {
   196			release_sock(sk);
   197			psock->backlog_work_delayed = false;
   198			sk_psock_backlog_msg(psock);
   199			lock_sock(sk);
   200		} else {
   201			sk_psock_run_backlog_work(psock, false);
   202		}
   203	
   204	error:
   205		sk_psock_put(sk_redir, psock);
   206		return ret;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
