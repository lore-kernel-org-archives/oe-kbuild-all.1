Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C71339BD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 20:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716754395; cv=none; b=BtUXmoe3Pr0JPOCDEyuWshNwaCQ0i6W0MGJW+2k7NXwUnk7G4hSPNbFhuJYd/qeuq4lNR4/X8dAHupWQncv6vOvgYhiUwB1wKHRBYTNRX7iaq/trIl+XmouKrkH824w7UtcBjKMRRaEdyzZ4woSszQgyvJgg4mqgsD5KFUSp2FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716754395; c=relaxed/simple;
	bh=X7S8WccHC/vzsJjtfQpPKoo2cUPuRuxKofEKDY5aClY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JM/tw7mMdTtEPXRwDhj9awjugvR7cHUuPB2WRA0xYpqppstRm7dAPWp9tCmuy/asah0gEDDr6dSdPZ9KJdoSXu0EaMqA8bDCEv7vvMTRmFakPhkak/1ZWB2IYazwNVwlRVWrUmnDSOgeiCvFXlMVX7DW6DRO9nfp2A3S6+k/M1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbRrZTTQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbRrZTTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716754392; x=1748290392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7S8WccHC/vzsJjtfQpPKoo2cUPuRuxKofEKDY5aClY=;
  b=SbRrZTTQBEqPxDrtd2eOjSPHaEXQvJwqFvQMlkNXAFsXgRWnq7lgK3Qf
   itkCoqGfY6Oh9oza9PrVp8UtTI7yzNGGPxdDpKYfog5hp4AQbZrKoCKvT
   SeR4TnTkk18TVa55ndtw14W9YLQ4xNGpKg8sp2/K6OV2cJLqjFn8Nkv5q
   /3KHsdtxHt8ELCAVTa5cSO8y3uBsiqBbz83UKJCbc8F4e9Bjd4Pscx5W9
   uXeSkj2ejThwUHrbGUAABKj5Go1BZdYS0iJtNArqi3ONpTLsUxdHGoquD
   zMTQkERJeyea4BT3mPaL4NiACxNVcO/NbuRR9DzP5DyhalQHARDfVahPF
   A==;
X-CSE-ConnectionGUID: EMsgNpqRR3ykA368k6qWLQ==
X-CSE-MsgGUID: hVp4ZsIhTuG6dkqh950chg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12842252"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="12842252"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 13:13:12 -0700
X-CSE-ConnectionGUID: Rv/5ZwMmQI69A1QcyOWDfw==
X-CSE-MsgGUID: IBlq/nwvQMCdGQIWcvtq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="39396228"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 May 2024 13:13:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBKEu-0008TH-2k;
	Sun, 26 May 2024 20:13:08 +0000
Date: Mon, 27 May 2024 04:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cong.wang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [congwang:bpf 1/1] net/ipv4/tcp_bpf.c:52:8: error: implicit
 declaration of function '__sk_wmem_schedule'; did you mean
 '__sk_rmem_schedule'?
Message-ID: <202405270336.2oSbgkuD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git bpf
head:   8325e39591226e0ab23a868609b5959cafe31b4c
commit: 8325e39591226e0ab23a868609b5959cafe31b4c [1/1] use sk_rmem_schedule()
config: i386-buildonly-randconfig-002-20240527 (https://download.01.org/0day-ci/archive/20240527/202405270336.2oSbgkuD-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405270336.2oSbgkuD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405270336.2oSbgkuD-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp_bpf.c: In function 'bpf_tcp_ingress':
>> net/ipv4/tcp_bpf.c:52:8: error: implicit declaration of function '__sk_wmem_schedule'; did you mean '__sk_rmem_schedule'? [-Werror=implicit-function-declaration]
      if (!__sk_wmem_schedule(sk, size, false)) {
           ^~~~~~~~~~~~~~~~~~
           __sk_rmem_schedule
   cc1: some warnings being treated as errors


vim +52 net/ipv4/tcp_bpf.c

    31	
    32	static int bpf_tcp_ingress(struct sock *sk, struct sk_psock *psock,
    33				   struct sk_msg *msg, u32 apply_bytes, int flags)
    34	{
    35		bool apply = apply_bytes;
    36		struct scatterlist *sge;
    37		u32 size, copied = 0;
    38		struct sk_msg *tmp;
    39		int i, ret = 0;
    40	
    41		tmp = kzalloc(sizeof(*tmp), __GFP_NOWARN | GFP_KERNEL);
    42		if (unlikely(!tmp))
    43			return -ENOMEM;
    44	
    45		lock_sock(sk);
    46		tmp->sg.start = msg->sg.start;
    47		i = msg->sg.start;
    48		do {
    49			sge = sk_msg_elem(msg, i);
    50			size = (apply && apply_bytes < sge->length) ?
    51				apply_bytes : sge->length;
  > 52			if (!__sk_wmem_schedule(sk, size, false)) {
    53				if (!copied)
    54					ret = -ENOMEM;
    55				break;
    56			}
    57	
    58			sk_mem_charge(sk, size);
    59			sk_msg_xfer(tmp, msg, i, size);
    60			copied += size;
    61			if (sge->length)
    62				get_page(sk_msg_page(tmp, i));
    63			sk_msg_iter_var_next(i);
    64			tmp->sg.end = i;
    65			if (apply) {
    66				apply_bytes -= size;
    67				if (!apply_bytes) {
    68					if (sge->length)
    69						sk_msg_iter_var_prev(i);
    70					break;
    71				}
    72			}
    73		} while (i != msg->sg.end);
    74	
    75		if (!ret) {
    76			msg->sg.start = i;
    77			sk_psock_queue_msg(psock, tmp);
    78			sk_psock_data_ready(sk, psock);
    79		} else {
    80			sk_msg_free(sk, tmp);
    81			kfree(tmp);
    82		}
    83	
    84		release_sock(sk);
    85		return ret;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
