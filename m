Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8D7C959
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 19:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32DFC433D2;
	Thu, 23 Mar 2023 19:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1679600634;
	bh=d1YO9hVxzcuN3OnKNzTq92uUDAfp7TeIWNkKp7C2H28=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rx2TJ9FSJ7eNvJVpEEqPy2okyTecUScjePEB9pgQcxoVEJ+PTF3L8rlzWeU24f852
	 HufIjgs3U4irNH9hnZgS5YHh+RTS4MxhM6HAYm1ScrEAR1U1nmhta7NfxXcUiX9SHt
	 KA7zu5IByrBxcn4WO8LrHvce7ckPtM0INnXLPSCM=
Date: Thu, 23 Mar 2023 12:43:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5432/6100] include/linux/mmzone.h:1749:2:
 error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-Id: <20230323124354.7d6606d323af38eaaef7c530@linux-foundation.org>
In-Reply-To: <202303231302.iY6qIfXA-lkp@intel.com>
References: <202303231302.iY6qIfXA-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Mar 2023 13:42:51 +0800 kernel test robot <lkp@intel.com> wrote:

>    In file included from include/linux/gfp.h:7,
>                     from include/linux/mm.h:7,
>                     from arch/loongarch/kernel/asm-offsets.c:9:
> >> include/linux/mmzone.h:1749:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE

Thanks, I assume this is fixed by

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/loongarch-drop-ranges-for-definition-of-arch_force_max_order.patch
