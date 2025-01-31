Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B671F94A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 06:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738305784; cv=none; b=T/K1tD6Kw560aZKr2myjC35V7Q1n7AK4YGi6Tia1+ZdXMqwOmrpjzbnvtGzDIHC/S0gNbi3gKaDWn0iyKCSUIlG2uQ/uMfAOoZBMRE2uLJahASdjf7Cg8s5Jcg6IeMn8+h8MvDqffAbVoRWJ7FEMhhQjEUxqYD2XXxuEKC/tZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738305784; c=relaxed/simple;
	bh=iEov+rG3qmCYnD2eZ16hFxlelSjzsc7VU1dL3KPj0mA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uWwex+wxtmVbu1ic4lqJbWxzCeNV3MSaImTcUwzqNvvLut/BDRvGpjrG7xGeF/G4QbJYY8QGaBFQCKAJkxjS03zS3Ziezlo9OyjeFexKAJcIOaAtjOCZB2ryj0q0ybHcvoRgTDSwQmbXE3gMhytPX1wPB18vXO2+WDSDD0J09dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HdMJm7dS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HdMJm7dS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C9EC4CED1;
	Fri, 31 Jan 2025 06:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738305784;
	bh=iEov+rG3qmCYnD2eZ16hFxlelSjzsc7VU1dL3KPj0mA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HdMJm7dSIpA8nB9Ckp/F6Bh1MoDkgiS9KplKcYV41Dr8G/RiBCistkQ+z7QNuY5vk
	 Kb4wiNifMwhc0HPxRTRJdaPV1ZF1xQl7qTDvtd6+Q2Ad/D3And2pPXAY51scIl38VZ
	 ktSLNgxKvm63wfVMnABZxJ+OMC8JShR6YqraUZGY=
Date: Thu, 30 Jan 2025 22:43:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Frank van der Linden <fvdl@google.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 77/88] mm/hugetlb_vmemmap.c:704:17: error:
 label 'out' used but not defined
Message-Id: <20250130224303.5964449be385d688996d5dd3@linux-foundation.org>
In-Reply-To: <202501311312.ZTWda9Ip-lkp@intel.com>
References: <202501311312.ZTWda9Ip-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Jan 2025 13:29:18 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   495206a68b359eb6117d0860861578113bbb94e7
> commit: 383ad37bda9ba2414ce6abff61fecdc09afc623a [77/88] mm/hugetlb: add pre-HVO framework
> config: x86_64-buildonly-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311312.ZTWda9Ip-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311312.ZTWda9Ip-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501311312.ZTWda9Ip-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/hugetlb_vmemmap.c: In function '__hugetlb_vmemmap_optimize_folios':
> >> mm/hugetlb_vmemmap.c:704:17: error: label 'out' used but not defined
>      704 |                 goto out;
>          |                 ^~~~

huh, I shouldn't have pushed that one out.  Fixed now, thanks.
