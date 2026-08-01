Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B7E35F60E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 00:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785544101; cv=none; b=pxlA5lsk4ve6q4dI6DEUUizlRcge/0K3C6Lvxaab6W+mIQHXcq4Ud8Uy12/4HUC4/RWJSKsMVSGWK2cJiQMtGKRCJGytb7r1Pau94SLkm/e5u+4LalasZ//Y1UGdT9MSNeFh+osCiCZr4jD6WtSjlUQs6Vn8GhrLQgH6JZPdRTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785544101; c=relaxed/simple;
	bh=9Ap/sTTjtoDYWP/r8DaMlLXzey1auxDHMIMmIlAA/JM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldThj9HIrO7mXpsHzMJmBtxbhRe2A7jQLGgaq30pfBv9UarCzD0PLz7AwtcJLrHrnBXTzIWgys4CJdUhFea+Qe9hSHJjmZQgGONXYd4TekiqtSN1a+l/SnJo05eBrMbWb/MdJkXA3k9TyCd32cu1IvqNdV0LvJhI2lVW/XBnCfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 484AAA10C5;
	Sat,  1 Aug 2026 00:28:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id B73A51A;
	Sat,  1 Aug 2026 00:28:05 +0000 (UTC)
Date: Fri, 31 Jul 2026 20:28:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Julia
 Lawall <Julia.Lawall@inria.fr>
Subject: Re: kernel/trace/ring_buffer.c:412:29-47: WARNING: casting value
 returned by memory allocation function to (struct buffer_page *) is
 useless.
Message-ID: <20260731202804.06a4056f@robin>
In-Reply-To: <202608010824.vc7vATf0-lkp@intel.com>
References: <202608010824.vc7vATf0-lkp@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: B73A51A
X-Stat-Signature: ee9hykkgny37z7yeou95os1784ksiqgx
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19sVJ15jjkIbJDXlHx+FzoOV+DpT0J35yI=
X-HE-Tag: 1785544085-771577
X-HE-Meta: U2FsdGVkX1+4/aWeiA2qBodvX3MGFtJQW/YaUi8MvdInqEaCbYCYxFqoGvW90al9sjtor/nYbYPfo7iPkIoU9uK0g/rtIf4YZmTVp9W0/v6yRk2TcBkt66kheVltyeWq0njEqrmzEZu/eOrHwbzDmGvSJ8bUeQtJTimPxlI1/ZSGk66uyfc8dK1sowYNf31Yy+yXvys0JAX35pHD1YjhEwStCp8AAh0mkkgBuYZ22SHVyvHsizbTEYsQNVlxddOr2NYX1ISbGaHlNkjupACDmsa2K/3POcEkokD7Tie5x9jRq9edB5cqqJPJ4BrhKjUUqNUcoqAgewQ9D/Q3CohwwGQ5t3stZSmABhABhaTZ8kzi+1aL9ThKT1O+k4lx/drl2QTkwUTfaao/vmrlgcU3nAFAXSkgqO+EdDpltG8KbZUdlaujoYmskn5rYRSjerUSP4mbzcCJs50=

On Sat, 01 Aug 2026 08:10:14 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
> commit: b1e7a590a0133606d3efd41aee38cdeac630b52f ring-buffer: Add helper functions for allocations
> date:   8 months ago
> config: openrisc-randconfig-r062-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010824.vc7vATf0-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 9.5.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: b1e7a590a013 ("ring-buffer: Add helper functions for allocations")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608010824.vc7vATf0-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> kernel/trace/ring_buffer.c:412:29-47: WARNING: casting value returned by memory allocation function to (struct buffer_page *) is useless.
> >> kernel/trace/ring_buffer.c:408:31-57: WARNING: casting value returned by memory allocation function to (struct ring_buffer_per_cpu *) is useless.  

No, whatever Coccinelle script that reported this is broken.

The typecast is in a macro. The macro is adding the typecast to make
sure that what it is being assigned to is of the proper type.

Hence, it is very *useful*!

-- Steve


> 
> vim +412 kernel/trace/ring_buffer.c
> 
>    403	
>    404	/*
>    405	 * For best performance, allocate cpu buffer data cache line sized
>    406	 * and per CPU.
>    407	 */
>  > 408	#define alloc_cpu_buffer(cpu) (struct ring_buffer_per_cpu *)		\  
>    409		kzalloc_node(ALIGN(sizeof(struct ring_buffer_per_cpu),		\
>    410				   cache_line_size()), GFP_KERNEL, cpu_to_node(cpu));
>    411	
>  > 412	#define alloc_cpu_page(cpu) (struct buffer_page *)			\  
>    413		kzalloc_node(ALIGN(sizeof(struct buffer_page),			\
>    414				   cache_line_size()), GFP_KERNEL, cpu_to_node(cpu));
>    415	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

