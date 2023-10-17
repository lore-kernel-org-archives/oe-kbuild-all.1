Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDA343AA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H4iWL+pp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4841C433C9;
	Tue, 17 Oct 2023 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1697554279;
	bh=8QST9rScEh763jZNRI95ZyKqEX0qwnM3d8lkq1pcw6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H4iWL+pptGDQhWA85o5KX5RrPFhjScdrk3yvR2NjLi2uRCSyeTR2ERxD7lIxUkZoB
	 YwlSpNUcRvS9s/siEAJNrtQqttodD+6K+VQ1A15Th5iKEPsOtxiB173S8wld0PSjf3
	 7xWSEHEkAmXyDxF4wZfV/1ah5TdxzH3RvLkF1LP8=
Date: Tue, 17 Oct 2023 07:51:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>, <willy@infradead.org>,
 <linux-kernel@vger.kernel.org>, <ying.huang@intel.com>, <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>
Subject: Re: [PATCH -next v2 17/19] mm: convert wp_page_reuse() and
 finish_mkwrite_fault() to take a folio
Message-Id: <20231017075118.724458634e508729bd1d2683@linux-foundation.org>
In-Reply-To: <b52105b5-3910-46b8-a869-4a82c8a2b845@huawei.com>
References: <20231013085603.1227349-18-wangkefeng.wang@huawei.com>
	<202310171537.XhmrkImn-lkp@intel.com>
	<b52105b5-3910-46b8-a869-4a82c8a2b845@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Oct 2023 17:04:41 +0800 Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> >>> mm/memory.c:3276: warning: Function parameter or member 'folio' not described in 'finish_mkwrite_fault'
> > 
> 
> Hi Andrew, should I resend this patch? or could you help me to update
> it, also a comment(page -> folio's) on patch18, thanks.

I'd assumed a new series would be sent, addressing Matthew's comments.
