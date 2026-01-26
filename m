Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED76A92E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 04:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769400074; cv=none; b=psXAQgVm0LYlleQwTFVvLKkiemCKkRSPfCSXthC4yrfMvuilCRKLLSKftmNqtHWp47KgpBLFjT+YD246ZbApCm9ZVTTJ0jJGP7q265IKc30g0BKnGFCLydMGqy2pHNTe1kr3KQ8bPOlUyu8Tnua9RFPWPA0BvJkfGIyo2ETcu8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769400074; c=relaxed/simple;
	bh=k+8dqO9UG4yjoC+DANa2MXlwVbgOIDgmtLvJrdv7qLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMJs3D9I60uFLHKobuIjqZFqFOyrg2a3n/1RA7KW3mV0VFA2CI0FrppnXqvrN6qbBu7tjWQLCu6C2VaZ2QQIhPhtNvp5pdKGR21zScO+5tOKPoDeOX1p3dLtwy2fIoYSByL16wic4MVCW74b9LFkIXhpAArqRO45eg4nULLhWzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CCPaHvMl; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CCPaHvMl"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769400064; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=dVpnyP6YZvF0qDg07C5GX24RcTsHWNjvJPh5w8fzsS8=;
	b=CCPaHvMlXpD927kdVyOSv+aKY44vtvNrocWpZWrZ+f3Byr5v0/HtdBBtfY+/9DX11nEmsn/+ccCA1URZYOeGqqmwgY4I9zY472GHHfqGLucREhBlSzAXw6wNUaQ+uhdmkJ7WWcV01VGXEEFIACIWKDvxb+XAw+it+w0MNSOyIe0=
Received: from 30.221.131.255(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WxnO5.i_1769400062 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Jan 2026 12:01:03 +0800
Message-ID: <413ac550-ae70-4e38-be1d-4bd5e3be2447@linux.alibaba.com>
Date: Mon, 26 Jan 2026 12:01:02 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5773/9539] Warning: fs/iomap/buffered-io.c:624
 function parameter 'private' not described in 'iomap_readahead'
To: Hongbo Li <lihongbo22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, kernel test robot <lkp@intel.com>
References: <202601261111.vIL9rhgD-lkp@intel.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <202601261111.vIL9rhgD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hongbo,

On 2026/1/26 11:56, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> commit: 8806f279244bf300dca2c99735d5a51cd24b86df [5773/9539] iomap: stash iomap read ctx in the private field of iomap_iter
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260126/202601261111.vIL9rhgD-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261111.vIL9rhgD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601261111.vIL9rhgD-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: fs/iomap/buffered-io.c:624 function parameter 'private' not described in 'iomap_readahead'
>>> Warning: fs/iomap/buffered-io.c:624 function parameter 'private' not described in 'iomap_readahead'

It seems the kernel-doc isn't updated, could you
submit another iomap patch to fix that?

  608 /**
  609  * iomap_readahead - Attempt to read pages from a file.
  610  * @ops: The operations vector for the filesystem.
  611  * @ctx: The ctx used for issuing readahead.

^ here.

  612  *
  613  * This function is for filesystems to call to implement their readahead
  614  * address_space operation.
  615  *
  616  * Context: The @ops callbacks may submit I/O (eg to read the addresses of
  617  * blocks from disc), and may wait for it.  The caller may be trying to
  618  * access a different page, and so sleeping excessively should be avoided.
  619  * It may allocate memory, but should avoid costly allocations.  This
  620  * function is called with memalloc_nofs set, so allocations will not cause
  621  * the filesystem to be reentered.
  622  */
  623 void iomap_readahead(const struct iomap_ops *ops,
  624                 struct iomap_read_folio_ctx *ctx, void *private)

Thanks,
Gao Xiang



> 

