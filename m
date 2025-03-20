Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235891C68B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 20:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742504076; cv=none; b=Qws5Oj/gyGWouwCFJrcg7pp3ShzvoDtT3MW+3l2mHY3HiBhnaJ402tgDsaxNO9yhwFvIz7HrEX6kROFtEQp/ZIX8dXtWazyX3J1Ccdwj1u1jOU45iBfSgSzm+WWUe0xWjFQCgObybV63NUeAEZCOuL0teND4rbHgomh1b0gt2iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742504076; c=relaxed/simple;
	bh=+TqexOIZlFgWtE0fwwmMpBDHK1FoYRHFMmn9vcXG7Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbUXaWMyxApDP3JwS2WuJ/fbgqM76iOupaeYdZl1jm85KoD4UvujyQQRH4Rgjx2lN2LIrqSPgl0PoRHdPdfrKXxnSb/cUAIog4Xz3UU2CAekDGxlq7w728W44oqJkKfYKjjkP6sfIaAJG7yanswK0BbXGLQLGyWJ6amkUWaZoxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lF4U3IH5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lF4U3IH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630DCC4CEDD;
	Thu, 20 Mar 2025 20:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742504074;
	bh=+TqexOIZlFgWtE0fwwmMpBDHK1FoYRHFMmn9vcXG7Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lF4U3IH5/ifoteYLFwv4LKh+E/ga5qnxzPWhpg80Uqqt7dEXcorelb30Z3WDYv4AQ
	 KQUgh6jyIwzbc/bSCgxbHAMlpmkWfbPsvj+YSw61Ao/NcGd3+K1RBToPVzY6D+95mA
	 NGXg8LHSy92wIXAN6GVP47VWQ4c9fSW5sT6D7PQBwsxRlAzem/AWaSnrXcxNXdJ0fR
	 GtQt+pRSANMfd/akZxGQOaktmkbiYLai5ZJq57M2u7s9kCjs59YytH+WhB/ngT6Jzd
	 4VazJQiZwl3cG4JBJZY6JiymZ76+hh4wPy2KWV/9u2k0H57Uprb+7DHMpYjsaJcFVS
	 5+O8PoWix5duQ==
Date: Thu, 20 Mar 2025 20:54:33 +0000
From: Wei Liu <wei.liu@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
	Jinank Jain <jinankjain@microsoft.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Muminul Islam <muislam@microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>
Subject: Re: [linux-next:master 12013/12769]
 drivers/hv/mshv_eventfd.c:399:19: error: implicit declaration of function
 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'?
Message-ID: <Z9yAiQePXWm7Q9J3@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <202503210422.6u1LLUSg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503210422.6u1LLUSg-lkp@intel.com>

On Fri, Mar 21, 2025 at 04:17:50AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   73b8c1dbc2508188e383023080ce6a582ff5f279
> commit: f5288d14069b6580405b6f0d1c4ccd45c7ac97bf [12013/12769] Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
> config: x86_64-randconfig-076-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210422.6u1LLUSg-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210422.6u1LLUSg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503210422.6u1LLUSg-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    drivers/hv/mshv_eventfd.c: In function 'mshv_irqfd_assign':
> >> drivers/hv/mshv_eventfd.c:399:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
>      399 |         eventfd = eventfd_ctx_fileget(fd_file(f));
>          |                   ^~~~~~~~~~~~~~~~~~~
>          |                   eventfd_ctx_fdget
> >> drivers/hv/mshv_eventfd.c:399:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      399 |         eventfd = eventfd_ctx_fileget(fd_file(f));
>          |                 ^
>    cc1: some warnings being treated as errors

Nuno, it looks like we need this:

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 3118d5472fab..6c1416167bd2 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -64,6 +64,7 @@ config MSHV_ROOT
        # e.g. When withdrawing memory, the hypervisor gives back 4k pages in
        # no particular order, making it impossible to reassemble larger pages
        depends on PAGE_SIZE_4KB
+       select EVENTFD
        default n
        help
          Select this option to enable support for booting and running as root
