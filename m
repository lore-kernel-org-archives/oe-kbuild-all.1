Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB3A2CA6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Dec 2022 21:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC8DC433F0;
	Sat, 10 Dec 2022 21:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1670707107;
	bh=XeV4w624ne3OXFQDwJWZaFY3IF7G4GrwQy8ytYt1wLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ca/zq/jxiKdb4XWiYyud/S1S8bU6C30q3Co0zFzJ6xJvntvo2JjV2kboq65OLg8w5
	 P7VKPRbT20Ex1nkZTdWxev0i4bg4yiRHD6rprKGBghRSNeAc/nlyBIFG6ouImswm90
	 YL3WvyRwl7kYweBWBP7QKpxk+q0MLJ37TJyrcPnw=
Date: Sat, 10 Dec 2022 13:18:26 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, oe-kbuild-all@lists.linux.dev,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>, GNU/Weeb Mailing List
 <gwml@vger.gnuweeb.org>, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 71/161]
 mm/ksm.c:2605:21: error: implicit declaration of function
 'copy_mc_user_highpage'; did you mean 'copy_user_highpage'?
Message-Id: <20221210131826.6512ef7e5f0cd4a9e06c414e@linux-foundation.org>
In-Reply-To: <202212101503.RNrbiXsN-lkp@intel.com>
References: <202212101503.RNrbiXsN-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 10 Dec 2022 15:59:20 +0800 kernel test robot <lkp@intel.com> wrote:

> Note: the ammarfaizi2-block/akpm/mm/mm-unstable HEAD 4661cf99c1e4946297434595994227e47f33c014 builds fine.
>       It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
>    mm/ksm.c: In function 'ksm_might_need_to_copy':
> >> mm/ksm.c:2605:21: error: implicit declaration of function 'copy_mc_user_highpage'; did you mean 'copy_user_highpage'? [-Werror=implicit-function-declaration]
>     2605 |                 if (copy_mc_user_highpage(new_page, page, address, vma)) {
>          |                     ^~~~~~~~~~~~~~~~~~~~~

Thanks.  I have moved
mm-hwposion-support-recovery-from-ksm_might_need_to_copy.patch to the
end of the mm-stable queue so this should now be fixed.

