Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D10199E80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 15:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311822; cv=none; b=FE8lmN6Kn8WuWODf6jscOZN394z6V68Il+mPhMCl+IlU0Jn8Ij6Rbh3mbW9EdXQMGYtRv/8rA49ILQr6gzTOL5sYN24X4kRpPiJrea174HYQpzOzYRYUrnqB0tXua3zYNiVCRkQ/CE0wOFQZiNBWpEkHWr3HDWYu0MG9rxwDOYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311822; c=relaxed/simple;
	bh=GTYAbmUB8bX214+OIZcG9vChMqbeEaZIGZFIO3yilWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sg4wQC3XzhfPLnVMXDKuK0bV86GK8i8KwUwFypG62AqHx98XpumDhPFYhJuPAZGZw/iIzdpi0+6xHnPAuhHt6UtOdlfgwzDDi6/OYhDYo/U1D+lBqUKnSW1QyAIVMki8Jq3R/YeWTJ0HMeRgUlLqCJA3IcM/v6WFgrom0kNb420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2Kqtn0q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2Kqtn0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D461C4CEDD;
	Tue, 18 Mar 2025 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742311821;
	bh=GTYAbmUB8bX214+OIZcG9vChMqbeEaZIGZFIO3yilWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2Kqtn0qXiNPpUFNzeQZiQkndiR0aTi+eeaA6q7yJpU4e8GpZus1xQcBmYjKbuclD
	 cxSFG90P/O8NN4xvEV3LYKVmWuOj20Xv8KEQZ2JEDO90y4vqBX6iY2xZ7+OHs58QAI
	 57s6wPtCunPHwTV4lEnm7odiMwC29XnS3TL4e8eik8d00ltMiWH1LK6WAXb1txrBI8
	 VHb4mF6aUL1LrOxWesiB2AEWGZRJh0oULdIyu8+UJJio/JjYQeEV3rf4+/EvkYtoko
	 Mb5paXy0ipgbKgaclJinPdrCvcUywpGhZOSGLOhDleTL72Bj5zChIUxguiitcq+ZM6
	 fzOMhPpidQWgw==
Date: Tue, 18 Mar 2025 15:30:19 +0000
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
Subject: Re: [hyperv:hyperv-next 22/22] versioncheck:
 ./drivers/hv/mshv_portid_table.c: 3 linux/version.h not needed.
Message-ID: <Z9mRi-NilfPXMh1C@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <202503180913.gLveRQwr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503180913.gLveRQwr-lkp@intel.com>

On Tue, Mar 18, 2025 at 09:43:28AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
> head:   3ee7bc04bd48f70b6a37ad7d63b7d5202569ec68
> commit: 3ee7bc04bd48f70b6a37ad7d63b7d5202569ec68 [22/22] Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
> reproduce: (https://download.01.org/0day-ci/archive/20250318/202503180913.gLveRQwr-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503180913.gLveRQwr-lkp@intel.com/
> 
> versioncheck warnings: (new ones prefixed by >>)
>    INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>    /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
>    find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
>    	-name '*.[hcS]' -type f -print | sort \
>    	| xargs perl -w ./scripts/checkversion.pl
> >> ./drivers/hv/mshv_portid_table.c: 3 linux/version.h not needed.


I dropped the header from code.

Wei.
