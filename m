Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A6E2B9A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 21:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1a1OoQIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95690C433C7;
	Wed, 29 Nov 2023 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701294194;
	bh=c0A6vzYbk95GV1LWzgAFjOEddHCTXxL1QcDDpTnFsMM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1a1OoQIR7tJyDQowznf/MGr6JOQjlhlzNuA2NvN5KbgJZ1y8hfzTUoI0jtz3oJWGh
	 vaEmArT4ve8UGz52rAklipRNyj4zGmM/+kvJlVzXOkch0uSXZF6hNpsR9H+4ccd31b
	 yyAMDFE8Wp9uITjoqhfSCh2wKflYoMWINemzLB4E=
Date: Wed, 29 Nov 2023 13:43:13 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Domenico Cerasuolo <cerasuolodomenico@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:825:17: error:
 dereferencing pointer to incomplete type 'struct mem_cgroup'
Message-Id: <20231129134313.656e76c2e3fec1361007633b@linux-foundation.org>
In-Reply-To: <202311292250.RUfWGNgx-lkp@intel.com>
References: <202311292250.RUfWGNgx-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Nov 2023 23:42:11 +0800 kernel test robot <lkp@intel.com> wrote:

> >> mm/zswap.c:825:17: error: dereferencing pointer to incomplete type 'struct mem_cgroup'
>       css_get(&memcg->css);
>                     ^~

OK, thanks, patchset needs work for CONFIG_MEMCG=n.  I'll drop this version.
