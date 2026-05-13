Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E8E3905EC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 03:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778644749; cv=none; b=c+GV3eO3aEBC7A0suNaJ+kN5N8m2xB2Tq58N5qnyS0JsJB7JlySpYhOVLj58UgS2KMU6K47Df+xI5dIvPDR1lQuLj0sPRqgQIYe758pfHrgABZVpLhL3VYY7tT7E6nVsIxrYzgJo9RFaWE09dxMNmVds7kCWS3L1jQKTAKiEkFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778644749; c=relaxed/simple;
	bh=B0Isy85fo4rpJ08jiR3Hm8oL5wMKJbRNGuB8SzSk0Dk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nhJHGi3N8w6xIOFF7KKNctRVUUtVM9q1NZdDmGXb1sLobJ0r2wQS5bE7yfy7gwrXX2nuYWdIjYlTaX82d2foxrlUqZ+H4DxTHoHC8Oum2l5QGbidPofZVxntQG79XyYZaNqNXrUxnI3qVYKByPGwEF74ya0i20qBLwIzgd4rfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iajF+ki5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iajF+ki5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA5DC2BCC7;
	Wed, 13 May 2026 03:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778644749;
	bh=B0Isy85fo4rpJ08jiR3Hm8oL5wMKJbRNGuB8SzSk0Dk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iajF+ki5+TrO9jt/ILz7oxOKiqbAtrZ3PtFQB8UEp5N6jyf0rVshJmLuHQdsbsFwr
	 BDwU6vs6QAxLRbj8skdVmkiUWQzgi5h0lOPJIBqmu+l7oSJaLtqkFtpNAiRq3prd/v
	 if3i9ySaQbSHYBWpKVm7zJIuaG0sBwRYq1nyZ390=
Date: Tue, 12 May 2026 20:59:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [linux-next:master 14086/14440] lib/cmdline.c:188: undefined
 reference to `__efistub___lshrdi3'
Message-Id: <20260512205908.7817ac71eb93427b17518ca7@linux-foundation.org>
In-Reply-To: <202605041353.nsZSMiIC-lkp@intel.com>
References: <202605041353.nsZSMiIC-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 04 May 2026 13:22:00 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b9303e6bff706758c167af686b5315ad00233bf8
> commit: 7f448f913d6f048e448df40a877be6f5afb5249d [14086/14440] lib: fix memparse() to handle overflow
> config: riscv-randconfig-001-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041353.nsZSMiIC-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041353.nsZSMiIC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605041353.nsZSMiIC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    riscv32-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `memparse':
> >> lib/cmdline.c:188: undefined reference to `__efistub___lshrdi3'

Still there.  

Thanks.  I've forgotten what's happening here, and I'm probably not the
only one!  I'll remove the "lib and lib/cmdline enhancements, v9"
series from mm.git - Dmitry, please let's start again?
