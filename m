Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8C32236FC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748984865; cv=none; b=SqIPKT5eyeO6ziwXrSWiZReSKqC3BHddD8Gh6VSLNaTsPFjetaxd34TCp32SpdtN8fQe/j4ooxuIL/5E46OwKHJZPdiHR7OvOXfTYqdDXIxoeVjM3ZjsCm4iveXxUsL66xoMjZk54Obz7RtGBExDLi3juC9+zkt2P15C9RNN1XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748984865; c=relaxed/simple;
	bh=NBJmp6CTNmpKPkwNOQJqQGoK1i9I8l8s0SwwTjfxWSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t0jZ9aYx52Aa43gnKREgdO/bzCcS5jcu64elGbmD3B5syb+NRDJY1NU+JwfdDKy6TEK8VMWIUppIX8U3FB8jBO0Fo6D50wHt1mG1/vv44h0GebO25Vuhu+3f9Nlhkd7vPtiLTrNNgLjnc83HggeA94gubtOB3uYdHIAvsMhSlXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6pgxt/P; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6pgxt/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748984864; x=1780520864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NBJmp6CTNmpKPkwNOQJqQGoK1i9I8l8s0SwwTjfxWSk=;
  b=m6pgxt/PxkIilEqRVAZD7sVyY5jNATVcdJW56AGzT2c76XWugo0IUJi8
   tAPlCjku/q06UObYRBdC/U460zxpIi/8SbhWcU1M657wGgx4ystUlacLV
   XM8IkE+8/J7SxKYhKkOuB5MzUtqIRfhhdctPv60TK7i+XnBKjmHHBOhsg
   KUdMVoSL6VhjRCWymJwmfgTOKQO9xrLKjdU1cmYsP24FPaYM1x3CB9ubG
   wMM7ODradMz0v9gusIm3H4uFYZ47pNz0FdI4IGk6cbcN/OLvEbmz0D873
   i41hYT4bn7nE6c9aCQe09k/SpRq8Fevxu8surW7sdzhzqZX/HWcqak4qn
   w==;
X-CSE-ConnectionGUID: C3sYuYK6Taa2nNXuCREidg==
X-CSE-MsgGUID: n8dbWRHiThC1cwHHvDII1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51187732"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="51187732"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 14:07:43 -0700
X-CSE-ConnectionGUID: Cw+G21LgSDmiEfTQXeRYaA==
X-CSE-MsgGUID: pL2Vc5UWSmGeV5l8x7Je4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
   d="scan'208";a="175917708"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jun 2025 14:07:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMYrD-0002jB-2s;
	Tue, 03 Jun 2025 21:07:39 +0000
Date: Wed, 4 Jun 2025 05:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-6.16 5/5] io_uring/kbuf.c:497:13: warning:
 variable 'ret' set but not used
Message-ID: <202506040557.BAUaH8JE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-6.16
head:   9c989601d74fa8a1132b20f3972f19efd5332fd4
commit: 9c989601d74fa8a1132b20f3972f19efd5332fd4 [5/5] io_uring/kbuf: limit legacy provided buffer lists to USHRT_MAX
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250604/202506040557.BAUaH8JE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506040557.BAUaH8JE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506040557.BAUaH8JE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/kbuf.c: In function 'io_add_buffers':
>> io_uring/kbuf.c:497:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     497 |         int ret = -ENOMEM, i, bid = pbuf->bid;
         |             ^~~


vim +/ret +497 io_uring/kbuf.c

   491	
   492	static int io_add_buffers(struct io_ring_ctx *ctx, struct io_provide_buf *pbuf,
   493				  struct io_buffer_list *bl)
   494	{
   495		struct io_buffer *buf;
   496		u64 addr = pbuf->addr;
 > 497		int ret = -ENOMEM, i, bid = pbuf->bid;
   498	
   499		for (i = 0; i < pbuf->nbufs; i++) {
   500			/*
   501			 * Nonsensical to have more than sizeof(bid) buffers in a
   502			 * buffer list, as the application then has no way of knowing
   503			 * which duplicate bid refers to what buffer.
   504			 */
   505			if (bl->nbufs == USHRT_MAX) {
   506				ret = -EOVERFLOW;
   507				break;
   508			}
   509			buf = kmalloc(sizeof(*buf), GFP_KERNEL_ACCOUNT);
   510			if (!buf)
   511				break;
   512	
   513			list_add_tail(&buf->list, &bl->buf_list);
   514			bl->nbufs++;
   515			buf->addr = addr;
   516			buf->len = min_t(__u32, pbuf->len, MAX_RW_COUNT);
   517			buf->bid = bid;
   518			buf->bgid = pbuf->bgid;
   519			addr += pbuf->len;
   520			bid++;
   521			cond_resched();
   522		}
   523	
   524		return i ? 0 : -ENOMEM;
   525	}
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
