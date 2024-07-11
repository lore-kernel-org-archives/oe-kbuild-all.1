Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E836C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 00:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720656651; cv=none; b=gt5Zvs63WJwKJfgkhRMTbun2samq8OMPgq6oj/xtcoX1gwKARi+2U+2ryanyxf2lPdbGf+BKWVMxl2QDfRvOvuawPf0fwvf/oT0sejpbtDL5g1ezlwLILZdc8dR8NdlmqXO6ljkCawlv4AuhzNsnvGhCfgxEAglK8eFGrWVmx6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720656651; c=relaxed/simple;
	bh=96Nzq0b44lwpTO7jqM+n3aUjd056yS/AKDXOZva842U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ODv0Dh1krcTyyAkOGdpUGcBQNhhRvt9Yu4t0pn4RL8gdMadlOfLPLym3xwy/J5MQWC5qsQeFZzZVK138VEuVoOArhqnRI+ryl3Dhss+VSGPrH0OfguiCrQ69miZP7nw0VLC67nAy720p8KRfBs/yWqqHT7Do6d27MMi+m3Jsshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5CASma1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5CASma1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AC8C32781;
	Thu, 11 Jul 2024 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720656650;
	bh=96Nzq0b44lwpTO7jqM+n3aUjd056yS/AKDXOZva842U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r5CASma1D22o/Avhpgsql0Ao4RiGN/U3LOHzOJImULtB/sSXavh7Bmr+JAt2pDGt3
	 xsI06ekT1OAIDbU4Iy0tzVydK9keVD63G2QjbIwjxNTH3jIhg5tzh87Yo6gs70CltZ
	 b3RoxTw5wtPSbLGv603f46GZZvJZvvUfn2UeYGCoMYc/1wRYhjqIhc2txp8zieaJuC
	 CX0BdLytHDjT067zlGdEKItzfAmNaclRU7KPLEbMJWkacB3UXdTMnZXil+pQvcSWM8
	 0jpVeA1OawlMwmQEe8OzJ61Ty+zMkd1GFfM563RoqeRqYvk7l6rJi8lbe0d06R4lfQ
	 dEZaxiwaAxncw==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 7424/10451] WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_enqueue.part.0+0x38 (section: .text) -> .LBE1049 (section: .init.text)
Date: Wed, 10 Jul 2024 17:10:43 -0700
Message-Id: <20240711001043.100459-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202407091146.N8o5lBgN-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Tue, 9 Jul 2024 11:57:48 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0b58e108042b0ed28a71cd7edf5175999955b233
> commit: e64a020fe3a8bb9287b46568b4baf71105c5b47e [7424/10451] mm/damon/core: implement DAMOS quota goals online commit function
> config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407091146.N8o5lBgN-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091146.N8o5lBgN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407091146.N8o5lBgN-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_enqueue.part.0+0x38 (section: .text) -> .LBE1049 (section: .init.text)

Thank you for this report.

But because the commit only adds some code to mm/damon/core.c without changing
any behavior while the warning is related with net/sunrpc/svc_xprt.c, I don't
think the commit is somewhat to be changed for the warning.  I also confirmed
the warning is not reproducible with the commit on mm-unstable.

Please let me know if I'm missing something.


Thanks,
SJ

[...]
