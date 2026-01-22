Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE160316190
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 17:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103162; cv=none; b=Kowle4nRZy6+m8LRn5g9f4pWIpILL8nlR9dLO0hK7F+uYA69AV/+uQZOZZdQ8kMeM89M3kjBBm6AXu7piS7yST0SJV/EHA1c4yqfu62dP2Q+TpSg2K+amm7iUXmPdqo3raPNVVwgsVkXN+bFA3muWGOiNDBd9S+A9ikzfycgmMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103162; c=relaxed/simple;
	bh=T51xee8w+q4wOs994zMPrpOU5VE4HghA2NdWC1B5WOw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OgefZFXFmo9AReAAZlfrJyVXUD3fOt6H3emv9icoh+ZtVFQaROxYdvlS+4uzin5WfJ1/qaoWVwAEipkyMMuF5J2zL+58KUGqSgexb5wu6gNouWf4r7XyPHEnRC9nzZz3MZfBGWMhk8wOzbETLuJPPk0ll1WrRvsjQMh9p2eSYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AJ5b+VU7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AJ5b+VU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0BAC116C6;
	Thu, 22 Jan 2026 17:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769103161;
	bh=T51xee8w+q4wOs994zMPrpOU5VE4HghA2NdWC1B5WOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AJ5b+VU71V+YVuXCL+/s2IIrCquyiH9XVNXLJR+hLQ7dV6vpzsPbop2aH5WoMNnrO
	 DIU05IfK5crWnQI5+TL9byn9gRtfEdaTa4TS+eGy51sPheUdhofNjIZsraB+Hk7Mai
	 lYuu0tdzu92OU+IWJkpUnl5Ce5HU5OcjcagkdF7w=
Date: Thu, 22 Jan 2026 09:32:40 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, oe-kbuild-all@lists.linux.dev, David
 Hildenbrand <david@kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 279/310] memory-failure.c:275:49: warning:
 format specifies type 'unsigned long' but the argument has type
 '__fsword_t' (aka 'int')
Message-Id: <20260122093240.ef007fed49c166ae5ff256c1@linux-foundation.org>
In-Reply-To: <202601221142.mDWA1ucw-lkp@intel.com>
References: <202601221142.mDWA1ucw-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 12:00:08 +0100 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   dc4fe40a11269aead253fa0beb098b00417b8694
> commit: ce9b369feafe8c65aa134b0c8791bf7f19e463e2 [279/310] selftests/mm: add memory failure clean pagecache test
> config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601221142.mDWA1ucw-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221142.mDWA1ucw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601221142.mDWA1ucw-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> memory-failure.c:275:49: warning: format specifies type 'unsigned long' but the argument has type '__fsword_t' (aka 'int') [-Wformat]
>      275 |                 SKIP(return, "unsupported filesystem :%lx\n", fs_type);
>          |                                                       ~~~     ^~~~~~~
>          |                                                       %x

Thanks.

I don't think we can rely upon libc's __fsword_t being `int' in all
situations for all time?

We could add the typecast but perhaps it's better to change
get_fs_type() to return int?
