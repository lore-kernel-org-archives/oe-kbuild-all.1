Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812B0154433
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 02:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894551; cv=none; b=nRRYfpmogDbWNLCwZMm/217gojhzOAIyaWOGZU7NzG0xaKgFjUNIrwEDYvJKBAZhghZh8Mvcr5MOxC96OX1guQ9ZSklXFFC+2LlWwq+4pBdHrrV7qLpalOa+2YD5S5ggPvfRkD92qTzwp/UeaeBhtzQbpagAueaJY0q1/2qSrOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894551; c=relaxed/simple;
	bh=9Tn8YRuB791orSt2KRrOXjA7UVeFxC1Wm8XXrLDzrRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sig5MTa/W6wSJTF5C5tG/R9ezmCaDrkAAhjAja49KMuTJMa8qBa+5dRzRJ2gZOk8Uq/btVWoe5UPbr0Tjv33dpmUoca6ERX+/METWCF7lFPIUUOYtDrRhQlDybWf53qM+VSbxsPDOn/qHkkBUhN9NkdXaO8sakCrX3IN0LCqWmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+kdw0QM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+kdw0QM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738894549; x=1770430549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Tn8YRuB791orSt2KRrOXjA7UVeFxC1Wm8XXrLDzrRg=;
  b=g+kdw0QMJ4Px3RNjQu7Tgru9GJngyc4ROdYGK3misf1z8/X4B7vyysaD
   o4dPvnlIsgk6rc9nex5H7Q/F6bqkSg5kjjnWsyvXX2Tq8jC4a6G/6FLzN
   7lNz6Z/1paHd/DcUqlXPDsO7CYWxzbP1ylv+7afkNLQpLlP2jq7pSp1sp
   oLagZ9O9vaOXe7JAoYdH89Qs3+moyt1hnd/m0RxfSePZngpW/5PlHuuOZ
   WLvbNG/ZMmKgUzPXJBwKhzQC24VaDRhO0oY9R5a7N/80Ax+1etbkardak
   gD5aVAt92zkO6eZJIw+mVB4T+OsGGA3sT6x9goUz7+4fH6QiXcjb5wWX/
   w==;
X-CSE-ConnectionGUID: vAYtxB/gQzuXSguOzU+Wqg==
X-CSE-MsgGUID: tPscvQreTwqrM4qmY81zZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50510614"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="50510614"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 18:15:47 -0800
X-CSE-ConnectionGUID: ZwrGxTjeSEekQVbyIIZDAA==
X-CSE-MsgGUID: opE0eC1FR1q3jaq2FBVMaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116013794"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2025 18:15:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgDuB-000xdu-1T;
	Fri, 07 Feb 2025 02:15:43 +0000
Date: Fri, 7 Feb 2025 10:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Zijian Zhang <zijianzhang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Cong Wang <cong.wang@bytedance.com>,
	Amery Hung <amery.hung@bytedance.com>
Subject: [congwang:tcp_bpf 4/4] net/ipv4/tcp_bpf.c:92:13: warning:
 'tcp_bpf_xfer_msg' defined but not used
Message-ID: <202502071005.PFD8zsVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git tcp_bpf
head:   46723971531868f59e2750d734a2295c9de373b1
commit: 46723971531868f59e2750d734a2295c9de373b1 [4/4] tcp_bpf: improve ingress redirection performance with message corking
config: arm-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071005.PFD8zsVn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071005.PFD8zsVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071005.PFD8zsVn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_bpf.c:92:13: warning: 'tcp_bpf_xfer_msg' defined but not used [-Wunused-function]
      92 | static void tcp_bpf_xfer_msg(struct sk_msg *dst, struct sk_msg *msg,
         |             ^~~~~~~~~~~~~~~~
>> net/ipv4/tcp_bpf.c:32:12: warning: 'tcp_bpf_coalesce_msg' defined but not used [-Wunused-function]
      32 | static int tcp_bpf_coalesce_msg(struct sk_msg *last, struct sk_msg *msg,
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/tcp_bpf_xfer_msg +92 net/ipv4/tcp_bpf.c

    31	
  > 32	static int tcp_bpf_coalesce_msg(struct sk_msg *last, struct sk_msg *msg,
    33					u32 *apply_bytes_ptr, u32 *tot_size)
    34	{
    35		struct scatterlist *sge_from, *sge_to;
    36		u32 apply_bytes = *apply_bytes_ptr;
    37		bool apply = apply_bytes;
    38		int i = msg->sg.start;
    39		u32 size;
    40	
    41		while (i != msg->sg.end) {
    42			int last_sge_idx = last->sg.end;
    43	
    44			if (sk_msg_full(last))
    45				break;
    46	
    47			sge_from = sk_msg_elem(msg, i);
    48			sk_msg_iter_var_prev(last_sge_idx);
    49			sge_to = &last->sg.data[last_sge_idx];
    50	
    51			size = (apply && apply_bytes < sge_from->length) ?
    52				apply_bytes : sge_from->length;
    53			if (sk_msg_try_coalesce_ok(last, last_sge_idx) &&
    54			    sg_page(sge_to) == sg_page(sge_from) &&
    55			    sge_to->offset + sge_to->length == sge_from->offset) {
    56				sge_to->length += size;
    57			} else {
    58				sge_to = &last->sg.data[last->sg.end];
    59				sg_unmark_end(sge_to);
    60				sg_set_page(sge_to, sg_page(sge_from), size,
    61					    sge_from->offset);
    62				get_page(sg_page(sge_to));
    63				sk_msg_iter_next(last, end);
    64			}
    65	
    66			sge_from->length -= size;
    67			sge_from->offset += size;
    68	
    69			if (sge_from->length == 0) {
    70				put_page(sg_page(sge_to));
    71				sk_msg_iter_var_next(i);
    72			}
    73	
    74			msg->sg.size -= size;
    75			last->sg.size += size;
    76			*tot_size += size;
    77	
    78			if (apply) {
    79				apply_bytes -= size;
    80				if (!apply_bytes)
    81					break;
    82			}
    83		}
    84	
    85		if (apply)
    86			*apply_bytes_ptr = apply_bytes;
    87	
    88		msg->sg.start = i;
    89		return i;
    90	}
    91	
  > 92	static void tcp_bpf_xfer_msg(struct sk_msg *dst, struct sk_msg *msg,
    93				     u32 *apply_bytes_ptr, u32 *tot_size)
    94	{
    95		u32 apply_bytes = *apply_bytes_ptr;
    96		bool apply = apply_bytes;
    97		struct scatterlist *sge;
    98		int i = msg->sg.start;
    99		u32 size;
   100	
   101		do {
   102			sge = sk_msg_elem(msg, i);
   103			size = (apply && apply_bytes < sge->length) ?
   104				apply_bytes : sge->length;
   105	
   106			sk_msg_xfer(dst, msg, i, size);
   107			*tot_size += size;
   108			if (sge->length)
   109				get_page(sk_msg_page(dst, i));
   110			sk_msg_iter_var_next(i);
   111			dst->sg.end = i;
   112			if (apply) {
   113				apply_bytes -= size;
   114				if (!apply_bytes) {
   115					if (sge->length)
   116						sk_msg_iter_var_prev(i);
   117					break;
   118				}
   119			}
   120		} while (i != msg->sg.end);
   121	
   122		if (apply)
   123			*apply_bytes_ptr = apply_bytes;
   124		msg->sg.start = i;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
