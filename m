Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A765BACF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 19:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720725987; cv=none; b=tEHaTlyrV8Unsh4riV5uLib9O5pRzfQkFE46b/P446swHVKqIRRYaHcW1rFWNgOPckjfiD/WliNswvzf/jJ4f719pbSkWIeK207GUq5uSd5Sb9V3S/XFEwfBUQdxAiw9rlYoMFFzy0c72XS34Niqaz2xDB+5369Zlt/dg7XKUME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720725987; c=relaxed/simple;
	bh=AtoLYIHLaYoX6JQCX11otx9KhVHLRp5Sif444v1hUIE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EIdgb/ncz6ck+4zIFVAp5yWhWDGUvs7KgGTdONsrqSOjRGr/Z9dYOYF3RB+15xahTkTigc+8DZxJbudCrrlJyWI3bia6CJzE1MwTiwYwHUQWM9snkbtHwZ/tAobRbj3hdP5IC6b2aOng9Ukm8YOBDiXrObrDsNwlGWgTUsBMVDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=onux7wKg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="onux7wKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE73C116B1;
	Thu, 11 Jul 2024 19:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1720725987;
	bh=AtoLYIHLaYoX6JQCX11otx9KhVHLRp5Sif444v1hUIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=onux7wKgnFT8NT0A8Tl9VgDMYK3/AdPsu/gZ4YD4WWkyTk6AuzJK7/UQuTIYaZErU
	 RHpmn7JXwYo5By6ZRVr/j4yR937DjCt+Pq+UUEVYQwi1YaMEXxJgOX0dagHAqmNJSA
	 Lx79k5aeWUV9IgpORjG6nlRVC6qlFGYjbuavZ6aQ=
Date: Thu, 11 Jul 2024 12:26:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>
Subject: Re: [linux-next:master 12377/12643]
 arch/loongarch/include/asm/pgtable.h:614: warning: "pud_leaf" redefined
Message-Id: <20240711122626.508affe293dea06def530f8b@linux-foundation.org>
In-Reply-To: <202407111910.kbzq5PZK-lkp@intel.com>
References: <202407111910.kbzq5PZK-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Jul 2024 19:42:43 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
> commit: 4d460b397e28528bab4b2cea6a9337560e78b0b8 [12377/12643] mm: add p{g/4}d_leaf() in asm-generic/pgtable-nop{4/u}d.h
> config: loongarch-randconfig-r031-20230725 (https://download.01.org/0day-ci/archive/20240711/202407111910.kbzq5PZK-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111910.kbzq5PZK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407111910.kbzq5PZK-lkp@intel.com/

Thanks, I'll drop this version of the three patch series:

Subject: arch/x86: drop own definition of pgd,p4d_leaf
Subject: mm: remove pud_user() from asm-generic/pgtable-nopmd.h
Subject: mm: add p{g/4}d_leaf() in asm-generic/pgtable-nop{4/u}d.h

