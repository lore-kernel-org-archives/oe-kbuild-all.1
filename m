Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C21C29F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 10:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EECC433C9;
	Tue, 22 Aug 2023 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692700208;
	bh=70xFTByQ1/Lb6Cdvza+q6+K4Gi0UbjmSlxNHah3ifG8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=O/Z1mWgLXIczqKdwdBYUegIgBWSBp4x39unZjWlPUxcVM0VGzyAka91Iwz3IFqFTz
	 EQWVY4e1FEiOt8vlauA92JsDLQij+IX+JiNMSFtvsAcWfQ4oYGMR0lzXpaZcDBmaaj
	 w7XiVBMaW+YGPT2WqrbQgyUsTB8Urjngzjt+3MO7Vnfy6fKF1VdzFAICz1u46sS0Q2
	 JhTui8+bWJ7EBtYmYni4OiU/2UF59RXqc5ZMzgdEHcuO7zlGNxyJLtX6RszQ2R8B4k
	 Cm9cgRd2k71zy2LrHYmUNEGsDY4rUHMj2smMY4LaCUew519OuwmhRkJj3qKmyQH+aH
	 IC8moyhwVxPQQ==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Aug 2023 13:30:05 +0300
Message-Id: <CUZ057BXGCE1.2E8MOHQ8NVINE@suppilovahvero>
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 "Borislav Petkov" <bp@suse.de>, "Serge Ayoun" <serge.ayoun@intel.com>
Subject: Re: arch/x86/kernel/cpu/sgx/main.c:124: warning: Function parameter
 or member 'low' not described in 'sgx_calc_section_metric'
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "kernel test robot" <lkp@intel.com>, "Sean Christopherson"
 <sean.j.christopherson@intel.com>
X-Mailer: aerc 0.14.0
References: <202308221542.11UpkVfp-lkp@intel.com>
In-Reply-To: <202308221542.11UpkVfp-lkp@intel.com>

On Tue Aug 22, 2023 at 10:27 AM EEST, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f7757129e3dea336c407551c98f50057c22bb266
> commit: e7e0545299d8cb0fd6fe3ba50401b7f5c3937362 x86/sgx: Initialize meta=
data for Enclave Page Cache (EPC) sections
> date:   2 years, 9 months ago
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/2023=
0822/202308221542.11UpkVfp-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221542=
.11UpkVfp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308221542.11UpkVfp-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> arch/x86/kernel/cpu/sgx/main.c:124: warning: Function parameter or mem=
ber 'low' not described in 'sgx_calc_section_metric'
> >> arch/x86/kernel/cpu/sgx/main.c:124: warning: Function parameter or mem=
ber 'high' not described in 'sgx_calc_section_metric'
>
>
> vim +124 arch/x86/kernel/cpu/sgx/main.c
>
>    117=09
>    118	/**
>    119	 * A section metric is concatenated in a way that @low bits 12-31 =
define the
>    120	 * bits 12-31 of the metric and @high bits 0-19 define the bits 32=
-51 of the
>    121	 * metric.
>    122	 */
>    123	static inline u64 __init sgx_calc_section_metric(u64 low, u64 high=
)
>  > 124	{
>    125		return (low & GENMASK_ULL(31, 12)) +
>    126		       ((high & GENMASK_ULL(19, 0)) << 32);
>    127	}
>    128=09
>
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

https://lkml.org/lkml/2023/8/22/379

BR, Jarkko
