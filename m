Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4485D461
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709720982; cv=none; b=PgnXhwFgH6bYdCqGbZ6sLTNBKG3FMEMvPKzH8ICZ5W6hNhnqiJAzIW+fnx+IUXk1QMrzMQi6XH+Q1aA6kEmZdMoz22EBDbO+vys/2SrPBXz5itwHkgexHdoZLLZdkkhelLlC9puf+EaM+T9AvASM8R8x0ESAPgDhlPiLh9yqzw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709720982; c=relaxed/simple;
	bh=fG+pUVPghWkddTkxVtl4aaExfhh5wToilqPZ7rhhd3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Geot3sfNRuAiJk46X5dF6UV6pmwn6SslftrKhZ/zWSScSkznZwi9vTQtGwBzHKweaF/qkHly3hvXkLT/+17iqX5aD4L5cgPQ8gKfj0WGiiGOi/FWX4GYsAsDJ5yiPmZLAl/zDARe97xFvJAuYXX9qgkiC3g12hH3FM41f70hYTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qX18LDlQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qX18LDlQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88184C433F1;
	Wed,  6 Mar 2024 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709720981;
	bh=fG+pUVPghWkddTkxVtl4aaExfhh5wToilqPZ7rhhd3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qX18LDlQAvuG7g6QlGpX801D9VWxTEFZ6GXJDBpO6DdXV9zb8zUDpCfRwQJANQRYH
	 Z4wXi+K9I69GDuiEMcn5QF+usDMkTfbEl0wzaUjY7uvZgDJPCLISigUIJXf7nH+Vvq
	 tynPu4kE6AXT+SBNqG4pq9xrsXb2+ezxlzhcEfn1qDqd4QjG/aOsvtpN3ijdGP9n75
	 0ztfEnB1trK8Pe2YTi1XHxse6gqjEc4qoOBviq4tUChzs+pIvkCL/1nNoJuh0UWsPp
	 YfyGHhROK2pvsQbErCsFXnxOknPDQFTScH4pyFaVzbCIxwLhYNZHkwNYiFw6TxFLR9
	 uIbrGffB4j4Sg==
Date: Wed, 6 Mar 2024 11:29:37 +0100
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Eric Sandeen <sandeen@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-vfs:vfs.mount.api 2/3] fs/freevxfs/vxfs_super.c:186:
 warning: Function parameter or struct member 'fc' not described in
 'vxfs_fill_super'
Message-ID: <20240306-lauwarm-leumund-dbc6a58b5ca7@brauner>
References: <202403061733.YVyoeVPl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202403061733.YVyoeVPl-lkp@intel.com>

On Wed, Mar 06, 2024 at 05:14:51PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount.api
> head:   0540b5e5fc1fb89be71af08ddfc7c21a22828ec5
> commit: f65b9daeb55bb95583d6fa90762887c22b190406 [2/3] freevxfs: Convert freevxfs to the new mount API.
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240306/202403061733.YVyoeVPl-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061733.YVyoeVPl-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403061733.YVyoeVPl-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/freevxfs/vxfs_super.c:186: warning: Function parameter or struct member 'fc' not described in 'vxfs_fill_super'
> >> fs/freevxfs/vxfs_super.c:186: warning: Excess function parameter 'dp' description in 'vxfs_fill_super'
> >> fs/freevxfs/vxfs_super.c:186: warning: Excess function parameter 'silent' description in 'vxfs_fill_super'

Fixed.
