Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C552417ADE8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732352010; cv=none; b=BXgFA6+2i7C1UsQMr5nJFlw4hJwHNy39BMVtUdfSCTyBIX8c63t3/QbaG2KkeNOslVofyHf1pacvQKpgshQhIjkDjQ/z5p4ykelfhcNSdpbi4Tv8jjqmEfWk71CyWFMgYhTE7GFWNsFMlY1wry3h2Y+zURLIePT2DNjLHt+QLmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732352010; c=relaxed/simple;
	bh=7KYWrM1DiKlNNjPzuZPk0aJyMhSLsr2CFocEr4SNyIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T6MrxPUrbJI/A7V+gYWyokJDrPIR6vaexBDgH4z+FHtDYuui3WfS4L2/e9Qj2efccoiNbkVnsfabDBLEcFhBnNktQxnRY+kPvFUksaym6X/OFi0TUvdKBWCw8oOLvjku/mdy9KFFzFNK82HM4V8g8CC71X6MxzPuzHzxG2tEU5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEKqnGTV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEKqnGTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732352009; x=1763888009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KYWrM1DiKlNNjPzuZPk0aJyMhSLsr2CFocEr4SNyIY=;
  b=YEKqnGTVAY40iNn29NCn/tlduVDL6jHOGipICrCwveuke+n9KhvxfJ6Y
   aEfMAtsgKP8R2RmPhkFN0hSQu9Ak+2vXeXOJNBHa4BAkCZKJYgoYXbRRu
   8bP9SfvmlDL4stk2cZiRBdUpyheKa2A0VvNRHa5jqzb6m8xjTcMa4D7As
   9htuMiRWw0UM9TwgjM9cWhMEQTZUatFwmKYzChgF92ObG5gp9y9lcuB3U
   fEIeUykT7XD4p2TlFE1M+6U2wPaxTlRyy1FsGEllfGAhoTj+5TpUWOSdE
   MIxynJTkp2nBryESwLpdKR8RiZsdes375tBt7dANYsCH/FGnhN2q7QovE
   A==;
X-CSE-ConnectionGUID: 2nbE3rbvS/+yoGiehkVRjA==
X-CSE-MsgGUID: H8wNAQcMQVChmzpNTUmn2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="57905988"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="57905988"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 00:53:27 -0800
X-CSE-ConnectionGUID: GwzJiys6Q+aNs9xM39FSHw==
X-CSE-MsgGUID: O/lLtWYjSHOAIaqTU/bCDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="90780720"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Nov 2024 00:53:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEltL-0004XH-2K;
	Sat, 23 Nov 2024 08:53:23 +0000
Date: Sat, 23 Nov 2024 16:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 6/6]
 drivers/media/v4l2-core/v4l2-loopback.c:2146:40: sparse: sparse: symbol
 'client_usage_ops' was not declared. Should it be static?
Message-ID: <202411231651.GThiwACk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   285d0494d6dea4507f6e858963168f87e786241a
commit: 6d4e4c8b2c8c3a3cc0af134d62691ef604b7b1d2 [6/6] media: v4l2-loopback
config: x86_64-randconfig-123-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231651.GThiwACk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231651.GThiwACk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231651.GThiwACk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-loopback.c:2146:40: sparse: sparse: symbol 'client_usage_ops' was not declared. Should it be static?
>> drivers/media/v4l2-core/v4l2-loopback.c:2280:13: sparse: sparse: restricted __poll_t degrades to integer
>> drivers/media/v4l2-core/v4l2-loopback.c:2394:27: sparse: sparse: cast removes address space '__user' of expression
>> drivers/media/v4l2-core/v4l2-loopback.c:2394:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2394:27: sparse:     expected void [noderef] __user *to
   drivers/media/v4l2-core/v4l2-loopback.c:2394:27: sparse:     got void *
   drivers/media/v4l2-core/v4l2-loopback.c:2442:65: sparse: sparse: cast removes address space '__user' of expression
>> drivers/media/v4l2-core/v4l2-loopback.c:2442:65: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2442:65: sparse:     expected void const [noderef] __user *from
   drivers/media/v4l2-core/v4l2-loopback.c:2442:65: sparse:     got void *
   drivers/media/v4l2-core/v4l2-loopback.c:2899:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2899:54: sparse:     expected void const [noderef] __user *from
   drivers/media/v4l2-core/v4l2-loopback.c:2899:54: sparse:     got void *
   drivers/media/v4l2-core/v4l2-loopback.c:2931:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2931:46: sparse:     expected void const [noderef] __user *from
   drivers/media/v4l2-core/v4l2-loopback.c:2931:46: sparse:     got void *
>> drivers/media/v4l2-core/v4l2-loopback.c:2948:62: sparse: sparse: Using plain integer as NULL pointer
   drivers/media/v4l2-core/v4l2-loopback.c:2962:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2962:35: sparse:     expected void [noderef] __user *to
   drivers/media/v4l2-core/v4l2-loopback.c:2962:35: sparse:     got void *
>> drivers/media/v4l2-core/v4l2-loopback.c:2999:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/media/v4l2-core/v4l2-loopback.c:2999:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/media/v4l2-core/v4l2-loopback.c:2999:27: sparse:     got unsigned int ( * )( ... )
   drivers/media/v4l2-core/v4l2-loopback.c:3090:50: sparse: sparse: Using plain integer as NULL pointer

vim +/client_usage_ops +2146 drivers/media/v4l2-core/v4l2-loopback.c

  2145	
