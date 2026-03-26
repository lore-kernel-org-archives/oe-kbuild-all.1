Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C82D8364;
	Thu, 26 Mar 2026 03:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774496216; cv=none; b=epnm8hnmTLyC/JiboJVhZ+KWV36+e19dxgvV+t0V7yFhxz9WO/bR+6Hn3/iFl+lbXajhkTLzKR5QRzK+JZBDi1BGws3i4OCRBoNnR+hr+Byw4vR83B5EH5UwqkC5ZEq2KuHsUVcsmqIPRvwUV86mUWkXK43UlGmh7Q0glb8f5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774496216; c=relaxed/simple;
	bh=CqQntqxnCRIB6D4N7KvDeKcg74YX7cXVaqW8OLCN0lo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oek96fQ6H4LAlHoN5BEe051Pi8GdHGTG8w6rH7ItuvYCzhXIgt/cUTjkKhq02nv2IpoyIgIVlNoQBCzghpueO5AVLeR4iGqXbNWEgGI/cfnAAG59FmXVT4ivgQD1KNNXzcZD1o7P9rCIKdETbbhgdFmMzg31le5Nv3vTN+/DiV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bMgcC3g1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bMgcC3g1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419D3C4CEF7;
	Thu, 26 Mar 2026 03:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774496215;
	bh=CqQntqxnCRIB6D4N7KvDeKcg74YX7cXVaqW8OLCN0lo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bMgcC3g15oxLe2s+2mgU5KIVNpzgBLbCCrlKLe7f61tbsM/5kGTaLmcJqSVMimfFd
	 hmbt1dsDCBq6u1CEaoBWZUontraFkC40SqxpxoShK66/95UQBU5N2tMPAYdzJBbQmn
	 zmJtlpz0SJY3T8jkmOeGFmYYAGyKjl44NNZxfZK4=
Date: Wed, 25 Mar 2026 20:36:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Qi Zheng <qi.zheng@linux.dev>, hannes@cmpxchg.org, hughd@google.com,
 mhocko@suse.com, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
 muchun.song@linux.dev, david@kernel.org, lorenzo.stoakes@oracle.com,
 ziy@nvidia.com, harry.yoo@oracle.com, yosry.ahmed@linux.dev,
 imran.f.khan@oracle.com, kamalesh.babulal@oracle.com,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 chenridong@huaweicloud.com, mkoutny@suse.com,
 hamzamahfooz@linux.microsoft.com, apais@linux.microsoft.com,
 lance.yang@linux.dev, bhe@redhat.com, usamaarif642@gmail.com,
 oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH 3/3] mm: memcontrol: correct the nr_pages parameter type
 of mem_cgroup_update_lru_size()
Message-Id: <20260325203653.5abdac45e7d22ca648fe23b4@linux-foundation.org>
In-Reply-To: <202603260338.GfCrsaVO-lkp@intel.com>
References: <2cf06f9faf51900ce6acbb4740fc60355a2842ed.1774342371.git.zhengqi.arch@bytedance.com>
	<202603260338.GfCrsaVO-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Mar 2026 03:35:39 +0100 kernel test robot <lkp@intel.com> wrote:

> Hi Qi,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on next-20260325]
> [cannot apply to trace/for-next linus/master v7.0-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-memcontrol-correct-the-type-of-stats_updates-to-unsigned-long/20260325-230337
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/2cf06f9faf51900ce6acbb4740fc60355a2842ed.1774342371.git.zhengqi.arch%40bytedance.com
> patch subject: [PATCH 3/3] mm: memcontrol: correct the nr_pages parameter type of mem_cgroup_update_lru_size()
> config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260326/202603260338.GfCrsaVO-lkp@intel.com/config)
> compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260338.GfCrsaVO-lkp@intel.com/reproduce)

Thanks.  Can't reproduce. (there are meds for this!)

> b4536f0c829c858 Michal Hocko       2017-01-10 @1486  		"%s(%p, %d, %d): lru_size %ld\n",

We presently have

		"%s(%p, %d, %ld): lru_size %ld\n",

so it appears we fixed this recently.
