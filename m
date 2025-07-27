Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6621D2E36E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753638347; cv=none; b=gLGuVoNJZ8681j/FeokMjFcEQ+bwD3bBmUvv//xCPHggoR0EMh7Zy2cTJUPjCkzgOZXOaBBy/XDs59r5YIP0yWyfzm1tSvU1XnG0NNEAEP1/uJALhzngcLnYEXY15UwENM/Rzl/WsxldHddvFtn14hS3xhoexsxz5Wdo1D7DdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753638347; c=relaxed/simple;
	bh=ex5JEccYsk0QDtr4tii0bb5/IAi3owE10Klxt6g2vsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KGn79lkseyac+y6OEcTUnB050wVxU4fzGc4dpBlmRd0V8i8Ms5H+2ZROB7+DA2IrzwJnAiOiVZ5y8MB6aNKosYAgKRJuYkADt6abq1k24Mi4GGQRwDsOzQDW2/L+TN1Ym37uC2mHJsCJ/IMNd3mIo/Oo5/WHE+Ug1yuinkDxGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsezkBq1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsezkBq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8FDC4CEEB;
	Sun, 27 Jul 2025 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753638346;
	bh=ex5JEccYsk0QDtr4tii0bb5/IAi3owE10Klxt6g2vsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AsezkBq1tkFhO5+SU12JxXhqFcQPmyq+eHp/mEAgVb4zZyOUQKv86Xji5tGjRHYvj
	 AD2bLNMiXtJxeoUCmW1uHo5r40ARxIVcDYC3ajvnIOcZvro5GPZ5MQy1wkfBXix1Vn
	 brUwpsR7KSnDt5iylQ0E5yhi++QkNePK6DxFXjJXugtLxU6EJe7iRQ+M646xS3vbMW
	 63L7Uu9f95SK4b2qxQd7naLGNXV12V51VXX8XOUlK+T/V6//IcedLStZtUR693+xnm
	 GUXdFVIeYHdC4Q2anosx9TH4lib3U076O/GBtZLawTpCME8x1CIlT79Cg+n08JAVE9
	 3xqew2iBLg+vA==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 34/101] mm/mprotect.c:726:13: error: 'PAGE_NONE' undeclared; did you mean 'PAGE_U_NONE'?
Date: Sun, 27 Jul 2025 10:45:44 -0700
Message-Id: <20250727174544.63218-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202507270855.YvsYlfrv-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 27 Jul 2025 08:16:01 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   de1df744d5c68470ace629863436a2b0b7360254
> commit: af1d8aa70d3ae773ee9c7b9782ccfef1876bb027 [34/101] mm/mprotect: use PAGE_NONE for change_protection(..., MM_CP_PROT_DAMON)
> config: arc-randconfig-001-20250727 (https://download.01.org/0day-ci/archive/20250727/202507270855.YvsYlfrv-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270855.YvsYlfrv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507270855.YvsYlfrv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/pagewalk.h:5,
>                     from mm/mprotect.c:12:
>    include/linux/mm.h:78: warning: "PAGES_TO_MB" redefined
>     #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
>     
>    In file included from arch/arc/include/asm/irqflags-compact.h:16,
>                     from arch/arc/include/asm/irqflags.h:11,
>                     from include/linux/irqflags.h:18,
>                     from include/linux/spinlock.h:59,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/mm.h:7,
>                     from include/linux/pagewalk.h:5,
>                     from mm/mprotect.c:12:
>    arch/arc/include/asm/arcregs.h:155: note: this is the location of the previous definition
>     #define PAGES_TO_MB(n_pages) (PAGES_TO_KB(n_pages) >> 10)
>     
>    mm/mprotect.c: In function 'change_protection':
> >> mm/mprotect.c:726:13: error: 'PAGE_NONE' undeclared (first use in this function); did you mean 'PAGE_U_NONE'?
>       newprot = PAGE_NONE;
>                 ^~~~~~~~~
>                 PAGE_U_NONE
>    mm/mprotect.c:726:13: note: each undeclared identifier is reported only once for each function it appears in

Thank you for this report!  I just pushed a fix:
https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=bbc588c9166d6ff4ac9b270929732760215a94c3

Reproducing the error on my own failed as below, though, so I was unable to
verify the fix on my own.  Please let me know if anything wrong.

    $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-8.5.0 ~/lkp-tests/kbuild/make.cross W=1 O=../linux.out/ ARCH=arc SHELL=/bin/bash mm/
    Compiler will be installed in ~/0day
    lftpget -c https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64/./8.5.0/x86_64-gcc-8.5.0-nolibc-sparc-linux.tar.xz
    ~
    tar Jxf ~/0day/8.5.0/x86_64-gcc-8.5.0-nolibc-sparc-linux.tar.xz -C ~/0day
    No gcc cross compiler for arc
    setup_crosstool failed


Thanks,
SJ

[...]