> 2146	const struct v4l2_subscribed_event_ops client_usage_ops = {
  2147		.add = client_usage_ops_add,
  2148		.replace = client_usage_ops_replace,
  2149		.merge = client_usage_ops_merge,
  2150	};
  2151	
  2152	static int vidioc_subscribe_event(struct v4l2_fh *fh,
  2153					  const struct v4l2_event_subscription *sub)
  2154	{
  2155		switch (sub->type) {
  2156		case V4L2_EVENT_CTRL:
  2157			return v4l2_ctrl_subscribe_event(fh, sub);
  2158		case V4L2_EVENT_PRI_CLIENT_USAGE:
  2159			return v4l2_event_subscribe(fh, sub, 0, &client_usage_ops);
  2160		}
  2161	
  2162		return -EINVAL;
  2163	}
  2164	
  2165	/* file operations */
  2166	static void vm_open(struct vm_area_struct *vma)
  2167	{
  2168		struct v4l2l_buffer *buf;
  2169	
  2170		buf = vma->vm_private_data;
  2171		buf->use_count++;
  2172	
  2173		buf->buffer.flags |= V4L2_BUF_FLAG_MAPPED;
  2174	}
  2175	
  2176	static void vm_close(struct vm_area_struct *vma)
  2177	{
  2178		struct v4l2l_buffer *buf;
  2179	
  2180		buf = vma->vm_private_data;
  2181		buf->use_count--;
  2182	
  2183		if (buf->use_count <= 0)
  2184			buf->buffer.flags &= ~V4L2_BUF_FLAG_MAPPED;
  2185	}
  2186	
  2187	static struct vm_operations_struct vm_ops = {
  2188		.open = vm_open,
  2189		.close = vm_close,
  2190	};
  2191	
  2192	static int v4l2_loopback_mmap(struct file *file, struct vm_area_struct *vma)
  2193	{
  2194		u8 *addr;
  2195		unsigned long start;
  2196		unsigned long size;
  2197		struct v4l2_loopback_device *dev;
  2198		struct v4l2_loopback_opener *opener;
  2199		struct v4l2l_buffer *buffer = NULL;
  2200	
  2201		start = (unsigned long)vma->vm_start;
  2202		size = (unsigned long)(vma->vm_end - vma->vm_start);
  2203	
  2204		dev = v4l2loopback_getdevice(file);
  2205		opener = fh_to_opener(file->private_data);
  2206	
  2207		if (size > dev->buffer_size)
  2208			return -E2BIG;
  2209	
  2210		if (opener->timeout_image_io) {
  2211			if ((vma->vm_pgoff << PAGE_SHIFT) != dev->buffer_size * V4L2_LOOPBACK_BUFFERS) {
  2212				pr_info("invalid mmap offset for timeout_image_io mode\n");
  2213				return -EINVAL;
  2214			}
  2215		} else if ((vma->vm_pgoff << PAGE_SHIFT) > dev->buffer_size * (dev->buffers_number - 1)) {
  2216			pr_info("userspace tries to mmap too far, fail\n");
  2217			return -EINVAL;
  2218		}
  2219	
  2220		/* FIXXXXXME: allocation should not happen here! */
  2221		if (NULL == dev->image)
  2222			if (allocate_buffers(dev) < 0)
  2223				return -EINVAL;
  2224	
  2225		if (opener->timeout_image_io) {
  2226			buffer = &dev->timeout_image_buffer;
  2227			addr = dev->timeout_image;
  2228		} else {
  2229			int i;
  2230			for (i = 0; i < dev->buffers_number; ++i) {
  2231				buffer = &dev->buffers[i];
  2232				if ((buffer->buffer.m.offset >> PAGE_SHIFT) ==
  2233				    vma->vm_pgoff)
  2234					break;
  2235			}
  2236	
  2237			if (i >= dev->buffers_number)
  2238				return -EINVAL;
  2239	
  2240			addr = dev->image + (vma->vm_pgoff << PAGE_SHIFT);
  2241		}
  2242	
  2243		while (size > 0) {
  2244			struct page *page;
  2245	
  2246			page = vmalloc_to_page(addr);
  2247	
  2248			if (vm_insert_page(vma, start, page) < 0)
  2249				return -EAGAIN;
  2250	
  2251			start += PAGE_SIZE;
  2252			addr += PAGE_SIZE;
  2253			size -= PAGE_SIZE;
  2254		}
  2255	
  2256		vma->vm_ops = &vm_ops;
  2257		vma->vm_private_data = buffer;
  2258	
  2259		vm_open(vma);
  2260	
  2261		return 0;
  2262	}
  2263	
  2264	static unsigned int v4l2_loopback_poll(struct file *file,
  2265					       struct poll_table_struct *pts)
  2266	{
  2267		struct v4l2_loopback_opener *opener;
  2268		struct v4l2_loopback_device *dev;
  2269		__poll_t req_events = poll_requested_events(pts);
  2270		int ret_mask = 0;
  2271	
  2272		opener = fh_to_opener(file->private_data);
  2273		dev = v4l2loopback_getdevice(file);
  2274	
  2275		/* call poll_wait in first call, regardless, to ensure that the wait-queue
  2276		 * is not null */
  2277		poll_wait(file, &dev->read_event, pts);
  2278		poll_wait(file, &opener->fh.wait, pts);
  2279	
> 2280		if (req_events & POLLPRI) {
  2281			if (v4l2_event_pending(&opener->fh)) {
  2282				ret_mask |= POLLPRI;
  2283				if (!(req_events & DEFAULT_POLLMASK))
  2284					return ret_mask;
  2285			}
  2286		}
  2287	
  2288		switch (opener->type) {
  2289		case WRITER:
  2290			ret_mask |= POLLOUT | POLLWRNORM;
  2291			break;
  2292		case READER:
  2293			if (can_read(dev, opener))
  2294				ret_mask |= POLLIN | POLLRDNORM;
  2295			break;
  2296		default:
  2297			break;
  2298		}
  2299	
  2300		return ret_mask;
  2301	}
  2302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
