Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E9F277035
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761243962; cv=none; b=OZXytiI+Ojtim9QvaUx1xFiiGCzNzFjmRjm/ET6bVfJ0lo7Ry5EUUtOEbyMG6/OUbPzoGTr42PyXj+3EEJbXO0m0MXyVbN43z9Ph39LmwE4wPkdwiiM9nnNpyk185Ou2uQ84nWXRvRIWJtLWt74SLUXWHLMso5Xr/NvODZk3oNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761243962; c=relaxed/simple;
	bh=yLXucJAwwy2i8pDUiFSKkY+/Z+V1pLNyaA//VAVy+zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akzVaOYX763SbG2l8cQmbdA6j+ybYUkh5BkJF/3xqeY31bSnXfPKpaRrznXrPqqMzI9siJ7SoeNtDSxMXCYkRoKN+OXUtbf8ny6jucEa0Wb6e+SiSjdMEO1HmjVDaqzlztDMEz0N0TSrvG266l7s9E8a0M5CEHULvCCMCV9H3Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzAI1KbJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzAI1KbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761243961; x=1792779961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yLXucJAwwy2i8pDUiFSKkY+/Z+V1pLNyaA//VAVy+zU=;
  b=JzAI1KbJhNXWR7vn5ZRoTZ4/ROmJ6vuaQUcYS4wnzH83HjCI1YN6aDs4
   RtqQgX8TKzFw3VVQ3R2zZaBNOIS80yQXspXDs1AIA/afn5NHcmJ+lryhe
   2uHwxh+y1UdmgmYSyVCWyqWE2d6J9fjpD8TcJUsMvJKAUpVdEvK7WWJtz
   L/SKvGhnd7t0yRNj31QpiKuTXPyRbK1i5nrWl9459YAMWC6vlo6IqTnDV
   5sZ+B1L5I5ewnZ0L46Rql/Gg1VtzUAq2OQhn9HKdVvZjjmM1egXqydhO8
   K8X8FkOc6rlDpRhXJMo69rRvq76fIkSxKsYID7ZeS0iFihwGcL+ofwz3n
   g==;
X-CSE-ConnectionGUID: UY4YpPR9SbKmkQTPx5F0IQ==
X-CSE-MsgGUID: w0F5vYbcT2q9m8rDTigu4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63316223"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="63316223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:26:01 -0700
X-CSE-ConnectionGUID: FVn3ZHjOTbSSFNKFfX/VlQ==
X-CSE-MsgGUID: OTWfFuFmTKWq0PKGSKnmkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="183833720"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2025 11:25:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC00Y-000DmX-1J;
	Thu, 23 Oct 2025 18:25:54 +0000
Date: Fri, 24 Oct 2025 02:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Xing <kerneljasonxing@gmail.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	bjorn@kernel.org, magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com, jonathan.lemon@gmail.com,
	sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net,
	hawk@kernel.org, john.fastabend@gmail.com, joe@dama.to,
	willemdebruijn.kernel@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	netdev@vger.kernel.org, Jason Xing <kernelxing@tencent.com>
Subject: Re: [PATCH net-next v3 3/9] xsk: add xsk_alloc_batch_skb() to build
 skbs in batch
Message-ID: <202510240231.gdaPdxP4-lkp@intel.com>
References: <20251021131209.41491-4-kerneljasonxing@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021131209.41491-4-kerneljasonxing@gmail.com>

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/xsk-introduce-XDP_GENERIC_XMIT_BATCH-setsockopt/20251021-211646
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251021131209.41491-4-kerneljasonxing%40gmail.com
patch subject: [PATCH net-next v3 3/9] xsk: add xsk_alloc_batch_skb() to build skbs in batch
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20251024/202510240231.gdaPdxP4-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240231.gdaPdxP4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240231.gdaPdxP4-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: net/core/skbuff.o: in function `xsk_alloc_batch_skb':
   skbuff.c:(.text+0x77d0): undefined reference to `xsk_build_skb'
>> skbuff.c:(.text+0x77d0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `xsk_build_skb'
>> or1k-linux-ld: skbuff.c:(.text+0x78f0): undefined reference to `xsk_build_skb'
   skbuff.c:(.text+0x78f0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `xsk_build_skb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
