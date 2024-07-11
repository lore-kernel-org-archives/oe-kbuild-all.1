Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1669C3211
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720657976; cv=none; b=iQ79A8NSxOTwo53flWpuVu6tIg+rKvE1UND3hiYhPEaM7p0pPXBWpvZWaxDvCRxK8D9lmX0oWjKaHxUscvxZvgg53Ohc5717zohRWPLNjiXB8//0rItgxV1jAB19WdzIPDHjbX86JJjKiy4tApTp5yTpvnIXjT2sXSp+h2c9ldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720657976; c=relaxed/simple;
	bh=IsrCjr9M6WJ8bM5+Dy1pByd9X/Sq36pgTT9MU6iissg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hpq5tPP8nIJlEBbYbW3qngkLr1MCmfvCDP3DUJeh6baE7YtGWNqSsa1Z1mxTkcE/81Kq1fL9yFfOSLeqP8+gFs8gIDpcro5aoXGM8Dt3UqdgbxH0BdWz30lu+U/EXlqSFVFMquhojjkMMgnSGnN6YQbmnZ7vMsPTB7fSqVZx74U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4UcyV5a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4UcyV5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25423C32781;
	Thu, 11 Jul 2024 00:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720657975;
	bh=IsrCjr9M6WJ8bM5+Dy1pByd9X/Sq36pgTT9MU6iissg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R4UcyV5ap3/ZujXovsidyTNyLi/yHC3CmJlkXVO4sFgNTaP9cDlYkPRNp6S0Ivcqz
	 9ClXJBv6QQ2Iqlz1WtOYeNKI4F19oqGobhCVoYGi8pogBFP4tp6dq7+eASCpkbDPM6
	 LjxXwJuc6tIwvdeof+SAh7ilrXLTFVXtrHx94QoSg7Bh0DA+zYYcIE1ztMYZQFm6Rz
	 88KbBNlSMSWofRQrbUgORKVyYgOvDfjDKlch8igl06p4+k/Hu+INDhJqjZ0UfUJZjA
	 0HLRe+U8/IWq3PY8EKeDI45eCIOZQ2X012UXwUSV8zBwrhveKlOTXdSD0EjKVZFd1S
	 VmqqRxthaNrTg==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	Honggyu Kim <honggyu.kim@sk.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 7416/10451] WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create_from_sa+0x6e (section: .text) -> .L96 (section: .init.text)
Date: Wed, 10 Jul 2024 17:32:51 -0700
Message-Id: <20240711003251.161484-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202407090506.BxtnYHgZ-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Tue, 9 Jul 2024 05:52:19 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0b58e108042b0ed28a71cd7edf5175999955b233
> commit: c3bf782bb0fffebcc4e467033cf6bf5e5e1b0784 [7416/10451] mm: make alloc_demote_folio externally invokable for migration
> config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407090506.BxtnYHgZ-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090506.BxtnYHgZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407090506.BxtnYHgZ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create_from_sa+0x6e (section: .text) -> .L96 (section: .init.text)

Thank you for this report.  However, given the diff of Honggyu's commit, it
doesn't seem to be the real root cause of this issue.  I also confirmed the
warning is not reproducible with the commit on mm-unstable.

Please let me know if I'm missing something.


Thanks,
SJ

[...]
