Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C8EEA8;
	Tue, 10 Mar 2026 00:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101141; cv=none; b=ZgCst9uufvk9NOfESFT0RrZBxK/be3BKh+vFG1/IZG6H/LOngJkTtnOBNH/FgSlqwuUkVHWxXcp/lmk60bpJJgWeRgSF09Qiw0S/m/VkaRj9Mim49tBJFgFGelzfQREDiw7Gr+F4xsE1JZvX6WegVGHX5FU0WsynxV/OKY6zw3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101141; c=relaxed/simple;
	bh=RB2ODOd4LKGFpz3EyswezaifgABKwanHZMqjT9rezCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUyV0F2kdH8pBplnuWrJqwblS8vYUwO37B1OW4Vsin5jzjId68x4xxx2vZB1pzQccWHHTlSAKh5BxTxqmmJ+b1A5yADM4DpNVHBAY181tJHidz4cnl/wUoiKAg2dtWzcSysPH9/Vp2gxAN2Jc/A075GPo/hYj/mcU2fZXDwjT8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7KKh3II; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7KKh3II"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C54C4CEF7;
	Tue, 10 Mar 2026 00:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773101141;
	bh=RB2ODOd4LKGFpz3EyswezaifgABKwanHZMqjT9rezCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e7KKh3IIn5k8PPUH76xonQ8mKJ7TnRMwF2uit4KvJlFuOchZAdHsGfJTytqyl9Umg
	 ylckDPI1umjJvuiYdXGRKLH2qVPI/1Z3j5HqGDdI4wjKimpzxamLdpCw/Uk+9oI3/p
	 pEyU8AXH5AiiIdRBOVWb/swFeKQh6ROIWmrmoYoOYU31m2vexbp0NvSjRXgT8LppoF
	 VKAXAufkU/+LBw1sacwDR+VDXLbsGYjhhglYABxlMkNBrzG7j/8DtFa0fN005W4Ejh
	 xr7HY/k/Za4fvQVBH87Sq/rWrTDDwZdJ2cOKvzfxNmozbaiYMHPLv+w+3JIwWGWSIm
	 kMO8uvrmF4liA==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [sj:damon/next 139/143] htmldocs: Documentation/mm/maintainer-profile.rst: WARNING: document isn't included in any toctree [toc.not_included]
Date: Mon,  9 Mar 2026 17:05:36 -0700
Message-ID: <20260310000538.11127-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202603090825.WIbGm8S9-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 09 Mar 2026 08:39:46 +0100 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   3ea83b53d7252f4231cc33670a6f8b37514055da
> commit: 43414b4cb39a85c66e164f34d962e88a143a439a [139/143] Docs/mm: add a maintainer-profile
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260309/202603090825.WIbGm8S9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603090825.WIbGm8S9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
>    Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
>    Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
>    Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
>    Documentation/core-api/percpu-counter-tree.rst: WARNING: document isn't included in any toctree [toc.not_included]
> >> Documentation/mm/maintainer-profile.rst: WARNING: document isn't included in any toctree [toc.not_included]

Thank you for this reporting!  I just added a fix to my tree.


Thanks,
SJ

[...]
