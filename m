Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4017CA17
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753028297; cv=none; b=BcVz/zlZ3OYPqBOwEpuMAmid6t7+beSkaJX2bGWxb8RpEtZXtakBPktrSj5NDCJabZwIpgKmXYAlAPfNZZ+78sZNrXQvGx+MbwGyyBK7tNy7DLLgu4plqtHWcCi1DwbtgY/VMpCeHYw/kjNFmfLm3Sndf/UTvilDcgTGLnWk11o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753028297; c=relaxed/simple;
	bh=YCJFYHX/3C4+YBN+AM39Wy9LJxFj4ndYzOi0tPZXP7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qp+XQLz4qBn8nUgm9iPdIWMZYOdJFuTBSL3ilEmA3NOo2qP/pa1XTlXNy5Yd4mjjJLwmYV9MV4S1QY/dSyQrFEqhsFlseRqzAfQBq/lkjSush6ZBkH8kWjjGAsthYEc/rkhIbFLr/l8PCM6vogKAupcsfQRfJe73+ljMOCnsrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xk+KtxC9; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xk+KtxC9"
Message-ID: <7c0e8460-2dd0-4397-b5f0-37ef7db6b65c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753028292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bk2FYGN0KMci3WSNwBBEiqMVobskdUbkZLJNZN6Hnho=;
	b=Xk+KtxC9RGSIeRs+uwBqFnx3TlW/U8HAo6vp13LBDUuNTZkvaWjZM0UkRO9DWaXpXJwhBn
	8ZSqL1flr9SHCDByoZvdbilS6/fR3DQRyhCaYGsyDUbiqiIS4DUksxJuSx7gWJPzmdlUwW
	W4Q22n7+at3dL0amT4bFGuoeykmmdJw=
Date: Sun, 20 Jul 2025 09:18:07 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 1023/11307] kernel/bpf/cgroup.c:710:10-17:
 WARNING: ERR_CAST can be used with anchor_link
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>
References: <202507201048.bceHy8zX-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <202507201048.bceHy8zX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 7/19/25 7:35 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> commit: 1209339844601ec1766f4ff430673fbcfe42bb51 [1023/11307] bpf: Implement mprog API on top of existing cgroup progs
> config: alpha-randconfig-r054-20250720 (https://download.01.org/0day-ci/archive/20250720/202507201048.bceHy8zX-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.4.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507201048.bceHy8zX-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
>>> kernel/bpf/cgroup.c:710:10-17: WARNING: ERR_CAST can be used with anchor_link
>>> kernel/bpf/cgroup.c:714:10-17: WARNING: ERR_CAST can be used with anchor_prog

I don't think we have correctness here. But, indeed ERR_CAST
is better than ERR_PTR(PTR_ERR(anchor_link). I will send a patch
to upstream for this.

> vim +710 kernel/bpf/cgroup.c
>
>     682	
>     683	static struct bpf_prog_list *get_prog_list(struct hlist_head *progs, struct bpf_prog *prog,
>     684						   struct bpf_cgroup_link *link, u32 flags, u32 id_or_fd)
>     685	{
>     686		bool is_link = flags & BPF_F_LINK, is_id = flags & BPF_F_ID;
>     687		struct bpf_prog_list *pltmp, *pl = ERR_PTR(-EINVAL);
>     688		bool preorder = flags & BPF_F_PREORDER;
>     689		struct bpf_link *anchor_link = NULL;
>     690		struct bpf_prog *anchor_prog = NULL;
>     691		bool is_before, is_after;
>     692	
>     693		is_before = flags & BPF_F_BEFORE;
>     694		is_after = flags & BPF_F_AFTER;
>     695		if (is_link || is_id || id_or_fd) {
>     696			/* flags must have either BPF_F_BEFORE or BPF_F_AFTER */
>     697			if (is_before == is_after)
>     698				return ERR_PTR(-EINVAL);
>     699			if ((is_link && !link) || (!is_link && !prog))
>     700				return ERR_PTR(-EINVAL);
>     701		} else if (!hlist_empty(progs)) {
>     702			/* flags cannot have both BPF_F_BEFORE and BPF_F_AFTER */
>     703			if (is_before && is_after)
>     704				return ERR_PTR(-EINVAL);
>     705		}
>     706	
>     707		if (is_link) {
>     708			anchor_link = bpf_get_anchor_link(flags, id_or_fd);
>     709			if (IS_ERR(anchor_link))
>   > 710				return ERR_PTR(PTR_ERR(anchor_link));
>     711		} else if (is_id || id_or_fd) {
>     712			anchor_prog = bpf_get_anchor_prog(flags, id_or_fd);
>     713			if (IS_ERR(anchor_prog))
>   > 714				return ERR_PTR(PTR_ERR(anchor_prog));
>     715		}
>     716	
>     717		if (!anchor_prog && !anchor_link) {
>     718			/* if there is no anchor_prog/anchor_link, then BPF_F_PREORDER
>     719			 * doesn't matter since either prepend or append to a combined
>     720			 * list of progs will end up with correct result.
>     721			 */
>     722			hlist_for_each_entry(pltmp, progs, node) {
>     723				if (is_before)
>     724					return pltmp;
>     725				if (pltmp->node.next)
>     726					continue;
>     727				return pltmp;
>     728			}
>     729			return NULL;
>     730		}
>     731	
>     732		hlist_for_each_entry(pltmp, progs, node) {
>     733			if ((anchor_prog && anchor_prog == pltmp->prog) ||
>     734			    (anchor_link && anchor_link == &pltmp->link->link)) {
>     735				if (!!(pltmp->flags & BPF_F_PREORDER) != preorder)
>     736					goto out;
>     737				pl = pltmp;
>     738				goto out;
>     739			}
>     740		}
>     741	
>     742		pl = ERR_PTR(-ENOENT);
>     743	out:
>     744		if (anchor_link)
>     745			bpf_link_put(anchor_link);
>     746		else
>     747			bpf_prog_put(anchor_prog);
>     748		return pl;
>     749	}
>     750	
>

