Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D329170A11
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 15:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762616533; cv=none; b=bT7QYH7NeiwKRCEtC9aEEsplP/F6FnFEhoc/J6ynzzwlyTnxRfFtnQ23ZS97CSRiJB6JZnaUH/IR8y22EtVgReCk4sTUgItMyc9ma8qQ4XBpYc8WVPX4vhoult23bWGNxxTY72/otbm/o8XGOnJP5/gZ8juSdLDy7X2x7J3lYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762616533; c=relaxed/simple;
	bh=0LhJKYjeMgpc5xXYzHJoSK6GrnIhGCalth6OKc0L32Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdcRvlsxAeR0Nk/ZZn4gV2Iy0AU3IU54gIH4rK4IyVk7rQNFK5YuyyrJN0Tu5hV8bisOV40+lpnFBszMcFb+SOyfOVJ6g54ehB7HqPYVrTm+p+NJGJ7c4c9k814W6oFo3MKp5azpQzfVdwEtv2HA6QU6cM3j3KqbtrhIyKbBW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgeV19PJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgeV19PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762616532; x=1794152532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0LhJKYjeMgpc5xXYzHJoSK6GrnIhGCalth6OKc0L32Q=;
  b=KgeV19PJ3UyWOSWMeQNLntSpG232Jx7lrr5qLgZ+tu5F+qr++o600eI9
   oVD/a5m1amr5u5qIzl0FCVBXhX/HFefEmAFToQ1WhPsNQgHLd+P5Ek1zq
   AOzcKLpq2c3XF/2h3SIhYm+1cqeDc/n+vby+AJ4Ck4Ld9TjoTlC6uK+qd
   HChzZNBXLlCK+0BYq3Tn+OdKcpebnKS3jhjyU39wMaP/Vh211i7M5x4Q/
   MG0+ChOa2K1qh0+HdaK6Txq8xJDqKnLcgXy6b+gYiAqq5WbLXtZuwk443
   vZbDFscC7xcHG6Q3RXc4bto3Z6ZsXM8/TWjPzwVmQR4mRyYTjYHDJmDQc
   w==;
X-CSE-ConnectionGUID: +JGMmT9oQrKtzzHDYuFAiA==
X-CSE-MsgGUID: 1cNxmUfyThaQMqscRMboWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="63748552"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="63748552"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 07:42:11 -0800
X-CSE-ConnectionGUID: vmupxVOlTTKl1ELT/Su+nQ==
X-CSE-MsgGUID: 3Ygipu7MSuC9tJHpAkYddg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="187941951"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Nov 2025 07:42:10 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHl4q-0001Al-0q;
	Sat, 08 Nov 2025 15:42:08 +0000
Date: Sat, 8 Nov 2025 23:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC mptcp-next 3/6] mptcp: add sock_set_reuseaddr
Message-ID: <202511082301.xToSVe73-lkp@intel.com>
References: <32da8f2876b30d35602232e9021d312bd105b2de.1762485513.git.tanggeliang@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32da8f2876b30d35602232e9021d312bd105b2de.1762485513.git.tanggeliang@kylinos.cn>

Hi Geliang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mptcp/export]
[also build test WARNING on mptcp/export-net linus/master v6.18-rc4 next-20251107]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/mptcp-add-sock_set_nodelay/20251107-113907
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
patch link:    https://lore.kernel.org/r/32da8f2876b30d35602232e9021d312bd105b2de.1762485513.git.tanggeliang%40kylinos.cn
patch subject: [RFC mptcp-next 3/6] mptcp: add sock_set_reuseaddr
config: riscv-randconfig-002-20251108 (https://download.01.org/0day-ci/archive/20251108/202511082301.xToSVe73-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511082301.xToSVe73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511082301.xToSVe73-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/tcp.h:44,
                    from net/core/devmem.c:20:
>> include/net/mptcp.h:333:13: warning: 'mptcp_sock_set_reuseaddr' defined but not used [-Wunused-function]
     333 | static void mptcp_sock_set_reuseaddr(struct sock *sk) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/net/mptcp.h:331:13: warning: 'mptcp_sock_set_nodelay' defined but not used [-Wunused-function]
     331 | static void mptcp_sock_set_nodelay(struct sock *sk) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/mptcp_sock_set_reuseaddr +333 include/net/mptcp.h

   332	
 > 333	static void mptcp_sock_set_reuseaddr(struct sock *sk) { }
   334	#endif /* CONFIG_MPTCP */
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
