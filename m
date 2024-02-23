Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D80D29B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708690389; cv=none; b=nVCRz2Az9+ZFNlQd9xMWhipaNX1ogE3dmDSwZGJFIVJkLCOgjcL8IoRUvXNv4orvrguE8rl4UfUbHjbl9KZ7aDfBNL7gxY2BzUZy13M6nPUgs8rDxhvp/o8WZ2EwcgZy/fLoCCPbhZ8y61SIO2nrr5py4GY3De3eFD/Paso4Hbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708690389; c=relaxed/simple;
	bh=ZGIRBlq6PO/00jBa/j7rzASUYHjKhp3ltjW6lYywqEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbRvfcRkYeN3qzcHoKKC/D7tK4u90WE+h8sEyWJSXkOJfryJi+0iAgpFbk4VoDq0ka28SgwlH/7hZU28hGnUgDB0GOjlD6QTAV7e4w5Bvt26iACWg1iaKGsbemx834OK1FRjRn+9fPCjNcEthB8/XELLEWIXgoAuMd3RFAFOR9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asNpR25d; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asNpR25d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708690388; x=1740226388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZGIRBlq6PO/00jBa/j7rzASUYHjKhp3ltjW6lYywqEQ=;
  b=asNpR25d5sLZOLYi9snpOk4AzJbGpzJ/55mlggPhnzhcudWWxVM3zfol
   w2xAppo1CIrFyehn+V7Fzlw73fLBn58cLvxl0F4mp51mSFUYNQbHcQMoM
   3Oa4rjW/wf49Z5vKhS/yiVWWqfBCPQRD3+5lZ2seP9z2Miax5grgK1AqX
   cdVOnE/98LDchXPcmS2CO7SrBaAKrrbu+rsTaCi2uOwOnnbXu44ZYt5w4
   9OkqoXz3wqvvIrwJ1S7jO21YkJZbo+pqM+ehpeKnOmdOWxjvN03z26sxt
   CaWcTP4uhdX/nWtSdsR5yLse2ZvZzUJwklS8sHSgYglwWr8sZA4itOAh6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2869147"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2869147"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 04:13:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5778657"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 04:13:06 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdUQJ-0007Uk-2Z;
	Fri, 23 Feb 2024 12:13:03 +0000
Date: Fri, 23 Feb 2024 20:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 19/20] net/smc: support smc inet with merge socks
Message-ID: <202402231924.Ig4QRMRd-lkp@intel.com>
References: <1708412505-34470-20-git-send-email-alibuda@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1708412505-34470-20-git-send-email-alibuda@linux.alibaba.com>

Hi Wythe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Wythe/net-export-partial-symbols-in-inet-inet6-proto_ops/20240220-190529
base:   net-next/main
patch link:    https://lore.kernel.org/r/1708412505-34470-20-git-send-email-alibuda%40linux.alibaba.com
patch subject: [RFC net-next 19/20] net/smc: support smc inet with merge socks
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240223/202402231924.Ig4QRMRd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231924.Ig4QRMRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231924.Ig4QRMRd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/smc/af_smc.c:3911:14: warning: no previous prototype for '__smc_inet_csk_accept' [-Wmissing-prototypes]
    3911 | struct sock *__smc_inet_csk_accept(struct sock *sk, int flags, int *err, bool kern, int next_state)
         |              ^~~~~~~~~~~~~~~~~~~~~
   net/smc/af_smc.c: In function 'smc_inet_setsockopt':
   net/smc/af_smc.c:4219:26: warning: variable 'smc' set but not used [-Wunused-but-set-variable]
    4219 |         struct smc_sock *smc;
         |                          ^~~
   net/smc/af_smc.c: In function 'smc_inet_release':
   net/smc/af_smc.c:4434:13: warning: variable 'old_state' set but not used [-Wunused-but-set-variable]
    4434 |         int old_state, rc;
         |             ^~~~~~~~~
--
   net/smc/smc_inet.c:148:35: warning: initialized field overwritten [-Woverride-init]
     148 |         .per_cpu_fw_alloc       = &tcp_memory_per_cpu_fw_alloc,
         |                                   ^
   net/smc/smc_inet.c:148:35: note: (near initialization for 'smc_inet6_prot.per_cpu_fw_alloc')
>> net/smc/smc_inet.c:320:5: warning: no previous prototype for 'smc_sk_wait_tcp_data' [-Wmissing-prototypes]
     320 | int smc_sk_wait_tcp_data(struct sock *sk, long *timeo, const struct sk_buff *skb)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/__smc_inet_csk_accept +3911 net/smc/af_smc.c

  3910	
> 3911	struct sock *__smc_inet_csk_accept(struct sock *sk, int flags, int *err, bool kern, int next_state)
  3912	{
  3913		struct sock *child;
  3914		int cur;
  3915	
  3916		child = inet_csk_accept(sk, flags | O_NONBLOCK, err, kern);
  3917		if (child) {
  3918			smc_sk(child)->listen_smc = smc_sk(sk);
  3919	
  3920			/* depends on syn_smc if next_state not specify */
  3921			if (next_state == SMC_NEGOTIATION_TBD)
  3922				next_state = tcp_sk(child)->syn_smc ? SMC_NEGOTIATION_PREPARE_SMC :
  3923					SMC_NEGOTIATION_NO_SMC;
  3924	
  3925			cur = smc_inet_sock_move_state(child, SMC_NEGOTIATION_TBD,
  3926						       next_state);
  3927			switch (cur) {
  3928			case SMC_NEGOTIATION_NO_SMC:
  3929				smc_sk_set_state(child, SMC_ACTIVE);
  3930				smc_switch_to_fallback(smc_sk(child), SMC_CLC_DECL_PEERNOSMC);
  3931				break;
  3932			case SMC_NEGOTIATION_PREPARE_SMC:
  3933				/* init as passive open smc sock */
  3934				smc_sock_init_passive(sk, child);
  3935				break;
  3936			default:
  3937				break;
  3938			}
  3939		}
  3940		return child;
  3941	}
  3942	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
