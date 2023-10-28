Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D02C2595
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JXS4EyqA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85337C433C7;
	Sat, 28 Oct 2023 16:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1698510966;
	bh=VxA3RK+jlfT667Er/84AjP8AvKupOHpbxCx4Cp+4/Qo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JXS4EyqAKqs61MsxhEknq6OvxvgUM5rb/2F/C1J/gL3j3/C0aPEkp6pkRtXCyvDwP
	 wh8fCOzpkgzoTZIKeLhZjLTjskvKWTx8Ycrq/fYuAs+hieFMvK33iMz//48hWD4uDJ
	 qlKo0iijzGrSIMxHsdWVR7hwJpH6VZgjR/3nyF0w=
Date: Sat, 28 Oct 2023 09:36:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 18/58] ERROR: modpost: vmlinux:
 local symbol 'kthread_stop_put' was exported
Message-Id: <20231028093605.b516ad5d8ca820ec76da3072@linux-foundation.org>
In-Reply-To: <202310282049.HXCHtgEz-lkp@intel.com>
References: <202310282049.HXCHtgEz-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Oct 2023 20:29:18 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   d431880137b55533f664056070226a88dba99637
> commit: 6309727ef27162deabd5c095c11af24970fba5a2 [18/58] kthread: add kthread_stop_put
> config: riscv-randconfig-c033-20221102 (https://download.01.org/0day-ci/archive/20231028/202310282049.HXCHtgEz-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310282049.HXCHtgEz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310282049.HXCHtgEz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> ERROR: modpost: vmlinux: local symbol 'system_power_efficient_wq' was exported

[ it now proceeds to list 16000 more such "errors" ]

I see no error here - these symbols are exported because modules use
them.  Unless I misinterpret the intent of this modpost check.

Masahiro, could you please take a look?
