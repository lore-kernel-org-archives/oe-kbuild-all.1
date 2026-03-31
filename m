Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8B637AA76
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 18:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981422; cv=none; b=r8Ft9gcdTKy3gNy9g2PpCDdpFi8rxmIt9eJPMXRmQPB2VZTrfD311fLAC8lWtzjvm9satu9RmR21gG6XL5ezixRC2JvjzQu8d4HHVVrzE3WVQcewmtg6VwBPbgwa2MMj+BkSK8U8pZ0HhEB2rSM+jyi7wKE4Ev0SiEsdDEl9ccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981422; c=relaxed/simple;
	bh=H7HU/TLnZ8bVLFZQ0yYOKUzgESrMGNQd+7T8BLdmYFg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lNOKGwkgtc+MST1LHSPBqr57TJbLZ9B0M0BMLcJr8ui34pBR198edroEvm5IwmS0d+H7lnwlIGp9ifqObdVfYapIHxvFGijZdkzQcrbZW/oJ+c95dyoI8+lfKjiqekKVflsjSBPXWBGEqr6H0SG9JoovAutKDr51OMoFhdTDoMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=pNEzS5eG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="pNEzS5eG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D742C19423;
	Tue, 31 Mar 2026 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774981421;
	bh=H7HU/TLnZ8bVLFZQ0yYOKUzgESrMGNQd+7T8BLdmYFg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pNEzS5eGuBwE8sUdbHNIfqW+JpavK4huAORT2wugb9MXAaIJT8ULhCpJIGj+AfTkB
	 M17cQzNBq8F7AJTWxgmEpWE9lzKrJ+sZcXzP5V0/hFHtmbR6OXUJ/UFpS+lFRyYtB4
	 7+4WTOfTKYGwxZXbHlt54MoBE6T64W8962s6ZqK8=
Date: Tue, 31 Mar 2026 11:23:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Chunyu Hu <chuhu@redhat.com>, oe-kbuild-all@lists.linux.dev, David
 Hildenbrand <david@kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 121/130]
 tools/testing/selftests/kselftest.h:427:13: error: implicit declaration of
 function 'vasprintf'; did you mean 'vsprintf'?
Message-Id: <20260331112341.83f62d4d4de710457ecb59c1@linux-foundation.org>
In-Reply-To: <202603311105.ysUeYPSZ-lkp@intel.com>
References: <202603311105.ysUeYPSZ-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 31 Mar 2026 11:27:20 +0200 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   24e341657c283c965e3bfee0baa9ed0376127973
> commit: cc0b04b10a7b98fd8df2fd539177e94e0f83a5c3 [121/130] selftests: ksft_exit_fail_perror: support printf style arguments
> config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260331/202603311105.ysUeYPSZ-lkp@intel.com/config)
> compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311105.ysUeYPSZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603311105.ysUeYPSZ-lkp@intel.com/
> 
> Note: the akpm-mm/mm-unstable HEAD 24e341657c283c965e3bfee0baa9ed0376127973 builds fine.
>       It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from za-fork.c:12:
>    ../../kselftest.h: In function 'ksft_exit_fail_perror':
> >> ../../kselftest.h:427:13: error: implicit declaration of function 'vasprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
>      427 |         if (vasprintf(&buf, msg, args) == -1) {
>          |             ^~~~~~~~~
>          |             vsprintf

What's going on here.  vasprintf is a GNU thing, but that isn't it. 
kselftest.h includes stdio.h directly so fine.  I don't see anything in
the later patches which could alter this, so the "only hurts
bisectability" is inexplicable.

I was able to reproduce this, once.  Now it's gone away.


And arm64 allnoconfig is a nuisance.  Now my vmlinux build immediately
faceplants with

./arch/arm64/include/asm/atomic_ll_sc.h:298:9: error: unknown type name 'u128'
  298 |         u128 full;

With the latest 15.2.0 kit from https://www.kernel.org/pub/tools/crosstool/.


