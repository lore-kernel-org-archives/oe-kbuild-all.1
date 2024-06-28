Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2628018046
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 03:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719544364; cv=none; b=BfvxHk5t9r42yh1e//HloMfSh5m0yxvHMKpeHn5HLlg2/ZkeoHjk0I9MsbIX6+rUACu2jYGFtEk6UTU4puqUnCoeoHJFMIn8pHP3KWPqb57L0iVsLUtfirE0A2pIeFXwBdSdPrhWEdOBKCJEP50HmXmlxUqMpXC4aoMt9X6kbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719544364; c=relaxed/simple;
	bh=KpKvoNe31q1ir/EC3qbB097EM0L4TCKV56PaZiAfSFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHQVYeJW8tlrqSf/Mtpn+5VWzd3SBslT5LbUUosLIUyCKRpLPJ2fJxrAvbTtOmp/5iYhlK2Rgklpm/qReGN8rBr31SBvzt6yFYo0+dG4+jQFgzYEss+kQmyA2DUQ5doFF69/liMQnFsHNFOb/kwy/9fZihdLxzzUdy0LMlx+o5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNH2svvH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNH2svvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719544363; x=1751080363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KpKvoNe31q1ir/EC3qbB097EM0L4TCKV56PaZiAfSFw=;
  b=PNH2svvHjccalso4i9ZCOjaBHq/eIM3yLZiGYJkD31/o5Bm+S9b5BtFf
   6sVkv63x1Gu4VaQ3HQCirTdFykb8qf9/0PHVKfHmcT12mq0sJT5u1I7+J
   UnWy5QsmyAHeuszo9Mwma/uEibni5+Z56k5uBAX1tLUCJWIIr6jJak1mT
   z6iHhcs+svksK1e4NEfFVl2Zh5ZRoRV0HC0zysC/3YCF76k5MRjKR3JEW
   sEgm1x4SlY++rEk5pb5eKBGktW922WrxO3ZtcA8D9zGAiLAV0900NzJok
   dXxqYlGXKAe3yK/PCbkliBsNo4fBHWF9qb/9JJ5vg/0nE7AAgykj1eCfQ
   g==;
X-CSE-ConnectionGUID: saNiMMPhTv+5hK2y6+ov7w==
X-CSE-MsgGUID: vL4HQbvYQN6+veDNzhMy2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="20586078"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="20586078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 20:12:42 -0700
X-CSE-ConnectionGUID: Jsd8QtN4TXia8baFcb1tSw==
X-CSE-MsgGUID: jz6j91dmSHWQE3tOo9P3Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="44510188"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Jun 2024 20:12:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN22P-000Gko-1U;
	Fri, 28 Jun 2024 03:12:37 +0000
Date: Fri, 28 Jun 2024 11:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: zijianzhang@bytedance.com, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, edumazet@google.com,
	willemdebruijn.kernel@gmail.com, cong.wang@bytedance.com,
	xiaochun.lu@bytedance.com, Zijian Zhang <zijianzhang@bytedance.com>
Subject: Re: [PATCH net-next v6 2/4] sock: support copy cmsg to userspace in
 TX path
Message-ID: <202406281051.NAiS477l-lkp@intel.com>
References: <20240626193403.3854451-3-zijianzhang@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626193403.3854451-3-zijianzhang@bytedance.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/zijianzhang-bytedance-com/selftests-fix-OOM-problem-in-msg_zerocopy-selftest/20240627-150801
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240626193403.3854451-3-zijianzhang%40bytedance.com
patch subject: [PATCH net-next v6 2/4] sock: support copy cmsg to userspace in TX path
config: i386-randconfig-062-20240628 (https://download.01.org/0day-ci/archive/20240628/202406281051.NAiS477l-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281051.NAiS477l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281051.NAiS477l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/socket.c:2635:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *msg_control @@     got void [noderef] __user *[noderef] __user msg_control @@
   net/socket.c:2635:30: sparse:     expected void *msg_control
   net/socket.c:2635:30: sparse:     got void [noderef] __user *[noderef] __user msg_control
>> net/socket.c:2629:49: sparse: sparse: dereference of noderef expression

vim +2635 net/socket.c

  2623	
  2624	static int sendmsg_copy_cmsg_to_user(struct msghdr *msg_sys,
  2625					     struct user_msghdr __user *umsg)
  2626	{
  2627		struct compat_msghdr __user *umsg_compat =
  2628					(struct compat_msghdr __user *)umsg;
> 2629		unsigned long cmsg_ptr = (unsigned long)umsg->msg_control;
  2630		unsigned int flags = msg_sys->msg_flags;
  2631		struct msghdr msg_user = *msg_sys;
  2632		struct cmsghdr *cmsg;
  2633		int err;
  2634	
> 2635		msg_user.msg_control = umsg->msg_control;
  2636		msg_user.msg_control_is_user = true;
  2637		for_each_cmsghdr(cmsg, msg_sys) {
  2638			if (!CMSG_OK(msg_sys, cmsg))
  2639				break;
  2640			if (cmsg_copy_to_user(cmsg))
  2641				put_cmsg(&msg_user, cmsg->cmsg_level, cmsg->cmsg_type,
  2642					 cmsg->cmsg_len - sizeof(*cmsg), CMSG_DATA(cmsg));
  2643		}
  2644	
  2645		err = __put_user((msg_sys->msg_flags & ~MSG_CMSG_COMPAT), COMPAT_FLAGS(umsg));
  2646		if (err)
  2647			return err;
  2648		if (MSG_CMSG_COMPAT & flags)
  2649			err = __put_user((unsigned long)msg_user.msg_control - cmsg_ptr,
  2650					 &umsg_compat->msg_controllen);
  2651		else
  2652			err = __put_user((unsigned long)msg_user.msg_control - cmsg_ptr,
  2653					 &umsg->msg_controllen);
  2654		return err;
  2655	}
  2656	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
