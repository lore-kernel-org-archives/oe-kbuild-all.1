Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251C28828
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732428238; cv=none; b=G5v+xR/yAxZceeL+kUC8ETvUeuDumM38jLz20e9oMooEbLGcYd4WAucq+c6spt/amM4/ieSW+o99XDvp/PklXeCCXGTsTLEYpmluWAokLA+t8MElrjwx66lWZIwi70A7x8QDs4SODMx9a73BHRJmsosyG5zBhEgaVFUNbe5nEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732428238; c=relaxed/simple;
	bh=g+4+qN9q4FSWKPVN9z8ReydVApbBd6xsCak4nOaHzpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eyT+YHkozSF72G60ZcYIna59OxRzZtePxKHVegHCRsGs0v2StzPHoIjfs1qNTOCjYeXe7SdkoHJ/G+ZvggoO5wENWDPUlOXEnWPLTmgICP4SWPFSAWXuI7KxrGC3fbsx5p+PUMcIkLEa//Juf2AXN7QfcWBgNKWDY4lchtOS4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWAs4Ja1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWAs4Ja1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732428236; x=1763964236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g+4+qN9q4FSWKPVN9z8ReydVApbBd6xsCak4nOaHzpw=;
  b=bWAs4Ja1dkSz1cRXku8Vpyhbwa5jvrClB5wVDby3/UcEjLJxRMQLs0qc
   szzs0ZGw+3ZSiG1YyAUHUT41pAtQh5U3BbdzPB88vnO/sT4UPjpL728Hn
   H3Dx1hqcF2Kt/pecdU/2rdARFBDCbN4j5P9JUH+pts5LMGHbXvErKWe2S
   nmhsYsHvX+g7zb3IWb1BrBL6yljIjL6QrSVmwaWJbS7pksyVUvl+eVHno
   EWfRw/xZQGXJiJo0JnwFhbrnvDVo0CfWestYsQaA5WQCLl9cJ38SzP5lE
   FzpY20X5weFe4R0elKYD0Iy9OpcJL/5EaYWthhV076a+lub0MCLNWoxN8
   g==;
X-CSE-ConnectionGUID: cZx02SQwRqqM3zTrfg0Obg==
X-CSE-MsgGUID: ZlT3Yh0vTceCMi3evOLWKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="57941272"
X-IronPort-AV: E=Sophos;i="6.12,180,1728975600"; 
   d="scan'208";a="57941272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 22:03:55 -0800
X-CSE-ConnectionGUID: G3rpztuURo2ApiMP5eBSIQ==
X-CSE-MsgGUID: y4GtNrqQQK6P8ABEScrkvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,180,1728975600"; 
   d="scan'208";a="128456003"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Nov 2024 22:03:53 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tF5ip-0004td-1n;
	Sun, 24 Nov 2024 06:03:51 +0000
Date: Sun, 24 Nov 2024 14:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: Zijian Zhang <zijianzhang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Cong Wang <cong.wang@bytedance.com>,
	Amery Hung <amery.hung@bytedance.com>
Subject: [congwang:bpf-next 4/4] net/ipv4/tcp_bpf.c:32:12: warning:
 'tcp_bpf_ingress_backlog' defined but not used
