Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E7917C8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 02:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E197EC433D2;
	Sun,  4 Jun 2023 02:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685844244;
	bh=Bv6NDQo9VdNYdgQDQQYOlGCNwgLTTxAxcYNuPKEPEKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LSS02eHxu17/6WNVodQRQFHSmHAf1VyH2Ww70FKn4rxKQmTauKi4+6ccv9Tz4wPB6
	 rfxWT4u+1F+JdOlogKFPA8czzdqWw3UbQCRMLLPUdV0ew2g80jKiLDxobGVLeVWFXN
	 3xVQa4G+pUGWGj7dES3rQ1eLkgAgekcBOhPY6zb71ue2tYyqkjW3pqvdBgMI6oW4ki
	 NxlXl6tT7GuKnCUH6/Xmg7s/vGJlKgH3Vr+cANnMS2A413e2qhC5g62E2nMc9X4luy
	 mJy8FPj8aZf7oV3iagKRDl1jEkRf6w1V0HOJwSyPBmcnCo4AIlwo9Zoj5PkvXkh1Bv
	 YCcSYDmPTKbJA==
Date: Sun, 4 Jun 2023 11:04:00 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-doc@vger.kernel.org
Subject: Re: [trace:probes/core 16/16] htmldocs: Warning:
 Documentation/trace/fprobetrace.rst references a file that doesn't exist:
 Documentation/trace/fprobes.rst
Message-Id: <20230604110400.197a8c4e201ace830741ccf1@kernel.org>
In-Reply-To: <202306040144.aD72UzkF-lkp@intel.com>
References: <202306040144.aD72UzkF-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 Jun 2023 01:15:57 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/core
> head:   438ae37afde3d24731cf23e5b77370e76218744e
> commit: 438ae37afde3d24731cf23e5b77370e76218744e [16/16] Documentation: tracing/probes: Add fprobe event tracing document
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/commit/?id=438ae37afde3d24731cf23e5b77370e76218744e
>         git remote add trace git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
>         git fetch --no-tags trace probes/core
>         git checkout 438ae37afde3d24731cf23e5b77370e76218744e
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306040144.aD72UzkF-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: Documentation/trace/fprobetrace.rst references a file that doesn't exist: Documentation/trace/fprobes.rst
> 

Oops, it should be fprobe.rst, instead of fprobes.rst...

Thanks,

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