Message-ID: <202411241313.3XYQWmkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git bpf-next
head:   c46b33a6bbd017d6d15896d0833748ebc998fbd7
commit: 736b87f033f1915a306ad94d42aa021875655c50 [4/4] tcp_bpf: improve ingress performance with message corking
config: loongarch-randconfig-001-20241124 (https://download.01.org/0day-ci/archive/20241124/202411241313.3XYQWmkU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241124/202411241313.3XYQWmkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411241313.3XYQWmkU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_bpf.c:32:12: warning: 'tcp_bpf_ingress_backlog' defined but not used [-Wunused-function]
      32 | static int tcp_bpf_ingress_backlog(struct sk_psock *psock_from,
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/tcp_bpf_ingress_backlog +32 net/ipv4/tcp_bpf.c

    31	
  > 32	static int tcp_bpf_ingress_backlog(struct sk_psock *psock_from,
    33					   struct sock *sk_redir,
    34					   struct sk_msg *msg, u32 apply_bytes)
    35	{
    36		bool ingress_msg_empty, spin_lock_held = false;
    37		struct scatterlist *sge_from, *sge_to;
    38		struct sk_msg *last, *tmp = NULL;
    39		u32 size, tot_size = 0;
    40		struct sk_psock *psock;
    41		bool apply;
    42		int i;
    43	
    44		psock = sk_psock_get(sk_redir);
    45		if (unlikely(!psock))
    46			return -EPIPE;
    47	
    48		ingress_msg_empty = false;
    49		if (list_empty(&psock->backlog_msg))
    50			goto new_sk_msg;
    51	
    52		/* If possible, coalesce to the last sk_msg from the backlog_msg */
    53		spin_lock(&psock->backlog_msg_lock);
    54		last = list_last_entry(&psock->backlog_msg, struct sk_msg, list);
    55		if (list_empty(&psock->backlog_msg) || last->sk != psock_from->sk) {
    56			spin_unlock(&psock->backlog_msg_lock);
    57			goto new_sk_msg;
    58		}
    59	
    60		i = msg->sg.start;
    61		apply = apply_bytes;
    62		while (i != msg->sg.end) {
    63			int last_sge_idx;
    64	
    65			if (sk_msg_full(last))
    66				break;
    67			sge_from = sk_msg_elem(msg, i);
    68			last_sge_idx = last->sg.end;
    69			sk_msg_iter_var_prev(last_sge_idx);
    70			sge_to = &last->sg.data[last_sge_idx];
    71	
    72			size = (apply && apply_bytes < sge_from->length) ?
    73				apply_bytes : sge_from->length;
    74			if (sk_msg_try_coalesce_ok(last, last_sge_idx) &&
    75			    sg_page(sge_to) == sg_page(sge_from) &&
    76			    sge_to->offset + sge_to->length == sge_from->offset) {
    77				sge_to->length += size;
    78			} else {
    79				sge_to = &last->sg.data[last->sg.end];
    80				sg_unmark_end(sge_to);
    81				sg_set_page(sge_to, sg_page(sge_from), size, sge_from->offset);
    82				get_page(sg_page(sge_to));
    83				sk_msg_iter_next(last, end);
    84			}
    85			sge_from->length -= size;
    86			sge_from->offset += size;
    87			if (sge_from->length == 0) {
    88				put_page(sg_page(sge_to));
    89				sk_msg_iter_var_next(i);
    90			}
    91			msg->sg.size -= size;
    92			last->sg.size += size;
    93			tot_size += size;
    94	
    95			if (apply) {
    96				apply_bytes -= size;
    97				if (!apply_bytes)
    98					break;
    99			}
   100		}
   101		msg->sg.start = i;
   102	
   103		if (!apply_bytes || i == msg->sg.end)
   104			goto out;
   105		spin_lock_held = true;
   106	
   107	new_sk_msg:
   108		/* If we jump here from the beginning, the spin_lock is not held */
   109		tmp = sk_msg_alloc(GFP_ATOMIC);
   110		if (!tmp) {
   111			if (spin_lock_held)
   112				spin_unlock(&psock->backlog_msg_lock);
   113			return -ENOMEM;
   114		}
   115	
   116		tmp->sk = psock_from->sk;
   117		sock_hold(tmp->sk);
   118		tmp->sg.start = msg->sg.start;
   119	
   120		i = msg->sg.start;
   121		apply = apply_bytes;
   122		do {
   123			sge_from = sk_msg_elem(msg, i);
   124			size = (apply && apply_bytes < sge_from->length) ?
   125				apply_bytes : sge_from->length;
   126	
   127			sk_msg_xfer(tmp, msg, i, size);
   128			tot_size += size;
   129			if (sge_from->length)
   130				get_page(sk_msg_page(tmp, i));
   131			sk_msg_iter_var_next(i);
   132			tmp->sg.end = i;
   133			if (apply) {
   134				apply_bytes -= size;
   135				if (!apply_bytes) {
   136					if (sge_from->length)
   137						sk_msg_iter_var_prev(i);
   138					break;
   139				}
   140			}
   141		} while (i != msg->sg.end);
   142		msg->sg.start = i;
   143		if (!spin_lock_held) {
   144			spin_lock(&psock->backlog_msg_lock);
   145			ingress_msg_empty = list_empty(&psock->ingress_msg);
   146		}
   147		list_add_tail(&tmp->list, &psock->backlog_msg);
   148	
   149	out:
   150		spin_unlock(&psock->backlog_msg_lock);
   151	
   152		/* Cork bytes without waking up the other socket, except for two cases
   153		 * 1. The backlog size in this round is larger than GSO, we are sure
   154		 * that we can wake up the other socket now.
   155		 * 2. ingress_msg is empty. For latency, we should handle the first
   156		 * sk_msg immediately.
   157		 */
   158		if (tot_size >= 65536 || ingress_msg_empty) {
   159			release_sock(psock_from->sk);
   160			psock->backlog_work_delayed = false;
   161			sk_psock_backlog_msg(psock);
   162			lock_sock(psock_from->sk);
   163		} else {
   164			schedule_backlog_work(psock, false);
   165		}
   166	
   167		sk_psock_put(sk_redir, psock);
   168		return 0;
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
